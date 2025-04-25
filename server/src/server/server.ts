
import express, {Request, Response, NextFunction} from "express";
import http from "http";
import {isDev, serverConfig, usePublicConfig} from "@/server/config";
import cors from 'cors'
import stripAnsi from "strip-ansi";
import {engine} from "express-handlebars";
import {encodeBase58String} from "@/atom/common/utils/basex";
import path from 'node:path'

const workerPort = process.env.PORT || 7201;

type HandlerFunc = (request: Request, response: Response) => Promise<Response<any, Record<string, any>> | undefined | void>;

function handleErrors(handlerFunc: HandlerFunc) {

    return async (req: Request, res: Response, next: NextFunction) => {
        try {
            await handlerFunc(req, res);
        } catch (e) {
            next(e);
        }
    }
}

async function healthCheck(
    request: Request,
    response: Response,) {
    response.status(200).send({
        code: 200,
        message: 'ok'
    })
}

function runMain() {
    const server = express();

    // 解决跨域问题
    server.use(cors({
        credentials: true,
        origin: true,
    }));
    server.use(express.json());
    server.use(express.urlencoded({extended: true}));

    server.get('/suzaku/healthz', handleErrors(healthCheck));

    server.engine('handlebars', engine());
    server.engine('.hbs', engine({extname: '.hbs'}));
    server.set('view engine', '.hbs');

    const cwd = process.cwd();
    console.log('current dir', cwd)

    const browserConfigString = JSON.stringify(usePublicConfig())
    const mainParams: any = {
        suzakuSrc: isDev() ? '/suzaku/src/browser/browser.tsx' : '/suzaku/assets/browser.mjs',
    }

    if (isDev()) {
        console.log('isDev')
        mainParams.suzakuStyle = '/suzaku/assets/suzaku.css';
        mainParams.LGEnv = encodeBase58String(browserConfigString)
        const basename = path.basename(cwd)

        const parentDir =cwd.substring(0, cwd.length - basename.length)
        if (!parentDir) {
            throw new Error('parent dir not found')
        }
        server.set('views', `${cwd}/src/server/templates`);
        const flutterWebDir = path.join(parentDir, 'build', 'web')
        console.log('flutterWebDir', flutterWebDir)
        server.use('/suzaku', express.static(flutterWebDir));
        server.get('/suzaku{*any}', (req, res) => {
            res.render('home', mainParams);
        });
    } else {
        console.log('isProd')
        mainParams.suzakuStyle = '/suzaku/assets/suzaku.css';
        mainParams.LGEnv = encodeBase58String(browserConfigString)

        server.set('views', `${cwd}/dist/templates`);
        const flutterWebDir = path.join(cwd, 'build', 'web')
        console.log('flutterWebDir', flutterWebDir)
        server.use('/suzaku', express.static(flutterWebDir));
        server.get('/suzaku{*any}', (req, res) => {
            res.render('home', mainParams);
        });
    }


    server.use((err: Error, req: Request, res: Response, next: NextFunction) => {
        const message = stripAnsi(err.stack || err.message || 'Unknown error')
        res.status(500).send({
            code: 500,
            message: message
        })
    })

    const httpServer = http.createServer(server);

    httpServer.listen(workerPort, async () => {
        console.log(
            `Worker server is running on http://0.0.0.0:${workerPort}`,
        );
    });
}


runMain();


import express, {Request, Response, NextFunction} from "express";
import http from "http";
import cors from 'cors'
import stripAnsi from "strip-ansi";

function handleErrors(
    handlerFunc: (request: Request, response: Response) => Promise<Response<any, Record<string, any>> | undefined | void>) {

    return async (req: Request, res: Response, next: NextFunction) => {
        try {
            await handlerFunc(req, res);
        } catch (e) {
            next(e);
        }
    }
}

export async function sayHello(
    request: Request,
    response: Response,
) {
    response.json({
        code: 200,
        message: "Hello, World!",
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

    server.get("/", handleErrors(sayHello));

    server.use((err: Error, req: Request, res: Response, next: NextFunction) => {
        const message = stripAnsi(err.stack || err.message || 'Unknown error')
        res.status(500).send({
            code: 500,
            message: message
        })
    })

    const httpServer = http.createServer(server);
    const workerPort = 7103;

    httpServer.listen(workerPort, async () => {
        console.log(
            `Worker server is running on http://0.0.0.0:${workerPort}`,
        );
    });
}


runMain();

// 解析配置信息
import dotenv from "dotenv";
import {IBrowserConfig} from "@/common/config";

const result = dotenv.config({path: `.env.${process.env.RUN_MODE ?? 'development'}`})
if (result.error) {
    throw new Error(`解析配置出错: ${result.error}`)
}

interface IServerConfig {
    PUBLIC_SELF_URL: string,
}

function parseConfig(): IServerConfig {
    const config = {
        PUBLIC_SELF_URL: process.env.PUBLIC_SELF_URL || ''
    }
    if (!config.PUBLIC_SELF_URL) {
        throw new Error('PUBLIC_SELF_URL is required')
    }

    return config
}

export function usePublicConfig(): IBrowserConfig {
    const selfUrl = process.env.PUBLIC_SELF_URL || ''
    if (!selfUrl) {
        throw new Error('PUBLIC_SELF_URL is required')
    }
    const runMode = process.env.RUN_MODE || 'development'
    if (!runMode) {
        throw new Error('RUN_MODE is required')
    }
    return {
        PUBLIC_SELF_URL: selfUrl,
        PUBLIC_MODE: runMode,
    }
}

export const serverConfig = parseConfig()


export function isDev() {
    return !process.env.RUN_MODE || process.env.RUN_MODE === 'development'
}

export function isTest() {
    return process.env.RUN_MODE === 'test'
}

export function isProd() {
    return process.env.RUN_MODE === 'production'
}

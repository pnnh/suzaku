cmake_minimum_required(VERSION 3.28)

project(polaris-desktop VERSION 0.1 LANGUAGES C CXX)

# 设置语言标准
set(CMAKE_C_STANDARD 23)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 设置开启显示详细的构建过程
set(CMAKE_VERBOSE_MAKEFILE ON)

# 启用测试
enable_testing()

# 查找并设置ccache
find_program(CCACHE_PROGRAM ccache)
if (CCACHE_PROGRAM)
    set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE "${CCACHE_PROGRAM}")
endif ()

# 设置生成clangd compile_commands.json文件，方便和IDE集成
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include_directories(${CMAKE_CURRENT_SOURCE_DIR})

add_subdirectory(shared)
add_subdirectory(tests)




set(LIB_NAME ${PROJECT_NAME})
set(APP_SOURCES
        models/LibraryModel.cpp
        models/LibraryModel.h
        models/ImageModel.cpp
        models/ImageModel.h
        models/PictureProvider.cpp
        models/PictureProvider.h
        utils/md5.h
        utils/md5.cpp
        utils/mime.h
        utils/mime.cpp)

if (EMSCRIPTEN)
    list(APPEND APP_SOURCES
        platform/wasm/wasm.cpp
        platform/wasm/wasm.h
        platform/wasm/browser.cpp)
    add_executable(${LIB_NAME} ${APP_SOURCES})
    set_target_properties(${LIB_NAME} PROPERTIES LINK_FLAGS "-lembind -sMODULARIZE -sENVIRONMENT=web -sTOTAL_MEMORY=32MB --embind-emit-tsd ${LIB_NAME}.d.ts")

    install(FILES
            "$<TARGET_FILE_DIR:${LIB_NAME}>/${LIB_NAME}.js"
            "$<TARGET_FILE_DIR:${LIB_NAME}>/${LIB_NAME}.wasm"
            "$<TARGET_FILE_DIR:${LIB_NAME}>/${LIB_NAME}.d.ts"
            DESTINATION browser)
else ()
    add_library(${LIB_NAME} SHARED ${APP_SOURCES})
endif ()

find_package(OpenSSL REQUIRED)
target_link_libraries(${LIB_NAME} PRIVATE OpenSSL::Crypto)

install(TARGETS ${LIB_NAME}
        BUNDLE DESTINATION .
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})


if(WIN32 OR APPLE OR LINUX)
    # 以下是原mobile项目native目录下的内容
    add_library(pulsar-native SHARED
            database/quantum.cc
            database/quantum.h
            database/quantum.def
    )
    # 查找并引用日志库
    find_package(spdlog CONFIG REQUIRED)
    target_link_libraries(pulsar-native PRIVATE spdlog::spdlog)

    # 查找并引用sqlite3
    find_package(unofficial-sqlite3 CONFIG REQUIRED)
    target_link_libraries(pulsar-native PRIVATE unofficial::sqlite3::sqlite3)


    if (APPLE)
        message("configure for Apple")
        set_target_properties(pulsar-native PROPERTIES
                FRAMEWORK TRUE
                FRAMEWORK_VERSION A
                VERSION ${PROJECT_VERSION}
                SOVERSION 1
                OUTPUT_NAME "pulsar-native"
                XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "iPhone Developer"
                MACOSX_BUNDLE TRUE)
    endif ()

    set_target_properties(pulsar-native PROPERTIES
            VERSION ${PROJECT_VERSION}
            SOVERSION 1
            OUTPUT_NAME "pulsar-native")

    target_compile_definitions(pulsar-native PUBLIC DART_SHARED_LIB)

    install(TARGETS pulsar-native
            RUNTIME_DEPENDENCY_SET pulsar-native-dependencies
            DESTINATION shared)
    install(RUNTIME_DEPENDENCY_SET pulsar-native-dependencies)

    install(DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/"
            DESTINATION include/pulsar/native
            FILES_MATCHING PATTERN "*.h")
endif ()




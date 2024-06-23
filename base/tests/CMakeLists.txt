set(TEST_NAME tests)

if (NOT EMSCRIPTEN)
    add_executable(${TEST_NAME}
            main.cpp
            utils/md5.hpp)
    target_link_libraries(${TEST_NAME} PRIVATE ${LIB_NAME})
endif ()

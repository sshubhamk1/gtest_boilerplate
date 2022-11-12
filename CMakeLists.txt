cmake_minimum_required(VERSION 3.0.0)
project(test_project VERSION 0.1.0)

include(CTest)
enable_testing()
add_executable(test_project ${PROJECT_SOURCE_DIR}/src/main.cpp)
set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
set(ROOT_DIR ${PROJECT_SOURCE_DIR})
include(ExternalProject)
set(CMAKE_CXX_STANDARD 14)
ExternalProject_Add(
    googletest
    GIT_REPOSITORY git@github.com:google/googletest.git
    GIT_TAG main
    GIT_REMOTE_NAME origin
    SOURCE_DIR ${ROOT_DIR}/thirdparty/googletest
    BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/thirdparty/googletest
    CMAKE_ARGS -DBuildShared=ON -DBuildExamples=OFF -DCMAKE_INSTALL_PREFIX=${CMAKE_CURRENT_BINARY_DIR}/lib/googletest 
)

target_include_directories( ${PROJECT_NAME} 
    PUBLIC
    ${CMAKE_CURRENT_BINARY_DIR}/lib/googletest/include
)

target_link_directories( ${PROJECT_NAME}
    PRIVATE
    ${CMAKE_CURRENT_BINARY_DIR}/lib/googletest/lib64
)


target_link_libraries(${PROJECT_NAME} gtest gtest_main pthread)

include(CPack)
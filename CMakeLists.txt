cmake_minimum_required(VERSION 3.0.0)
project(CP VERSION 0.1.0)

set(HEADER_FILES ${CMAKE_SOURCE_DIR}/cxx-prettyprint/ ${CMAKE_SOURCE_DIR}/)



add_executable(main main.cc)
target_include_directories(main PRIVATE ${HEADER_FILES})
target_link_libraries(main -lgmp)

cmake_minimum_required(VERSION 3.16)

project(AdExample VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(${PROJECT_NAME}
    main.cpp
)

file(GLOB AD_CPP_FILES ad/*.mm ad/*.h)
target_sources(${PROJECT_NAME} PRIVATE ${AD_CPP_FILES})

message("Copy ${CMAKE_CURRENT_SOURCE_DIR}/Podfile -> ${CMAKE_BINARY_DIR}")
add_custom_target(copy_podfile
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
        "${CMAKE_CURRENT_SOURCE_DIR}/Podfile"
        "${CMAKE_BINARY_DIR}"
    COMMENT "Copying Podfile"
)
add_dependencies(${PROJECT_NAME} copy_podfile)


set (CMAKE_CONFIGURATION_TYPES Debug Release)

cmake_minimum_required (VERSION 2.6)
project (Console)

include_directories (${Console_SOURCE_DIR}/../../Shared)

add_subdirectory (${Console_SOURCE_DIR}/../../Shared/Core Core)

add_executable (Console
    main.cpp
)

target_link_libraries (Console Core)
set (CMAKE_CONFIGURATION_TYPES Debug Release)

cmake_minimum_required (VERSION 2.6)
project (Console)

include_directories (${Console_SOURCE_DIR}/../../Shared)
include_directories (${Console_SOURCE_DIR}/../../External/zlib)

add_subdirectory (${Console_SOURCE_DIR}/../../Shared/Core Core)

add_subdirectory (${Console_SOURCE_DIR}/../../External/zlib zlib)
include_directories (${CMAKE_BINARY_DIR}/zlib)

add_executable (Console
    main.cpp
)

target_link_libraries (Console Core)
target_link_libraries (Console zlib)
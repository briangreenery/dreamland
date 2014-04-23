cmake_minimum_required(VERSION 2.8)

include(Build/macros.cmake)

# Output executables in the 'bin' directory
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# Output static libraries in the 'lib' directory
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)

# Output tests in the 'test' directory
set(TEST_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/test)

add_subdirectory(Applications)
add_subdirectory(External)
add_subdirectory(Shared)

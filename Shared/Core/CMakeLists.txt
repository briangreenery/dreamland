set (CMAKE_CONFIGURATION_TYPES Debug Release)

cmake_minimum_required (VERSION 2.6)
project (Core)

include_directories (${Core_SOURCE_DIR}/..)

add_library (Core STATIC
  Hodor.cpp
)

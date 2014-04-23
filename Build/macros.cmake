# Add source files to the project

macro(add_bigfix_sources)
  list(APPEND BIGFIX_SOURCES ${ARGV})
endmacro()

# Create an executable

macro(add_bigfix_executable name)
  project(${name})
  set(BIGFIX_PROJECT_NAME ${name})
  add_executable(${name} ${BIGFIX_SOURCES})
  target_include_directories(${name} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
endmacro()

# Create a static library of bigfix code

macro(add_bigfix_library name)
  project(${name})
  set(BIGFIX_PROJECT_NAME ${name})
  add_library(${name} STATIC ${BIGFIX_SOURCES})
  target_include_directories(${name} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
endmacro()

# Add a test suite

macro(add_bigfix_test_suite name)
  set(testName ${name}Test)
  project(${testName})
  set(BIGFIX_PROJECT_NAME ${testName})
  add_executable(${testName} ${BIGFIX_SOURCES})
  target_link_libraries(${testName} PRIVATE gtest gtest_main)
  target_include_directories(
    ${testName}
    PRIVATE
    ${CMAKE_SOURCE_DIR}/External/gtest-1.7.0/include
  )
  set_target_properties(${testName} PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${TEST_OUTPUT_DIRECTORY})
endmacro()

# Add a dependency on a bigfix library

macro(add_bigfix_library_dependencies)
  target_link_libraries(${BIGFIX_PROJECT_NAME} PUBLIC ${ARGV})
endmacro()

include(CMakeParseArguments)

# Create an executable

macro(add_bigfix_executable name)
  cmake_parse_arguments(ARG "" "" "SOURCES;DEPENDS" ${ARGN})

  add_executable(${name} ${ARG_SOURCES})
  target_include_directories(${name} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
  target_link_libraries(${name} PUBLIC ${ARG_DEPENDS})
  set_target_properties(${name} PROPERTIES FOLDER Applications)
endmacro()

# Create a static library

macro(add_bigfix_library name)
  cmake_parse_arguments(ARG "" "" "SOURCES;DEPENDS" ${ARGN})

  add_library(${name} STATIC ${ARG_SOURCES})
  target_include_directories(${name} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
  target_link_libraries(${name} PUBLIC ${ARG_DEPENDS})
  set_target_properties(${name} PROPERTIES FOLDER Shared)
endmacro()

# Add a test suite

macro(add_bigfix_test_suite name)
  cmake_parse_arguments(ARG "" "" "SOURCES;DEPENDS" ${ARGN})

  # Build the test
  add_executable(${name} EXCLUDE_FROM_ALL ${ARG_SOURCES})
  target_link_libraries(${name} PRIVATE gtest gtest_main)
  target_link_libraries(${name} PUBLIC ${ARG_DEPENDS})
  set_target_properties(${name} PROPERTIES FOLDER Tests)

  # Output in the 'tests' folder
  set_target_properties(${testName} PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${TEST_OUTPUT_DIRECTORY})

  # Run the test
  set(runTest Run${name})
  add_custom_target(${runTest} COMMAND ${name})
  add_dependencies(${runTest} ${name})
  set_target_properties(${runTest} PROPERTIES FOLDER Tests)

  # Add the test run to the 'test' target
  add_dependencies(test ${runTest})
endmacro()

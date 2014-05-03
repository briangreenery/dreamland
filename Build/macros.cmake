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
  set_target_properties(${name} PROPERTIES FOLDER Applications)
endmacro()

# Create a static library of bigfix code

macro(add_bigfix_library name)
  project(${name})
  set(BIGFIX_PROJECT_NAME ${name})
  add_library(${name} STATIC ${BIGFIX_SOURCES})
  target_include_directories(${name} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
  set_target_properties(${name} PROPERTIES FOLDER Shared)
endmacro()

# Add a test suite

macro(add_bigfix_test_suite name)
  set(testName ${name}Test)
  project(${testName})
  set(BIGFIX_PROJECT_NAME ${testName})

  # Build the test executable
  add_executable(${testName} EXCLUDE_FROM_ALL ${BIGFIX_SOURCES})
  target_link_libraries(${testName} PRIVATE gtest gtest_main)
  set_target_properties(${testName} PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${TEST_OUTPUT_DIRECTORY})

  # Run the test executable
  set(runTestName Run${testName})
  add_custom_target(${runTestName} COMMAND ${testName})
  add_dependencies(${runTestName} ${testName})

  # Add the test run to the 'test' target
  add_dependencies(test ${runTestName})

  # Put the build and run projects in the 'Tests' folder in Visual Studio
  set_target_properties(${testName} PROPERTIES FOLDER Tests)
  set_target_properties(${runTestName} PROPERTIES FOLDER Tests)
endmacro()

# Add a dependency on a bigfix library

macro(add_bigfix_library_dependencies)
  target_link_libraries(${BIGFIX_PROJECT_NAME} PUBLIC ${ARGV})
endmacro()

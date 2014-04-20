# Add source files to the project

macro(add_bigfix_sources)
  list(APPEND BIGFIX_SOURCES ${ARGV})
endmacro()

# Create an executable

macro(add_bigfix_executable name)
  project(${name})
  set(BIGFIX_PROJECT_NAME ${name})
  add_executable(${name} ${BIGFIX_SOURCES})
endmacro()

# Create a shared static library

macro(add_bigfix_library name)
  project(${name})
  set(BIGFIX_PROJECT_NAME ${name})
  add_library(${name} STATIC ${BIGFIX_SOURCES})
  target_include_directories(${name} PUBLIC Source)
endmacro()

# Add a dependency on a bigfix library

macro(add_bigfix_library_dependencies)
  foreach(bigfixLibrary ${ARGV})
    target_link_libraries(${BIGFIX_PROJECT_NAME} PUBLIC ${bigfixLibrary})
  endforeach()
endmacro()

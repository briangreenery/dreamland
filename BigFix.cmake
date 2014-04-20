# Add source files to the project

macro(add_bigfix_sources)
  file(
    RELATIVE_PATH
    relativePath
    "${BIGFIX_PROJECT_DIR}"
    "${CMAKE_CURRENT_SOURCE_DIR}"
  )

  foreach(sourceFile ${ARGV})
    list(APPEND BIGFIX_SOURCES "${relativePath}/${sourceFile}")
  endforeach()

  set(BIGFIX_SOURCES ${BIGFIX_SOURCES} PARENT_SCOPE)
endmacro()

# Create an executable

macro(add_bigfix_executable name)
  project(${name})
  set(BIGFIX_PROJECT_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
  set(BIGFIX_PROJECT_NAME ${name})
  add_subdirectory(Source)
  add_executable(${name} ${BIGFIX_SOURCES})
endmacro()

# Create a shared static library

macro(add_bigfix_library name)
  project(${name})
  set(BIGFIX_PROJECT_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
  set(BIGFIX_PROJECT_NAME ${name})
  add_subdirectory(Source/${name})
  add_library(${name} STATIC ${BIGFIX_SOURCES})
  target_include_directories(${name} PUBLIC Source)
endmacro()

# Add a dependency on a bigfix library

macro(add_bigfix_library_dependencies)
  foreach(bigfixLibrary ${ARGV})
    target_link_libraries(${BIGFIX_PROJECT_NAME} PUBLIC ${bigfixLibrary})
  endforeach()
endmacro()

add_bigfix_sources(
  Hodor/main.cpp
  Hodor/PrintTime.cpp
)

add_bigfix_executable(Hodor)
add_bigfix_library_dependencies(Time)

project(gtest)
add_library(gtest STATIC EXCLUDE_FROM_ALL src/gtest-all.cc)
target_include_directories(gtest PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories(gtest PUBLIC include)

target_compile_definitions(gtest PUBLIC -DGTEST_HAS_PTHREAD=0)

if (WIN32)
  target_compile_definitions(gtest PUBLIC -DGTEST_OS_WINDOWS=1)
endif()

# Visual Studio 2012 only supports up to 8 template parameters in
# std::tr1::tuple by default, but gtest requires 10
if (MSVC AND MSVC_VERSION EQUAL 1700)
  target_compile_definitions(gtest PUBLIC -D_VARIADIC_MAX=10)
endif()

project(gtest_main)
add_library(gtest_main STATIC EXCLUDE_FROM_ALL src/gtest_main.cc)
target_link_libraries(gtest_main gtest)

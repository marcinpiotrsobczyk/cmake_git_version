cmake_minimum_required(VERSION 3.16)


add_executable(main main.cpp)


find_package(Git)
if(EXISTS ${CMAKE_SOURCE_DIR}/.git AND GIT_FOUND)
execute_process(
  COMMAND ${GIT_EXECUTABLE} rev-parse HEAD
  OUTPUT_VARIABLE VERSION_STRING
  OUTPUT_STRIP_TRAILING_WHITESPACE
  RESULT_VARIABLE res
  WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
  ECHO_OUTPUT_VARIABLE
)
else()
  set(VERSION_STRING "Unknown")
endif()
message("detected git revision: `${VERSION_STRING}`")
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/version.cpp.in ${CMAKE_CURRENT_BINARY_DIR}/version.cpp @ONLY ESCAPE_QUOTES)
add_library(cgv ${CMAKE_CURRENT_SOURCE_DIR}/version.hpp ${CMAKE_CURRENT_BINARY_DIR}/version.cpp)
target_link_libraries(main PRIVATE cgv)

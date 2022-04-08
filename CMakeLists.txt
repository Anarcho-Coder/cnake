cmake_minimum_required(VERSION 3.13)  # CMake version check
project(cnake)               # Create project "simple_example"
set(CMAKE_CXX_STANDARD 14)            # Enable c++14 standard

# Add main.cpp file of project root directory as source file
set(SOURCE_FILES main.cpp)
# Set SDL2 constants
set(GCC_SDL2_LINK_FLAGS "-lSDL2")

add_definitions(${GCC_SDL2_LINK_FLAGS})

find_package(SDL2 REQUIRED)
include_directories(${SDL2_INCLUDE_DIRS})

# Add executable target with source files listed in SOURCE_FILES variable
add_executable(cnake ${SOURCE_FILES})

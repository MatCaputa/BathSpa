# CMake minimum required verison
cmake_minimum_required(VERSION 3.10)

# Project definition
project(vending_machine VERSION 1.0 DESCRIPTION "Console-based Vending Machine application." LANGUAGES CXX)

# Compiler standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Executable file and source map
add_executable(vending_machine
    src/main.cpp
    src/VendingMachine.cpp
    src/GridSlot.cpp
    src/Product.cpp
    src/Utils.cpp
)

# Compiler error levels
if(MSVC)
    target_compile_options(vending_machine PRIVATE /W4)
else()
    target_compile_options(vending_machine PRIVATE -Wall -Wextra -Wpedantic)
endif()

# Headers folder
target_include_directories(vending_machine PRIVATE include)

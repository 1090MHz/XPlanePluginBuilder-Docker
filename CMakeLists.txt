cmake_minimum_required(VERSION 3.10)

# Set the project name and version
project(XPlanePlugin VERSION 1.0)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Add the source files
set(SOURCES
    src/YourPluginSourceFile.cpp
)

# Include directories
include_directories(
    ${CMAKE_SOURCE_DIR}/XPSDK410/CHeaders/XPLM
    ${CMAKE_SOURCE_DIR}/XPSDK410/CHeaders/Widgets
)

# Add the shared library
add_library(${PROJECT_NAME} SHARED ${SOURCES})

# Set the output directory for the plugin
set_target_properties(${PROJECT_NAME} PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/build
    PREFIX ""
    SUFFIX ".xpl"
)

# Link any necessary libraries (if any)
# target_link_libraries(${PROJECT_NAME} <library_name>)
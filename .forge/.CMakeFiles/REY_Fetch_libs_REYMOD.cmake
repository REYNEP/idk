# --------------------
#  INPUT Options:- 
#       ${libs_REYMOD} ----> Path to ".libs_REYMOD"
# OUTPUT Options:- 
#       ${libs_include_SOURCE_DIR} ---------> Path to ".libs_REYMOD/include"
# --------------------


# Set the directory to count files in
set(DIRECTORY_TO_COUNT ${libs_REYMOD}/include)

# Get all files in the directory --- [That '*' is important]
file(GLOB FILES_IN_DIRECTORY "${DIRECTORY_TO_COUNT}/*")

# Count the number of files
list(LENGTH FILES_IN_DIRECTORY FILE_COUNT)


if ((FILE_COUNT GREATER 0) AND (EXISTS "${libs_REYMOD}/include/vulkan"))
    message(STATUS "Already Fetched before")
else()
    message(STATUS "Fetching Now")

    include(FetchContent)
    set(FETCHCONTENT_QUIET FALSE)    # Doesn't have any effect on "GIT_PROGRESS" / "LOG_DOWNLOAD"

    FetchContent_Declare(
        libs-include
        GIT_REPOSITORY https://github.com/REYNEP/libs-include
        GIT_TAG        94eb1819aaa5401902e2d673bac667fa84dfe380
        GIT_PROGRESS   TRUE         # ON:- logs DOWNLOAD_PROGRESS into `LOG_DIR`

        PREFIX       ${libs_REYMOD}/CMakeFetchLogs/prefix
        SOURCE_DIR   ${libs_REYMOD}/include
        DOWNLOAD_DIR ${libs_REYMOD}/CMakeFetchLogs/include-download

        STAMP_DIR    ${libs_REYMOD}/CMakeFetchLogs/include-stamp
        LOG_DIR      ${libs_REYMOD}/CMakeFetchLogs/include-log
        LOG_DOWNLOAD   TRUE
        LOG_UPDATE     TRUE
        LOG_PATCH      TRUE
        LOG_CONFIGURE  TRUE
        LOG_BUILD      TRUE
        LOG_INSTALL    TRUE
        LOG_TEST       TRUE
        LOG_MERGED_STDOUTERR TRUE
        #More Options:- https://cmake.org/cmake/help/latest/module/ExternalProject.html
        #Quote:-
        #   "The <contentOptions> can be any of the download, update, or patch options that the ExternalProject_Add() command understands."
    )

    message(STATUS "Fetching https://github.com/REYNEP/libs-include inside ${libs_REYMOD}")
    message(STATUS "Download Progress being logged inside ${libs_REYMOD}")

        FetchContent_MakeAvailable(libs-include)

    message(STATUS "Fetching Done")

        execute_process(
            COMMAND ${CMAKE_COMMAND} -E tar xvf "${libs_REYMOD}/include/vulkan-headers.zip"
            WORKING_DIRECTORY ${libs_REYMOD}/include
        )

    message(STATUS "Extracted vulkan-headers.zip")
endif()
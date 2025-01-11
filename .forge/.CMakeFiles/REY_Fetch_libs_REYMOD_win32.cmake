
# --------------------
#  INPUT Options:- 
#       ${libs_REYMOD} ----> Path to ".libs_REYMOD"
# OUTPUT Options:- 
#       ${libs_win32_SOURCE_DIR} ---------> Path to ".libs_REYMOD/win32"
# --------------------

include(FetchContent)
set(FETCHCONTENT_QUIET TRUE)        # Doesn't have any effect on "GIT_PROGRESS" / "LOG_DOWNLOAD"

    FetchContent_Declare(
        libs-win32
        GIT_REPOSITORY https://github.com/REYNEP/libs-win32
        GIT_TAG        31f9175b76248c692ef4f8034482ad69fb9d3bfc
        GIT_PROGRESS   TRUE         # ON:- logs DOWNLOAD_PROGRESS into `LOG_DIR`

        PREFIX       ${libs_REYMOD}/CMakeFetchLogs/prefix
        SOURCE_DIR   ${libs_REYMOD}/win32
        DOWNLOAD_DIR ${libs_REYMOD}/CMakeFetchLogs/win32-download

        STAMP_DIR    ${libs_REYMOD}/CMakeFetchLogs/win32-stamp
        LOG_DIR      ${libs_REYMOD}/CMakeFetchLogs/win32-log
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

    message(STATUS "Fetching https://github.com/REYNEP/libs_win32 inside ${libs_REYMOD}")
    message(STATUS "Download Progress being logged inside ${libs_REYMOD}")
        FetchContent_MakeAvailable(libs-win32)
    message(STATUS "Fetching Done")
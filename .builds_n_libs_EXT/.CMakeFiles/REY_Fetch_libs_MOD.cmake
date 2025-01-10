
# --------------------
#  INPUT Options:- 
#       ${libs_MOD} ----> Path to ".libs_MOD"
# OUTPUT Options:- 
#       ${libs_include_SOURCE_DIR} ---------> Path to ".libs_MOD/include"
# --------------------

include(FetchContent)
set(FETCHCONTENT_QUIET TRUE)        # Doesn't have any effect on "GIT_PROGRESS" / "LOG_DOWNLOAD"

    FetchContent_Declare(
        libs_include
        GIT_REPOSITORY https://github.com/REYNEP/libs_include
        GIT_TAG        94eb1819aaa5401902e2d673bac667fa84dfe380
        GIT_PROGRESS   TRUE         # ON:- logs DOWNLOAD_PROGRESS into `LOG_DIR`

        PREFIX       ${libs_MOD}/CMakeFetchLogs/prefix
        SOURCE_DIR   ${libs_MOD}/include
        DOWNLOAD_DIR ${libs_MOD}/CMakeFetchLogs/include-download

        STAMP_DIR    ${libs_MOD}/CMakeFetchLogs/include-stamp
        LOG_DIR      ${libs_MOD}/CMakeFetchLogs/include-log
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

    message(STATUS "Fetching https://github.com/REYNEP/libs_include inside ${libs_MOD}")
    message(STATUS "Download Progress being logged inside ${libs_MOD}")
        FetchContent_MakeAvailable(libs_include)
    message(STATUS "Fetching Done")

if (NOT EXISTS "${libs_MOD}/include/vulkan")
    execute_process(
        COMMAND ${CMAKE_COMMAND} -E tar xvf "${libs_include_SOURCE_DIR}/vulkan-headers.zip"
        WORKING_DIRECTORY ${libs_include_SOURCE_DIR}
    )
endif()
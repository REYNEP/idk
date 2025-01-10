#[[ --------------------

    FetchContent_Declare(
        Vulkan-Headers
        GIT_REPOSITORY https://github.com/KhronosGroup/Vulkan-Headers
        GIT_TAG        d4a196d8c84e032d27f999adcea3075517c1c97f     # Update for "Vulkan-Docs" Version:- 1.4.304
        GIT_PROGRESS   TRUE         # ON:- logs DOWNLOAD_PROGRESS into `LOG_DIR`

        LOG_DIR ${FETCHCONTENT_BASE_DIR}
        LOG_DOWNLOAD   TRUE
        LOG_UPDATE     TRUE
        LOG_PATCH      TRUE
        LOG_MERGED_STDOUTERR TRUE
    )

    message(STATUS "Fetching     Vulkan-Headers    inside ${FETCHCONTENT_BASE_DIR}")
    message(STATUS "Download Progress being logged inside ${FETCHCONTENT_BASE_DIR}")
        FetchContent_MakeAvailable(Vulkan-Headers)
    message(STATUS "Fetching Done")

target_include_directories(idk PUBLIC ${FETCHCONTENT_BASE_DIR}/Vulkan-Headers/include)
]]
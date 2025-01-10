## CMake_Fetch will download into these 4 Folder here in this directory.

### My Approach to External Libraries:- `CMAKE_FETCH` + Blender's Approach
    1. CMAKE_FETCH most stuffs ----> like fmt
    2. .libs_MOD = Libraries CUT/Stripped/Modified by REYNEP ----> like vulkan
        Supplying these like Blender supplies their External Libraries

    3. Even the stuff inside .libs_MOD would be fetches by CMAKE 😜

```py
.repo
    |- .forge
        |- .build_CMAKE = CMake Configuration & Building. VSCODE Settings:- "cmake.buildDirectory"

        |- .CMakeFiles = Stuff that CMakeLists.txt needs/includes

        |- .libs_CMAKE_FETCH = external libraries that need to be built PER_OS/PLATFORM
            |- fmt:- https://github.com/fmtlib/fmt

        |- .libs_GIT = alternative to CMAKE_FETCH. i.e. Manually Building 😵‍💫 [EMPTY FOR NOW]
        |- .libs_MOD = alternative to CMAKE_FETCH.
            |- include = GIT_REPO
                |- Vulkan-Headers
            |- linux   = GIT_REPO
            |- osX     = GIT_REPO
            |- win32   = GIT_REPO
                |- vulkan-1.lib
                These 4 above are Separate GIT_REPOs that I plan on to maintain
                These 4 above will be downloaded by CMAKE_FETCH during CONFIGURATION
                These 4 above won't be available to be grabbed by GIT_SUBMODULE
            |
            |- Why Separate from `libs_CMAKE_FETCH`?
                |- Stuff that "I Don't have to build". e.g. vulkan. LunarG Builds & serves that instead.
                |- CUSTOM_MODIFIED_Libraries would be here.
                |- Libraries with HUGE_DOWNLOAD size, I cut them & keep short stuff here.
                    |- Vulkan-Headers Repository = 50-70 MB GitHub download.
                        I turned it into basically    ~1 MB ZIP

        |- .sandbox_libs_EXT = My SandBox for playing around with libraries 😵‍💫 [EMPTY FOR NOW]
```
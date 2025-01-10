# ***** BEGIN GPL LICENSE BLOCK *****
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software Foundation,
# Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
#
# The Original Code is Copyright (C) 2021, REYNEP
#
# ***** END GPL LICENSE BLOCK *****
#
#   TODO:
#   TODO:
#

cmake_minimum_required(VERSION 3.25 FATAL_ERROR)

project("project_idk" VERSION 0.0.1)

    set(CMAKE_CXX_STANDARD 20)
    set(CMAKE_CXX_STANDARD_REQUIRED ON)

    

set(SRC
    "idk.cpp"
)
  
set(INC
    ".forge/.libs_MOD/include"
        # vulkan
        # vk-video
)

set(libs_MOD "${CMAKE_CURRENT_SOURCE_DIR}/.forge/.libs_MOD")
set(LIB)









# ---fetch include----
set(CMAKE_INSTALL_PREFIX ${FETCHCONTENT_BASE_DIR}/.install_CMAKE)
include(.forge/.CMakeFiles/REY_Fetch_libs_MOD.cmake)    # Input:- ${libs_MOD}

# ------options-------
option(idk_BUILD_linux     ""     OFF)      # Mind the QUOTATION MARKS. Won't work without those
option(idk_BUILD_osx       ""     OFF)      # ALSO, Remember to UNSET them from CACHE @ the end of this file.
option(idk_BUILD_win32     ""      ON)

# --------------------
if(idk_BUILD_linux)
    list(APPEND LIB "${libs_MOD}/linux")
elseif(idk_BUILD_osx)
    list(APPEND LIB "${libs_MOD}/osx")
elseif(idk_BUILD_win32)
    list(APPEND LIB "${libs_MOD}/win32")
    include(.forge/.CMakeFiles/REY_Fetch_libs_MOD_win32.cmake)    # Input:- ${libs_MOD}
endif()

# -------vulkan-------
set(REY_FindVulkan_PATHS ${LIB})                                #  Input:- ${REY_FindVulkan_PATHS}
include(.forge/.CMakeFiles/REY_FindVulkan.cmake)    # Output:- ${amVK_EXT_Vulkan}






# --------------------
           add_executable (idk ${SRC})
target_include_directories(idk PUBLIC ${INC})
target_link_libraries     (idk ${amVK_EXT_Vulkan})







# --------------------
set(FETCHCONTENT_BASE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/.forge/.libs_CMAKE_FETCH)
include(.forge/.CMakeFiles/REY_Fetch_fmk.cmake)     # Output:- fmt::fmt

target_link_libraries(idk fmt::fmt)
target_include_directories(idk PUBLIC fmt::fmt)

# --------------------
install(TARGETS idk
  DESTINATION ${CMAKE_CURRENT_SOURCE_DIR})

unset(idk_BUILD_linux            CACHE)
unset(idk_BUILD_osx              CACHE)
unset(idk_BUILD_win32            CACHE)
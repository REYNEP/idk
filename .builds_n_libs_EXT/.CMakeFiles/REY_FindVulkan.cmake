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
#-----------------------------------------------------------------------------
# I don't wanna find the entire FKIN VULKAN-SDK.... I just wanna find vulkan-1.lib
# AUTHOR: REYNEP
# DATE: 2025 Jan 10


# --------------------
# How to use:-
#   Way-1:- download LUNARG VULKAN-SDK & Install it. & Make sure to add to ENVIRONMENT VARIABLES
#              - VK_SDK_PATH = "C:\VulkanSDK\"
#              - VULKAN_INCLUDE_DIR = "C:\VulkanSDK\Include"
#              - VULKAN_SDK = "C:\VulkanSDK\"                   [or wherever you installed it]
#   Way-2:-
#          Set Where the Vulkan-1.lib is located in: ${REY_FindVulkan_PATHS}

# --------------------
#  INPUT Options:- 
#       ${REY_FindVulkan_PATHS} ----> Paths where to look for vulkan-1.lib
# OUTPUT Options:- 
#       ${amVK_EXT_Vulkan} ---------> Full_Path to vulkan-1.lib [CACHED in CMakeCache]
# --------------------



find_package(Vulkan QUIET)

if (Vulkan_FOUND)
  message(STATUS "[REY_FindVulkan]")
  message(STATUS "    `find_package(Vulkan)` Worked:- ${Vulkan_LIBRARY}")

  set(amVK_EXT_Vulkan ${Vulkan_LIBRARY} CACHE STRING "" FORCE)
else()
  find_library(amVK_EXT_Vulkan_TMP
    NAMES
      vulkan      # UNIX/MAC
      vulkan-1    # Windows
    DOC
      ""
    PATHS
      ${REY_FindVulkan_PATHS}
    PATH_SUFFIXES
      Debug
      Release
      Lib         # Windows
      lib         # UNIX/MAC
    NO_DEFAULT_PATH
    NO_CACHE
  )

  if (EXISTS ${amVK_EXT_Vulkan_TMP})
    set(amVK_EXT_Vulkan ${amVK_EXT_Vulkan_TMP} CACHE STRING "" FORCE)
    message(STATUS "[REY_FindVulkan]")
    message(STATUS "    Found 1 File:- ${amVK_EXT_Vulkan}")
  endif()
  
endif()
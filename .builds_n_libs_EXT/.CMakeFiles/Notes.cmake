# Note-0:-
# I tried to List all the "input/output Options/Variables" inside each .cmake file @ the Header/Documentation part.
#   i.e.:-
#       Every EXTERNAL      Variable each REY.cmake file uses [as like Input/Option/Settings specific to that REY.cmake]
#       Every SYSTEM/CMAKE  Variable each REY.cmake file uses
#       Every OUTGOING      Variable each REY.cmake file creates
#
# Mostly Kept, all REY.cmake files, Independant from one another.


# Note-1:- 
#   Vulkan::Vulkan should not be used. That is a "<TARGET>" that cmake provides.... So it's not a PHYSICAL ADDRESS / PATH
#       + & I Hate https://cmake.org/cmake/help/latest/policy/CMP0028.html
#   because it doesn't make sense to limit it in those circumstances, if `::` actually aren't the problems, tho I think they are....  [on WIN32 it doesn't work]
#
# 2025, January 10:- I dont know what I meant @ the above line. It was from like 2021. I was 15years old
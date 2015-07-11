# - Find Plasma library
# Find the native Plasma includes and library
#
#  PLASMA_INCLUDE_DIR - where to find plasma.h, etc.
#  PLASMA_LIBRARY_DIR - List of libraries when using Plasma.
#  PLASMA_FOUND       - True if Plasma found.

# if (PLASMA_INCLUDE_DIR)
#   # already in cache, be silent
#   set(PLASMA_FIND_QUIETLY TRUE)
# endif ()

find_path(PLASMA_INCLUDE_DIR plasma.h
  /usr/local/include/plasma
)

set(PLASMA_NAMES plasma)
find_library(PLASMA_LIBRARY
  NAMES ${PLASMA_NAMES}
  PATHS /usr/lib /usr/local/lib
  HINTS ${PLASMA_LIBRARY_DIR}
  PATH_SUFFIXES plasma
)

if (PLASMA_INCLUDE_DIR AND PLASMA_LIBRARY)
  get_filename_component(PLASMA_LIBRARY_DIR "${PLASMA_LIBRARY}" PATH)
  set(PLASMA_FOUND TRUE)
else ()
  set(PLASMA_FOUND FALSE)
endif ()

if (PLASMA_FOUND)
  if (NOT PLASMA_FIND_QUIETLY)
    message(STATUS "Found Plasma")
    message(STATUS "PLASMA_LIBRARY_DIR = ${PLASMA_LIBRARY_DIR}")
    message(STATUS "PLASMA_INCLUDE_DIR = ${PLASMA_INCLUDE_DIR}")
  endif ()
else ()
  if (PLASMA_FIND_REQUIRED)
    message(STATUS "Looked for Plasma libraries named ${PLASMA_NAMES}.")
    message(FATAL_ERROR "Could NOT find Plasma library")
  endif ()
endif ()

mark_as_advanced(
  PLASMA_LIBRARY_DIR
  PLASMA_INCLUDE_DIR
)
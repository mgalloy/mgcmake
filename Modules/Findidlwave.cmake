include(FindPackageHandleStandardArgs)

find_path(idlwave_DIR
  idlwave.el
  PATHS ~/software/idlwave ~/projects/idlwave
)

if (idlwave_DIR)
  set(idlwave_FOUND TRUE)
endif()

if (idlwave_FOUND)
  if (NOT idlwave_FIND_QUIETLY)
    message(STATUS "idlwave = ${idlwave_DIR}")
  endif ()
else ()
  if (idlwave_FIND_REQUIRED)
    message(FATAL_ERROR "Could not find idlwave!")
  endif ()
endif ()

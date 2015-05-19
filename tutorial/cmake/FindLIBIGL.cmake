# - Try to find the LIBIGL library
# Once done this will define
#
#  LIBIGL_FOUND - system has LIBIGL
#  LIBIGL_INCLUDE_DIR - the LIBIGL include directory
#  LIBIGL_SOURCES - the LIBIGL source files
if(NOT LIBIGL_FOUND)

FIND_PATH(LIBIGL_INCLUDE_DIR igl/readOBJ.h
   /usr/include
   /usr/local/include
   /usr/local/igl/libigl/include
   $ENV{LIBIGL}/include
   $ENV{LIBIGLROOT}/include
   $ENV{LIBIGL_ROOT}/include
   $ENV{LIBIGL_DIR}/include
   $ENV{LIBIGL_DIR}/inc
   ${PROJECT_SOURCE_DIR}/../libigl/include
   ${PROJECT_SOURCE_DIR}/../../libigl/include
   ${PROJECT_SOURCE_DIR}/../../include
)

if(LIBIGL_INCLUDE_DIR)
   set(LIBIGL_FOUND TRUE)
   set(LIBIGL_INCLUDE_DIR ${LIBIGL_INCLUDE_DIR}  ${LIBIGL_INCLUDE_DIR}/../external/Singular_Value_Decomposition)
   #set(LIBIGL_SOURCES
   #   ${LIBIGL_INCLUDE_DIR}/igl/viewer/Viewer.cpp
   #)
endif(LIBIGL_INCLUDE_DIR)

if(LIBIGL_USE_STATIC_LIBRARY)
  add_definitions(-DIGL_STATIC_LIBRARY)
  set(LIBIGL_LIB_DIRS
   /usr/lib
   /usr/local/lib
   $ENV{LIBIGLROOT}/lib
   $ENV{LIBIGL_ROOT}/lib
   $ENV{LIBIGL_DIR}/lib
   ${PROJECT_SOURCE_DIR}/../libigl/lib
   ${PROJECT_SOURCE_DIR}/../../libigl/lib
   ${PROJECT_SOURCE_DIR}/../../lib)
  FIND_LIBRARY( LIBIGL_LIBRARY NAMES igl PATHS ${LIBIGL_LIB_DIRS})
  if(NOT LIBIGL_LIBRARY)
    set(LIBIGL_FOUND FALSE)
    message(FATAL_ERROR "could NOT find libigl")
  endif(NOT LIBIGL_LIBRARY)
  set(LIBIGL_LIBRARIES ${LIBIGL_LIBRARIES}  ${LIBIGL_LIBRARY})

  FIND_LIBRARY( LIBIGLBBW_LIBRARY NAMES iglbbw PATHS ${LIBIGL_LIB_DIRS})
  if(NOT LIBIGLBBW_LIBRARY)
    set(LIBIGL_FOUND FALSE)
    message(FATAL_ERROR "could NOT find libiglbbw")
  endif(NOT LIBIGLBBW_LIBRARY)
  set(LIBIGL_LIBRARIES ${LIBIGL_LIBRARIES}  ${LIBIGLBBW_LIBRARY})
  FIND_LIBRARY( LIBIGLMOSEK_LIBRARY NAMES iglmosek PATHS ${LIBIGL_LIB_DIRS})
#  if(NOT LIBIGLMOSEK_LIBRARY)
#    set(LIBIGL_FOUND FALSE)
#    message(FATAL_ERROR "could NOT find libiglmosek")
#  endif(NOT LIBIGLMOSEK_LIBRARY)
  set(LIBIGL_LIBRARIES ${LIBIGL_LIBRARIES}  ${LIBIGLMOSEK_LIBRARY})
#if(MOSEK_FOUND)
#    set(LIBIGL_INCLUDE_DIR ${LIBIGL_INCLUDE_DIR}  ${MOSEK_INCLUDE_DIR})
#    set(LIBIGL_LIBRARIES ${LIBIGL_LIBRARIES}  ${MOSEK_LIBRARIES})
#  else(MOSEK_FOUND)
#    set(LIBIGL_FOUND FALSE)
#    message(FATAL_ERROR "could NOT find mosek")
#  endif(MOSEK_FOUND)

  FIND_LIBRARY( LIBIGLCGAL_LIBRARY NAMES iglcgal PATHS ${LIBIGL_LIB_DIRS})
  if(NOT LIBIGLCGAL_LIBRARY)
    set(LIBIGL_FOUND FALSE)
    message(FATAL_ERROR "could NOT find libiglcgal")
  endif(NOT LIBIGLCGAL_LIBRARY)
  set(LIBIGL_LIBRARIES ${LIBIGL_LIBRARIES}  ${LIBIGLCGAL_LIBRARY})

  FIND_LIBRARY( LIBIGLBOOLEAN_LIBRARY NAMES iglboolean PATHS ${LIBIGL_LIB_DIRS})
  if(NOT LIBIGLBOOLEAN_LIBRARY)
    set(LIBIGL_FOUND FALSE)
    message(FATAL_ERROR "could NOT find libiglboolean ")
  endif(NOT LIBIGLBOOLEAN_LIBRARY)
  set(LIBIGL_LIBRARIES ${LIBIGL_LIBRARIES}  ${LIBIGLBOOLEAN_LIBRARY})

  FIND_LIBRARY( LIBIGLEMBREE_LIBRARY NAMES iglembree PATHS ${LIBIGL_LIB_DIRS})
  if(NOT LIBIGLEMBREE_LIBRARY)
    set(LIBIGL_FOUND FALSE)
    message(FATAL_ERROR "could NOT find libiglembree")
  endif(NOT LIBIGLEMBREE_LIBRARY)
  set(LIBIGL_LIBRARIES ${LIBIGL_LIBRARIES}  ${LIBIGLEMBREE_LIBRARY})
  find_package(Embree REQUIRED)

  FIND_LIBRARY( LIBIGLLIM_LIBRARY NAMES igllim PATHS ${LIBIGL_LIB_DIRS})
  if(NOT LIBIGLLIM_LIBRARY)
    set(LIBIGL_FOUND FALSE)
    message(FATAL_ERROR "could NOT find libigllim")
  endif(NOT LIBIGLLIM_LIBRARY)
  set(LIBIGL_LIBRARIES ${LIBIGL_LIBRARIES}  ${LIBIGLLIM_LIBRARY})

  FIND_LIBRARY( LIBIGLMATLAB_LIBRARY NAMES iglmatlab PATHS ${LIBIGL_LIB_DIRS})
  if(NOT LIBIGLMATLAB_LIBRARY)
    set(LIBIGL_FOUND FALSE)
    message(FATAL_ERROR "could NOT find libiglmatlab")
  endif(NOT LIBIGLMATLAB_LIBRARY)
  set(LIBIGL_LIBRARIES ${LIBIGL_LIBRARIES}  ${LIBIGLMATLAB_LIBRARY})
  find_package(Matlab REQUIRED)
  if(MATLAB_FOUND)
    set(LIBIGL_INCLUDE_DIR ${LIBIGL_INCLUDE_DIR}  ${MATLAB_INCLUDE_DIR})
    set(LIBIGL_LIBRARIES ${LIBIGL_LIBRARIES}  ${MATLAB_LIBRARIES})
  else(MATLAB_FOUND)
    set(LIBIGL_FOUND FALSE)
    message(FATAL_ERROR "could NOT find matlab")
  endif(MATLAB_FOUND)

  FIND_LIBRARY( LIBIGLSVD3X3_LIBRARY NAMES iglsvd3x3 PATHS ${LIBIGL_LIB_DIRS})
  if(NOT LIBIGLSVD3X3_LIBRARY)
    set(LIBIGL_FOUND FALSE)
    message(FATAL_ERROR "could NOT find libiglsvd3x3")
  endif(NOT LIBIGLSVD3X3_LIBRARY)
  set(LIBIGL_LIBRARIES ${LIBIGL_LIBRARIES}  ${LIBIGLSVD3X3_LIBRARY})

  FIND_LIBRARY( LIBIGLTETGEN_LIBRARY NAMES igltetgen PATHS ${LIBIGL_LIB_DIRS})
  if(NOT LIBIGLTETGEN_LIBRARY)
    set(LIBIGL_FOUND FALSE)
    message(FATAL_ERROR "could NOT find libigltetgen")
  endif(NOT LIBIGLTETGEN_LIBRARY)
  set(LIBIGL_LIBRARIES ${LIBIGL_LIBRARIES}  ${LIBIGLTETGEN_LIBRARY})

  FIND_LIBRARY( LIBIGLTRIANGLE_LIBRARY NAMES igltriangle PATHS ${LIBIGL_LIB_DIRS})
  if(NOT LIBIGLTRIANGLE_LIBRARY)
    set(LIBIGL_FOUND FALSE)
    message(FATAL_ERROR "could NOT find libigltriangle")
  endif(NOT LIBIGLTRIANGLE_LIBRARY)
  set(LIBIGL_LIBRARIES ${LIBIGL_LIBRARIES}  ${LIBIGLTRIANGLE_LIBRARY})

  FIND_LIBRARY( LIBIGLVIEWER_LIBRARY NAMES iglviewer PATHS ${LIBIGL_LIB_DIRS})
  if(NOT LIBIGLVIEWER_LIBRARY)
    set(LIBIGL_FOUND FALSE)
      message(FATAL_ERROR "could NOT find libiglviewer")
  endif(NOT LIBIGLVIEWER_LIBRARY)
  set(LIBIGL_LIBRARIES ${LIBIGL_LIBRARIES}  ${LIBIGLVIEWER_LIBRARY})

  find_package(OpenMP)
  if (OPENMP_FOUND)
    set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_C_FLAGS}")
    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
  else(OPENMP_FOUND)
    set(LIBIGL_FOUND false)
  endif(OPENMP_FOUND)
endif(LIBIGL_USE_STATIC_LIBRARY)



if(LIBIGL_FOUND)
   if(NOT LIBIGL_FIND_QUIETLY)
      message(STATUS "Found LIBIGL: ${LIBIGL_INCLUDE_DIR}")
   endif(NOT LIBIGL_FIND_QUIETLY)
else(LIBIGL_FOUND)
   if(LIBIGL_FIND_REQUIRED)
      message(FATAL_ERROR "could NOT find LIBIGL")
   endif(LIBIGL_FIND_REQUIRED)
endif(LIBIGL_FOUND)

MARK_AS_ADVANCED(LIBIGL_INCLUDE_DIR LIBIGL_LIBRARIES IGL_VIEWER_SOURCES)

endif(NOT LIBIGL_FOUND)

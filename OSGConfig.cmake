#get_filename_component(_osg_cmake_prefix_ ${CMAKE_CURRENT_LIST_FILE} DIRECTORY)
#set(_osg_install_prefix_ "${_osg_cmake_prefix_}/..")
cmake_path(GET CMAKE_CURRENT_LIST_FILE PARENT_PATH _osg_cmake_prefix_)
cmake_path(GET _osg_cmake_prefix_ PARENT_PATH _osg_install_prefix_)
set(OSG_INCLUDE_DIR ${_osg_install_prefix_}/include)
set(OSG_BIN_DIR ${_osg_install_prefix_}/bin)
set(OSG_DEBUG_LIBRARIES
	${_osg_install_prefix_}/lib/osgGAd.lib
	${_osg_install_prefix_}/lib/osgUtild.lib
	${_osg_install_prefix_}/lib/osgTextd.lib
	${_osg_install_prefix_}/lib/osgViewerd.lib
	${_osg_install_prefix_}/lib/OpenThreadsd.lib
)

set(OSG_RELEASE_LIBRARIES
	${_osg_install_prefix_}/lib/osgGA.lib
	${_osg_install_prefix_}/lib/osgUtil.lib
	${_osg_install_prefix_}/lib/osgText.lib
	${_osg_install_prefix_}/lib/osgViewer.lib
	${_osg_install_prefix_}/lib/OpenThreads.lib
)

set(OSG_LIBRARIES $<$<CONFIG:Debug>:${OSG_DEBUG_LIBRARIES}>$<$<CONFIG:Release>:${OSG_RELEASE_LIBRARIES}>)

add_library(OSG SHARED IMPORTED)
set_property(TARGET OSG PROPERTY IMPORTED_LOCATION ${_osg_install_prefix_}/bin)
set_property(TARGET OSG PROPERTY IMPORTED_IMPLIB ${_osg_install_prefix_}/lib/osg.lib)
set_property(TARGET OSG PROPERTY IMPORTED_IMPLIB_DEBUG ${_osg_install_prefix_}/lib/osgd.lib)
set_property(TARGET OSG PROPERTY INTERFACE_LINK_LIBRARIES ${OSG_LIBRARIES})
set_property(TARGET OSG PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${_osg_install_prefix_}/include)
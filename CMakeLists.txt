cmake_minimum_required(VERSION 3.16)

project(AdExample VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(AdExample
    main.cpp
)

qt_add_qml_module(AdExample
    URI AdExample
    VERSION 1.0
    QML_FILES
        Main.qml
)

if(IOS)
    file(GLOB AD_CPP_FILES ad/*.mm ad/*.h)
    target_sources(${PROJECT_NAME} PRIVATE ${AD_CPP_FILES})
endif()

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(AdExample PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.AdExample
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(AdExample
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS AdExample
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

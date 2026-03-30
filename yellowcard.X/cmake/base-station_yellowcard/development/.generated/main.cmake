include("${CMAKE_CURRENT_LIST_DIR}/rule.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/file.cmake")

set(base_station_yellowcard_development_library_list )

# Handle files with suffix s, for group development-XC32
if(base_station_yellowcard_development_development_XC32_FILE_TYPE_assemble)
add_library(base_station_yellowcard_development_development_XC32_assemble OBJECT ${base_station_yellowcard_development_development_XC32_FILE_TYPE_assemble})
    base_station_yellowcard_development_development_XC32_assemble_rule(base_station_yellowcard_development_development_XC32_assemble)
    list(APPEND base_station_yellowcard_development_library_list "$<TARGET_OBJECTS:base_station_yellowcard_development_development_XC32_assemble>")

endif()

# Handle files with suffix S, for group development-XC32
if(base_station_yellowcard_development_development_XC32_FILE_TYPE_assembleWithPreprocess)
add_library(base_station_yellowcard_development_development_XC32_assembleWithPreprocess OBJECT ${base_station_yellowcard_development_development_XC32_FILE_TYPE_assembleWithPreprocess})
    base_station_yellowcard_development_development_XC32_assembleWithPreprocess_rule(base_station_yellowcard_development_development_XC32_assembleWithPreprocess)
    list(APPEND base_station_yellowcard_development_library_list "$<TARGET_OBJECTS:base_station_yellowcard_development_development_XC32_assembleWithPreprocess>")

endif()

# Handle files with suffix [cC], for group development-XC32
if(base_station_yellowcard_development_development_XC32_FILE_TYPE_compile)
add_library(base_station_yellowcard_development_development_XC32_compile OBJECT ${base_station_yellowcard_development_development_XC32_FILE_TYPE_compile})
    base_station_yellowcard_development_development_XC32_compile_rule(base_station_yellowcard_development_development_XC32_compile)
    list(APPEND base_station_yellowcard_development_library_list "$<TARGET_OBJECTS:base_station_yellowcard_development_development_XC32_compile>")

endif()

# Handle files with suffix cpp, for group development-XC32
if(base_station_yellowcard_development_development_XC32_FILE_TYPE_compile_cpp)
add_library(base_station_yellowcard_development_development_XC32_compile_cpp OBJECT ${base_station_yellowcard_development_development_XC32_FILE_TYPE_compile_cpp})
    base_station_yellowcard_development_development_XC32_compile_cpp_rule(base_station_yellowcard_development_development_XC32_compile_cpp)
    list(APPEND base_station_yellowcard_development_library_list "$<TARGET_OBJECTS:base_station_yellowcard_development_development_XC32_compile_cpp>")

endif()

# Handle files with suffix [cC], for group development-XC32
if(base_station_yellowcard_development_development_XC32_FILE_TYPE_dependentObject)
add_library(base_station_yellowcard_development_development_XC32_dependentObject OBJECT ${base_station_yellowcard_development_development_XC32_FILE_TYPE_dependentObject})
    base_station_yellowcard_development_development_XC32_dependentObject_rule(base_station_yellowcard_development_development_XC32_dependentObject)
    list(APPEND base_station_yellowcard_development_library_list "$<TARGET_OBJECTS:base_station_yellowcard_development_development_XC32_dependentObject>")

endif()

# Handle files with suffix elf, for group development-XC32
if(base_station_yellowcard_development_development_XC32_FILE_TYPE_bin2hex)
add_library(base_station_yellowcard_development_development_XC32_bin2hex OBJECT ${base_station_yellowcard_development_development_XC32_FILE_TYPE_bin2hex})
    base_station_yellowcard_development_development_XC32_bin2hex_rule(base_station_yellowcard_development_development_XC32_bin2hex)
    list(APPEND base_station_yellowcard_development_library_list "$<TARGET_OBJECTS:base_station_yellowcard_development_development_XC32_bin2hex>")

endif()


# Main target for this project
add_executable(base_station_yellowcard_development_image_Y8ivZ53t ${base_station_yellowcard_development_library_list})

if(NOT CMAKE_HOST_WIN32)
    set_target_properties(base_station_yellowcard_development_image_Y8ivZ53t PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${base_station_yellowcard_development_output_dir}")
endif()
set_target_properties(base_station_yellowcard_development_image_Y8ivZ53t PROPERTIES
    OUTPUT_NAME "development"
    SUFFIX ".elf")
target_link_libraries(base_station_yellowcard_development_image_Y8ivZ53t PRIVATE ${base_station_yellowcard_development_development_XC32_FILE_TYPE_link})

# Add the link options from the rule file.
base_station_yellowcard_development_link_rule( base_station_yellowcard_development_image_Y8ivZ53t)

# Call bin2hex function from the rule file
base_station_yellowcard_development_bin2hex_rule(base_station_yellowcard_development_image_Y8ivZ53t)
if(CMAKE_HOST_WIN32)
    add_custom_command(
        TARGET base_station_yellowcard_development_image_Y8ivZ53t
        POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E make_directory ${base_station_yellowcard_development_output_dir}
        COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:base_station_yellowcard_development_image_Y8ivZ53t> ${base_station_yellowcard_development_output_dir}/${base_station_yellowcard_development_original_image_name}
        BYPRODUCTS ${base_station_yellowcard_development_output_dir}/${base_station_yellowcard_development_original_image_name}
        COMMENT "Copying elf to out location")
    set_property(
        TARGET base_station_yellowcard_development_image_Y8ivZ53t
        APPEND PROPERTY ADDITIONAL_CLEAN_FILES
        ${base_station_yellowcard_development_output_dir}/${base_station_yellowcard_development_original_image_name})
endif()

# The following step will be performed after each build if final image is rebuilt
add_custom_command(TARGET base_station_yellowcard_development_Bin2Hex POST_BUILD
    COMMAND ${MP_CC_DIR}\\xc32-objdump -S \"out\\base-station_yellowcard\"\\development.elf > build\\%{ConfigurationName}\\%{ImageType}\\%{ProjectName}.lst
    WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../../../..)

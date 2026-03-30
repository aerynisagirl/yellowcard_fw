# The following variables contains the files used by the different stages of the build process.
set(base_station_yellowcard_production_production_XC32_FILE_TYPE_assemble)
set_source_files_properties(${base_station_yellowcard_production_production_XC32_FILE_TYPE_assemble} PROPERTIES LANGUAGE ASM)

# For assembly files, add "." to the include path for each file so that .include with a relative path works
foreach(source_file ${base_station_yellowcard_production_production_XC32_FILE_TYPE_assemble})
        set_source_files_properties(${source_file} PROPERTIES INCLUDE_DIRECTORIES "$<PATH:NORMAL_PATH,$<PATH:REMOVE_FILENAME,${source_file}>>")
endforeach()

set(base_station_yellowcard_production_production_XC32_FILE_TYPE_assembleWithPreprocess)
set_source_files_properties(${base_station_yellowcard_production_production_XC32_FILE_TYPE_assembleWithPreprocess} PROPERTIES LANGUAGE ASM)

# For assembly files, add "." to the include path for each file so that .include with a relative path works
foreach(source_file ${base_station_yellowcard_production_production_XC32_FILE_TYPE_assembleWithPreprocess})
        set_source_files_properties(${source_file} PROPERTIES INCLUDE_DIRECTORIES "$<PATH:NORMAL_PATH,$<PATH:REMOVE_FILENAME,${source_file}>>")
endforeach()

set(base_station_yellowcard_production_production_XC32_FILE_TYPE_compile
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../src/Interrupts.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../src/Logging.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../src/Main.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../src/PacketStructures.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../src/drv/DPS368/DPS368.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../src/drv/HAL.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../src/drv/SHT4x/SHT4x.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../src/drv/SSD1803A/SSD1803A.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../src/drv/SX1231H/SX1231H.c")
set_source_files_properties(${base_station_yellowcard_production_production_XC32_FILE_TYPE_compile} PROPERTIES LANGUAGE C)
set(base_station_yellowcard_production_production_XC32_FILE_TYPE_compile_cpp)
set_source_files_properties(${base_station_yellowcard_production_production_XC32_FILE_TYPE_compile_cpp} PROPERTIES LANGUAGE CXX)
set(base_station_yellowcard_production_production_XC32_FILE_TYPE_link)
set(base_station_yellowcard_production_production_XC32_FILE_TYPE_bin2hex)
set(base_station_yellowcard_production_image_name "production.elf")
set(base_station_yellowcard_production_image_base_name "production")

# The output directory of the final image.
set(base_station_yellowcard_production_output_dir "${CMAKE_CURRENT_SOURCE_DIR}/../../../out/base-station_yellowcard")

# The full path to the final image.
set(base_station_yellowcard_production_full_path_to_image ${base_station_yellowcard_production_output_dir}/${base_station_yellowcard_production_image_name})

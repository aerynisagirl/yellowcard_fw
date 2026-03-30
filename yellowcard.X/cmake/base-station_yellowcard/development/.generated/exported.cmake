set(DEPENDENT_MP_BIN2HEXbase_station_yellowcard_development_Y8ivZ53t "c:/Program Files/Microchip/xc32/v4.35/bin/xc32-bin2hex.exe")
set(DEPENDENT_DEPENDENT_TARGET_ELFbase_station_yellowcard_development_Y8ivZ53t "${CMAKE_CURRENT_LIST_DIR}/../../../../out/base-station_yellowcard/development.elf")
set(DEPENDENT_TARGET_DIRbase_station_yellowcard_development_Y8ivZ53t "${CMAKE_CURRENT_LIST_DIR}/../../../../out/base-station_yellowcard")
set(DEPENDENT_BYPRODUCTSbase_station_yellowcard_development_Y8ivZ53t ${DEPENDENT_TARGET_DIRbase_station_yellowcard_development_Y8ivZ53t}/${sourceFileNamebase_station_yellowcard_development_Y8ivZ53t}.c)
add_custom_command(
    OUTPUT ${DEPENDENT_TARGET_DIRbase_station_yellowcard_development_Y8ivZ53t}/${sourceFileNamebase_station_yellowcard_development_Y8ivZ53t}.c
    COMMAND ${DEPENDENT_MP_BIN2HEXbase_station_yellowcard_development_Y8ivZ53t} --image ${DEPENDENT_DEPENDENT_TARGET_ELFbase_station_yellowcard_development_Y8ivZ53t} --image-generated-c ${sourceFileNamebase_station_yellowcard_development_Y8ivZ53t}.c --image-generated-h ${sourceFileNamebase_station_yellowcard_development_Y8ivZ53t}.h --image-copy-mode ${modebase_station_yellowcard_development_Y8ivZ53t} --image-offset ${addressbase_station_yellowcard_development_Y8ivZ53t} 
    WORKING_DIRECTORY ${DEPENDENT_TARGET_DIRbase_station_yellowcard_development_Y8ivZ53t}
    DEPENDS ${DEPENDENT_DEPENDENT_TARGET_ELFbase_station_yellowcard_development_Y8ivZ53t})
add_custom_target(
    dependent_produced_source_artifactbase_station_yellowcard_development_Y8ivZ53t 
    DEPENDS ${DEPENDENT_TARGET_DIRbase_station_yellowcard_development_Y8ivZ53t}/${sourceFileNamebase_station_yellowcard_development_Y8ivZ53t}.c
    )

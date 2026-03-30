set(DEPENDENT_MP_BIN2HEXbase_station_yellowcard_production_s4_3rjbe "c:/Program Files/Microchip/xc32/v4.35/bin/xc32-bin2hex.exe")
set(DEPENDENT_DEPENDENT_TARGET_ELFbase_station_yellowcard_production_s4_3rjbe "${CMAKE_CURRENT_LIST_DIR}/../../../../out/base-station_yellowcard/production.elf")
set(DEPENDENT_TARGET_DIRbase_station_yellowcard_production_s4_3rjbe "${CMAKE_CURRENT_LIST_DIR}/../../../../out/base-station_yellowcard")
set(DEPENDENT_BYPRODUCTSbase_station_yellowcard_production_s4_3rjbe ${DEPENDENT_TARGET_DIRbase_station_yellowcard_production_s4_3rjbe}/${sourceFileNamebase_station_yellowcard_production_s4_3rjbe}.c)
add_custom_command(
    OUTPUT ${DEPENDENT_TARGET_DIRbase_station_yellowcard_production_s4_3rjbe}/${sourceFileNamebase_station_yellowcard_production_s4_3rjbe}.c
    COMMAND ${DEPENDENT_MP_BIN2HEXbase_station_yellowcard_production_s4_3rjbe} --image ${DEPENDENT_DEPENDENT_TARGET_ELFbase_station_yellowcard_production_s4_3rjbe} --image-generated-c ${sourceFileNamebase_station_yellowcard_production_s4_3rjbe}.c --image-generated-h ${sourceFileNamebase_station_yellowcard_production_s4_3rjbe}.h --image-copy-mode ${modebase_station_yellowcard_production_s4_3rjbe} --image-offset ${addressbase_station_yellowcard_production_s4_3rjbe} 
    WORKING_DIRECTORY ${DEPENDENT_TARGET_DIRbase_station_yellowcard_production_s4_3rjbe}
    DEPENDS ${DEPENDENT_DEPENDENT_TARGET_ELFbase_station_yellowcard_production_s4_3rjbe})
add_custom_target(
    dependent_produced_source_artifactbase_station_yellowcard_production_s4_3rjbe 
    DEPENDS ${DEPENDENT_TARGET_DIRbase_station_yellowcard_production_s4_3rjbe}/${sourceFileNamebase_station_yellowcard_production_s4_3rjbe}.c
    )

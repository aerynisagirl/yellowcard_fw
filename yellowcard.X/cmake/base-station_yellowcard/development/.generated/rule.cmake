# The following functions contains all the flags passed to the different build stages.

set(PACK_REPO_PATH "C:/Users/Aeryn/.mchp_packs" CACHE PATH "Path to the root of a pack repository.")

function(base_station_yellowcard_development_development_XC32_assemble_rule target)
    set(options
        "-g"
        "${ASSEMBLER_PRE}"
        "-mprocessor=32MX120F032B"
        "-Wa,--defsym=__MPLAB_BUILD=1${MP_EXTRA_AS_POST},--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--gdwarf-2,-I${CMAKE_CURRENT_SOURCE_DIR}/../../.."
        "-mdfp=${PACK_REPO_PATH}/Microchip/PIC32MX_DFP/1.5.259")
    list(REMOVE_ITEM options "")
    target_compile_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target} PRIVATE "__DEBUG=1")
    target_include_directories(${target} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../..")
endfunction()
function(base_station_yellowcard_development_development_XC32_assembleWithPreprocess_rule target)
    set(options
        "-x"
        "assembler-with-cpp"
        "-g"
        "${MP_EXTRA_AS_PRE}"
        "${DEBUGGER_NAME_AS_MACRO}"
        "-mdfp=${PACK_REPO_PATH}/Microchip/PIC32MX_DFP/1.5.259"
        "-mprocessor=32MX120F032B"
        "-Wa,--defsym=__MPLAB_BUILD=1${MP_EXTRA_AS_POST},--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,-I${CMAKE_CURRENT_SOURCE_DIR}/../../..")
    list(REMOVE_ITEM options "")
    target_compile_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target}
        PRIVATE "__DEBUG=1"
        PRIVATE "XPRJ_development=development")
    target_include_directories(${target} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../..")
endfunction()
function(base_station_yellowcard_development_development_XC32_compile_rule target)
    set(options
        "-g"
        "${CC_PRE}"
        "-x"
        "c"
        "-c"
        "-mprocessor=32MX120F032B"
        "-ffunction-sections"
        "-fno-common"
        "-mdfp=${PACK_REPO_PATH}/Microchip/PIC32MX_DFP/1.5.259")
    list(REMOVE_ITEM options "")
    target_compile_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target}
        PRIVATE "__DEBUG"
        PRIVATE "_BUILDTYPE_DEV=1"
        PRIVATE "XPRJ_development=development")
    target_include_directories(${target} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../..")
endfunction()
function(base_station_yellowcard_development_development_XC32_compile_cpp_rule target)
    set(options
        "-g"
        "${CC_PRE}"
        "${DEBUGGER_NAME_AS_MACRO}"
        "-mprocessor=32MX120F032B"
        "-frtti"
        "-fexceptions"
        "-fno-check-new"
        "-fenforce-eh-specs"
        "-fno-common"
        "-mdfp=${PACK_REPO_PATH}/Microchip/PIC32MX_DFP/1.5.259")
    list(REMOVE_ITEM options "")
    target_compile_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target}
        PRIVATE "__DEBUG"
        PRIVATE "XPRJ_development=development")
    target_include_directories(${target} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../..")
endfunction()
function(base_station_yellowcard_development_dependentObject_rule target)
    set(options
        "-mprocessor=32MX120F032B"
        "-mdfp=${PACK_REPO_PATH}/Microchip/PIC32MX_DFP/1.5.259")
    list(REMOVE_ITEM options "")
    target_compile_options(${target} PRIVATE "${options}")
endfunction()
function(base_station_yellowcard_development_link_rule target)
    set(options
        "-g"
        "${MP_EXTRA_LD_PRE}"
        "${DEBUGGER_OPTION_TO_LINKER}"
        "${DEBUGGER_NAME_AS_MACRO}"
        "-mprocessor=32MX120F032B"
        "-Wl,--defsym=__MPLAB_BUILD=1${MP_EXTRA_LD_POST},--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-L${CMAKE_CURRENT_SOURCE_DIR}/../../..,-Map=mem.map,--memorysummary,memoryfile.xml"
        "-mdfp=${PACK_REPO_PATH}/Microchip/PIC32MX_DFP/1.5.259")
    list(REMOVE_ITEM options "")
    target_link_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target} PRIVATE "XPRJ_development=development")
endfunction()
function(base_station_yellowcard_development_bin2hex_rule target)
    add_custom_target(
        base_station_yellowcard_development_Bin2Hex ALL
        COMMAND ${MP_BIN2HEX} ${base_station_yellowcard_development_image_name}
        WORKING_DIRECTORY ${base_station_yellowcard_development_output_dir}
        BYPRODUCTS "${base_station_yellowcard_development_output_dir}/${base_station_yellowcard_development_image_base_name}.hex"
        COMMENT "Convert build file to .hex")
    add_dependencies(base_station_yellowcard_development_Bin2Hex ${target})
endfunction()

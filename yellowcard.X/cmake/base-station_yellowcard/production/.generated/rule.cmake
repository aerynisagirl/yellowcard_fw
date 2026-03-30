# The following functions contains all the flags passed to the different build stages.

set(PACK_REPO_PATH "C:/Users/Aeryn/.mchp_packs" CACHE PATH "Path to the root of a pack repository.")

function(base_station_yellowcard_production_production_XC32_assemble_rule target)
    set(options
        "-g"
        "${ASSEMBLER_PRE}"
        "-mprocessor=32MX120F032B"
        "-Wa,--defsym=__MPLAB_BUILD=1${MP_EXTRA_AS_POST},--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--gdwarf-2,--defsym=__MPLAB_DEBUGGER_PK5=1,-I${CMAKE_CURRENT_SOURCE_DIR}/../../.."
        "-mdfp=${PACK_REPO_PATH}/Microchip/PIC32MX_DFP/1.5.259")
    list(REMOVE_ITEM options "")
    target_compile_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target}
        PRIVATE "__DEBUG=1"
        PRIVATE "__MPLAB_DEBUGGER_PK5=1")
    target_include_directories(${target} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../..")
endfunction()
function(base_station_yellowcard_production_production_XC32_assembleWithPreprocess_rule target)
    set(options
        "-x"
        "assembler-with-cpp"
        "-g"
        "${MP_EXTRA_AS_PRE}"
        "-mdfp=${PACK_REPO_PATH}/Microchip/PIC32MX_DFP/1.5.259"
        "-mprocessor=32MX120F032B"
        "-Wa,--defsym=__MPLAB_BUILD=1${MP_EXTRA_AS_POST},--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK5=1,-I${CMAKE_CURRENT_SOURCE_DIR}/../../..")
    list(REMOVE_ITEM options "")
    target_compile_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target}
        PRIVATE "__DEBUG=1"
        PRIVATE "__MPLAB_DEBUGGER_PK5=1"
        PRIVATE "XPRJ_production=production")
    target_include_directories(${target} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../..")
endfunction()
function(base_station_yellowcard_production_production_XC32_compile_rule target)
    set(options
        "-g"
        "${CC_PRE}"
        "-x"
        "c"
        "-c"
        "-mprocessor=32MX120F032B"
        "-ffunction-sections"
        "-fomit-frame-pointer"
        "-fno-common"
        "-mdfp=${PACK_REPO_PATH}/Microchip/PIC32MX_DFP/1.5.259")
    list(REMOVE_ITEM options "")
    target_compile_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target}
        PRIVATE "__DEBUG"
        PRIVATE "__MPLAB_DEBUGGER_PK5=1"
        PRIVATE "_BUILDTYPE_PROD=1"
        PRIVATE "XPRJ_production=production")
    target_include_directories(${target} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../..")
endfunction()
function(base_station_yellowcard_production_production_XC32_compile_cpp_rule target)
    set(options
        "-g"
        "${CC_PRE}"
        "-mprocessor=32MX120F032B"
        "-frtti"
        "-fno-exceptions"
        "-fno-check-new"
        "-fenforce-eh-specs"
        "-fomit-frame-pointer"
        "-fno-common"
        "-mdfp=${PACK_REPO_PATH}/Microchip/PIC32MX_DFP/1.5.259")
    list(REMOVE_ITEM options "")
    target_compile_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target}
        PRIVATE "__DEBUG"
        PRIVATE "__MPLAB_DEBUGGER_PK5=1"
        PRIVATE "XPRJ_production=production")
    target_include_directories(${target} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../..")
endfunction()
function(base_station_yellowcard_production_dependentObject_rule target)
    set(options
        "-mprocessor=32MX120F032B"
        "-mdfp=${PACK_REPO_PATH}/Microchip/PIC32MX_DFP/1.5.259")
    list(REMOVE_ITEM options "")
    target_compile_options(${target} PRIVATE "${options}")
endfunction()
function(base_station_yellowcard_production_link_rule target)
    set(options
        "-g"
        "${MP_EXTRA_LD_PRE}"
        "-mdebugger"
        "-mprocessor=32MX120F032B"
        "-mreserve=data@0x0:0x1fc"
        "-mreserve=boot@0x1fc00490:0x1fc00bf0"
        "-Wl,--defsym=__MPLAB_BUILD=1${MP_EXTRA_LD_POST},--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-L${CMAKE_CURRENT_SOURCE_DIR}/../../..,-Map=mem.map,--memorysummary,memoryfile.xml"
        "-mdfp=${PACK_REPO_PATH}/Microchip/PIC32MX_DFP/1.5.259")
    list(REMOVE_ITEM options "")
    target_link_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target}
        PRIVATE "__MPLAB_DEBUGGER_PK5=1"
        PRIVATE "XPRJ_production=production")
endfunction()
function(base_station_yellowcard_production_bin2hex_rule target)
    add_custom_target(
        base_station_yellowcard_production_Bin2Hex ALL
        COMMAND ${MP_BIN2HEX} ${base_station_yellowcard_production_image_name}
        WORKING_DIRECTORY ${base_station_yellowcard_production_output_dir}
        BYPRODUCTS "${base_station_yellowcard_production_output_dir}/${base_station_yellowcard_production_image_base_name}.hex"
        COMMENT "Convert build file to .hex")
    add_dependencies(base_station_yellowcard_production_Bin2Hex ${target})
endfunction()

#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-basestation_development.mk)" "nbproject/Makefile-local-basestation_development.mk"
include nbproject/Makefile-local-basestation_development.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=basestation_development
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/yellowcard.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/yellowcard.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=src/drv/DPS368/DPS368.c src/drv/SHT4x/SHT4x.c src/drv/SX1231H/SX1231H.c src/drv/SSD1803A/SSD1803A.c src/Main.c src/drv/HAL.c src/Interrupts.c src/PacketStructures.c src/Logging.c src/Application.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/src/drv/DPS368/DPS368.o ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o ${OBJECTDIR}/src/Main.o ${OBJECTDIR}/src/drv/HAL.o ${OBJECTDIR}/src/Interrupts.o ${OBJECTDIR}/src/PacketStructures.o ${OBJECTDIR}/src/Logging.o ${OBJECTDIR}/src/Application.o
POSSIBLE_DEPFILES=${OBJECTDIR}/src/drv/DPS368/DPS368.o.d ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o.d ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o.d ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o.d ${OBJECTDIR}/src/Main.o.d ${OBJECTDIR}/src/drv/HAL.o.d ${OBJECTDIR}/src/Interrupts.o.d ${OBJECTDIR}/src/PacketStructures.o.d ${OBJECTDIR}/src/Logging.o.d ${OBJECTDIR}/src/Application.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/src/drv/DPS368/DPS368.o ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o ${OBJECTDIR}/src/Main.o ${OBJECTDIR}/src/drv/HAL.o ${OBJECTDIR}/src/Interrupts.o ${OBJECTDIR}/src/PacketStructures.o ${OBJECTDIR}/src/Logging.o ${OBJECTDIR}/src/Application.o

# Source Files
SOURCEFILES=src/drv/DPS368/DPS368.c src/drv/SHT4x/SHT4x.c src/drv/SX1231H/SX1231H.c src/drv/SSD1803A/SSD1803A.c src/Main.c src/drv/HAL.c src/Interrupts.c src/PacketStructures.c src/Logging.c src/Application.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

# The following macros may be used in the pre and post step lines
_/_=\\
ShExtension=.bat
Device=PIC32MX120F032B
ProjectDir="C:\Users\Aeryn\Documents\RF Project\git_repos\yellowcard_fw\yellowcard.X"
ProjectName=yellowcard
ConfName=basestation_development
ImagePath="dist\basestation_development\${IMAGE_TYPE}\yellowcard.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ImageDir="dist\basestation_development\${IMAGE_TYPE}"
ImageName="yellowcard.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IsDebug="true"
else
IsDebug="false"
endif

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-basestation_development.mk ${DISTDIR}/yellowcard.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
	@echo "--------------------------------------"
	@echo "User defined post-build step: [${MP_CC_DIR}\xc32-objdump -S ${ImageDir}\${PROJECTNAME}.${IMAGE_TYPE}.elf > build\${ConfName}\${IMAGE_TYPE}\${ProjectName}.lst]"
	@${MP_CC_DIR}\xc32-objdump -S ${ImageDir}\${PROJECTNAME}.${IMAGE_TYPE}.elf > build\${ConfName}\${IMAGE_TYPE}\${ProjectName}.lst
	@echo "--------------------------------------"

MP_PROCESSOR_OPTION=32MX120F032B
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/src/drv/DPS368/DPS368.o: src/drv/DPS368/DPS368.c  .generated_files/flags/basestation_development/cc9ec9302981c5efc58de9162096985d2a02d669 .generated_files/flags/basestation_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/DPS368" 
	@${RM} ${OBJECTDIR}/src/drv/DPS368/DPS368.o.d 
	@${RM} ${OBJECTDIR}/src/drv/DPS368/DPS368.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/drv/DPS368/DPS368.o.d" -o ${OBJECTDIR}/src/drv/DPS368/DPS368.o src/drv/DPS368/DPS368.c    -DXPRJ_basestation_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/SHT4x/SHT4x.o: src/drv/SHT4x/SHT4x.c  .generated_files/flags/basestation_development/7638e89aee6d5f2e9a6e116a74e8fdfa2b78019f .generated_files/flags/basestation_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/SHT4x" 
	@${RM} ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o.d 
	@${RM} ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/drv/SHT4x/SHT4x.o.d" -o ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o src/drv/SHT4x/SHT4x.c    -DXPRJ_basestation_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/SX1231H/SX1231H.o: src/drv/SX1231H/SX1231H.c  .generated_files/flags/basestation_development/119ad3f815b7428d33e4003dea84a8c2226dc141 .generated_files/flags/basestation_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/SX1231H" 
	@${RM} ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o.d 
	@${RM} ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/drv/SX1231H/SX1231H.o.d" -o ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o src/drv/SX1231H/SX1231H.c    -DXPRJ_basestation_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o: src/drv/SSD1803A/SSD1803A.c  .generated_files/flags/basestation_development/95b015f4a8d687d09a3295b7dd0c92fa32d1b9bc .generated_files/flags/basestation_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/SSD1803A" 
	@${RM} ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o.d 
	@${RM} ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o.d" -o ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o src/drv/SSD1803A/SSD1803A.c    -DXPRJ_basestation_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Main.o: src/Main.c  .generated_files/flags/basestation_development/1539349d01b5f5bfab883bd6a76a72db44e509e6 .generated_files/flags/basestation_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Main.o.d 
	@${RM} ${OBJECTDIR}/src/Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/Main.o.d" -o ${OBJECTDIR}/src/Main.o src/Main.c    -DXPRJ_basestation_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/HAL.o: src/drv/HAL.c  .generated_files/flags/basestation_development/9d9e217a6405d1bf2b2182091b0f3f77f1f5e1dc .generated_files/flags/basestation_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv" 
	@${RM} ${OBJECTDIR}/src/drv/HAL.o.d 
	@${RM} ${OBJECTDIR}/src/drv/HAL.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/drv/HAL.o.d" -o ${OBJECTDIR}/src/drv/HAL.o src/drv/HAL.c    -DXPRJ_basestation_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Interrupts.o: src/Interrupts.c  .generated_files/flags/basestation_development/1ddea254b6629bac25f142c456416d7a189ba787 .generated_files/flags/basestation_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Interrupts.o.d 
	@${RM} ${OBJECTDIR}/src/Interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/Interrupts.o.d" -o ${OBJECTDIR}/src/Interrupts.o src/Interrupts.c    -DXPRJ_basestation_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/PacketStructures.o: src/PacketStructures.c  .generated_files/flags/basestation_development/80ec02e690336e1498d5e6ef7f172ec20f328fa1 .generated_files/flags/basestation_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/PacketStructures.o.d 
	@${RM} ${OBJECTDIR}/src/PacketStructures.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/PacketStructures.o.d" -o ${OBJECTDIR}/src/PacketStructures.o src/PacketStructures.c    -DXPRJ_basestation_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Logging.o: src/Logging.c  .generated_files/flags/basestation_development/2332831cfa0db10787c12c557240791ecd3bd5a0 .generated_files/flags/basestation_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Logging.o.d 
	@${RM} ${OBJECTDIR}/src/Logging.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/Logging.o.d" -o ${OBJECTDIR}/src/Logging.o src/Logging.c    -DXPRJ_basestation_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Application.o: src/Application.c  .generated_files/flags/basestation_development/da125f70c7d406a85209b12085dcbe94883661e4 .generated_files/flags/basestation_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Application.o.d 
	@${RM} ${OBJECTDIR}/src/Application.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/Application.o.d" -o ${OBJECTDIR}/src/Application.o src/Application.c    -DXPRJ_basestation_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/src/drv/DPS368/DPS368.o: src/drv/DPS368/DPS368.c  .generated_files/flags/basestation_development/a88715b15d4e7bbb18fa7cc5cc58093381b860c5 .generated_files/flags/basestation_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/DPS368" 
	@${RM} ${OBJECTDIR}/src/drv/DPS368/DPS368.o.d 
	@${RM} ${OBJECTDIR}/src/drv/DPS368/DPS368.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/drv/DPS368/DPS368.o.d" -o ${OBJECTDIR}/src/drv/DPS368/DPS368.o src/drv/DPS368/DPS368.c    -DXPRJ_basestation_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/SHT4x/SHT4x.o: src/drv/SHT4x/SHT4x.c  .generated_files/flags/basestation_development/d55fd16a58d488f76e0bd3979d37f6c1a570c74 .generated_files/flags/basestation_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/SHT4x" 
	@${RM} ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o.d 
	@${RM} ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/drv/SHT4x/SHT4x.o.d" -o ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o src/drv/SHT4x/SHT4x.c    -DXPRJ_basestation_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/SX1231H/SX1231H.o: src/drv/SX1231H/SX1231H.c  .generated_files/flags/basestation_development/330a59818a6dfc235c3ca8e3b9dbcc450a87676c .generated_files/flags/basestation_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/SX1231H" 
	@${RM} ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o.d 
	@${RM} ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/drv/SX1231H/SX1231H.o.d" -o ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o src/drv/SX1231H/SX1231H.c    -DXPRJ_basestation_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o: src/drv/SSD1803A/SSD1803A.c  .generated_files/flags/basestation_development/2440f07da4e96c36ffc0599aef9d25347b7374ca .generated_files/flags/basestation_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/SSD1803A" 
	@${RM} ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o.d 
	@${RM} ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o.d" -o ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o src/drv/SSD1803A/SSD1803A.c    -DXPRJ_basestation_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Main.o: src/Main.c  .generated_files/flags/basestation_development/f7f5281b620f988cf95a9387959813b353b3902e .generated_files/flags/basestation_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Main.o.d 
	@${RM} ${OBJECTDIR}/src/Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/Main.o.d" -o ${OBJECTDIR}/src/Main.o src/Main.c    -DXPRJ_basestation_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/HAL.o: src/drv/HAL.c  .generated_files/flags/basestation_development/26617b1614355b0216fcbd9d4f89537ccc3e7c9d .generated_files/flags/basestation_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv" 
	@${RM} ${OBJECTDIR}/src/drv/HAL.o.d 
	@${RM} ${OBJECTDIR}/src/drv/HAL.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/drv/HAL.o.d" -o ${OBJECTDIR}/src/drv/HAL.o src/drv/HAL.c    -DXPRJ_basestation_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Interrupts.o: src/Interrupts.c  .generated_files/flags/basestation_development/c6538fde31df00a6ae169d2a25ff86c61fc4480c .generated_files/flags/basestation_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Interrupts.o.d 
	@${RM} ${OBJECTDIR}/src/Interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/Interrupts.o.d" -o ${OBJECTDIR}/src/Interrupts.o src/Interrupts.c    -DXPRJ_basestation_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/PacketStructures.o: src/PacketStructures.c  .generated_files/flags/basestation_development/8f6f16c60f408c927e9c8949cdc08970292dcfaa .generated_files/flags/basestation_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/PacketStructures.o.d 
	@${RM} ${OBJECTDIR}/src/PacketStructures.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/PacketStructures.o.d" -o ${OBJECTDIR}/src/PacketStructures.o src/PacketStructures.c    -DXPRJ_basestation_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Logging.o: src/Logging.c  .generated_files/flags/basestation_development/bdf3293701f3a53d52454b2490edb5a501e6b0a4 .generated_files/flags/basestation_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Logging.o.d 
	@${RM} ${OBJECTDIR}/src/Logging.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/Logging.o.d" -o ${OBJECTDIR}/src/Logging.o src/Logging.c    -DXPRJ_basestation_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Application.o: src/Application.c  .generated_files/flags/basestation_development/7da5b486a38e8af8c7ad4869623ef857834c8bba .generated_files/flags/basestation_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Application.o.d 
	@${RM} ${OBJECTDIR}/src/Application.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/Application.o.d" -o ${OBJECTDIR}/src/Application.o src/Application.c    -DXPRJ_basestation_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/yellowcard.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/yellowcard.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_basestation_development=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/yellowcard.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/yellowcard.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_basestation_development=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/yellowcard.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif

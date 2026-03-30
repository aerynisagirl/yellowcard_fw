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
ifeq "$(wildcard nbproject/Makefile-local-basestation_production.mk)" "nbproject/Makefile-local-basestation_production.mk"
include nbproject/Makefile-local-basestation_production.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=basestation_production
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/base-station.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/base-station.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
ProjectDir="C:\Users\Aeryn\Documents\RF Project\local\yellowcard fw\base-station.X"
ProjectName=yellowcard
ConfName=basestation_production
ImagePath="dist\basestation_production\${IMAGE_TYPE}\base-station.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ImageDir="dist\basestation_production\${IMAGE_TYPE}"
ImageName="base-station.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IsDebug="true"
else
IsDebug="false"
endif

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-basestation_production.mk ${DISTDIR}/base-station.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
${OBJECTDIR}/src/drv/DPS368/DPS368.o: src/drv/DPS368/DPS368.c  .generated_files/flags/basestation_production/f6c1e0796184a2fd399bae46391e2a3a16d5cbd4 .generated_files/flags/basestation_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/DPS368" 
	@${RM} ${OBJECTDIR}/src/drv/DPS368/DPS368.o.d 
	@${RM} ${OBJECTDIR}/src/drv/DPS368/DPS368.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/drv/DPS368/DPS368.o.d" -o ${OBJECTDIR}/src/drv/DPS368/DPS368.o src/drv/DPS368/DPS368.c    -DXPRJ_basestation_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/SHT4x/SHT4x.o: src/drv/SHT4x/SHT4x.c  .generated_files/flags/basestation_production/97bf338cd4736960e7528c235855ade69e80b8ee .generated_files/flags/basestation_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/SHT4x" 
	@${RM} ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o.d 
	@${RM} ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/drv/SHT4x/SHT4x.o.d" -o ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o src/drv/SHT4x/SHT4x.c    -DXPRJ_basestation_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/SX1231H/SX1231H.o: src/drv/SX1231H/SX1231H.c  .generated_files/flags/basestation_production/38785bee7ea5b739cbf67fbaa6cefc1f2b5bc5c1 .generated_files/flags/basestation_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/SX1231H" 
	@${RM} ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o.d 
	@${RM} ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/drv/SX1231H/SX1231H.o.d" -o ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o src/drv/SX1231H/SX1231H.c    -DXPRJ_basestation_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o: src/drv/SSD1803A/SSD1803A.c  .generated_files/flags/basestation_production/95f7512e1ad4f854e1458e9a261442314f0e41f4 .generated_files/flags/basestation_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/SSD1803A" 
	@${RM} ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o.d 
	@${RM} ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o.d" -o ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o src/drv/SSD1803A/SSD1803A.c    -DXPRJ_basestation_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Main.o: src/Main.c  .generated_files/flags/basestation_production/fda69270229f73dfd35f2d174cdbf367a8738b1b .generated_files/flags/basestation_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Main.o.d 
	@${RM} ${OBJECTDIR}/src/Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/Main.o.d" -o ${OBJECTDIR}/src/Main.o src/Main.c    -DXPRJ_basestation_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/HAL.o: src/drv/HAL.c  .generated_files/flags/basestation_production/bb1c56c48ba58e97c2f40a81931fe4b8b5ac52d2 .generated_files/flags/basestation_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv" 
	@${RM} ${OBJECTDIR}/src/drv/HAL.o.d 
	@${RM} ${OBJECTDIR}/src/drv/HAL.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/drv/HAL.o.d" -o ${OBJECTDIR}/src/drv/HAL.o src/drv/HAL.c    -DXPRJ_basestation_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Interrupts.o: src/Interrupts.c  .generated_files/flags/basestation_production/3984b32831fecdbb4c21844e5af126bd915492a .generated_files/flags/basestation_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Interrupts.o.d 
	@${RM} ${OBJECTDIR}/src/Interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/Interrupts.o.d" -o ${OBJECTDIR}/src/Interrupts.o src/Interrupts.c    -DXPRJ_basestation_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/PacketStructures.o: src/PacketStructures.c  .generated_files/flags/basestation_production/2be52152dae766937e1bd2655d0378d713c8366d .generated_files/flags/basestation_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/PacketStructures.o.d 
	@${RM} ${OBJECTDIR}/src/PacketStructures.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/PacketStructures.o.d" -o ${OBJECTDIR}/src/PacketStructures.o src/PacketStructures.c    -DXPRJ_basestation_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Logging.o: src/Logging.c  .generated_files/flags/basestation_production/ef6a01edd07be3b087f680e49aa8ca8a2477a6b0 .generated_files/flags/basestation_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Logging.o.d 
	@${RM} ${OBJECTDIR}/src/Logging.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/Logging.o.d" -o ${OBJECTDIR}/src/Logging.o src/Logging.c    -DXPRJ_basestation_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Application.o: src/Application.c  .generated_files/flags/basestation_production/6d42cdaf683e06aed8f98b8a3b7d7257248d804b .generated_files/flags/basestation_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Application.o.d 
	@${RM} ${OBJECTDIR}/src/Application.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/Application.o.d" -o ${OBJECTDIR}/src/Application.o src/Application.c    -DXPRJ_basestation_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/src/drv/DPS368/DPS368.o: src/drv/DPS368/DPS368.c  .generated_files/flags/basestation_production/c810bf5044dc5ee0f92903c9ceb85e5edf2ab983 .generated_files/flags/basestation_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/DPS368" 
	@${RM} ${OBJECTDIR}/src/drv/DPS368/DPS368.o.d 
	@${RM} ${OBJECTDIR}/src/drv/DPS368/DPS368.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/drv/DPS368/DPS368.o.d" -o ${OBJECTDIR}/src/drv/DPS368/DPS368.o src/drv/DPS368/DPS368.c    -DXPRJ_basestation_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/SHT4x/SHT4x.o: src/drv/SHT4x/SHT4x.c  .generated_files/flags/basestation_production/fc98771581952dab7eb233e52b4b81af4dadef68 .generated_files/flags/basestation_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/SHT4x" 
	@${RM} ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o.d 
	@${RM} ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/drv/SHT4x/SHT4x.o.d" -o ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o src/drv/SHT4x/SHT4x.c    -DXPRJ_basestation_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/SX1231H/SX1231H.o: src/drv/SX1231H/SX1231H.c  .generated_files/flags/basestation_production/eb555eca5d02bc2108678cf7984bf178cecdef95 .generated_files/flags/basestation_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/SX1231H" 
	@${RM} ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o.d 
	@${RM} ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/drv/SX1231H/SX1231H.o.d" -o ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o src/drv/SX1231H/SX1231H.c    -DXPRJ_basestation_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o: src/drv/SSD1803A/SSD1803A.c  .generated_files/flags/basestation_production/b635e644daa8082d68ba1c097bb6135e7b2cfdd3 .generated_files/flags/basestation_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/SSD1803A" 
	@${RM} ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o.d 
	@${RM} ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o.d" -o ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o src/drv/SSD1803A/SSD1803A.c    -DXPRJ_basestation_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Main.o: src/Main.c  .generated_files/flags/basestation_production/8818b9b4b3ff0b59c2fd2d998eea154248138fc1 .generated_files/flags/basestation_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Main.o.d 
	@${RM} ${OBJECTDIR}/src/Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/Main.o.d" -o ${OBJECTDIR}/src/Main.o src/Main.c    -DXPRJ_basestation_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/HAL.o: src/drv/HAL.c  .generated_files/flags/basestation_production/89eb6bf245786a9dbc4286785fe2c34b3aa4a30a .generated_files/flags/basestation_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv" 
	@${RM} ${OBJECTDIR}/src/drv/HAL.o.d 
	@${RM} ${OBJECTDIR}/src/drv/HAL.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/drv/HAL.o.d" -o ${OBJECTDIR}/src/drv/HAL.o src/drv/HAL.c    -DXPRJ_basestation_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Interrupts.o: src/Interrupts.c  .generated_files/flags/basestation_production/68d90312abc39e1751e2981f3f50076602cdd3d9 .generated_files/flags/basestation_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Interrupts.o.d 
	@${RM} ${OBJECTDIR}/src/Interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/Interrupts.o.d" -o ${OBJECTDIR}/src/Interrupts.o src/Interrupts.c    -DXPRJ_basestation_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/PacketStructures.o: src/PacketStructures.c  .generated_files/flags/basestation_production/2e9fc5ad8a66a6f477e068ef74705543f45d65d6 .generated_files/flags/basestation_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/PacketStructures.o.d 
	@${RM} ${OBJECTDIR}/src/PacketStructures.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/PacketStructures.o.d" -o ${OBJECTDIR}/src/PacketStructures.o src/PacketStructures.c    -DXPRJ_basestation_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Logging.o: src/Logging.c  .generated_files/flags/basestation_production/f4c7aafdc3e98bde6d68d67acfa3a70d28dec759 .generated_files/flags/basestation_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Logging.o.d 
	@${RM} ${OBJECTDIR}/src/Logging.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/Logging.o.d" -o ${OBJECTDIR}/src/Logging.o src/Logging.c    -DXPRJ_basestation_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Application.o: src/Application.c  .generated_files/flags/basestation_production/a89afff01112f4c85afa438a0ea46cfefbcc8dbe .generated_files/flags/basestation_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Application.o.d 
	@${RM} ${OBJECTDIR}/src/Application.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_BASESTATION__ -MP -MMD -MF "${OBJECTDIR}/src/Application.o.d" -o ${OBJECTDIR}/src/Application.o src/Application.c    -DXPRJ_basestation_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/base-station.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/base-station.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_basestation_production=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/base-station.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/base-station.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_basestation_production=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/base-station.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
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

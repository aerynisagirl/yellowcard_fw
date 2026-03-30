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
ifeq "$(wildcard nbproject/Makefile-local-sensornode_development.mk)" "nbproject/Makefile-local-sensornode_development.mk"
include nbproject/Makefile-local-sensornode_development.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=sensornode_development
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
ConfName=sensornode_development
ImagePath="dist\sensornode_development\${IMAGE_TYPE}\base-station.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ImageDir="dist\sensornode_development\${IMAGE_TYPE}"
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
	${MAKE}  -f nbproject/Makefile-sensornode_development.mk ${DISTDIR}/base-station.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
${OBJECTDIR}/src/drv/DPS368/DPS368.o: src/drv/DPS368/DPS368.c  .generated_files/flags/sensornode_development/2c57a1afd7d06c60b820c0d3af034ca0a7f52a39 .generated_files/flags/sensornode_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/DPS368" 
	@${RM} ${OBJECTDIR}/src/drv/DPS368/DPS368.o.d 
	@${RM} ${OBJECTDIR}/src/drv/DPS368/DPS368.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/drv/DPS368/DPS368.o.d" -o ${OBJECTDIR}/src/drv/DPS368/DPS368.o src/drv/DPS368/DPS368.c    -DXPRJ_sensornode_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/SHT4x/SHT4x.o: src/drv/SHT4x/SHT4x.c  .generated_files/flags/sensornode_development/a92bb37f6270be320304ef641ba01a1d5e9a7422 .generated_files/flags/sensornode_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/SHT4x" 
	@${RM} ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o.d 
	@${RM} ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/drv/SHT4x/SHT4x.o.d" -o ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o src/drv/SHT4x/SHT4x.c    -DXPRJ_sensornode_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/SX1231H/SX1231H.o: src/drv/SX1231H/SX1231H.c  .generated_files/flags/sensornode_development/91f345063a6e851eee22ad56d3c38856e7faa6aa .generated_files/flags/sensornode_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/SX1231H" 
	@${RM} ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o.d 
	@${RM} ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/drv/SX1231H/SX1231H.o.d" -o ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o src/drv/SX1231H/SX1231H.c    -DXPRJ_sensornode_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o: src/drv/SSD1803A/SSD1803A.c  .generated_files/flags/sensornode_development/dab9d394e3d96d378eb71f1bf9d6dd8f2d330f73 .generated_files/flags/sensornode_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/SSD1803A" 
	@${RM} ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o.d 
	@${RM} ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o.d" -o ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o src/drv/SSD1803A/SSD1803A.c    -DXPRJ_sensornode_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Main.o: src/Main.c  .generated_files/flags/sensornode_development/e2dde40ada722672935f9751e9fff18d2ee78ac6 .generated_files/flags/sensornode_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Main.o.d 
	@${RM} ${OBJECTDIR}/src/Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/Main.o.d" -o ${OBJECTDIR}/src/Main.o src/Main.c    -DXPRJ_sensornode_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/HAL.o: src/drv/HAL.c  .generated_files/flags/sensornode_development/fbbd11cdf6f681d7a2fa60b54f53025135a1ff28 .generated_files/flags/sensornode_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv" 
	@${RM} ${OBJECTDIR}/src/drv/HAL.o.d 
	@${RM} ${OBJECTDIR}/src/drv/HAL.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/drv/HAL.o.d" -o ${OBJECTDIR}/src/drv/HAL.o src/drv/HAL.c    -DXPRJ_sensornode_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Interrupts.o: src/Interrupts.c  .generated_files/flags/sensornode_development/321f6ec78f9608b2f155bb51b6dfd4ea17c87d78 .generated_files/flags/sensornode_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Interrupts.o.d 
	@${RM} ${OBJECTDIR}/src/Interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/Interrupts.o.d" -o ${OBJECTDIR}/src/Interrupts.o src/Interrupts.c    -DXPRJ_sensornode_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/PacketStructures.o: src/PacketStructures.c  .generated_files/flags/sensornode_development/91dd4cf8bdbdb1507c43fa062b7d23d8b6b6ac2 .generated_files/flags/sensornode_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/PacketStructures.o.d 
	@${RM} ${OBJECTDIR}/src/PacketStructures.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/PacketStructures.o.d" -o ${OBJECTDIR}/src/PacketStructures.o src/PacketStructures.c    -DXPRJ_sensornode_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Logging.o: src/Logging.c  .generated_files/flags/sensornode_development/bae6e438b62be4c2c62f550c4c8e6596e27e65d5 .generated_files/flags/sensornode_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Logging.o.d 
	@${RM} ${OBJECTDIR}/src/Logging.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/Logging.o.d" -o ${OBJECTDIR}/src/Logging.o src/Logging.c    -DXPRJ_sensornode_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Application.o: src/Application.c  .generated_files/flags/sensornode_development/752e8585b946ff3413e202d041a87a32c96909fa .generated_files/flags/sensornode_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Application.o.d 
	@${RM} ${OBJECTDIR}/src/Application.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/Application.o.d" -o ${OBJECTDIR}/src/Application.o src/Application.c    -DXPRJ_sensornode_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/src/drv/DPS368/DPS368.o: src/drv/DPS368/DPS368.c  .generated_files/flags/sensornode_development/9cabf262e3e43c7b0ef4ddf485eb4a7437e49094 .generated_files/flags/sensornode_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/DPS368" 
	@${RM} ${OBJECTDIR}/src/drv/DPS368/DPS368.o.d 
	@${RM} ${OBJECTDIR}/src/drv/DPS368/DPS368.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/drv/DPS368/DPS368.o.d" -o ${OBJECTDIR}/src/drv/DPS368/DPS368.o src/drv/DPS368/DPS368.c    -DXPRJ_sensornode_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/SHT4x/SHT4x.o: src/drv/SHT4x/SHT4x.c  .generated_files/flags/sensornode_development/99f82cadad88dfd3733332c2284305c81626006 .generated_files/flags/sensornode_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/SHT4x" 
	@${RM} ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o.d 
	@${RM} ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/drv/SHT4x/SHT4x.o.d" -o ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o src/drv/SHT4x/SHT4x.c    -DXPRJ_sensornode_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/SX1231H/SX1231H.o: src/drv/SX1231H/SX1231H.c  .generated_files/flags/sensornode_development/27419fe1df24eb5e7092a4e5bd1cc25ac68de8f3 .generated_files/flags/sensornode_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/SX1231H" 
	@${RM} ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o.d 
	@${RM} ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/drv/SX1231H/SX1231H.o.d" -o ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o src/drv/SX1231H/SX1231H.c    -DXPRJ_sensornode_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o: src/drv/SSD1803A/SSD1803A.c  .generated_files/flags/sensornode_development/9f1251902984efc8923dc9379c0a59a5c1605950 .generated_files/flags/sensornode_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/SSD1803A" 
	@${RM} ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o.d 
	@${RM} ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o.d" -o ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o src/drv/SSD1803A/SSD1803A.c    -DXPRJ_sensornode_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Main.o: src/Main.c  .generated_files/flags/sensornode_development/705dcaea69791f8d51757a0fd2bd7b9bdaab6e91 .generated_files/flags/sensornode_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Main.o.d 
	@${RM} ${OBJECTDIR}/src/Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/Main.o.d" -o ${OBJECTDIR}/src/Main.o src/Main.c    -DXPRJ_sensornode_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/HAL.o: src/drv/HAL.c  .generated_files/flags/sensornode_development/375d2cfc84c033c65bb2bcfacaa2caec1fcc8ea6 .generated_files/flags/sensornode_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv" 
	@${RM} ${OBJECTDIR}/src/drv/HAL.o.d 
	@${RM} ${OBJECTDIR}/src/drv/HAL.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/drv/HAL.o.d" -o ${OBJECTDIR}/src/drv/HAL.o src/drv/HAL.c    -DXPRJ_sensornode_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Interrupts.o: src/Interrupts.c  .generated_files/flags/sensornode_development/1cd42de158bd23bfb1519482887e2d0a38c6e6 .generated_files/flags/sensornode_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Interrupts.o.d 
	@${RM} ${OBJECTDIR}/src/Interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/Interrupts.o.d" -o ${OBJECTDIR}/src/Interrupts.o src/Interrupts.c    -DXPRJ_sensornode_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/PacketStructures.o: src/PacketStructures.c  .generated_files/flags/sensornode_development/42e188ebc9e1fecb5c77a4fbcda3b0c13ccd693c .generated_files/flags/sensornode_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/PacketStructures.o.d 
	@${RM} ${OBJECTDIR}/src/PacketStructures.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/PacketStructures.o.d" -o ${OBJECTDIR}/src/PacketStructures.o src/PacketStructures.c    -DXPRJ_sensornode_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Logging.o: src/Logging.c  .generated_files/flags/sensornode_development/73c4b073f52d5f28508b6cf9eaf98635e7ad222b .generated_files/flags/sensornode_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Logging.o.d 
	@${RM} ${OBJECTDIR}/src/Logging.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/Logging.o.d" -o ${OBJECTDIR}/src/Logging.o src/Logging.c    -DXPRJ_sensornode_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Application.o: src/Application.c  .generated_files/flags/sensornode_development/68b3395673b903a0625506f49a8cf2bebb3b497c .generated_files/flags/sensornode_development/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Application.o.d 
	@${RM} ${OBJECTDIR}/src/Application.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fno-common -D__BUILD_DEVELOPMENT__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/Application.o.d" -o ${OBJECTDIR}/src/Application.o src/Application.c    -DXPRJ_sensornode_development=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
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
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/base-station.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_sensornode_development=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC00490:0x1FC00BEF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/base-station.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/base-station.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_sensornode_development=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
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

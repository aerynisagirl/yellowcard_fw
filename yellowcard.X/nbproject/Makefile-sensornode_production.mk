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
ifeq "$(wildcard nbproject/Makefile-local-sensornode_production.mk)" "nbproject/Makefile-local-sensornode_production.mk"
include nbproject/Makefile-local-sensornode_production.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=sensornode_production
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
ConfName=sensornode_production
ImagePath="dist\sensornode_production\${IMAGE_TYPE}\base-station.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ImageDir="dist\sensornode_production\${IMAGE_TYPE}"
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
	${MAKE}  -f nbproject/Makefile-sensornode_production.mk ${DISTDIR}/base-station.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
${OBJECTDIR}/src/drv/DPS368/DPS368.o: src/drv/DPS368/DPS368.c  .generated_files/flags/sensornode_production/137829282e80956f394bf5463653c8431d1a6686 .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/DPS368" 
	@${RM} ${OBJECTDIR}/src/drv/DPS368/DPS368.o.d 
	@${RM} ${OBJECTDIR}/src/drv/DPS368/DPS368.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/drv/DPS368/DPS368.o.d" -o ${OBJECTDIR}/src/drv/DPS368/DPS368.o src/drv/DPS368/DPS368.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/SHT4x/SHT4x.o: src/drv/SHT4x/SHT4x.c  .generated_files/flags/sensornode_production/63498497fcfae0aecc36e1fe8b2c274c3c271201 .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/SHT4x" 
	@${RM} ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o.d 
	@${RM} ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/drv/SHT4x/SHT4x.o.d" -o ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o src/drv/SHT4x/SHT4x.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/SX1231H/SX1231H.o: src/drv/SX1231H/SX1231H.c  .generated_files/flags/sensornode_production/1017dd2991986ffee2ee65deeaa3c328c8e1bce0 .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/SX1231H" 
	@${RM} ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o.d 
	@${RM} ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/drv/SX1231H/SX1231H.o.d" -o ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o src/drv/SX1231H/SX1231H.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o: src/drv/SSD1803A/SSD1803A.c  .generated_files/flags/sensornode_production/3a334c6e7ad23c32f0163b21af95614edc0ab342 .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/SSD1803A" 
	@${RM} ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o.d 
	@${RM} ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o.d" -o ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o src/drv/SSD1803A/SSD1803A.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Main.o: src/Main.c  .generated_files/flags/sensornode_production/ca2bacb6c2f99fe3584c411d4f3cac23f754c244 .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Main.o.d 
	@${RM} ${OBJECTDIR}/src/Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/Main.o.d" -o ${OBJECTDIR}/src/Main.o src/Main.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/HAL.o: src/drv/HAL.c  .generated_files/flags/sensornode_production/7e18211ac34f60e9db971ad3cf3f88f0a38c9edc .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv" 
	@${RM} ${OBJECTDIR}/src/drv/HAL.o.d 
	@${RM} ${OBJECTDIR}/src/drv/HAL.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/drv/HAL.o.d" -o ${OBJECTDIR}/src/drv/HAL.o src/drv/HAL.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Interrupts.o: src/Interrupts.c  .generated_files/flags/sensornode_production/c74c373337cc9d43421f802f424ac7d4cfa19f45 .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Interrupts.o.d 
	@${RM} ${OBJECTDIR}/src/Interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/Interrupts.o.d" -o ${OBJECTDIR}/src/Interrupts.o src/Interrupts.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/PacketStructures.o: src/PacketStructures.c  .generated_files/flags/sensornode_production/ad1c38aca51c86ea6e1ba6acb7ce1273bbde4cfc .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/PacketStructures.o.d 
	@${RM} ${OBJECTDIR}/src/PacketStructures.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/PacketStructures.o.d" -o ${OBJECTDIR}/src/PacketStructures.o src/PacketStructures.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Logging.o: src/Logging.c  .generated_files/flags/sensornode_production/b632aa47b2de1e2555af50baf8e7bfc229cf3852 .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Logging.o.d 
	@${RM} ${OBJECTDIR}/src/Logging.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/Logging.o.d" -o ${OBJECTDIR}/src/Logging.o src/Logging.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Application.o: src/Application.c  .generated_files/flags/sensornode_production/cbad52a2729a6894f2da9ac5531b46c37f256710 .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Application.o.d 
	@${RM} ${OBJECTDIR}/src/Application.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/Application.o.d" -o ${OBJECTDIR}/src/Application.o src/Application.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/src/drv/DPS368/DPS368.o: src/drv/DPS368/DPS368.c  .generated_files/flags/sensornode_production/ac23254cf4923368ac0072b6a303a0f6b84e450c .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/DPS368" 
	@${RM} ${OBJECTDIR}/src/drv/DPS368/DPS368.o.d 
	@${RM} ${OBJECTDIR}/src/drv/DPS368/DPS368.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/drv/DPS368/DPS368.o.d" -o ${OBJECTDIR}/src/drv/DPS368/DPS368.o src/drv/DPS368/DPS368.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/SHT4x/SHT4x.o: src/drv/SHT4x/SHT4x.c  .generated_files/flags/sensornode_production/93e9ba3575a55a688f6f5e4af5531d85f7bae421 .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/SHT4x" 
	@${RM} ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o.d 
	@${RM} ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/drv/SHT4x/SHT4x.o.d" -o ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o src/drv/SHT4x/SHT4x.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/SX1231H/SX1231H.o: src/drv/SX1231H/SX1231H.c  .generated_files/flags/sensornode_production/937931a69f9cf06b1ffd35509c224d18cf331a25 .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/SX1231H" 
	@${RM} ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o.d 
	@${RM} ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/drv/SX1231H/SX1231H.o.d" -o ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o src/drv/SX1231H/SX1231H.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o: src/drv/SSD1803A/SSD1803A.c  .generated_files/flags/sensornode_production/65924c0886537cd6106bc84febb65542702396c6 .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/SSD1803A" 
	@${RM} ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o.d 
	@${RM} ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o.d" -o ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o src/drv/SSD1803A/SSD1803A.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Main.o: src/Main.c  .generated_files/flags/sensornode_production/3a8960526c9ded48102e887261d6858c6177fdaa .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Main.o.d 
	@${RM} ${OBJECTDIR}/src/Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/Main.o.d" -o ${OBJECTDIR}/src/Main.o src/Main.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/HAL.o: src/drv/HAL.c  .generated_files/flags/sensornode_production/2190295acb85da8cb997e388edf7502cb2969540 .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv" 
	@${RM} ${OBJECTDIR}/src/drv/HAL.o.d 
	@${RM} ${OBJECTDIR}/src/drv/HAL.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/drv/HAL.o.d" -o ${OBJECTDIR}/src/drv/HAL.o src/drv/HAL.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Interrupts.o: src/Interrupts.c  .generated_files/flags/sensornode_production/ed8273a92c5d2c9988a3564d60728ed1727455df .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Interrupts.o.d 
	@${RM} ${OBJECTDIR}/src/Interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/Interrupts.o.d" -o ${OBJECTDIR}/src/Interrupts.o src/Interrupts.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/PacketStructures.o: src/PacketStructures.c  .generated_files/flags/sensornode_production/6da38dd3009379a9a790ca11cbe60563b6fedd08 .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/PacketStructures.o.d 
	@${RM} ${OBJECTDIR}/src/PacketStructures.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/PacketStructures.o.d" -o ${OBJECTDIR}/src/PacketStructures.o src/PacketStructures.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Logging.o: src/Logging.c  .generated_files/flags/sensornode_production/cbeca96045e15b8aaa71364c720340f5bc91803d .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Logging.o.d 
	@${RM} ${OBJECTDIR}/src/Logging.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/Logging.o.d" -o ${OBJECTDIR}/src/Logging.o src/Logging.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Application.o: src/Application.c  .generated_files/flags/sensornode_production/b323569c3e82cb6ec62725791f6b4ed012de0f1d .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Application.o.d 
	@${RM} ${OBJECTDIR}/src/Application.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fomit-frame-pointer -fno-common -D__BUILD_PRODUCTION__ -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/Application.o.d" -o ${OBJECTDIR}/src/Application.o src/Application.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
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
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/base-station.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/base-station.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/base-station.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
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

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
SOURCEFILES_QUOTED_IF_SPACED=src/drv/DPS368/DPS368.c src/drv/SHT4x/SHT4x.c src/drv/SX1231H/SX1231H.c src/drv/SSD1803A/SSD1803A.c src/Main.c src/drv/HAL.c src/Interrupts.c src/PacketStructures.c src/Logging.c src/Application.c src/Display.c src/StringUtils.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/src/drv/DPS368/DPS368.o ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o ${OBJECTDIR}/src/Main.o ${OBJECTDIR}/src/drv/HAL.o ${OBJECTDIR}/src/Interrupts.o ${OBJECTDIR}/src/PacketStructures.o ${OBJECTDIR}/src/Logging.o ${OBJECTDIR}/src/Application.o ${OBJECTDIR}/src/Display.o ${OBJECTDIR}/src/StringUtils.o
POSSIBLE_DEPFILES=${OBJECTDIR}/src/drv/DPS368/DPS368.o.d ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o.d ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o.d ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o.d ${OBJECTDIR}/src/Main.o.d ${OBJECTDIR}/src/drv/HAL.o.d ${OBJECTDIR}/src/Interrupts.o.d ${OBJECTDIR}/src/PacketStructures.o.d ${OBJECTDIR}/src/Logging.o.d ${OBJECTDIR}/src/Application.o.d ${OBJECTDIR}/src/Display.o.d ${OBJECTDIR}/src/StringUtils.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/src/drv/DPS368/DPS368.o ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o ${OBJECTDIR}/src/Main.o ${OBJECTDIR}/src/drv/HAL.o ${OBJECTDIR}/src/Interrupts.o ${OBJECTDIR}/src/PacketStructures.o ${OBJECTDIR}/src/Logging.o ${OBJECTDIR}/src/Application.o ${OBJECTDIR}/src/Display.o ${OBJECTDIR}/src/StringUtils.o

# Source Files
SOURCEFILES=src/drv/DPS368/DPS368.c src/drv/SHT4x/SHT4x.c src/drv/SX1231H/SX1231H.c src/drv/SSD1803A/SSD1803A.c src/Main.c src/drv/HAL.c src/Interrupts.c src/PacketStructures.c src/Logging.c src/Application.c src/Display.c src/StringUtils.c



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

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-sensornode_production.mk ${DISTDIR}/yellowcard.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

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
${OBJECTDIR}/src/drv/DPS368/DPS368.o: src/drv/DPS368/DPS368.c  .generated_files/flags/sensornode_production/b5fb8f4dde499cc66e23a90e0750550cf5a03865 .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/DPS368" 
	@${RM} ${OBJECTDIR}/src/drv/DPS368/DPS368.o.d 
	@${RM} ${OBJECTDIR}/src/drv/DPS368/DPS368.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -mno-float -O2 -fomit-frame-pointer -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/drv/DPS368/DPS368.o.d" -o ${OBJECTDIR}/src/drv/DPS368/DPS368.o src/drv/DPS368/DPS368.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/SHT4x/SHT4x.o: src/drv/SHT4x/SHT4x.c  .generated_files/flags/sensornode_production/b7c97601d0dcbe3a1157e04ef8e7ebce3c39fdbd .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/SHT4x" 
	@${RM} ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o.d 
	@${RM} ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -mno-float -O2 -fomit-frame-pointer -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/drv/SHT4x/SHT4x.o.d" -o ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o src/drv/SHT4x/SHT4x.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/SX1231H/SX1231H.o: src/drv/SX1231H/SX1231H.c  .generated_files/flags/sensornode_production/a4da50f091ae6acf835169685faeaee30ac39eb7 .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/SX1231H" 
	@${RM} ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o.d 
	@${RM} ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -mno-float -O2 -fomit-frame-pointer -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/drv/SX1231H/SX1231H.o.d" -o ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o src/drv/SX1231H/SX1231H.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o: src/drv/SSD1803A/SSD1803A.c  .generated_files/flags/sensornode_production/373f417022843e028ae1079cf9db0405ad6a57c9 .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/SSD1803A" 
	@${RM} ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o.d 
	@${RM} ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -mno-float -O2 -fomit-frame-pointer -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o.d" -o ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o src/drv/SSD1803A/SSD1803A.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Main.o: src/Main.c  .generated_files/flags/sensornode_production/ac34802dac5f668cec457c7bdcf7b1c8451ae7a1 .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Main.o.d 
	@${RM} ${OBJECTDIR}/src/Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -mno-float -O2 -fomit-frame-pointer -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/Main.o.d" -o ${OBJECTDIR}/src/Main.o src/Main.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/HAL.o: src/drv/HAL.c  .generated_files/flags/sensornode_production/83a65faa584376fc18c860529bbfb506096d098f .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv" 
	@${RM} ${OBJECTDIR}/src/drv/HAL.o.d 
	@${RM} ${OBJECTDIR}/src/drv/HAL.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -mno-float -O2 -fomit-frame-pointer -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/drv/HAL.o.d" -o ${OBJECTDIR}/src/drv/HAL.o src/drv/HAL.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Interrupts.o: src/Interrupts.c  .generated_files/flags/sensornode_production/c6cd9eb65f1bebb83bde8ae8d34492752a081dad .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Interrupts.o.d 
	@${RM} ${OBJECTDIR}/src/Interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -mno-float -O2 -fomit-frame-pointer -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/Interrupts.o.d" -o ${OBJECTDIR}/src/Interrupts.o src/Interrupts.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/PacketStructures.o: src/PacketStructures.c  .generated_files/flags/sensornode_production/c1eb1d7ae8640d7a690985f964a3bb013fb5e9c1 .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/PacketStructures.o.d 
	@${RM} ${OBJECTDIR}/src/PacketStructures.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -mno-float -O2 -fomit-frame-pointer -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/PacketStructures.o.d" -o ${OBJECTDIR}/src/PacketStructures.o src/PacketStructures.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Logging.o: src/Logging.c  .generated_files/flags/sensornode_production/140430a7548d51da59287456b06085482fbfdcf2 .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Logging.o.d 
	@${RM} ${OBJECTDIR}/src/Logging.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -mno-float -O2 -fomit-frame-pointer -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/Logging.o.d" -o ${OBJECTDIR}/src/Logging.o src/Logging.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Application.o: src/Application.c  .generated_files/flags/sensornode_production/58af5394e337ecde2fadd20d74954bd6a2e8ebb .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Application.o.d 
	@${RM} ${OBJECTDIR}/src/Application.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -mno-float -O2 -fomit-frame-pointer -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/Application.o.d" -o ${OBJECTDIR}/src/Application.o src/Application.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Display.o: src/Display.c  .generated_files/flags/sensornode_production/6a7f5d290bf7caa037d6ac1ac51c0f458a801ebc .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Display.o.d 
	@${RM} ${OBJECTDIR}/src/Display.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -mno-float -O2 -fomit-frame-pointer -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/Display.o.d" -o ${OBJECTDIR}/src/Display.o src/Display.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/StringUtils.o: src/StringUtils.c  .generated_files/flags/sensornode_production/bdaba12c3e89941da0ee88677f6b32b1a147496f .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/StringUtils.o.d 
	@${RM} ${OBJECTDIR}/src/StringUtils.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -mno-float -O2 -fomit-frame-pointer -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/StringUtils.o.d" -o ${OBJECTDIR}/src/StringUtils.o src/StringUtils.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/src/drv/DPS368/DPS368.o: src/drv/DPS368/DPS368.c  .generated_files/flags/sensornode_production/21e5a5c78ed40d548189a467ac29d6e57de4fc96 .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/DPS368" 
	@${RM} ${OBJECTDIR}/src/drv/DPS368/DPS368.o.d 
	@${RM} ${OBJECTDIR}/src/drv/DPS368/DPS368.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -mno-float -O2 -fomit-frame-pointer -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/drv/DPS368/DPS368.o.d" -o ${OBJECTDIR}/src/drv/DPS368/DPS368.o src/drv/DPS368/DPS368.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/SHT4x/SHT4x.o: src/drv/SHT4x/SHT4x.c  .generated_files/flags/sensornode_production/3ff82bcfe7eab03c87863414e9b403b69f05cc3d .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/SHT4x" 
	@${RM} ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o.d 
	@${RM} ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -mno-float -O2 -fomit-frame-pointer -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/drv/SHT4x/SHT4x.o.d" -o ${OBJECTDIR}/src/drv/SHT4x/SHT4x.o src/drv/SHT4x/SHT4x.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/SX1231H/SX1231H.o: src/drv/SX1231H/SX1231H.c  .generated_files/flags/sensornode_production/32427c54a1b66482b6b76d7f40e9e902d736bdba .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/SX1231H" 
	@${RM} ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o.d 
	@${RM} ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -mno-float -O2 -fomit-frame-pointer -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/drv/SX1231H/SX1231H.o.d" -o ${OBJECTDIR}/src/drv/SX1231H/SX1231H.o src/drv/SX1231H/SX1231H.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o: src/drv/SSD1803A/SSD1803A.c  .generated_files/flags/sensornode_production/e1b7760c550aafb5f91ef8bf4cc2dc9ee82481b4 .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv/SSD1803A" 
	@${RM} ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o.d 
	@${RM} ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -mno-float -O2 -fomit-frame-pointer -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o.d" -o ${OBJECTDIR}/src/drv/SSD1803A/SSD1803A.o src/drv/SSD1803A/SSD1803A.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Main.o: src/Main.c  .generated_files/flags/sensornode_production/30f3131703508f337824c647625cf47f63607405 .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Main.o.d 
	@${RM} ${OBJECTDIR}/src/Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -mno-float -O2 -fomit-frame-pointer -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/Main.o.d" -o ${OBJECTDIR}/src/Main.o src/Main.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/drv/HAL.o: src/drv/HAL.c  .generated_files/flags/sensornode_production/23c942b9257e0a668528558e9c47ebe6b487f814 .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/drv" 
	@${RM} ${OBJECTDIR}/src/drv/HAL.o.d 
	@${RM} ${OBJECTDIR}/src/drv/HAL.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -mno-float -O2 -fomit-frame-pointer -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/drv/HAL.o.d" -o ${OBJECTDIR}/src/drv/HAL.o src/drv/HAL.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Interrupts.o: src/Interrupts.c  .generated_files/flags/sensornode_production/4b8df4f25626c8c4252b55d99145b954951302d .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Interrupts.o.d 
	@${RM} ${OBJECTDIR}/src/Interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -mno-float -O2 -fomit-frame-pointer -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/Interrupts.o.d" -o ${OBJECTDIR}/src/Interrupts.o src/Interrupts.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/PacketStructures.o: src/PacketStructures.c  .generated_files/flags/sensornode_production/f81e8bb8b5acc8f350c0e0dd99f8a0d074e45bfd .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/PacketStructures.o.d 
	@${RM} ${OBJECTDIR}/src/PacketStructures.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -mno-float -O2 -fomit-frame-pointer -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/PacketStructures.o.d" -o ${OBJECTDIR}/src/PacketStructures.o src/PacketStructures.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Logging.o: src/Logging.c  .generated_files/flags/sensornode_production/a8f6f19629d3b572b96a19c893ee936ea1decb2a .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Logging.o.d 
	@${RM} ${OBJECTDIR}/src/Logging.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -mno-float -O2 -fomit-frame-pointer -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/Logging.o.d" -o ${OBJECTDIR}/src/Logging.o src/Logging.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Application.o: src/Application.c  .generated_files/flags/sensornode_production/f37c26d493534a056a94364d55fc9238dd9331f7 .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Application.o.d 
	@${RM} ${OBJECTDIR}/src/Application.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -mno-float -O2 -fomit-frame-pointer -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/Application.o.d" -o ${OBJECTDIR}/src/Application.o src/Application.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/Display.o: src/Display.c  .generated_files/flags/sensornode_production/bffbfd546750520ac28fec2403e15719f24f8cef .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/Display.o.d 
	@${RM} ${OBJECTDIR}/src/Display.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -mno-float -O2 -fomit-frame-pointer -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/Display.o.d" -o ${OBJECTDIR}/src/Display.o src/Display.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/StringUtils.o: src/StringUtils.c  .generated_files/flags/sensornode_production/da1a4c1fefc7ea559f2072a36ceeff043bfc2594 .generated_files/flags/sensornode_production/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/StringUtils.o.d 
	@${RM} ${OBJECTDIR}/src/StringUtils.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -mno-float -O2 -fomit-frame-pointer -D__IS_SENSORNODE__ -MP -MMD -MF "${OBJECTDIR}/src/StringUtils.o.d" -o ${OBJECTDIR}/src/StringUtils.o src/StringUtils.c    -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
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
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION) -O2 --fill=0x0 -o ${DISTDIR}/yellowcard.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC00490:0x1FC00BEF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--warn-section-align,--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/yellowcard.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION) -O2 --fill=0x0 -o ${DISTDIR}/yellowcard.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_sensornode_production=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--warn-section-align,--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/yellowcard.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} --write-sla 
	@echo Normalizing hex file
	@"C:/Program Files/Microchip/MPLABX/v6.15/mplab_platform/platform/../mplab_ide/modules/../../bin/hexmate" --edf="C:/Program Files/Microchip/MPLABX/v6.15/mplab_platform/platform/../mplab_ide/modules/../../dat/en_msgs.txt" ${DISTDIR}/yellowcard.X.${IMAGE_TYPE}.hex -o${DISTDIR}/yellowcard.X.${IMAGE_TYPE}.hex

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

ROOT_DIR = $(abspath ..)

# compile options ##############################################################
CFLAGS +=
CXXFLAGS +=

# sources ######################################################################
PROJ_NAME := GuruxDLMSLib
PROJ_ROOT_DIR := $(abspath .)
PROJ_SOURCE_DIR := ${PROJ_ROOT_DIR}/GuruxDLMS
PROJ_BUILD_DIR := ${PROJ_ROOT_DIR}/build
PROJ_OBJ_DIR := ${PROJ_BUILD_DIR}/obj

OBJS := \
	${PROJ_OBJ_DIR}/GXDateTime.o \
	${PROJ_OBJ_DIR}/GXDLMSClient.o \
	${PROJ_OBJ_DIR}/GXDLMSConverter.o \
	${PROJ_OBJ_DIR}/GXDLMS.o \
	${PROJ_OBJ_DIR}/GXDLMSLimits.o \
	${PROJ_OBJ_DIR}/GXDLMSLNSettings.o \
	${PROJ_OBJ_DIR}/GXDLMSObjectFactory.o \
	${PROJ_OBJ_DIR}/GXDLMSServerBase.o \
	${PROJ_OBJ_DIR}/GXDLMSSNSettings.o \
	${PROJ_OBJ_DIR}/GXDLMSVariant.o\
	${PROJ_OBJ_DIR}/GXOBISTemplate.o\
	${PROJ_OBJ_DIR}/GXStandardObisCodeCollection.o\
	${PROJ_OBJ_DIR}/GXStandardObisCode.o \
	${PROJ_OBJ_DIR}/Objects/GXApplicationContextName.o \
	${PROJ_OBJ_DIR}/Objects/GXAuthenticationMechanismName.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSActionItem.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSActionSchedule.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSActionSet.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSActivityCalendar.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSAssociationLogicalName.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSAssociationShortName.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSAutoAnswer.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSAutoConnect.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSCaptureObject.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSClock.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSData.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSDayProfileAction.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSDayProfile.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSDemandRegister.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSDisconnectControl.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSEmergencyProfile.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSExtendedRegister.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSGPRSSetup.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSHdlcSetup.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSIECOpticalPortSetup.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSImageActivateInfo.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSImageTransfer.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSIp4Setup.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSIp4SetupIpOption.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSLimiter.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSMacAddressSetup.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSMBusClient.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSMBusMasterPortSetup.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSMBusSlavePortSetup.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSMessageHandler.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSModemConfiguration.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSModemInitialisation.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSMonitoredValue.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSObjectCollection.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSObject.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSObjectDefinition.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSPppSetup.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSPppSetupIPCPOption.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSPppSetupLcpOption.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSProfileGeneric.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSPushObject.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSPushSetup.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSQualityOfService.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSRegisterActivation.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSRegister.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSRegisterMonitor.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSSapAssignment.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSSchedule.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSScriptAction.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSScriptTable.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSSeasonProfile.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSSecuritySetup.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSSpecialDay.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSSpecialDaysTable.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSTcpUdpSetup.o \
	${PROJ_OBJ_DIR}/Objects/GXDLMSWeekProfile.o \
	${PROJ_OBJ_DIR}/Objects/GXSendDestinationAndMethod.o \
	${PROJ_OBJ_DIR}/Objects/GXxDLMSContextType.o \

INCLUDE += \
	-I${PROJ_SOURCE_DIR}

include tools.mk

################################################################################
LIBRARY_DIR := ${PROJ_ROOT_DIR}/lib
LIBRARY := ${LIBRARY_DIR}/lib${PROJ_NAME}.a

# targets ######################################################################
.PHONY: all always bin clean
.INTERMEDIATE: ${DEPS}

all: bin

always:

bin: ${LIBRARY}

clean:
	@rm -rf \
		${PROJ_OBJ_DIR} \
		${PROJ_TEST_OBJ_DIR} \
		${LIBRARY_DIR} \

# library objects ##############################################################
${LIBRARY}: ${OBJS}
	@printf "Archiving $@\n"
	@mkdir -p "$(dir $@)"
	@${AR} csrv $@ ${OBJS} > /dev/null

${PROJ_OBJ_DIR}/%.o: ${PROJ_SOURCE_DIR}/%.cpp
	@printf "Compiling $<\n"
	@mkdir -p "$(dir $@)"
	@${CXX} \
		-o $@ \
		-c \
		${INCLUDE} \
		${CXXFLAGS} \
		$<

IF(NOT DEFINED FPU)  
    SET(FPU "-mfloat-abi=hard -mfpu=fpv5-sp-d16")  
ENDIF()  

IF(NOT DEFINED SPECS)  
    SET(SPECS "--specs=nosys.specs")  
ENDIF()  

IF(NOT DEFINED DEBUG_CONSOLE_CONFIG)  
    SET(DEBUG_CONSOLE_CONFIG "-DSDK_DEBUGCONSOLE=1")  
ENDIF()  

SET(CMAKE_ASM_FLAGS_DEBUG " \
    ${CMAKE_ASM_FLAGS_DEBUG} \
    -D__STARTUP_CLEAR_BSS \
    -DMCUXPRESSO_SDK \
    -DCPU_MCXN947VDF_cm33_core0 \
    -g \
    -mthumb \
    -mcpu=cortex-m33 \
    ${FPU} \
")
SET(CMAKE_ASM_FLAGS_RELEASE " \
    ${CMAKE_ASM_FLAGS_RELEASE} \
    -D__STARTUP_CLEAR_BSS \
    -DMCUXPRESSO_SDK \
    -DCPU_MCXN947VDF_cm33_core0 \
    -mthumb \
    -mcpu=cortex-m33 \
    ${FPU} \
")
SET(CMAKE_C_FLAGS_DEBUG " \
    ${CMAKE_C_FLAGS_DEBUG} \
    -include ${ProjDirPath}/../mcux_config.h \
    -DDEBUG \
    -DLPC_ENET \
    -DEXAMPLE_USE_100M_ENET_PORT \
    -DAX_EMBEDDED=1 \
    -DNXP_IOT_AGENT_USE_COREJSON \
    -DNXP_IOT_AGENT_USE_MBEDTLS_TRANSPORT_FOR_MQTT \
    -DPRINTF_ADVANCED_ENABLE=1 \
    -DUSE_RTOS=1 \
    -DMCUX_META_BUILD \
    -DMCUXPRESSO_SDK \
    -DCPU_MCXN947VDF_cm33_core0 \
    -DSERIAL_PORT_TYPE_UART=1 \
    -DLWIP_DISABLE_PBUF_POOL_SIZE_SANITY_CHECKS=1 \
    -DLWIP_SUPPORT_CUSTOM_PBUF=1 \
    -DCHECKSUM_GEN_UDP=1 \
    -DCHECKSUM_GEN_TCP=1 \
    -DCHECKSUM_GEN_ICMP=1 \
    -DCHECKSUM_GEN_ICMP6=1 \
    -DCHECKSUM_CHECK_IP=1 \
    -DCHECKSUM_CHECK_UDP=1 \
    -DCHECKSUM_CHECK_TCP=1 \
    -DCHECKSUM_CHECK_ICMP=1 \
    -DCHECKSUM_CHECK_ICMP6=1 \
    -DTFM_LPUART_FEATRUE \
    -DTFM_LVL=2 \
    -DCONFIG_TFM_FLOAT_ABI=2 \
    -DCONFIG_TFM_ENABLE_CP10CP11 \
    -DCONFIG_TFM_LAZY_STACKING \
    -D__DOMAIN_NS=1 \
    -DDOMAIN_NS=1 \
    -DCONFIG_TFM_USE_TRUSTZONE \
    -DATTEST_TOKEN_PROFILE_PSA_IOT_1 \
    -DPLATFORM_DEFAULT_CRYPTO_KEYS \
    -DPS_ENCRYPTION \
    -DPB_FIELD_32BIT \
    -DNXP_IOT_AGENT_HAVE_HOSTCRYPTO_MBEDTLS=1 \
    -DNXP_IOT_AGENT_HAVE_PSA=1 \
    -DNXP_IOT_AGENT_HAVE_PSA_IMPL_TFM=1 \
    -DIOT_AGENT_MQTT_ENABLE=1 \
    -DSDK_OS_FREE_RTOS \
    -g \
    -O0 \
    -Os \
    --specs=nano.specs \
    -Wall \
    -fno-common \
    -ffunction-sections \
    -fdata-sections \
    -fno-builtin \
    -mthumb \
    -mapcs \
    -std=gnu99 \
    -mcpu=cortex-m33 \
    ${FPU} \
    ${DEBUG_CONSOLE_CONFIG} \
")
SET(CMAKE_C_FLAGS_RELEASE " \
    ${CMAKE_C_FLAGS_RELEASE} \
    -include ${ProjDirPath}/../mcux_config.h \
    -DNDEBUG \
    -DLPC_ENET \
    -DEXAMPLE_USE_100M_ENET_PORT \
    -DAX_EMBEDDED=1 \
    -DNXP_IOT_AGENT_USE_COREJSON \
    -DNXP_IOT_AGENT_USE_MBEDTLS_TRANSPORT_FOR_MQTT \
    -DPRINTF_ADVANCED_ENABLE=1 \
    -DUSE_RTOS=1 \
    -DMCUX_META_BUILD \
    -DMCUXPRESSO_SDK \
    -DCPU_MCXN947VDF_cm33_core0 \
    -DSERIAL_PORT_TYPE_UART=1 \
    -DLWIP_DISABLE_PBUF_POOL_SIZE_SANITY_CHECKS=1 \
    -DLWIP_SUPPORT_CUSTOM_PBUF=1 \
    -DCHECKSUM_GEN_UDP=1 \
    -DCHECKSUM_GEN_TCP=1 \
    -DCHECKSUM_GEN_ICMP=1 \
    -DCHECKSUM_GEN_ICMP6=1 \
    -DCHECKSUM_CHECK_IP=1 \
    -DCHECKSUM_CHECK_UDP=1 \
    -DCHECKSUM_CHECK_TCP=1 \
    -DCHECKSUM_CHECK_ICMP=1 \
    -DCHECKSUM_CHECK_ICMP6=1 \
    -DTFM_LPUART_FEATRUE \
    -DTFM_LVL=2 \
    -DCONFIG_TFM_FLOAT_ABI=2 \
    -DCONFIG_TFM_ENABLE_CP10CP11 \
    -DCONFIG_TFM_LAZY_STACKING \
    -D__DOMAIN_NS=1 \
    -DDOMAIN_NS=1 \
    -DCONFIG_TFM_USE_TRUSTZONE \
    -DATTEST_TOKEN_PROFILE_PSA_IOT_1 \
    -DPLATFORM_DEFAULT_CRYPTO_KEYS \
    -DPS_ENCRYPTION \
    -DPB_FIELD_32BIT \
    -DNXP_IOT_AGENT_HAVE_HOSTCRYPTO_MBEDTLS=1 \
    -DNXP_IOT_AGENT_HAVE_PSA=1 \
    -DNXP_IOT_AGENT_HAVE_PSA_IMPL_TFM=1 \
    -DIOT_AGENT_MQTT_ENABLE=1 \
    -DSDK_OS_FREE_RTOS \
    -Os \
    --specs=nano.specs \
    -Wall \
    -fno-common \
    -ffunction-sections \
    -fdata-sections \
    -fno-builtin \
    -mthumb \
    -mapcs \
    -std=gnu99 \
    -mcpu=cortex-m33 \
    ${FPU} \
    ${DEBUG_CONSOLE_CONFIG} \
")
SET(CMAKE_CXX_FLAGS_DEBUG " \
    ${CMAKE_CXX_FLAGS_DEBUG} \
    -DDEBUG \
    -DMCUX_META_BUILD \
    -DMCUXPRESSO_SDK \
    -DCPU_MCXN947VDF_cm33_core0 \
    -DSERIAL_PORT_TYPE_UART=1 \
    -DLWIP_DISABLE_PBUF_POOL_SIZE_SANITY_CHECKS=1 \
    -DLWIP_SUPPORT_CUSTOM_PBUF=1 \
    -DCHECKSUM_GEN_UDP=1 \
    -DCHECKSUM_GEN_TCP=1 \
    -DCHECKSUM_GEN_ICMP=1 \
    -DCHECKSUM_GEN_ICMP6=1 \
    -DCHECKSUM_CHECK_IP=1 \
    -DCHECKSUM_CHECK_UDP=1 \
    -DCHECKSUM_CHECK_TCP=1 \
    -DCHECKSUM_CHECK_ICMP=1 \
    -DCHECKSUM_CHECK_ICMP6=1 \
    -DSDK_OS_FREE_RTOS \
    -g \
    -O0 \
    --specs=nano.specs \
    -Wall \
    -fno-common \
    -ffunction-sections \
    -fdata-sections \
    -fno-builtin \
    -mthumb \
    -mapcs \
    -fno-rtti \
    -fno-exceptions \
    -mcpu=cortex-m33 \
    ${FPU} \
    ${DEBUG_CONSOLE_CONFIG} \
")
SET(CMAKE_CXX_FLAGS_RELEASE " \
    ${CMAKE_CXX_FLAGS_RELEASE} \
    -DNDEBUG \
    -DMCUX_META_BUILD \
    -DMCUXPRESSO_SDK \
    -DCPU_MCXN947VDF_cm33_core0 \
    -DSERIAL_PORT_TYPE_UART=1 \
    -DLWIP_DISABLE_PBUF_POOL_SIZE_SANITY_CHECKS=1 \
    -DLWIP_SUPPORT_CUSTOM_PBUF=1 \
    -DCHECKSUM_GEN_UDP=1 \
    -DCHECKSUM_GEN_TCP=1 \
    -DCHECKSUM_GEN_ICMP=1 \
    -DCHECKSUM_GEN_ICMP6=1 \
    -DCHECKSUM_CHECK_IP=1 \
    -DCHECKSUM_CHECK_UDP=1 \
    -DCHECKSUM_CHECK_TCP=1 \
    -DCHECKSUM_CHECK_ICMP=1 \
    -DCHECKSUM_CHECK_ICMP6=1 \
    -DSDK_OS_FREE_RTOS \
    -Os \
    --specs=nano.specs \
    -Wall \
    -fno-common \
    -ffunction-sections \
    -fdata-sections \
    -fno-builtin \
    -mthumb \
    -mapcs \
    -fno-rtti \
    -fno-exceptions \
    -mcpu=cortex-m33 \
    ${FPU} \
    ${DEBUG_CONSOLE_CONFIG} \
")
SET(CMAKE_EXE_LINKER_FLAGS_DEBUG " \
    ${CMAKE_EXE_LINKER_FLAGS_DEBUG} \
    -g \
    -Xlinker \
    -Map=output.map \
    -Wall \
    -fno-common \
    -ffunction-sections \
    -fdata-sections \
    -fno-builtin \
    -mthumb \
    -mapcs \
    -Wl,--gc-sections \
    -Wl,-static \
    -Wl,--print-memory-usage \
    -mcpu=cortex-m33 \
    ${FPU} \
    ${SPECS} \
    -T\"${SdkRootDirPath}/middleware/tfm/tf-m/platform/ext/common/gcc/tfm_common_ns_pre.ld\" -static \
")
SET(CMAKE_EXE_LINKER_FLAGS_RELEASE " \
    ${CMAKE_EXE_LINKER_FLAGS_RELEASE} \
    -Xlinker \
    -Map=output.map \
    -Wall \
    -fno-common \
    -ffunction-sections \
    -fdata-sections \
    -fno-builtin \
    -mthumb \
    -mapcs \
    -Wl,--gc-sections \
    -Wl,-static \
    -Wl,--print-memory-usage \
    -mcpu=cortex-m33 \
    ${FPU} \
    ${SPECS} \
    -T\"${SdkRootDirPath}/middleware/tfm/tf-m/platform/ext/common/gcc/tfm_common_ns_pre.ld\" -static \
")

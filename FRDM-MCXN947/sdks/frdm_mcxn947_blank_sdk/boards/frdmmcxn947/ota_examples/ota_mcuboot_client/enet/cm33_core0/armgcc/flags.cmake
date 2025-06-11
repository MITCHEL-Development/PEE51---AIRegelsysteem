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
    -D_POSIX_SOURCE \
    -DPRINTF_ADVANCED_ENABLE=1 \
    -DMCUBOOT_APPLICATION=1 \
    -DUSE_RTOS=1 \
    -DLWIP_DNS=1 \
    -DLWIP_DHCP=1 \
    -DENET_RXBUFF_NUM=14 \
    -DSHELL_BUFFER_SIZE=128U \
    -DMCUX_META_BUILD \
    -DMCUXPRESSO_SDK \
    -DCPU_MCXN947VDF_cm33_core0 \
    -DSERIAL_PORT_TYPE_UART=1 \
    -DMFLASH_FILE_BASEADDR=131072 \
    -DMFLASH_ON_CHIP=1 \
    -DMFLASH_ON_CHIP_USE_FMU=1 \
    -DMBEDTLS_MCUX_ELS_API \
    -DMBEDTLS_MCUX_USE_ELS \
    -DMCUXCL_FEATURE_CSSL_MEMORY_C_FALLBACK \
    -DMBEDTLS_MCUX_ELS_PKC_API \
    -DMBEDTLS_MCUX_USE_PKC \
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
    -g1 \
    -O0 \
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
    -fomit-frame-pointer \
    -Wno-unused-function \
    ${FPU} \
    ${DEBUG_CONSOLE_CONFIG} \
")
SET(CMAKE_C_FLAGS_RELEASE " \
    ${CMAKE_C_FLAGS_RELEASE} \
    -include ${ProjDirPath}/../mcux_config.h \
    -DNDEBUG \
    -D_POSIX_SOURCE \
    -DPRINTF_ADVANCED_ENABLE=1 \
    -DMCUBOOT_APPLICATION=1 \
    -DUSE_RTOS=1 \
    -DLWIP_DNS=1 \
    -DLWIP_DHCP=1 \
    -DENET_RXBUFF_NUM=14 \
    -DSHELL_BUFFER_SIZE=128U \
    -DMCUX_META_BUILD \
    -DMCUXPRESSO_SDK \
    -DCPU_MCXN947VDF_cm33_core0 \
    -DSERIAL_PORT_TYPE_UART=1 \
    -DMFLASH_FILE_BASEADDR=131072 \
    -DMFLASH_ON_CHIP=1 \
    -DMFLASH_ON_CHIP_USE_FMU=1 \
    -DMBEDTLS_MCUX_ELS_API \
    -DMBEDTLS_MCUX_USE_ELS \
    -DMCUXCL_FEATURE_CSSL_MEMORY_C_FALLBACK \
    -DMBEDTLS_MCUX_ELS_PKC_API \
    -DMBEDTLS_MCUX_USE_PKC \
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
    -std=gnu99 \
    -mcpu=cortex-m33 \
    -fomit-frame-pointer \
    -Wno-unused-function \
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
    -DMFLASH_FILE_BASEADDR=131072 \
    -DMFLASH_ON_CHIP=1 \
    -DMFLASH_ON_CHIP_USE_FMU=1 \
    -DMBEDTLS_MCUX_ELS_API \
    -DMBEDTLS_MCUX_USE_ELS \
    -DMCUXCL_FEATURE_CSSL_MEMORY_C_FALLBACK \
    -DMBEDTLS_MCUX_ELS_PKC_API \
    -DMBEDTLS_MCUX_USE_PKC \
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
    -g1 \
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
    -DMFLASH_FILE_BASEADDR=131072 \
    -DMFLASH_ON_CHIP=1 \
    -DMFLASH_ON_CHIP_USE_FMU=1 \
    -DMBEDTLS_MCUX_ELS_API \
    -DMBEDTLS_MCUX_USE_ELS \
    -DMCUXCL_FEATURE_CSSL_MEMORY_C_FALLBACK \
    -DMBEDTLS_MCUX_ELS_PKC_API \
    -DMBEDTLS_MCUX_USE_PKC \
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
    --defsym=__stack_size__=0x2000 \
    -Xlinker \
    --defsym=__heap_size__=0x2000 \
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
    -T\"${ProjDirPath}/mcxn10_cm33_flash.ld\" -static \
")
SET(CMAKE_EXE_LINKER_FLAGS_RELEASE " \
    ${CMAKE_EXE_LINKER_FLAGS_RELEASE} \
    -Xlinker \
    --defsym=__stack_size__=0x2000 \
    -Xlinker \
    --defsym=__heap_size__=0x2000 \
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
    -T\"${ProjDirPath}/mcxn10_cm33_flash.ld\" -static \
")

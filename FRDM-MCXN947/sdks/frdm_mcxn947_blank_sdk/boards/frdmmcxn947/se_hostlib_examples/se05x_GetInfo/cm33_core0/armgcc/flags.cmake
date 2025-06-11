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
    -DSIMW_DEMO_ENABLE__DEMO_SE05X_GETINFO \
    -DMCXN \
    -DAX_EMBEDDED \
    -DPRINTF_ADVANCED_ENABLE=1 \
    -DMCUX_META_BUILD \
    -DMCUXPRESSO_SDK \
    -DCPU_MCXN947VDF_cm33_core0 \
    -DSERIAL_PORT_TYPE_UART=1 \
    -DMBEDTLS_MCUX_ELS_API \
    -DMBEDTLS_MCUX_USE_ELS \
    -DMCUXCL_FEATURE_CSSL_MEMORY_C_FALLBACK \
    -DMBEDTLS_MCUX_ELS_PKC_API \
    -DMBEDTLS_MCUX_USE_PKC \
    -DT1oI2C \
    -DT1oI2C_UM11225 \
    -DSSS_USE_FTR_FILE \
    -DNO_SECURE_CHANNEL_SUPPORT \
    -DMBEDTLS \
    -DSCP_MODE=C_MAC_C_ENC_R_MAC_R_ENC \
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
    -DSIMW_DEMO_ENABLE__DEMO_SE05X_GETINFO \
    -DMCXN \
    -DAX_EMBEDDED \
    -DPRINTF_ADVANCED_ENABLE=1 \
    -DMCUX_META_BUILD \
    -DMCUXPRESSO_SDK \
    -DCPU_MCXN947VDF_cm33_core0 \
    -DSERIAL_PORT_TYPE_UART=1 \
    -DMBEDTLS_MCUX_ELS_API \
    -DMBEDTLS_MCUX_USE_ELS \
    -DMCUXCL_FEATURE_CSSL_MEMORY_C_FALLBACK \
    -DMBEDTLS_MCUX_ELS_PKC_API \
    -DMBEDTLS_MCUX_USE_PKC \
    -DT1oI2C \
    -DT1oI2C_UM11225 \
    -DSSS_USE_FTR_FILE \
    -DNO_SECURE_CHANNEL_SUPPORT \
    -DMBEDTLS \
    -DSCP_MODE=C_MAC_C_ENC_R_MAC_R_ENC \
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
    -DMBEDTLS_MCUX_ELS_API \
    -DMBEDTLS_MCUX_USE_ELS \
    -DMCUXCL_FEATURE_CSSL_MEMORY_C_FALLBACK \
    -DMBEDTLS_MCUX_ELS_PKC_API \
    -DMBEDTLS_MCUX_USE_PKC \
    -DT1oI2C \
    -DT1oI2C_UM11225 \
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
    -DMBEDTLS_MCUX_ELS_API \
    -DMBEDTLS_MCUX_USE_ELS \
    -DMCUXCL_FEATURE_CSSL_MEMORY_C_FALLBACK \
    -DMBEDTLS_MCUX_ELS_PKC_API \
    -DMBEDTLS_MCUX_USE_PKC \
    -DT1oI2C \
    -DT1oI2C_UM11225 \
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
    --defsym=__stack_size__=0x3000 \
    -Xlinker \
    --defsym=__heap_size__=0x4000 \
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
    -T\"${ProjDirPath}/MCXN947_cm33_core0_flash.ld\" -static \
")
SET(CMAKE_EXE_LINKER_FLAGS_RELEASE " \
    ${CMAKE_EXE_LINKER_FLAGS_RELEASE} \
    -Xlinker \
    --defsym=__stack_size__=0x3000 \
    -Xlinker \
    --defsym=__heap_size__=0x4000 \
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
    -T\"${ProjDirPath}/MCXN947_cm33_core0_flash.ld\" -static \
")

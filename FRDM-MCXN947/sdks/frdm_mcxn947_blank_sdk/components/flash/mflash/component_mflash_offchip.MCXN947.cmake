# Add set(CONFIG_USE_component_mflash_offchip true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

      target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
          ${CMAKE_CURRENT_LIST_DIR}/mflash_file.c
          ${CMAKE_CURRENT_LIST_DIR}/mcxnx4x_flexspi/mflash_drv.c
        )

  
      target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
          ${CMAKE_CURRENT_LIST_DIR}/.
          ${CMAKE_CURRENT_LIST_DIR}/mcxnx4x_flexspi
        )

    if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

      target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
                  -DMFLASH_FILE_BASEADDR=134217728
                        -DMFLASH_OFF_CHIP=1
              )
  
  
  endif()


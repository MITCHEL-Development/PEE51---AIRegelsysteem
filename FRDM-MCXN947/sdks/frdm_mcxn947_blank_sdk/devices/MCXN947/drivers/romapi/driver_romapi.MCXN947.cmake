# Add set(CONFIG_USE_driver_romapi true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

      target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
          ${CMAKE_CURRENT_LIST_DIR}/flash/src/fsl_flash.c
          ${CMAKE_CURRENT_LIST_DIR}/mem_interface/src/fsl_mem_interface.c
          ${CMAKE_CURRENT_LIST_DIR}/nboot/src/fsl_nboot.c
          ${CMAKE_CURRENT_LIST_DIR}/runbootloader/src/fsl_runbootloader.c
        )

  
      target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
          ${CMAKE_CURRENT_LIST_DIR}/mem_interface
          ${CMAKE_CURRENT_LIST_DIR}/flash
          ${CMAKE_CURRENT_LIST_DIR}/nboot
          ${CMAKE_CURRENT_LIST_DIR}/runbootloader
        )

  

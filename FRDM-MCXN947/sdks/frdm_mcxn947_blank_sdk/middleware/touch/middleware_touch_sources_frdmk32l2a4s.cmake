# Add set(CONFIG_USE_middleware_touch_sources_frdmk32l2a4s true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

      target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
          ${CMAKE_CURRENT_LIST_DIR}/source/drivers/tsi/nt_drv_tsi_common.c
          ${CMAKE_CURRENT_LIST_DIR}/source/drivers/tsi/nt_drv_tsi_driver.c
          ${CMAKE_CURRENT_LIST_DIR}/source/drivers/tsi/nt_drv_tsi_v4_driver_specific.c
          ${CMAKE_CURRENT_LIST_DIR}/source/modules/nt_module_tsi.c
        )

  
      target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
          ${CMAKE_CURRENT_LIST_DIR}/source/drivers/tsi
          ${CMAKE_CURRENT_LIST_DIR}/source/modules
          ${CMAKE_CURRENT_LIST_DIR}/include
        )

  

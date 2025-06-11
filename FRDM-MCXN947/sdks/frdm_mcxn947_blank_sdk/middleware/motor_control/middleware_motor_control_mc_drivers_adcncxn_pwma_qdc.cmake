# Add set(CONFIG_USE_middleware_motor_control_mc_drivers_adcncxn_pwma_qdc true) in config.cmake to use this component

include_guard(GLOBAL)
message("${CMAKE_CURRENT_LIST_FILE} component is included.")

      target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
          ${CMAKE_CURRENT_LIST_DIR}/pmsm/pmsm_float/mc_drivers/mcdrv_adc_mcxn.c
          ${CMAKE_CURRENT_LIST_DIR}/pmsm/pmsm_float/mc_drivers/mcdrv_pwm3ph_pwma.c
          ${CMAKE_CURRENT_LIST_DIR}/pmsm/pmsm_float/mc_drivers/mcdrv_enc_qdc.c
        )

  
      target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
          ${CMAKE_CURRENT_LIST_DIR}/pmsm/pmsm_float/mc_drivers
        )

  

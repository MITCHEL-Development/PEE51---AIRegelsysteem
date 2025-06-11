/*
 *  Copyright 2025 NXP
 *  All rights reserved.
 *
 *  SPDX-License-Identifier: BSD-3-Clause
 */

#include "edgefast_bluetooth_config.h"

#define FLASH_ADAPTER_SIZE 0x4000

#if defined(WIFI_IW416_BOARD_AW_AM510_ARDUINO)
#include "wifi_bt_module_config.h"
#include "wifi_config.h"
#else
#error The transceiver module is unsupported
#endif

/* Select witch beacon application to start */
#define BEACON_APP  1
#define IBEACON_APP 0
#define EDDYSTONE   0

#if (defined EDDYSTONE) && (EDDYSTONE)
#undef CONFIG_BT_SETTINGS
#define CONFIG_BT_SETTINGS              1
#undef CONFIG_BT_KEYS_OVERWRITE_OLDEST
#define CONFIG_BT_KEYS_OVERWRITE_OLDEST 1
#endif
#if defined(IBEACON_APP) && (IBEACON_APP == 1)
#undef CONFIG_BT_DEVICE_NAME
#define CONFIG_BT_DEVICE_NAME "ibeacon"
#elif defined(EDDYSTONE) && (EDDYSTONE == 1)
#undef CONFIG_BT_DEVICE_NAME
#define CONFIG_BT_DEVICE_NAME "eddystone"
#elif defined(BEACON_APP) && (BEACON_APP == 1)
#undef CONFIG_BT_DEVICE_NAME
#define CONFIG_BT_DEVICE_NAME "beacon"
#endif

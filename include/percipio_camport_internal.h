#ifndef PERCIPIO_CAMPORT_INTERNAL_H_
#define PERCIPIO_CAMPORT_INTERNAL_H_

#include <stdint.h>
#include "percipio_camport.h"

namespace percipio {

enum InternalDeviceProperties {
  //control data save on device flash memory
  //download data to ram
  //related parameter :DeviceConfigData
  PROP_DEVCONFIG_DATA = 0x80000,
  //control config data on device
  //also can write config data from device ram to flash
  //related parameter :DeviceConfigSaveParam
  PROP_DEVCONFIG_UPDATE
};

struct DeviceConfigData {
  int8_t *data;
  int32_t data_len;
};


struct DeviceConfigUpdateParam {
  int8_t md5[16]; //
  int16_t write_flash; //0 -- not write 1-- write
};

}//namespace percipio

#endif

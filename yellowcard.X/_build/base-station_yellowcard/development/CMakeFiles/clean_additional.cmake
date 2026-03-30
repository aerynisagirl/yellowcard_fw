# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "C:\\Users\\Aeryn\\Documents\\RF Project\\local\\yellowcard fw\\base-station.X\\out\\base-station_yellowcard"
  )
endif()

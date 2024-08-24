### Device tree overlays for robotics project on Jetson Nano
- `tegra210-p3448-0000-p3449-0000-b00-vl53l1x-sensors.dtso`: the following i2c topology with 2 TCA9548A switches and 10 VL53L1X laser ToF sensors
  ```
  hdr40_i2c0 --> mux0 --> lasers (x5)
  hdr40_i2c1 --> mux1 --> lasers (x5)
  ```

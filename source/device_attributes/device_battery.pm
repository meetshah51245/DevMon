package device_battery;

use strict;
no warnings::unused;
no warnings 'once';
use Data::Dumper;
use dcl;

#-----------------------------------------------------------------------------
# Method: getDeviceBatteryLevel
#   A method to get a device's battery level.
#   Parameters (in order):
#       - Class Object
#       - Device
#   Return values (in order):
#       - Battery Level
#-----------------------------------------------------------------------------
sub getDeviceBatteryLevel {
  my ($self, $device) = @_;
  return setDeviceBatteryLevel($device);
}

#-----------------------------------------------------------------------------
# Method: setDeviceBatteryLevel
#   A method to set a device's battery level.
#   Parameters (in order):
#       - Device
#   Return values (in order):
#       - Battery Level
#-----------------------------------------------------------------------------
sub setDeviceBatteryLevel {
  my ($device) = @_;

  my $battery_level = dcl->fetchDeviceBatteryLevel($device);
  if (!$battery_level || not defined($battery_level)) {
    print "Device's battery level not found!\n";
    $battery_level = 0;
  }

  return $battery_level;
}

#-----------------------------------------------------------------------------
# Method: getDeviceBatteryTemp
#   A method to get a device's battery temperature.
#   Parameters (in order):
#       - Class Object
#       - Device
#   Return values (in order):
#       - Battery temperature
#-----------------------------------------------------------------------------
sub getDeviceBatteryTemp {
  my ($self, $device) = @_;
  return setDeviceBatteryTemp($device);
}

#-----------------------------------------------------------------------------
# Method: setDeviceBatteryTemp
#   A method to set a device's battery temperature.
#   Parameters (in order):
#       - Device
#   Return values (in order):
#       - Battery Temperature
#-----------------------------------------------------------------------------
sub setDeviceBatteryTemp {
  my ($device) = @_;

  my $battery_temp = dcl->fetchDeviceBatteryTemp($device);
  if (!$battery_temp || not defined ($battery_temp)) {
    print "Device's battery temperature not found!\n";
    $battery_temp = 0;
  }

  return $battery_temp;
}

#-----------------------------------------------------------------------------
# Method: getDeviceBatteryTempUnit
#   A method to get a device's battery temperature unit.
#   Parameters (in order):
#       - Class Object
#       - Device
#   Return values (in order):
#       - Temperature Unit
#-----------------------------------------------------------------------------
sub getDeviceBatteryTempUnit {
  my ($self, $device) = @_;
  return setDeviceBatteryTempUnit($device);
}

#-----------------------------------------------------------------------------
# Method: setDeviceBatteryTempUnit
#   A method to set a device temperature unit.
#   Parameters (in order):
#       - Device
#   Return values (in order):
#       - Temperature unit
#-----------------------------------------------------------------------------
sub setDeviceBatteryTempUnit {
  my ($device) = @_;

  my $battery_temp_unit = dcl->fetchDeviceBatteryTempUnit($device);
  if (!$battery_temp_unit || not defined($battery_temp_unit)) {
    print "Device's battery temperature unit not found!\n";
    $battery_temp_unit = 0;
  }

  return $battery_temp_unit;
}

#-----------------------------------------------------------------------------
# Method: getDeviceBatteryVoltage
#   A method to get a device's battery Voltage.
#   Parameters (in order):
#       - Class Object
#       - Device
#   Return values (in order):
#       - Battery Voltage
#-----------------------------------------------------------------------------
sub getDeviceBatteryVoltage {
  my ($self, $device) = @_;
  return setDeviceBatteryVoltage($device);
}

#-----------------------------------------------------------------------------
# Method: setDeviceBatteryVoltage
#   A method to set a device battery Voltage.
#   Parameters (in order):
#       - Device
#   Return values (in order):
#       - Battery Voltage
#-----------------------------------------------------------------------------
sub setDeviceBatteryVoltage {
  my ($device) = @_;

  my $battery_voltage = dcl->fetchDeviceBatteryVoltage($device);
  if (!$battery_voltage || not defined($battery_voltage)) {
    print "Device's battery temperature unit not found!\n";
    $battery_voltage = 0;
  }

  return $battery_voltage;
}

1;

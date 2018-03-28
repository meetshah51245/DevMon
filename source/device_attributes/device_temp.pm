package device_temp;

use strict;
no warnings::unused;
no warnings 'once';
use Data::Dumper;
use dcl;

#-----------------------------------------------------------------------------
# Method: getDeviceTemp
#   A method to get a device temperature.
#   Parameters (in order):
#       - Class Object
#       - Device
#   Return values (in order):
#       - Temperature
#-----------------------------------------------------------------------------
sub getDeviceTemp {
  my ($self, $device) = @_;
  return setDeviceTemp($device);
}

#-----------------------------------------------------------------------------
# Method: setDeviceTemp
#   A method to set a device temperature.
#   Parameters (in order):
#       - Device
#   Return values (in order):
#       - Temperature
#-----------------------------------------------------------------------------
sub setDeviceTemp {
  my ($device) = @_;

  my $temperature = dcl->fetchDeviceTemperature($device);
  if(!$temperature || not defined($temperature)) {
    print "Device Temperature not found!\n";
    $temperature = 0;
  }

  return $temperature;
}

#-----------------------------------------------------------------------------
# Method: getDeviceTempUnit
#   A method to get a device temperature unit.
#   Parameters (in order):
#       - Class Object
#       - Device
#   Return values (in order):
#       - Temperature Unit
#-----------------------------------------------------------------------------
sub getDeviceTempUnit {
  my ($self, $device) = @_;
  return setDeviceTempUnit($device);
}

#-----------------------------------------------------------------------------
# Method: setDeviceTempUnit
#   A method to set a device temperature unit.
#   Parameters (in order):
#       - Device
#   Return values (in order):
#       - Temperature Unit
#-----------------------------------------------------------------------------
sub setDeviceTempUnit {
  my ($device) = @_;

  my $temp_unit = dcl->fetchDeviceTemperatureUnit($device);
  if (!$temp_unit || not defined($temp_unit)) {
    print "Device Temperature unit not found!\n";
    $temp_unit = 0;
  }

  return $temp_unit;
}

1;

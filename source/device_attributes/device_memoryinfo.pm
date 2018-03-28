package device_memoryinfo;

use strict;
no warnings::unused;
no warnings 'once';
use Data::Dumper;

#-----------------------------------------------------------------------------
# Method: getDeviceTotalMemory
#   A method to get a device's memory.
#   Parameters (in order):
#       - Class Object
#       - Device
#   Return values (in order):
#       - Total Memory
#-----------------------------------------------------------------------------
sub getDeviceTotalMemory {
  my ($self, $device) = @_;
  return setDeviceTotalMemory($device);
}

#-----------------------------------------------------------------------------
# Method: setDeviceTotalMemory
#   A method to set a device's Memory Usage.
#   Parameters (in order):
#       - Device
#   Return values (in order):
#       - Total Memory
#-----------------------------------------------------------------------------
sub setDeviceTotalMemory {
  my ($device) = @_;

  my $memory_total = dcl->fetchDeviceTotalMemory($device);
  if (!$memory_total || not defined ($memory_total)) {
    print "Device's Total RAM not found!\n";
    $memory_total = 0;
  }

  return $memory_total;
}

#-----------------------------------------------------------------------------
# Method: getDeviceUsedMemory
#   A method to get a device's used memory.
#   Parameters (in order):
#       - Class Object
#       - Device
#   Return values (in order):
#       - Used Memory
#-----------------------------------------------------------------------------
sub getDeviceUsedMemory {
  my ($self, $device) = @_;
  return setDeviceUsedMemory($device);
}

#-----------------------------------------------------------------------------
# Method: setDeviceUsedMemory
#   A method to set a device's Used Memory.
#   Parameters (in order):
#       - Device
#   Return values (in order):
#       - Used Memory
#-----------------------------------------------------------------------------
sub setDeviceUsedMemory {
  my ($device) = @_;

  my $memory_total = dcl->fetchDeviceUsedMemory($device);
  if (!$memory_total || not defined ($memory_total)) {
    print "Device's Total RAM not found!\n";
    $memory_total = 0;
  }

  return $memory_total;
}

1;

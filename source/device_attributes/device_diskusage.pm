package device_diskusage;

use strict;
no warnings::unused;
no warnings 'once';
use Data::Dumper;

#-----------------------------------------------------------------------------
# Method: getDeviceDataDiskUsage
#   A method to get device's DATA disk usage.
#   Parameters (in order):
#       - Object Class
#       - Device
#   Return values (in order):
#       - Data Disk Usage
#-----------------------------------------------------------------------------
sub getDeviceDataDiskUsage {
  my ($self, $device) = @_;
  return setDeviceDataDiskUsage($device);
}

#-----------------------------------------------------------------------------
# Method: setDeviceDataDiskUsage
#   A method to set device's disk usage.
#   Parameters (in order):
#       - Device
#   Return values (in order):
#       - Data Disk Usage
#-----------------------------------------------------------------------------
sub setDeviceDataDiskUsage {
  my ($device) = @_;

  my $disk_usage = dcl->fetchDeviceDataDiskUsage($device);
  if (!$disk_usage || not defined ($disk_usage)) {
    print "Device's disk usage not found!\n";
    $disk_usage = 0;
  }

  return $disk_usage;
}

#-----------------------------------------------------------------------------
# Method: getDeviceSystemDiskUsage
#   A method to get device's system disk usage.
#   Parameters (in order):
#       - Object Class
#       - Device
#   Return values (in order):
#       - System Disk Usage
#-----------------------------------------------------------------------------
sub getDeviceSystemDiskUsage {
  my ($self, $device) = @_;
  return setDeviceSystemDiskUsage($device);
}

#-----------------------------------------------------------------------------
# Method: setDeviceSystemDiskUsage
#   A method to set device's disk usage.
#   Parameters (in order):
#       - Device
#   Return values (in order):
#       - System Disk Usage
#-----------------------------------------------------------------------------
sub setDeviceSystemDiskUsage {
  my ($device) = @_;

  my $disk_usage = dcl->fetchDeviceSystemDiskUsage($device);
  if (!$disk_usage || not defined ($disk_usage)) {
    print "Device's disk usage not found!\n";
    $disk_usage = 0;
  }

  return $disk_usage;
}

1;

package device_wifi;

use strict;
no warnings::unused;
no warnings 'once';
use Data::Dumper;

#-----------------------------------------------------------------------------
# Method: getDeviceWIFIStatus
#   A method to get a device's WIFI status.
#   Parameters (in order):
#       - Class Object
#       - Device
#   Return values (in order):
#       - Wifi Status
#-----------------------------------------------------------------------------
sub getDeviceWIFIStatus {
  my ($self, $device) = @_;
  return setDeviceWIFIStatus($device);
}

#-----------------------------------------------------------------------------
# Method: setDeviceWIFIStatus
#   A method to set a device's WIFI status.
#   Parameters (in order):
#       - Device
#   Return values (in order):
#       - Wifi Status
#-----------------------------------------------------------------------------
sub setDeviceWIFIStatus {
  my ($device) = @_;

  my $wifi_status = dcl->fetchDeviceWIFIStatus($device);
  if ($wifi_status <= -1 || not defined ($wifi_status)) {
    print "Device's wifi status not found!\n";
    $wifi_status = -1;
  }

  return $wifi_status;
}

1;

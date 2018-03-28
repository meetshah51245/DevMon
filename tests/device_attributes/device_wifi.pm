package device_wifi;

use strict;
no warnings::unused;
no warnings 'once';
use Data::Dumper;

sub getDeviceWIFIStatus {
  return setDeviceWIFIStatus();
}

sub setDeviceWIFIStatus {
  return int(rand(2));
}

1;

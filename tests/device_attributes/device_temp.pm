package device_temp;

use strict;
no warnings::unused;
no warnings 'once';
use Data::Dumper;

sub getDeviceTemp {
  return setDeviceTemp();
}

sub setDeviceTemp {
  my $min = 30;
  my $range = 70;
  return int(rand($range) + $min);
}

sub getDeviceTempUnit {
  return setDeviceTempUnit();
}

sub setDeviceTempUnit {
  return "C";
}

1;

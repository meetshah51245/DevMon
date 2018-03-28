package device_battery;

use strict;
no warnings::unused;
no warnings 'once';
use Data::Dumper;

sub getDeviceBatteryLevel {
  return setDeviceBatteryLevel();
}

sub setDeviceBatteryLevel {
  my $min = 50;
  my $range = 50;
  return int(rand($range) + $min);
}

sub getDeviceBatteryTemp {
  return setDeviceBatteryTemp();
}

sub setDeviceBatteryTemp {
  my $min = 150;
  my $range = 170;
  return int(rand($range) + $min);
}

sub getDeviceBatteryTempUnit {
  return setDeviceBatteryTempUnit();
}

sub setDeviceBatteryTempUnit {
  return "C";
}

1;

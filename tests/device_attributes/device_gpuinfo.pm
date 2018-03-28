package device_gpuinfo;

use strict;
no warnings::unused;
no warnings 'once';
use Data::Dumper;

sub getDeviceGPUFrequency {
  return setDeviceGPUFrequency();
}

sub setDeviceGPUFrequency {
  return 1.5;
}

sub getDeviceGPUFrequencyUnit {
  return setDeviceGPUFrequencyUnit();
}

sub setDeviceGPUFrequencyUnit {
  return "GHz";
}

sub getDeviceGPUUsage {
  return setDeviceGPUUsage();
}

sub setDeviceGPUUsage {
  my $min = 10;
  my $range = 90;
  return int(rand($range) + $min);
}

1;

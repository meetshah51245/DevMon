package device_cpuinfo;

use strict;
no warnings::unused;
no warnings 'once';
use Data::Dumper;

sub getDeviceCPUFrequency {
  return setDeviceCPUFrequency();
}

sub setDeviceCPUFrequency {
  return 2.5;
}

sub getDeviceCPUFrequencyUnit {
  return setDeviceCPUFrequencyUnit();
}

sub setDeviceCPUFrequencyUnit {
  return "GHz";
}

sub getDeviceCPUUsage {
  return setDeviceCPUUsage();
}

sub setDeviceCPUUsage {
  my $min = 10;
  my $range = 90;
  return int(rand($range) + $min);
}

sub getDeviceCPUActive {
  return setDeviceCPUActive();
}

sub setDeviceCPUActive {
  my $min = 1;
  my $range = 3;
  return int(rand($range) + $min);
}

1;

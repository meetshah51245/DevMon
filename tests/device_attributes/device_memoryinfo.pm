package device_memoryinfo;

use strict;
no warnings::unused;
no warnings 'once';
use Data::Dumper;

sub getDeviceMemoryUsage {
  return setDeviceMemoryUsage();
}

sub setDeviceMemoryUsage {
  my $min = 10;
  my $range = 90;
  return int(rand($range) + $min);
}

1;

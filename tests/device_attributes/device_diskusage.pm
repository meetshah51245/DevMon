package device_diskusage;

use strict;
no warnings::unused;
no warnings 'once';
use Data::Dumper;

sub getDeviceDiskUsage {
  return setDeviceDiskUsage();
}

sub setDeviceDiskUsage {
  my $min = 10;
  my $range = 90;
  return int(rand($range) + $min);
}

1;

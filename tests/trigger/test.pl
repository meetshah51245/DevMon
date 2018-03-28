#!/local/mnt/workspace/validat/perl/bin/vdev-perl -I../device_attributes -I../libs -I../db_layer

use strict;
use warnings;
no warnings::unused;
no warnings 'once';
use File::Basename;
use Data::Dumper;
use test;

my $FILE = basename(__FILE__);

#-----------------------------------------------------------------------------
# Method: testUsage
#   A utility to print test usage
#
#   Parameters (in order):
#       - Host: Host Name
#       - Device: Device ADB Name
#       - UPDATE_TIME: Update data every <UPDATE_TIME>.
#   Return values (in order):
#       - JSON
#-----------------------------------------------------------------------------
sub testUsage() {
  print "Usage : $FILE\n" .
  "  generate-data --host <HOST> --port <PORT> --device <DEVICE> --update <UPDATE_TIME>    # Generate data from fake device and put it into elastic search.\n" .
  " \n";
}

if ($#ARGV < 0) {
  testUsage();
  exit;
}

if (lc($ARGV[0]) eq "generate-data") {
  my $op = shift(@ARGV);
  my $host; my $device; my $update; my $port;

  while(1) {
    if (lc($ARGV[0]) eq "--host") {
      shift(@ARGV);
      $host = shift(@ARGV);
    } elsif (lc($ARGV[0]) eq "--port") {
      shift(@ARGV);
      $port = shift(@ARGV);
    } elsif (lc($ARGV[0]) eq "--device") {
      shift(@ARGV);
      $device = shift(@ARGV);
    } elsif (lc($ARGV[0]) eq "--update") {
      shift(@ARGV);
      $update = shift(@ARGV);
    } else {
      last;
    }
  }

  while(1) {
    my ($result, $device_data) = test->generateData($host, $port, $device);
    if (!$result) {
      print "{ 'status': $result, 'status_message': 'No data generated.'}\n";
      exit;
    } else {
      print "\n";
      print "$device_data";
      print "\n";
    }
    sleep($update);
  }
}

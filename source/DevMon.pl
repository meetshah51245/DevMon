#!/usr/bin/perl

use warnings;
no warnings::unused;
no warnings 'once';
no warnings 'uninitialized';
use File::Basename;
use Data::Dumper;
use DevMonEnv;
use DevMon;

my $FILE = basename(__FILE__);

#-----------------------------------------------------------------------------
# Method:DevMonUsage
#   A utility to print test usage
#
#   Parameters (in order):
#       - Host: Host Name
#       - Device: Device ADB Name
#       - UPDATE_TIME: Update data every <UPDATE_TIME>.
#   Return values (in order):
#       - JSON
#-----------------------------------------------------------------------------
sub DevMonUsage() {
  print "Usage : $FILE\n" .
  "  start --host <HOST> --port <PORT> --device <DEVICE> --update <UPDATE_TIME>\n" .
  "                      # Start DevMon\n" .
  " \n";
}

# If no input given.
if ($#ARGV < 0) {
  DevMonUsage();
  exit(1);
}

if (lc($ARGV[0]) eq "start") {
  my $op = shift(@ARGV);
  my $host; my $device; my $update; my $port;

  # Parse input
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

  # Input validation
  if (not defined($device)) {
    print "No device specified! Please connect a device and specify device name here.\n";
    exit;
  }

  if (not defined($host)) {
    print "Using DEFAULT host: localhost.\n";
    $host = "localhost";
  }

  if (not defined ($port)) {
    print "Using DEDAULT port: 9200.\n";
    $port = "9200";
  }

  if (not defined ($update)) {
    print "Using DEFAULT query time: 5s.\n";
    $update = 5;
  }

  # Start generating data
  print "*** Android device monitoring starting ... ***\n";
  my $result = DevMon->startDevMon($host, $port, $device, $update);
  if (!$result) {
    print "*** Android device monitoring failed to start! ***\n";
    exit(1);
  }
} else {
  DevMonUsage();
}

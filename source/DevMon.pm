package DevMon;

use strict;
no warnings::unused;
no warnings 'once';
use Data::Dumper;
use DevMonEnv;
use trigger;

#-----------------------------------------------------------------------------
# Method: startDevMon
#   A method for starting DevMon.
#
#   Parameters (in order):
#       - Host
#       - Port
#       - Device
#       - Update Time
#   Return values (in order):
#       - Pass/Fail
#-----------------------------------------------------------------------------
sub startDevMon {
  my ($self, $host, $port, $device, $update) = @_;
  my $entry=0;

  while(1) {
    ++$entry;
    my ($result, $device_data) = trigger->generateData($host, $port, $device);
    if (!$result) {
      return 0;
    } else {
      print "\n*** Entry $entry ***\n";
      print "$device_data";
      print "\n";
    }
    sleep($update);
  }

  return 1;
}

1;

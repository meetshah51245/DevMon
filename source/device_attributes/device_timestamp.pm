package device_timestamp;

use strict;
no warnings::unused;
no warnings 'once';
use DateTime;

#-----------------------------------------------------------------------------
# Method: getTimeStamp
#   A method for getting time stamp.
#
#   Return values (in order):
#       - Timestamp (Format: "YYYY-MM-DDTHH:MM:SS")
#-----------------------------------------------------------------------------
sub getTimeStamp {
  return setTimeStamp();
}

#-----------------------------------------------------------------------------
# Method: setTimeStamp
#   A method for getting time stamp.
#
#   Return values (in order):
#       - Timestamp (Format: "YYYY-MM-DDTHH:MM:SS")
#-----------------------------------------------------------------------------
sub setTimeStamp {
  my $date = DateTime->now(time_zone => 'local');
  return $date->ymd . "T" . $date->hms;
}

1;

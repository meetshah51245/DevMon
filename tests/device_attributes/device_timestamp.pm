package device_timestamp;

use strict;
no warnings::unused;
no warnings 'once';
use DateTime;

sub getTimeStamp {
  return setTimeStamp();
}

sub setTimeStamp {
  my $date = DateTime->now(time_zone => 'local');
  return $date->ymd . "T" . $date->hms;
}

1;

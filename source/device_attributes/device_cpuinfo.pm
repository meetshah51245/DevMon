package device_cpuinfo;

use strict;
no warnings::unused;
no warnings 'once';
use Data::Dumper;

#-----------------------------------------------------------------------------
# Method: getDeviceCPUFrequency
#   A method to get a device's CPU frequency
#   Parameters (in order):
#       - Class Object
#       - Device
#   Return values (in order):
#       - CPU Frequency
#-----------------------------------------------------------------------------
sub getDeviceCPUFrequency {
  my ($self, $device) = @_;
  return setDeviceCPUFrequency($device);
}

#-----------------------------------------------------------------------------
# Method: setDeviceCPUFrequency
#   A method to set a device's CPU frequency
#   Parameters (in order):
#       - Device
#   Return values (in order):
#       - CPU Frequency
#-----------------------------------------------------------------------------
sub setDeviceCPUFrequency {
  my ($device) = @_;

  my $cpu_freq = dcl->fetchDeviceCPUFrequency($device);
  if (!$cpu_freq || not defined($cpu_freq)) {
    print "Device's CPU frequency not found!\n";
    $cpu_freq = 0;
  }

  return $cpu_freq;
}

#-----------------------------------------------------------------------------
# Method: getDeviceMaxCPUFrequency
#   A method to get a device's Max CPU frequency
#   Parameters (in order):
#       - Class Object
#       - Device
#   Return values (in order):
#       - Max CPU Frequency
#-----------------------------------------------------------------------------
sub getDeviceMaxCPUFrequency {
  my ($self, $device) = @_;
  return setDeviceMaxCPUFrequency($device);
}

#-----------------------------------------------------------------------------
# Method: setDeviceMaxCPUFrequency
#   A method to set a device's CPU frequency
#   Parameters (in order):
#       - Device
#   Return values (in order):
#       - Max CPU Frequency
#-----------------------------------------------------------------------------
sub setDeviceMaxCPUFrequency {
  my ($device) = @_;

  my $cpu_freq = dcl->fetchDeviceMaxCPUFrequency($device);
  if (!$cpu_freq || not defined($cpu_freq)) {
    print "Device's CPU frequency not found!\n";
    $cpu_freq = 0;
  }

  return $cpu_freq;
}

#-----------------------------------------------------------------------------
# Method: getDeviceMinCPUFrequency
#   A method to get a device's Min CPU frequency
#   Parameters (in order):
#       - Class Object
#       - Device
#   Return values (in order):
#       - Min CPU Frequency
#-----------------------------------------------------------------------------
sub getDeviceMinCPUFrequency {
  my ($self, $device) = @_;
  return setDeviceMinCPUFrequency($device);
}

#-----------------------------------------------------------------------------
# Method: setDeviceMinCPUFrequency
#   A method to set a device's Min CPU frequency
#   Parameters (in order):
#       - Device
#   Return values (in order):
#       - Min CPU Frequency
#-----------------------------------------------------------------------------
sub setDeviceMinCPUFrequency {
  my ($device) = @_;

  my $cpu_freq = dcl->fetchDeviceMinCPUFrequency($device);
  if (!$cpu_freq || not defined($cpu_freq)) {
    print "Device's CPU frequency not found!\n";
    $cpu_freq = 0;
  }

  return $cpu_freq;
}

#-----------------------------------------------------------------------------
# Method: setDeviceCPUFrequencyUnit
#   A method to get a device's CPU frequency Unit
#   Parameters (in order):
#       - Class Object
#       - Device
#   Return values (in order):
#       - CPU Frequency Unit
#-----------------------------------------------------------------------------
sub getDeviceCPUFrequencyUnit {
  my ($self, $device) = @_;
  return setDeviceCPUFrequencyUnit($device);
}

#-----------------------------------------------------------------------------
# Method: setDeviceCPUFrequencyUnit
#   A method to set a device's CPU frequency Unit
#   Parameters (in order):
#       - Device
#   Return values (in order):
#       - CPU Frequency Unit
#-----------------------------------------------------------------------------
sub setDeviceCPUFrequencyUnit {
  my ($device) = @_;

  my $cpu_freq_unit = dcl->fetchDeviceCPUFrequencyUnit($device);
  if (!$cpu_freq_unit || not defined ($cpu_freq_unit)) {
    print "Device's CPU frequency not found!\n";
    $cpu_freq_unit = 0;
  }

  return $cpu_freq_unit;
}

#-----------------------------------------------------------------------------
# Method: getDeviceCPUUsage
#   A method to get a device's CPU Usage
#   Parameters (in order):
#       - Device
#   Return values (in order):
#       - CPU Usage
#-----------------------------------------------------------------------------
sub getDeviceCPUUsage {
  my ($self, $device) = @_;
  return setDeviceCPUUsage($device);
}

#-----------------------------------------------------------------------------
# Method: setDeviceCPUUsage
#   A method to get a device's CPU Usage
#   Parameters (in order):
#       - Device
#   Return values (in order):
#       - CPU Usage
#-----------------------------------------------------------------------------
sub setDeviceCPUUsage {
  my ($device) = @_;

  my $cpu_usage = dcl->fetchDeviceCPUUsage($device);
  if (!$cpu_usage || not defined($cpu_usage)) {
    print "Device's CPU usage not found!\n";
    $cpu_usage = 0;
  }

  return $cpu_usage;
}

#-----------------------------------------------------------------------------
# Method: getDeviceCPU
#   A method to get a device's CPU number.
#   Parameters (in order):
#       - Device
#   Return values (in order):
#       - CPU
#-----------------------------------------------------------------------------
sub getDeviceCPU {
  my ($self, $device) = @_;
  return setDeviceCPU($device);
}

#-----------------------------------------------------------------------------
# Method: setDeviceCPU
#   A method to set a device's CPU
#   Parameters (in order):
#       - Device
#   Return values (in order):
#       - CPU
#-----------------------------------------------------------------------------
sub setDeviceCPU {
  my ($device) = @_;

  my $cpu = dcl->fetchDeviceCPU($device);
  if (!$cpu || not defined($cpu)) {
    print "Device's CPU not found!\n";
    $cpu = 0;
  }

  return $cpu;
}

#-----------------------------------------------------------------------------
# Method: getDeviceCPUActive
#   A method to get a device's CPU Active
#   Parameters (in order):
#       - Device
#   Return values (in order):
#       - CPU Active
#-----------------------------------------------------------------------------
sub getDeviceCPUActive {
  my ($self, $device) = @_;
  return setDeviceCPUActive($device);
}

#-----------------------------------------------------------------------------
# Method: setDeviceCPUActive
#   A method to set a device's CPU Active
#   Parameters (in order):
#       - Device
#   Return values (in order):
#       - CPU Active
#-----------------------------------------------------------------------------
sub setDeviceCPUActive {
  my ($device) = @_;

  my $cpu_active = dcl->fetchDeviceCPUActive($device);
  if ($cpu_active <= -1 || not defined($cpu_active)) {
    print "Device's Active CPU not found!\n";
    $cpu_active = -1;
  }

  return $cpu_active;
}

#-----------------------------------------------------------------------------
# Method: getDeviceCPUIdle
#   A method to get a device's CPU Idle
#   Parameters (in order):
#       - Device
#   Return values (in order):
#       - CPU Idle
#-----------------------------------------------------------------------------
sub getDeviceCPUIdle {
  my ($self, $device) = @_;
  return setDeviceCPUIdle($device);
}

#-----------------------------------------------------------------------------
# Method: setDeviceCPUIdle
#   A method to set a device's CPU Idle
#   Parameters (in order):
#       - Device
#   Return values (in order):
#       - CPU Idle
#-----------------------------------------------------------------------------
sub setDeviceCPUIdle {
  my ($device) = @_;

  my $cpu_idle = dcl->fetchDeviceCPUIdle($device);
  if ($cpu_idle <= -1 || not defined($cpu_idle)) {
    print "Device's Idle CPU not found!\n";
    $cpu_idle = -1;
  }

  return $cpu_idle;
}

1;

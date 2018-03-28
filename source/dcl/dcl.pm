package dcl;

use strict;
no warnings::unused;
no warnings 'once';
use Data::Dumper;

#-----------------------------------------------------------------------------
# Method: executeADBCmd
#   A method to Execute ADB Commands
#   Parameters (in order):
#       - Device
#       - Command
#   Return values (in order):
#       - Status
#       - Result
#-----------------------------------------------------------------------------
sub executeADBCmd {
  my ($device, $cmd) = @_;

  my $device_cmd = "$main::ADB_EXE -s $device $cmd";
#  print "EXECUTE COMMAND: '$device_cmd'\n";
  my $result     = `$device_cmd 2>&1`;
  my $ret        = $? >> 8;
  $result =~ s/\r//g;
  $result =~ s/\n//g;
#  print "RESULT: '$result', STATUS: '$ret'\n";

  return (0, $result) if($ret || $result =~ "No such file or directory" || $result =~ "error: device not found" || $result =~ /error/i);
  return (1, $result);
}

#-----------------------------------------------------------------------------
# Method: fetchDeviceTemperature
#   A method to fetch a temperature from device.
#   Parameters (in order):
#       - Class Object
#       - Device
#   Return values (in order):
#       - Temperature
#-----------------------------------------------------------------------------
sub fetchDeviceTemperature {
  my ($self, $device) = @_;
  my $cmd;

  # Root
  $cmd = "root";
  executeADBCmd($device, $cmd);
  # Get temperature
  $cmd = "shell cat /sys/devices/virtual/thermal/thermal_zone0/temp";
  my ($status, $status_str) = executeADBCmd($device, $cmd);
  return 0 if(!$status);
  my $temperature = int($status_str);

  return $temperature; 
}

#-----------------------------------------------------------------------------
# Method: fetchDeviceTemperatureUnit
#   A method to fetch a temperature unit from device.
#   Parameters (in order):
#       - Class Object
#       - Device
#   Return values (in order):
#       - Temperature Unit
#-----------------------------------------------------------------------------
sub fetchDeviceTemperatureUnit {
  my ($self, $device) = @_;

  # No query needed for this.
  return "C";
}

#-----------------------------------------------------------------------------
# Method: fetchDeviceBatteryLevel
#   A method to fetch a battery level from device.
#   Parameters (in order):
#       - Class Object
#       - Device
#   Return values (in order):
#       - Battery Level
#-----------------------------------------------------------------------------
sub fetchDeviceBatteryLevel {
  my ($self, $device) = @_;
  my $cmd;

  # Root
  $cmd = "root";
  executeADBCmd($device, $cmd);
  # Get Battery Level
  $cmd = "shell dumpsys battery | grep level | cut -d':' -f2 | sed -s 's/ //g'";
  my ($status, $status_str) = executeADBCmd($device, $cmd);
  return 0 if(!$status);
  $status_str += 1 if($status_str == 0);
  my $battery_level = int($status_str);

  return $battery_level;
}

#-----------------------------------------------------------------------------
# Method: fetchDeviceBatteryTemp
#   A method to fetch a battery temperature from device.
#   Parameters (in order):
#       - Class Object
#       - Device
#   Return values (in order):
#       - Battery Temperature
#-----------------------------------------------------------------------------
sub fetchDeviceBatteryTemp {
  my ($self, $device) = @_;
  my $cmd;

  # Root
  $cmd = "root";
  executeADBCmd($device, $cmd);
  # Get Battery temperature
  $cmd = "shell dumpsys battery | grep temperature | cut -d':' -f2 | sed -s 's/ //g'";
  my ($status, $status_str) = executeADBCmd($device, $cmd);
  return 0 if(!$status);
  $status_str += 1 if($status_str == 0);
  my $battery_temp = int($status_str);

  return $battery_temp;
}

#-----------------------------------------------------------------------------
# Method: fetchDeviceBatteryVoltage
#   A method to fetch a battery voltage from device.
#   Parameters (in order):
#       - Class Object
#       - Device
#   Return values (in order):
#       - Battery Voltage
#-----------------------------------------------------------------------------
sub fetchDeviceBatteryVoltage {
  my ($self, $device) = @_;
  my $cmd;

  # Root
  $cmd = "root";
  executeADBCmd($device, $cmd);
  # Get Battery voltage
  $cmd = "shell dumpsys battery | grep voltage | cut -d':' -f2 | sed -s 's/ //g'";
  my ($status, $status_str) = executeADBCmd($device, $cmd);
  return 0 if(!$status);
  $status_str += 1 if($status_str == 0);
  my $battery_voltage = int($status_str);

  return $battery_voltage;
}

#-----------------------------------------------------------------------------
# Method: fetchDeviceTemperatureUnit
#   A method to fetch a battery's temperature unit from device.
#   Parameters (in order):
#       - Class Object
#       - Device
#   Return values (in order):
#       - Battery Temperature Unit
#-----------------------------------------------------------------------------
sub fetchDeviceBatteryTempUnit {
  my ($self, $device) = @_;

  # No query needed for this.
  return "C";
}

#-----------------------------------------------------------------------------
# Method: fetchDeviceCPUFrequency
#   A method to fetch a CPU Frequency from Device
#   Parameters (in order):
#       - Class Object
#       - Device
#   Return values (in order):
#       - CPU Frequency
#-----------------------------------------------------------------------------
sub fetchDeviceCPUFrequency {
  my ($self, $device) = @_;
  my $cmd;

  # Root
  $cmd = "root";
  executeADBCmd($device, $cmd);
  # Current CPU Frequency
  $cmd = "shell cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq";
  my ($status, $status_str) = executeADBCmd($device, $cmd);
  return 0 if(!$status);
  $status_str += 1 if($status_str == 0);
  my $cpu_freq = int($status_str);

  return $cpu_freq;
}

#-----------------------------------------------------------------------------
# Method: fetchDeviceMaxCPUFrequency
#   A method to fetch a Max CPU Frequency from Device
#   Parameters (in order):
#       - Class Object
#       - Device
#   Return values (in order):
#       - Max CPU Frequency
#-----------------------------------------------------------------------------
sub fetchDeviceMaxCPUFrequency {
  my ($self, $device) = @_;
  my $cmd;

  # Root
  $cmd = "root";
  executeADBCmd($device, $cmd);
  # Max CPU Frequency
  $cmd = "shell cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq";
  my ($status, $status_str) = executeADBCmd($device, $cmd);
  return 0 if(!$status);
  $status_str += 1 if($status_str == 0);
  my $cpu_freq = int($status_str);

  return $cpu_freq;
}

#-----------------------------------------------------------------------------
# Method: fetchDeviceMinCPUFrequency
#   A method to fetch a Min CPU Frequency from Device
#   Parameters (in order):
#       - Class Object
#       - Device
#   Return values (in order):
#       - Min CPU Frequency
#-----------------------------------------------------------------------------
sub fetchDeviceMinCPUFrequency {
  my ($self, $device) = @_;
  my $cmd;

  # Root
  $cmd = "root";
  executeADBCmd($device, $cmd);
  # Min CPU Frequency
  $cmd = "shell cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq";
  my ($status, $status_str) = executeADBCmd($device, $cmd);
  return 0 if(!$status);
  $status_str += 1 if($status_str == 0);
  my $cpu_freq = int($status_str);

  return $cpu_freq;
}

#-----------------------------------------------------------------------------
# Method: fetchDeviceCPUFrequencyUnit
#   A method to fetch a CPU Freq unit from device.
#   Parameters (in order):
#       - Class Object
#       - Device
#   Return values (in order):
#       - CPU Frequency Unit
#-----------------------------------------------------------------------------
sub fetchDeviceCPUFrequencyUnit {
  my ($self, $device) = @_;

  # No query needed for this.
  return "Hz";
}

#-----------------------------------------------------------------------------
# Method: fetchDeviceCPU
#   A method to fetch a CPU from Device.
#   Parameters (in order):
#       - Class Object
#       - Device
#   Return values (in order):
#       - CPU
#-----------------------------------------------------------------------------
sub fetchDeviceCPU {
  my ($self, $device) = @_;
  my $cmd;

  # Root
  $cmd = "root";
  executeADBCmd($device, $cmd);
  # CPU
  $cmd = "shell cat /sys/devices/system/cpu/present";
  my ($status, $status_str) = executeADBCmd($device, $cmd);
  return 0 if(!$status);
  my ($lower, $upper) = split('-',$status_str);
  my $cpu = int(($upper - $lower) + 1);

  return $cpu;
}

#-----------------------------------------------------------------------------
# Method: fetchDeviceCPUActive
#   A method to fetch a Active CPU from Device.
#   Parameters (in order):
#       - Class Object
#       - Device
#   Return values (in order):
#       - CPU Active
#-----------------------------------------------------------------------------
sub fetchDeviceCPUActive {
  my ($self, $device) = @_;
  my $cmd;

  # Root
  $cmd = "root";
  executeADBCmd($device, $cmd);
  # CPU Active
  $cmd = "shell cat /sys/devices/system/cpu/online";
  my ($status, $status_str) = executeADBCmd($device, $cmd);
  return -1 if(!$status);
  my ($lower, $upper) = split('-',$status_str);
  my $cpu_active = int(($upper - $lower) + 1);

  return $cpu_active;

}

#-----------------------------------------------------------------------------
# Method: fetchDeviceCPUIdle
#   A method to fetch a Active CPU from Device.
#   Parameters (in order):
#       - Class Object
#       - Device
#   Return values (in order):
#       - CPU Active
#-----------------------------------------------------------------------------
sub fetchDeviceCPUIdle {
  my ($self, $device) = @_;
  my $cmd;

  # Root
  $cmd = "root";
  executeADBCmd($device, $cmd);
  # CPU IDLE
  $cmd = "shell cat /sys/devices/system/cpu/offline";
  my ($status, $status_str) = executeADBCmd($device, $cmd);
  return -1 if(!$status);
  my ($lower, $upper) = split('-',$status_str);
  my $cpu_idle = int(($upper - $lower) + 1);

  return $cpu_idle;
}

#-----------------------------------------------------------------------------
# Method: fetchDeviceCPUUsage
#   A method to fetch a battery temperature from device.
#   Parameters (in order):
#       - Class Object
#       - Device
#   Return values (in order):
#       - CPU Usage
#-----------------------------------------------------------------------------
sub fetchDeviceCPUUsage {
  my ($self, $device) = @_;
  my $cmd;

  # Root
  $cmd = "root";
  executeADBCmd($device, $cmd);
  # Get CPU Usage
  $cmd = "shell dumpsys cpuinfo | grep TOTAL: | cut -d':' -f1 | cut -d'%' -f1";
  my ($status, $status_str) = executeADBCmd($device, $cmd);
  return 0 if(!$status);
  $status_str += 1 if($status_str == 0);
  my $cpu_usage = $status_str + 0.00;

  return $cpu_usage;
}

#-----------------------------------------------------------------------------
# Method: fetchDeviceDataDiskUsage
#   A method to fetch data disk usage from device.
#   Parameters (in order):
#       - Class Object
#       - Device
#   Return values (in order):
#       - Data Disk Usage
#-----------------------------------------------------------------------------
sub fetchDeviceDataDiskUsage {
  my ($self, $device) = @_;
  my $cmd;

  # Root
  $cmd = "root";
  executeADBCmd($device, $cmd);
  # Get Disk Usage
  $cmd = "shell dumpsys diskstats | grep Data-Free | cut -d'=' -f2 | cut -d '%' -f1 | sed -e 's/ //g'";
  my ($status, $status_str) = executeADBCmd($device, $cmd);
  return 0 if(!$status);
  $status_str += 1 if($status_str == 0);
  my $data_du = int($status_str);

  return $data_du;
}

#-----------------------------------------------------------------------------
# Method: fetchDeviceSystemDiskUsage
#   A method to fetch system disk usage from device.
#   Parameters (in order):
#       - Class Object
#       - Device
#   Return values (in order):
#       - System Disk Usage
#-----------------------------------------------------------------------------
sub fetchDeviceSystemDiskUsage {
  my ($self, $device) = @_;
  my $cmd;

  # Root
  $cmd = "root";
  executeADBCmd($device, $cmd);
  # Get CPU Usage
  $cmd = "shell dumpsys diskstats | grep System-Free | cut -d'=' -f2 | cut -d '%' -f1 | sed -e 's/ //g'";
  my ($status, $status_str) = executeADBCmd($device, $cmd);
  return 0 if(!$status);
  $status_str += 1 if($status_str == 0);
  my $system_du = int($status_str);

  return $system_du;
}

#-----------------------------------------------------------------------------
# Method: fetchDeviceTotalMemory
#   A method to fetch total memory from device.
#   Parameters (in order):
#       - Class Object
#       - Device
#   Return values (in order):
#       - Total Memory
#-----------------------------------------------------------------------------
sub fetchDeviceTotalMemory {
  my ($self, $device) = @_;
  my $cmd;

  # Root
  $cmd = "root";
  executeADBCmd($device, $cmd);
  # RAM Usage
  $cmd = "shell dumpsys meminfo | grep RAM: | grep Total | cut -d':' -f2 | cut -d' ' -f2 | sed -e 's/ //g'";
  my ($status, $status_str) = executeADBCmd($device, $cmd);
  return 0 if(!$status);
  my $total_ram = int($status_str);

  return $total_ram;
}

#-----------------------------------------------------------------------------
# Method: fetchDeviceUsedMemory
#   A method to fetch Used memory.
#   Parameters (in order):
#       - Class Object
#       - Device
#   Return values (in order):
#       - Used Memory
#-----------------------------------------------------------------------------
sub fetchDeviceUsedMemory {
  my ($self, $device) = @_;
  my $cmd;

  # Root
  $cmd = "root";
  executeADBCmd($device, $cmd);
  # RAM Usage
  $cmd = "shell dumpsys meminfo | grep RAM: | grep Used | cut -d':' -f2 | cut -d' ' -f2 | sed -e 's/ //g'";
  my ($status, $status_str) = executeADBCmd($device, $cmd);
  return 0 if(!$status);
  my $used_ram = int($status_str);

  return $used_ram;
}

#-----------------------------------------------------------------------------
# Method: fetchDeviceWIFIStatus
#   A method to fetch WIFI status.
#   Parameters (in order):
#       - Class Object
#       - Device
#   Return values (in order):
#       - WIFI Status
#-----------------------------------------------------------------------------
sub fetchDeviceWIFIStatus {
  my ($self, $device) = @_;
  my $cmd;

  # Root
  $cmd = "root";
  executeADBCmd($device, $cmd);
  # WIFI Status
  $cmd = "shell dumpsys wifi | grep Wi-Fi | grep 'enabled' | wc -l";
  my ($status, $status_str) = executeADBCmd($device, $cmd);
  return 0 if(!$status);
  my $wifi_status = int($status_str);

  return $wifi_status;
}

1;

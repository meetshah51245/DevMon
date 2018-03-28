package trigger;

use strict;
no warnings::unused;
no warnings 'once';
use JSON::XS;
use Data::Validate::Struct;
use Data::Dumper;
use json_perl;
use device_battery;
use device_cpuinfo;
use device_diskusage;
use device_memoryinfo;
use device_temp;
use device_timestamp;
use device_wifi;
use db_interface;

#-----------------------------------------------------------------------------
# Method: generateData
#   A method for generating data from a device and store into elastic search.
#
#   Parameters (in order):
#       - Host
#       - Port
#       - Device
#   Return values (in order):
#       - JSON
#-----------------------------------------------------------------------------
sub generateData {
  my ($self, $host, $port, $device) = @_;
  my %device_data; my $device_json;

  # Host Name
  $device_data{'host'} = $host;
  # Device Name
  $device_data{'device'} = $device;
  # Port
  $device_data{'port'} = $port;
  # Indexing
  $device_data{'indexing'} = "$host:$port/$device/$host";
  # Time Stamp
  $device_data{'@timestamp'} = device_timestamp->getTimeStamp();
  # Device Temperature
  $device_data{'temperature'} = device_temp->getDeviceTemp($device);
  return 0 if(!$device_data{'temperature'});
  $device_data{'temperature_unit'} = device_temp->getDeviceTempUnit($device);
  return 0 if(!$device_data{'temperature_unit'});
  # Device Battery
  $device_data{'battery_level'} = device_battery->getDeviceBatteryLevel($device);
  return 0 if(!$device_data{'battery_level'});
  $device_data{'battery_temp'} = device_battery->getDeviceBatteryTemp($device);
  return 0 if(!$device_data{'battery_temp'});
  $device_data{'battery_voltage'} = device_battery->getDeviceBatteryVoltage($device);
  return 0 if(!$device_data{'battery_voltage'});
  $device_data{'battery_temp_unit'} = device_battery->getDeviceBatteryTempUnit($device);
  return 0 if(!$device_data{'battery_temp_unit'});
  # Device CPU
  $device_data{'cpu_frequency'} = device_cpuinfo->getDeviceCPUFrequency($device);
  return 0 if(!$device_data{'cpu_frequency'});
  $device_data{'cpu_frequency_unit'} = device_cpuinfo->getDeviceCPUFrequencyUnit($device);
  return 0 if(!$device_data{'cpu_frequency_unit'});
  $device_data{'cpu_max_frequency'} = device_cpuinfo->getDeviceMaxCPUFrequency($device);
  return 0 if(!$device_data{'cpu_max_frequency'});
  $device_data{'cpu_min_frequency'} = device_cpuinfo->getDeviceMinCPUFrequency($device);
  return 0 if(!$device_data{'cpu_min_frequency'});
  $device_data{'cpu'} = device_cpuinfo->getDeviceCPU($device);
  return 0 if(!$device_data{'cpu'});
  $device_data{'cpu_active'} = device_cpuinfo->getDeviceCPUActive($device);
  return 0 if($device_data{'cpu_active'} <= -1);
  $device_data{'cpu_idle'} = device_cpuinfo->getDeviceCPUIdle($device);
  return 0 if($device_data{'cpu_idle'} <= -1);
  $device_data{'cpu_usage'} = device_cpuinfo->getDeviceCPUUsage($device);
  return 0 if(!$device_data{'cpu_usage'});
  # Device Disk Usage
  $device_data{'data_disk_space'} = device_diskusage->getDeviceDataDiskUsage($device);
  return 0 if(!$device_data{'data_disk_space'});
  $device_data{'sys_disk_space'} = device_diskusage->getDeviceSystemDiskUsage($device);
  return 0 if(!$device_data{'sys_disk_space'});
  # Device Memory
  $device_data{'memory_total'} = device_memoryinfo->getDeviceTotalMemory($device);
  return 0 if(!$device_data{'memory_total'});
  $device_data{'memory_used'} = device_memoryinfo->getDeviceUsedMemory($device);
  return 0 if(!$device_data{'memory_used'});
  $device_data{'memory_usage'} = ($device_data{'memory_used'}/$device_data{'memory_total'}) * 100;
  # Device WIFI status
  $device_data{'wifi_status'} = device_wifi->getDeviceWIFIStatus($device);
  # Convert into JSON
  $device_json = json_perl->perl2json(\%device_data);

  # Insert this JSON into elastic search
  return 0 if(!db_interface->insertToDB($device_json));

  return (1, $device_json);
}

1;

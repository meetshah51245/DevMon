package test;

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
use device_gpuinfo;
use device_memoryinfo;
use device_temp;
use device_timestamp;
use device_wifi;
use db_interface;

#-----------------------------------------------------------------------------
# Method: generateData
#   A method for generating data from fake device and store into elastic search.
#
#   Parameters (in order):
#       - Host
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
  $device_data{'temperature'} = device_temp->getDeviceTemp();
  $device_data{'temperature_unit'} = device_temp->getDeviceTempUnit();
  # Device Battery
  $device_data{'battery_level'} = device_battery->getDeviceBatteryLevel();
  $device_data{'battery_temp'} = device_battery->getDeviceBatteryTemp();
  $device_data{'battery_temp_unit'} = device_battery->getDeviceBatteryTempUnit();
  # Device CPU
  $device_data{'cpu_frequency'} = device_cpuinfo->getDeviceCPUFrequency();
  $device_data{'cpu_frequency_unit'} = device_cpuinfo->getDeviceCPUFrequencyUnit();
  $device_data{'cpu_usage'} = device_cpuinfo->getDeviceCPUUsage();
  $device_data{'cpu_active'} = device_cpuinfo->getDeviceCPUActive();
  # Device Disk Usage
  $device_data{'disk_usage'} = device_diskusage->getDeviceDiskUsage();
  # Device GPU
  $device_data{'gpu_frequency'} = device_gpuinfo->getDeviceGPUFrequency();
  $device_data{'gpu_frequency_unit'} = device_gpuinfo->getDeviceGPUFrequencyUnit();
  $device_data{'gpu_usage'} = device_gpuinfo->getDeviceGPUUsage();
  # Device Memory
  $device_data{'memory_usage'} = device_memoryinfo->getDeviceMemoryUsage();
  # Device WIFI status
  $device_data{'wifi_status'} = device_wifi->getDeviceWIFIStatus();

  # Convert into JSON
  $device_json = json_perl->perl2json(\%device_data);

  # Insert this JSON into elastic search
  return 0 if(!db_interface->insertToDB($device_json));

  return (1, $device_json);
}

1;

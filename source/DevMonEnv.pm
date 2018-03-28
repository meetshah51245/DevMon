use DevMonEnv;

# Setting up entire environment in this block
BEGIN {
  our $projectRoot           = "/local/mnt/workspace/vishruts/DevMon";
  $main::devMonRoot          = "$projectRoot";
  $main::devMonSource        = "$devMonRoot/source";
  $main::devMonTools         = "$devMonRoot/tools";
  $main::devMonBin           = "$devMonRoot/bin";
  $main::devMonDB            = "$devMonSource/db";
  $main::devMonDBInterface   = "$devMonSource/db_interface";
  $main::devMonDCL           = "$devMonSource/dcl";
  $main::devMonDeviceAttr    = "$devMonSource/device_attributes";
  $main::devMonLibs          = "$devMonSource/libs";
  $main::devMonTrigger       = "$devMonSource/trigger";
  $main::devMonES            = "$devMonTools/elasticsearch-1.1.1";
  $main::devMonKibana        = "$devMonTools/kibana";
  $main::ADB_EXE             = "$devMonBin/adb";
}

push @INC, $main::devMonRoot;
push @INC, $main::devMonSource;
push @INC, $main::devMonTools;
push @INC, $main::devMonBin;
push @INC, $main::devMonDB;
push @INC, $main::devMonDBInterface;
push @INC, $main::devMonDCL;
push @INC, $main::devMonDeviceAttr;
push @INC, $main::devMonLibs;
push @INC, $main::devMonTrigger;
push @INC, $main::devMonES;
push @INC, $main::devMonKibana;
push @INC, $main::ADB_EXE;

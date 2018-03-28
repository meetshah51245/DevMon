#### DevMon (Android Device Monitoring)
* Tool
  ** 

* Setup
  ** DevMon
     -> Unzip DevMon.tar.gz to <ROOT>.

  ** Kibana
     -> Kibana is found under <ROOT>/DevMon/tools/kibana.
     -> Copy kibana to web space /var/www: sudo cp -R  <ROOT>/DevMon/tools/kibana /var/www
     -> Open kibana in web browser: http://<HOST-NAME>/kibana/index.html#
     -> Load DevMon Dashboard in web browser: <ROOT>/kibana-dashboard/

  ** Elastic Search
     -> Elastic search is found under <ROOT>/DevMon/tools/elasticsearch-1.1.1
     -> Set cluster to DevMon and choose node name from DevMon/docs/naming_convention.txt if it is not already set in file <ROOT>/DevMon/tools/elasticsearch-1.1.1/config/elasticsearch.yml
     -> Run elastic search: <ROOT>/DevMon/tools/elasticsearch-1.1.1/bin/elasticsearch.

  ** Android Device
     -> Connect Android with USB and turn on USB debugging in device.
     -> Setup Android udev rules and re-load them.
     -> Make sure that device is appearing in ADB before running this tool.

* Run
  ** Run production [Requires Android device to setup properly on machine]
     -> Source code is located at <ROOT>/DevMon/source.
     -> Run production: trigger.pl <DEVICE_NAME> <UPDATE_TIME>
     -> Trigger (trigger.pl) will collect JSON from device every <UPDATE_TIME> secs and post it to database (elastic search). Kibana later will read database (elastic search) and put it onto dashboard.

* Test
  ** Run testing [Doesn't require Android device. It will create fake device]
     -> Testing does not require device as it creates a fake device.
     -> Run test.pl <DEVICE_NAME> <UPDATE_TIME>
     -> Test (test.pl) will create JSON every <UPDATE_TIME> secs and post it to database (elastic search). Kibana later will read database (elastic search) and put it onto dashboard.

* Dashboard
  ** Refresh your dashboard and start analysing the data coming from a device.

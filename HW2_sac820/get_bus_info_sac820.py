from __future__ import print_function
import sys
import requests

apikey = os.getenv("MTAAPIKEY")
busline = "MTA NYCT_B52"

#apikey = sys.argv[0]
#busline = "MTA NYCT_" + sys.argv[1]

parameters = {"key": apikey, "LineRef": busline}
response = requests.get("http://bustime.mta.info/api/siri/vehicle-monitoring.json", params=parameters)

data = response.json()
number_active_buses = len(data['Siri']['ServiceDelivery']['VehicleMonitoringDelivery'][0]['VehicleActivity'])


print("Bus Line : " + sys.argv[1])
print("Number of Active Buses : " + str(number_active_buses))


for i in range(0, number_active_buses):
    latitude = data['Siri']['ServiceDelivery']['VehicleMonitoringDelivery'][0]['VehicleActivity'][i]['MonitoredVehicleJourney']['Onward']['Latitude']
    longitude = data['Siri']['ServiceDelivery']['VehicleMonitoringDelivery'][0]['VehicleActivity'][i]['MonitoredVehicleJourney']['VehicleLocation']['Longitude']
    print("Bus " + str(i) + " is at latitude " + str(latitude) + " and longitude " + str(longitude))


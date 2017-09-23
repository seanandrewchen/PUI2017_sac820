from __future__ import print_function
import sys
import requests

#apikey = os.getenv("MTAAPIKEY")
#busline = "MTA NYCT_B52"

#Take in command line arguments
apikey = sys.argv[0]
busline = "MTA NYCT_" + sys.argv[1]

#Get request to MTA API with parameters
parameters = {"key": apikey, "LineRef": busline}
response = requests.get("http://bustime.mta.info/api/siri/vehicle-monitoring.json", params=parameters)

#Convert API response content into JSON and into dictionary
data = response.json()

#For some reason inside the dictionary there is a list. That list is the list of vehicles. So the length of that
#is the number of active vehicles
number_active_buses = len(data['Siri']['ServiceDelivery']['VehicleMonitoringDelivery'][0]['VehicleActivity'])

#Print bus location information
print("Bus Line : " + sys.argv[1])
print("Number of Active Buses : " + str(number_active_buses))
for i in range(0, number_active_buses):
    latitude = data['Siri']['ServiceDelivery']['VehicleMonitoringDelivery'][0]['VehicleActivity'][i]['MonitoredVehicleJourney']['VehicleLocation']['Latitude']
    longitude = data['Siri']['ServiceDelivery']['VehicleMonitoringDelivery'][0]['VehicleActivity'][i]['MonitoredVehicleJourney']['VehicleLocation']['Longitude']
    print("Bus " + str(i) + " is at latitude " + str(latitude) + " and longitude " + str(longitude))


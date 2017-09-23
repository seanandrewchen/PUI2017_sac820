from __future__ import print_function
import sys
import requests
import os
import csv

apikey = "c6d720f6-920e-4e54-8a47-6c82cce327d3"
busline = "MTA NYCT_B52"
cv_name = "B52.csv"

#Take in command line arguments
#apikey = str(sys.argv[1])
#busline = "MTA NYCT_" + str(sys.argv[2])
#cv_name = str(sys.argv[3])

#Get request to MTA API with parameters
parameters = {"key":apikey, "LineRef":busline, "VehicleMonitoringDetailLevel":"calls", "MaximumNumberOfCallsOnwards":"1"}
response = requests.get("http://bustime.mta.info/api/siri/vehicle-monitoring.json", params=parameters)

#Convert API response content into JSON and into dictionary
data = response.json()

#For some reason inside the dictionary there is a list. That list is the list of vehicles. So the length of that
#is the number of active vehicles
number_active_buses = len(data['Siri']['ServiceDelivery']['VehicleMonitoringDelivery'][0]['VehicleActivity'])

print(number_active_buses)

with open(cv_name, 'wb') as csvfile:
    filewriter = csv.writer(csvfile, delimiter=',',
                            quotechar='|', quoting=csv.QUOTE_MINIMAL)
    filewriter.writerow(['Latitude', 'Longitude', 'Stop Name', 'Stop Status'])
    for i in range(0, number_active_buses):
        latitude = data['Siri']['ServiceDelivery']['VehicleMonitoringDelivery'][0]['VehicleActivity'][i]['MonitoredVehicleJourney']['VehicleLocation']['Latitude']
        longitude = data['Siri']['ServiceDelivery']['VehicleMonitoringDelivery'][0]['VehicleActivity'][i]['MonitoredVehicleJourney']['VehicleLocation']['Longitude']
        stop_name = data['Siri']['ServiceDelivery']['VehicleMonitoringDelivery'][0]['VehicleActivity'][i]['MonitoredVehicleJourney']['OnwardCalls']['OnwardCall'][0]['StopPointName']
        stops_from_call = data['Siri']['ServiceDelivery']['VehicleMonitoringDelivery'][0]['VehicleActivity'][i]['MonitoredVehicleJourney']['OnwardCalls']['OnwardCall'][0]['Extensions']['Distances']['PresentableDistance']

        filewriter.writerow([latitude, longitude, stop_name, stops_from_call])

        print(latitude)
        print(longitude)
        print(stop_name)
        print(stops_from_call)

import dht
import machine
import time
import network
import urequests
import ujson

def connect(ssid, password):
    station = network.WLAN(network.STA_IF)
    station.active(True)
    station.connect(ssid, password)
    return station

print("Connecting...")
station = connect("Network Name", "Password")
if not station.isconnected():
    print("Not connected!")
else:
    print("Connected!")


r = machine.Pin(2, machine.Pin.OUT)
d = dht.DHT11(machine.Pin(4))

x = 0

while x < 10:
    d.measure()
    temperature = ("{}".format(d.temperature()))
    humidity = ("{}".format(d.humidity()))

    if int(temperature) > 31 or int(humidity) > 70:
        r.value(1)
    else:
        r.value(0)
            
    data = {'field1': temperature, 'field2': humidity}
    request = urequests.post('https://api.thingspeak.com/update?api_key=J4NKP906UTS1Z58Q',
        json = data,
        headers = {'content-type': 'application/json'})
    
    request.close()   
    
    time.sleep(15)
    x += 1 


def connect(ssid, password):
    import network
    import time
    station = network.WLAN(network.STA_IF)
    station.active(True)
    station.connect(ssid, password)
    for t in range(50):
        if station.isconnected():
            break
        time.sleep(0.1)
    return station

import urequests
print("Connecting...")
station = connect("Network Name", "Password")
if not station.isconnected():
    print("Not connected!...")
else:
    print("Connecting!...")
    print("Accessing the website...")
    response = urequests.get("http://teste.afonsomiguel.com")
    print("Page Accessed:")
    print(response.text)
    station.disconnect()

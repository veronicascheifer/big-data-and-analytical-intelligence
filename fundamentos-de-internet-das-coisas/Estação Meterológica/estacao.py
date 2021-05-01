import dht
import machine
import time

r = machine.Pin(2, machine.Pin.OUT)
d = dht.DHT11(machine.Pin(4))

x = 0

while x < 10:
    d.measure()
    temperatura = d.temperature()
    umidade = d.humidity()
    
    print("Temp={}   Umid={}".format(d.temperature(), d.humidity()))
    
    if temperatura > 31 or umidade > 70:
        r.value(1)
    else:
        r.value(0)
        
    print("Temp={}   Umid={}".format(d.temperature(), d.humidity()))
    
    time.sleep(1)
    x += 1
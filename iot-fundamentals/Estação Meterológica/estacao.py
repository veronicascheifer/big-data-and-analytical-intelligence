import dht
import machine
import time
import network
import urequests
import ujson

def conecta(ssid, senha):
    station = network.WLAN(network.STA_IF)
    station.active(True)
    station.connect(ssid, senha)
    return station

print("Conectando...")
station = conecta("nome da rede", "senha")
if not station.isconnected():
    print("Nao conectado!")
else:
    print("Conectado!")


r = machine.Pin(2, machine.Pin.OUT)
d = dht.DHT11(machine.Pin(4))

x = 0

while x < 10:
    d.measure()
    temperatura = ("{}".format(d.temperature()))
    umidade = ("{}".format(d.humidity()))

    if int(temperatura) > 31 or int(umidade) > 70:
        r.value(1)
    else:
        r.value(0)
            
    dados = {'field1': temperatura, 'field2': umidade}
    request = urequests.post('https://api.thingspeak.com/update?api_key=J4NKP906UTS1Z58Q',
        json = dados,
        headers = {'content-type': 'application/json'})
    
    request.close()   
    
    time.sleep(15)
    x += 1 

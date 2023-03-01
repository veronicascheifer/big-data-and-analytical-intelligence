
def conecta(ssid, senha):
    import network
    import time
    station = network.WLAN(network.STA_IF)
    station.active(True)
    station.connect(ssid, senha)
    for t in range(50):
        if station.isconnected():
            break
        time.sleep(0.1)
    return station

import urequests
print("Conectando...")
station = conecta("nome da rede", "senha")
if not station.isconnected():
    print("N‹o conectado!...")
else:
    print("Conectado!...")
    print("Acessando o site...")
    response = urequests.get("http://teste.afonsomiguel.com")
    print("P‡gina acessada:")
    print(response.text)
    station.disconnect()

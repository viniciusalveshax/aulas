import random

from tcp import *
from time import *

serverIP = "1.1.1.1"
serverPort = 1234

client = TCPClient()

def onTCPConnectionChange(type):
	print("connection to " + client.remoteIP() + " changed to state " + str(type))

def onTCPReceive(data):
	print("received from " + client.remoteIP() + " with data: " + data)

def main():
	client.onConnectionChange(onTCPConnectionChange)
	client.onReceive(onTCPReceive)

	print(client.connect(serverIP, serverPort))

	count = 0
	while True:
		
		list1 = [1, 2]
		numero_tentado = random.choice(list1)

		data = numero_tentado
		client.send(data)

		sleep(1)

if __name__ == "__main__":
	main()

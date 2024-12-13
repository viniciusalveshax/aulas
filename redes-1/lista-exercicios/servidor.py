from tcp import *
from time import *

import random

port = 1234
server = TCPServer()

def onTCPNewClient(client):
	def onTCPConnectionChange(type):
		print("connection to " + client.remoteIP() + " changed to state " + str(type))
		
	def onTCPReceive(data):
		print("received from " + client.remoteIP() + " with data: " + data)
		
		list1 = [1, 2]
		numero_escolhido = random.choice(list1)

		#numero = 18
		if data == str(numero_escolhido):
			resposta = "Acertou"
			print(resposta)
		else:
			resposta = "Errou"
			print("A resposta certa era ", numero_escolhido)
		# send back same data
		client.send(resposta)

	client.onConnectionChange(onTCPConnectionChange)
	client.onReceive(onTCPReceive)

def main():
	server.onNewClient(onTCPNewClient)
	print(server.listen(port))

#	numero = 34
#	print("O numero a ser adivinhado eh ", numero)

	# don't let it finish
	while True:
		sleep(3600)

if __name__ == "__main__":
	main()

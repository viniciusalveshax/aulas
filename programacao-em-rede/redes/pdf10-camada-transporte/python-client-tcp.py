import socket

# Configurações
HOST = '127.0.0.1'
PORT = 65432

# Cria a estrutura de dados socket
with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:

    # Conecta no host especificado
    s.connect((HOST, PORT))
    
    # Repete até que 'sair' seja digitado
    while True:
    
    	# Lê o teclado
        message = input('Digite uma mensagem ou "sair": ')
        
        # Passa tudo para minúsculas
        if message.lower() == 'sair':
            break
            
        # Manda a mensagem
        s.sendall(message.encode('utf-8'))
        
        # Aguarda uma resposta com tamanho de até 1024 bytes
        data = s.recv(1024)
        if not data:
            break
        received_data = data.decode('utf-8')
        print(f'Resposta do servidor: {received_data}')
    print('Desconectado.')            

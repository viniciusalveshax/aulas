# Gerado com Gemini

import socket

# Configurações
HOST = '127.0.0.1'  # Endereço IP do servidor (localhost)
PORT = 65432       # Porta para conexão

# Cria socket TCP
with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:

    # Atrela o programa na porta e no host
    s.bind((HOST, PORT))
    
    # Passa a escutar, esperando conexões
    s.listen()
    
    # Aceita uma conexão e retorna os parâmetros da conexão
    conn, addr = s.accept()
    with conn:
        print(f'Conectado por {addr}')
        
        # Recebe dados e envia a mesma informação de volta
        # Encerra quando o recebimento retornar falso
        while True:
            data = conn.recv(1024)
            if not data:
                break
            received_data = data.decode('utf-8')
            print(f'Recebido: {received_data}')
            conn.sendall(data)  # Envia de volta o que foi recebido
        print('Desconectado.')

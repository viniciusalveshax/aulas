import socket

# Definir o endereço e a porta do servidor
servidor_endereco = ('127.0.0.1', 4040)  # 127.0.0.1 é o loopback (localhost)

# Criar um socket UDP
cliente_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

while True:
    # Solicitar uma mensagem
    mensagem = input("Digite uma mensagem (ou CTRL+X para sair): ")
    if mensagem == 'CTRL+X':
        break  # Sair do loop
    else:
        # Codificar a mensagem
        mensagem_codificada = mensagem.encode('utf-8')

        # Enviar a mensagem
        cliente_socket.sendto(mensagem_codificada, servidor_endereco)

        # Receber uma resposta (opcional)
        dados, _ = cliente_socket.recvfrom(1024)
        resposta = dados.decode('utf-8')
        print(f"Resposta do servidor: {resposta}")

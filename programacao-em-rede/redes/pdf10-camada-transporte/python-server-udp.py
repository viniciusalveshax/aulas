import socket

# Definir o endereço e a porta do servidor
servidor_endereco = ('', 4040)  # '' significa que o servidor ouvirá em todas as interfaces

# Criar um socket UDP
servidor_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

# Vincular o socket ao endereço
servidor_socket.bind(servidor_endereco)

print(f"Servidor UDP ouvindo em {servidor_endereco}")

while True:
    # Receber dados
    dados, endereco_cliente = servidor_socket.recvfrom(1024)  # 1024 é o tamanho máximo do buffer

    # Decodificar os dados
    mensagem_recebida = dados.decode('utf-8')

    # Imprimir a mensagem recebida
    print(f"Mensagem recebida de {endereco_cliente}: {mensagem_recebida}")

    # Enviar uma resposta (opcional)
    resposta = f"Mensagem recebida: {mensagem_recebida}".encode('utf-8')
    servidor_socket.sendto(resposta, endereco_cliente)

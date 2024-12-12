% Configuração do receptor UDP
clear udpServer;
pause(0.5);
pkg load instrument-control;  % Carrega o pacote necessário para comunicação UDP

% Criar a porta UDP para escuta de dados
udpServer = udpport("LocalPort", 12344);  % Porta de escuta (mesma porta que o transmissor usa)

disp("Aguardando dados do transmissor...");

% Aguardar e ler dados enquanto estiverem sendo recebidos
while true
    if udpServer.NumBytesAvailable > 0  % Verifica se há dados disponíveis
        mensagem = read(udpServer, udpServer.NumBytesAvailable, "string");  % Recebe os dados
        disp(['Dados recebidos: ', mensagem]);
    end
end

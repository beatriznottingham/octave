clear all;
pkg load instrument-control;  % Carrega o pacote necessário para comunicação UDP

% Configuração do transmissor UDP
serverIP = "10.10.1.2";  % Substituir pelo IP do servidor
serverPort = 12344;
disp("Enviando mensagem para o servidor...");

% Criar objeto UDP
udpClient = udp(serverIP, serverPort);  % Define o IP e a porta do servidor
fopen(udpClient);  % Abre a conexão UDP

% Nome do arquivo a ser enviado
arqcha = 'ch08_Lminmax3.90_4.00_lbd3.9000_p.dat';
nome_arquivo = ['C:\IFCE_OctaveT\' arqcha];

% Abrir o arquivo para leitura
fid = fopen(nome_arquivo, 'r');
if fid == -1
    error('Não foi possível abrir o arquivo: %s', nome_arquivo);
end

% Ler e enviar o conteúdo do arquivo linha por linha
linha_atual = fgetl(fid);  % Lê a primeira linha do arquivo
while ischar(linha_atual)
    linha_atual = strtrim(linha_atual);  % Remove espaços desnecessários
    fwrite(udpClient, linha_atual);  % Envia a linha atual para o servidor
    disp(['Enviando: ', linha_atual]);  % Exibe a linha que está sendo enviada
    linha_atual = fgetl(fid);  % Lê a próxima linha do arquivo
end

% Fechar o arquivo e a conexão UDP
fclose(fid);
fclose(udpClient);
disp("Palavras enviadas.");

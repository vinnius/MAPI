% Parâmetros do financiamento
valor_financiado = 200000;  % R$ 200.000,00
taxa_juros_anual = 0.12;  % 12% ao ano
taxa_juros_mensal = (1 + taxa_juros_anual)^(1/12) - 1;  % taxa mensal equivalente
prazo_meses = 240;  % 20 anos

% Cálculo da prestação mensal usando a fórmula da anuidade
prestacao_mensal = (valor_financiado * taxa_juros_mensal * (1 + taxa_juros_mensal)^prazo_meses) / ((1 + taxa_juros_mensal)^prazo_meses - 1);

% Parâmetros do faturamento
faturamento_liquido_inicial = 5000;  % R$ 5.000,00
taxa_crescimento_mensal = 0.02;  % 2% ao mês

% Vetores para armazenar os valores ao longo do tempo
meses = 1:prazo_meses;
faturamento_liquido = zeros(1, prazo_meses);
divida_restante = zeros(1, prazo_meses);
soma_dos_dois = zeros(1, prazo_meses);

% Inicializando a dívida restante com o valor financiado
divida_restante(1) = valor_financiado;

% Cálculo do faturamento, dívida restante e soma dos valores
for i = 1:prazo_meses
    if i == 1
        faturamento_liquido(i) = faturamento_liquido_inicial;
    else
        faturamento_liquido(i) = faturamento_liquido(i-1) * (1 + taxa_crescimento_mensal);
        divida_restante(i) = divida_restante(i-1) * (1 + taxa_juros_mensal) - prestacao_mensal;
    end
    
    soma_dos_dois(i) = faturamento_liquido(i) - divida_restante(i); % Aqui mudei para subtração.
end

% Plotando os gráficos
figure;
hold on;
plot(meses, faturamento_liquido, 'b', 'LineWidth', 2); % Crescimento do Faturamento Líquido
plot(meses, divida_restante, 'r', 'LineWidth', 2); % Dívida Restante
plot(meses, soma_dos_dois, 'g', 'LineWidth', 2); % Soma dos Dois Anteriores
xlabel('Meses');
ylabel('R$ (Reais)');
title('Comparação');
legend('Faturamento Líquido', 'Dívida Restante', 'Soma dos Dois');
grid on;
hold off;

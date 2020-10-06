def obter_limite(): 
    nome = 'Verônica Scheifer'
    print('Bem vindo à loja de ', nome)
    print('Vamos fazer uma análise de crédito para você!')
    cargo = str(input('Por favor, digite seu cargo: '))
    print('Seu cargo é ', cargo)
    salario = float(input('Por favor, digite seu salário: '))
    print('Seu salário é ', salario)
    anoDeNascimento = int(input('Por favor, digite seu ano de nascimento: '))
    print('Seu ano de nascimento é ', anoDeNascimento)

    from datetime import datetime
    ano_atual = datetime.today().year
    idade_aprox =  ano_atual - anoDeNascimento 
    print('Sua idade aproximada é ', idade_aprox)
    limite = salario * (idade_aprox/1000) + 100
    print('Seu limite é ', limite)
    return limite 

def verificar_produto(limite): 
    produto = str(input('Por favor, digite o nome do seu produto: '))
    preco_produto = float(input('Por favor, agora digite o preço do produto: '))
    nome_completo = str(input('Por favor, digite seu nome completo para calcularmos o desconto: ')).strip()
    primeiro_nome = nome_completo.split()[0]
    tamanho_nome_completo = len(nome_completo)
    tamanho_primeiro_nome = len(primeiro_nome)

    print('Seu primeiro nome é:', primeiro_nome)
    print('Seu nome completo possui o total de', tamanho_nome_completo, 'caracteres')

    anoDeNascimento = int(input('Por favor, digite novamente seu ano de nascimento: '))
    print('Seu ano de nascimento é ', anoDeNascimento)
    from datetime import datetime
    ano_atual = datetime.today().year
    idade_aprox =  ano_atual - anoDeNascimento 

    bloqueado = 0

    if preco_produto <= (0.6*limite):
        print('Liberado!')
    elif preco_produto >= (0.6*limite) and preco_produto <= (0.9*limite):
        print('Liberado ao parcelar em até 2 vezes')
    elif preco_produto >= (0.9*limite) and preco_produto <= (0.10*limite):
        print('Liberado ao parcelar em 3 ou mais vezes')
    else:
        print('Bloqueado!')
        bloqueado = 1

    if (not bloqueado):
        if (preco_produto >= tamanho_nome_completo and preco_produto <= idade_aprox):
            desconto = tamanho_primeiro_nome
            print ('Seu desconto é de: %d reais.' %desconto)
            preco_final = preco_produto - desconto
            print ('Seu valor final com desconto é: %.2f reais.' %preco_final)
        else:
            print('Não há desconto.')

limite = obter_limite()

quantidade_produtos = int(input("Quantos produtos você deseja cadastrar?"))
while (quantidade_produtos > 0):
    verificar_produto(limite)
    quantidade_produtos -= 1

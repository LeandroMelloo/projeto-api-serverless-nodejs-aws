
 # 1° Passo - Instalar o serverless framework
    - npm i -g serverless

# 2° Passo - executar os comandos para testar o serverless framework
    - sls -v
    - serverless -v

# 3° Passo - Inicializar o serverless, e criar o projeto
- comando: sls

# 4° Passo - Entrar na pasta criada no passo 3
- comando: cd hello-sls

# 5° Passo - Sempre fazer deploy antes de tudo para verificar se está com ambiente ok
- comando: sls deploy

# 6° Passo - Invocar a função Lambda na AWS
- comando: sls invoke -f hello

# 7° Passo - Invocar a função Lambda Localmente na máquina
- comando: sls invoke local -f hello --log

# 8° Passo - Aguardando eventos de log
- comando: sls logs -f hello --tail

# 9° Passo - Remover
- comando: sls remove
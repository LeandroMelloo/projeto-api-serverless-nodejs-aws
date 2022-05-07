# 1° Passo - Criar um arquivo de politicas de segurança para sua Lambda
# 2° Passo - Criar a Role de segurança na AWS, através do IAM

aws iam create-role \
    --role-name lambda-exemplo \
    --assume-role-policy-document file://politicas.json \
    | tee logs/role.log

# 3° Passo - Criar arquivo com o conteudo e zipa-lo
zip function.zip index.js

aws lambda create-function \
    --function-name hello-cli \
    --zip-file fileb://function.zip \
    --handler index.handler \
    --runtime nodejs12.x \
    --role arn:aws:iam::452137519136:role/lambda-exemplo \
    | tee logs/lambda-create.log

# 4° Passo - Invocar lambda
aws lambda invoke \
    --function-name hello-cli \
    --log-type Tail \
    logs/lambda-exec.log

# 5° Passo - Atualizar a função, zipar novamente
zip function.zip index.js

# 6° Passo - Atualizar a função lambda
aws lambda update-function-code \
    --zip-file fileb://function.zip \
    --function-name hello-cli \
    --publish \
    | tee logs/lambda-update.log

# 7° Passo - Invocar lambda atualizada
aws lambda invoke \
    --function-name hello-cli \
    --log-type Tail \
    logs/lambda-exec-update.log

# 8° Passo - Remover a função lambda
aws lambda delete-function \
    --function-name hello-cli

aws iam delete-role \
    --role-name lambda-exemplo
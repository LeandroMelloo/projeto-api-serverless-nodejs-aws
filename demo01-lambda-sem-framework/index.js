async function handler(event, context) {
    console.log('Ambiente..', JSON.stringify(process.env, null, 2))
    console.log('Evento..', JSON.stringify(process.env, null, 2))

    return {
        data: {
            nome: 'Leandro Moreira Paulino de Mello',
            idade: 36,
            sexo: 'Masculino'
        }  
    }
}

module.exports = {
    handler
}
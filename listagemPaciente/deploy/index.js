const moment = require('moment');

const pacientes = [
    { id: 1, nome: 'Leandro', dataNasciemnto: '1985-10-09' },
    { id: 2, nome: 'Luciana', dataNasciemnto: '1985-01-16' },
    { id: 3, nome: 'Pedro Henrique', dataNasciemnto: '2006-12-19' },
    { id: 4, nome: 'Beatriz', dataNasciemnto: '2011-07-30' }
];

function buscarPaciente(id) {
    return pacientes.find(paciente => paciente.id == id);
}

function calcularIdade(paciente) {
    const dataAtual = moment();
    const dataNascimento = moment(paciente.dataNasciemnto, 'YYYY-MM-DD');
    
    return dataAtual.diff(dataNascimento, 'years');
}

exports.handler = async (event) => {
    if (event.pacienteId)
        console.log('PacienteId informado: ' + event.pacienteId);
    else
        console.log('PacienteIdade não informado');
    
    let pacienteEncontrado = pacientes;

    if (event.pacienteId) {
        pacienteEncontrado = buscarPaciente(event.pacienteId);
        pacienteEncontrado.idade = calcularIdade(pacienteEncontrado);
        
        return {
            statusCode: 200,
            body: JSON.stringify(pacienteEncontrado)
        };
    }
    console.log("DEPLOY CLI AWS");
    const todosPacientes = pacientes.map(p => ({ ...p, idade: calcularIdade(p) }));
    return {
        statusCode: 200,
        body: JSON.stringify(todosPacientes)
    };
};

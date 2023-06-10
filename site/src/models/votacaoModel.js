var database = require("../database/config");

function buscarUltimasMedidas(idVotacao) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select count(escolha)
                    from voto
                    where fkVotacao = ${idVotacao}
                    order by escolha desc`;
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select
        escolha, count(escolha) as totalVotos
        from voto
        where fkVotacao = ${idVotacao}
        group by escolha
        order by totalVotos;`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function verificarVotoUsuario(idVotacao, idUsuario) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select escolha
                    from voto
                    where fkVotacao = ${idUsuario}
                    order by escolha desc`;
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select
        *
        from voto
        where fkUsuario = ${idUsuario} and fkVotacao = ${idVotacao};`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function registrarVotoUsuario(escolha, idVotacao, idUsuario) {    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucao = `
        INSERT INTO voto (escolha, fkVotacao, fkUsuario) VALUES ('${escolha}', '${idVotacao}', '${idUsuario}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    buscarUltimasMedidas,
    verificarVotoUsuario,
    registrarVotoUsuario,
}

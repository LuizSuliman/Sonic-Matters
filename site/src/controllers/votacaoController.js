var medidaModel = require("../models/votacaoModel");

function buscarUltimasMedidas(req, res) {

    var idVotacao = req.params.idVotacao;

    console.log(`Recuperando os votos`);

    medidaModel.buscarUltimasMedidas(idVotacao).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum voto encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar os votos.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
    buscarUltimasMedidas,
}
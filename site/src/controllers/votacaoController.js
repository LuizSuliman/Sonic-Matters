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

function verificarVotoUsuario(req, res) {
    var idVotacao = req.params.i;
    var idUsuario = req.params.idUsuario;

    console.log(`Verificando se o usuário já votou`);

    medidaModel.verificarVotoUsuario(idVotacao, idUsuario).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum voto encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao verificas se o usuário já votou", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function registrarVotoUsuario(req, res) {
    var escolha = req.body.escolhaServer;
    var idVotacao = req.body.idVotacaoServer;
    var idUsuario = req.body.idUsuarioServer;

    // Faça as validações dos valores
    if (escolha == undefined) {
        res.status(400).send("Seu escolha está undefined!");
    } else if (idVotacao == undefined) {
        res.status(400).send("Seu idVotacao está undefined!");
    } else if (idUsuario == undefined) {
        res.status(400).send("Seu idUsuario está undefined!");
    } else {
        
        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        medidaModel.registrarVotoUsuario(escolha, idVotacao, idUsuario)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

module.exports = {
    buscarUltimasMedidas,
    verificarVotoUsuario,
    registrarVotoUsuario,
}
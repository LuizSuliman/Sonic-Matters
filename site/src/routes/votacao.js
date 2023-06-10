var express = require("express");
var router = express.Router();

var votacaoController = require("../controllers/votacaoController");

router.get("/ultimas/:idVotacao", function (req, res) {
    votacaoController.buscarUltimasMedidas(req, res);
});

router.get("/voto/:i/:idUsuario", function (req, res) {
    votacaoController.verificarVotoUsuario(req, res);
});

router.post("/registro", function (req, res) {
    votacaoController.registrarVotoUsuario(req, res);
});

module.exports = router;
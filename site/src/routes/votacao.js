var express = require("express");
var router = express.Router();

var votacaoController = require("../controllers/votacaoController");

router.get("/ultimas/:idVotacao", function (req, res) {
    votacaoController.buscarUltimasMedidas(req, res);
});

module.exports = router;
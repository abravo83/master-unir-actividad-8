const router = require("express").Router();
const {
  getAutores,
  postAutor,
  getAutor,
  putAutor,
  deleteAutor,
} = require("../../controllers/autores.controller");

router.get("/", getAutores);
router.get("/:id", getAutor);
router.post("/", postAutor);
router.put("/:id", putAutor);
router.delete("/:id", deleteAutor);

module.exports = router;

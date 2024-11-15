const router = require("express").Router();

router.use("/posts", require("./api-routes/posts.routes"));
router.use("/autores", require("./api-routes/autores.routes"));

module.exports = router;

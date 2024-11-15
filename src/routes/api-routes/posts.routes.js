const router = require("express").Router();
const {
  getPostsCtrl,
  getPostsByAutorIdCtrl,
  getPostByIdCtrl,
  createPostCtrl,
  deletePostCtrl,
  updatePostCtrl,
} = require("../../controllers/posts.controller");

router.get("/", getPostsCtrl);
router.get("/autor/:id", getPostsByAutorIdCtrl);
router.get("/:id", getPostByIdCtrl);
router.post("/", createPostCtrl);
router.put("/:id", updatePostCtrl);
router.delete("/:id", deletePostCtrl);

module.exports = router;

const {
  getAllPosts,
  getPostByAutorId,
  getPostById,
  createPost,
  dropPost,
  updatePost,
} = require("../models/Post.model");

const getPostsCtrl = async (req, res, next) => {
  try {
    const result = await getAllPosts();

    res.json(result);
    //   --
  } catch (error) {
    next(error);
  }
};

const getPostsByAutorIdCtrl = async (req, res, next) => {
  try {
    const { id } = req.params;
    const result = await getPostByAutorId(id);

    res.json(result);
    //   --
  } catch (error) {
    next(error);
  }
};

const getPostByIdCtrl = async (req, res, next) => {
  try {
    const { id } = req.params;
    const [result] = await getPostById(id);

    res.json(result);
    //   --
  } catch (error) {
    next(error);
  }
};

const updatePostCtrl = async (req, res, next) => {
  try {
    const { id } = req.params;
    const { titulo, descripcion, categoria, texto, autor_id } = req.body;
    const result = await updatePost(id, {
      titulo,
      descripcion,
      categoria,
      texto,
      autor_id,
    });

    res.json(result);
    //   --
  } catch (error) {
    next(error);
  }
};

const createPostCtrl = async (req, res, next) => {
  try {
    const { titulo, descripcion, texto, categoria, autor_id } = req.body;
    const result = await createPost({
      titulo,
      descripcion,
      texto,
      categoria,
      autor_id,
    });

    res.json(result);
    //   --
  } catch (error) {
    next(error);
  }
};

const deletePostCtrl = async (req, res, next) => {
  try {
    const { id } = req.params;
    const [result] = await dropPost(id);

    res.json(result);
    //   --
  } catch (error) {
    next(error);
  }
};

module.exports = {
  getPostsCtrl,
  getPostsByAutorIdCtrl,
  getPostByIdCtrl,
  updatePostCtrl,
  createPostCtrl,
  deletePostCtrl,
};

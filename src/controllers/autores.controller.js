const {
  getAllAutores,
  createAutor,
  getAutorById,
} = require("../models/Autor.model");

const getAutores = async (req, res, next) => {
  try {
    const result = await getAllAutores();

    return res.json(result);
  } catch (error) {
    next(error);
  }
};

const getAutor = async (req, res, next) => {
  try {
    const { id } = req.params;
    const [result] = await getAutorById(id);

    return res.json(result);
  } catch (error) {
    next(error);
  }
};

const postAutor = async (req, res, next) => {
  try {
    const { nombre, email, imagen } = req.body;
    const id = await createAutor({ nombre, email, imagen });

    if (id) {
      return res.status(201).json({ id, nombre, email, imagen });
    }

    return res.status(400).json({ message: "Error al crear el autor" });
  } catch (error) {
    next(error);
  }
};

const putAutor = async (req, res, next) => {
  try {
    const { id } = req.params;
    const { nombre, email, imagen } = req.body;

    const [result] = await updateAutor(id, { nombre, email, imagen });

    if (result) {
      return res.json(result);
    }

    return res.status(400).json({ message: "Error al actualizar el autor" });
  } catch (error) {
    next(error);
  }
};

const deleteAutor = async (req, res, next) => {
  try {
    const { id } = req.params;
    const deleted = await dropAutor(id);

    if (deleted) {
      return res.json({ message: "Autor eliminado" });
    }

    return res.status(400).json({ message: "Error al eliminar el autor" });
  } catch (error) {
    next(error);
  }
};

module.exports = {
  getAutores,
  postAutor,
  getAutor,
  putAutor,
  deleteAutor,
};
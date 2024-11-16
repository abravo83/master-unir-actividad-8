const pool = require("../config/db");

const getAllPosts = async () => {
  const [result] = await pool.query(
    "SELECT posts.*, autores.imagen autor_imagen, autores.email autor_email, autores.nombre autor_nombre FROM posts INNER JOIN autores ON posts.autor_id = autores.id"
  );
  return result;
};

const getPostByAutorId = async (id) => {
  const [rows] = await pool.query(
    "SELECT posts.*, autores.imagen autor_imagen, autores.email autor_email, autores.nombre autor_nombre FROM posts INNER JOIN autores ON posts.autor_id = autores.id WHERE autor_id = ?",
    [id]
  );

  return rows;
};

const getPostById = async (id) => {
  const [resultado] = await pool.query(
    "SELECT posts.*, autores.imagen autor_imagen, autores.email autor_email, autores.nombre autor_nombre FROM posts INNER JOIN autores ON posts.autor_id = autores.id WHERE posts.id = ?",
    [id]
  );

  return resultado || null;
};

const createPost = async ({
  titulo,
  descripcion,
  texto,
  categoria,
  autor_id,
}) => {
  const [result] = await pool.query(
    "INSERT INTO posts (titulo, descripcion, texto, fecha_creacion, categoria, autor_id) VALUES (?, ?, ?, NOW(), ?, ?)",
    [titulo, descripcion, texto, categoria, autor_id]
  );

  if (result.affectedRows === 0) {
    return null;
  }

  const [post] = await pool.query(
    "SELECT posts.*, autores.imagen autor_imagen, autores.email autor_email, autores.nombre autor_nombre FROM posts INNER JOIN autores ON posts.autor_id = autores.id WHERE posts.id = ?",
    [result.insertId]
  );
  if (!post[0]) {
    return null;
  }

  return post[0];
};

const upatePost = async (id, { titulo, descripcion, categoria, autor_id }) => {
  const [result] = await pool.query(
    "UPDATE posts SET titulo = ?, descripcion = ?, categoria = ?, autor_id = ? WHERE posts.id = ?",
    [titulo, descripcion, categoria, autor_id, id]
  );

  if (result.affectedRows === 0) {
    return null;
  }

  const [post] = await pool.query(
    "SELECT posts.*, autores.imagen autor_imagen, autores.email autor_email, autores.nombre autor_nombre FROM posts INNER JOIN autores ON posts.autor_id = autores.id WHERE posts.id = ?",
    [id]
  );
  if (!post[0]) {
    return null;
  }

  return post[0];
};

const dropPost = async (id) => {
  const [result] = await pool.query("DELETE FROM posts WHERE id = ?", [id]);

  return result.affectedRows > 0 || null;
};

module.exports = {
  getAllPosts,
  getPostByAutorId,
  getPostById,
  createPost,
  upatePost,
  dropPost,
};

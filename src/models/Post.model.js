const pool = require("../config/db");

const getAllPosts = async () => {
  const [rows] = await pool.query(
    "SELECT * FROM posts INNER JOIN autores ON posts.autor_id = autores.id"
  );
  return rows;
};

const getPostByAutorId = async (id) => {
  const [rows] = await pool.query(
    "SELECT * FROM posts INNER JOIN autores ON posts.autor_id = autores.id WHERE autor_id = ?",
    [id]
  );

  return rows;
};

const getPostById = async (id) => {
  const [resultado] = await pool.query(
    "SELECT * FROM posts INNER JOIN autores ON posts.autor_id = autores.id WHERE id = ?",
    [id]
  );

  return resultado || null;
};

const createPost = async ({ titulo, descripcion, categoria, autor_id }) => {
  const [result] = await pool.query(
    "INSERT INTO posts (titulo, descripcion, fecha_creacion, categoria, autor_id) VALUES (?, ?, NOW(), ?, ?)",
    [titulo, descripcion, categoria, autor_id]
  );

  if (result.affectedRows === 0) {
    return null;
  }

  const [post] = await pool.query(
    "SELECT * FROM posts INNER JOIN autores ON posts.autor_id = autores.id WHERE id = ?",
    [result.insertId]
  );
  if (!post[0]) {
    return null;
  }

  return result;
};

const upatePost = async (id, { titulo, descripcion, categoria, autor_id }) => {
  const [result] = await pool.query(
    "UPDATE posts SET titulo = ?, descripcion = ?, categoria = ?, autor_id = ? WHERE id = ?",
    [titulo, descripcion, categoria, autor_id, id]
  );

  if (result.affectedRows === 0) {
    return null;
  }

  const [post] = await pool.query("SELECT * FROM posts WHERE id = ?", [id]);
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

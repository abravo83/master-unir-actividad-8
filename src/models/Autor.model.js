const pool = require("../config/db");

async function getAllAutores() {
  // return (result = await pool.query("SELECT * FROM autores"));
  const [result] = await pool.query("select * from autores");
  return result || null;
}

async function getAutorById(id) {
  const [result] = await pool.query(`SELECT * FROM autores WHERE id = ?`, [id]);
  return result[0] || null;
}

async function createAutor({ nombre, email, imagen }) {
  const [result] = await pool.query(
    `INSERT INTO autores 
        (nombre, email, imagen)
        VALUES (?, ?, ?)`,
    [nombre, email, imagen]
  );
  return result.insertId || null;
}

async function updateAutor(id, { nombre, email, imagen }) {
  const [result] = await pool.query(
    `UPDATE autores 
        SET nombre = ?, email = ?, imagen = ?
        WHERE id = ?`,
    [nombre, email, imagen, id]
  );

  if (result.affectedRows === 0) {
    return null;
  }
  return { id, nombre, email, imagen };
}

async function dropAutor(id) {
  const [resultPosts] = await pool.query(
    `DELETE FROM posts WHERE autor_id = ?`,
    [id]
  );
  const [resultAutores] = await pool.query(`DELETE FROM autores WHERE id = ?`, [
    id,
  ]);
  return (
    { autores: resultAutores.affectedRows, posts: resultPosts.affectedRows } ||
    null
  );
}

module.exports = {
  getAllAutores,
  getAutorById,
  createAutor,
  updateAutor,
  dropAutor,
};

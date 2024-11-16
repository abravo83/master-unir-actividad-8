# Actividad 8 API REST

## Install Instructions

- PREREQUISITE: Having a MySQL server running locally.
- Run `npm install` as usual to **install all dependencies**.
- Use the `myblog.sql` file content query to **install the DB**.
- **CREATE YOUR OWN .env file**. Use the `.env_example` to **create** your own `.env` file that should contain access to your DB. The .env should have this structure

```

DB_HOST_ADDRESS=localhost
DB_USER=root
DB_PASSWORD=yourpassword
DB_PORT=3306
DB_NAME=myblog
PORT=3000

```

but the data within should be your own. Special attention to the DB\_ data. You should know this data already. If not, reinstall MySQL and pay attention and take notes in the installation process.

## To run the project

```Bash
npm run start
```

## API use Instructions

_X means none, nothing_

### **AUTHORS**

### Get All Authors

- GET /api/autores
- Body: X
- Headers: X

- Answer: An array of authors. And empty array if no records are found.

### Get Author By Id

- GET /api/autores/id (where id is a number that identifies the author)
- Body: X
- Headers: X

- Answer: An author object. An error 400 if author does not exist with {message} object.

### Post a new Author

- POST /api/autores
- Body:
  {
  "nombre": string,
  "email": string,
  "imagen": string
  }
- Headers: Content-Type: application/json

- Answer: Returns the new Autor object with its Id included

### Update an Author

- PUT /api/autores/id (where id is a number that identifies the author)
- Body:
  {
  "nombre": string,
  "email": string,
  "imagen": string
  }
- Headers: Content-Type: application/json

- Answer: Returns the new Autor object with its Id included

### Delete an Author (Also removes every post of this author)

- DELETE /api/autores/id (where id is a number that identifies the author)
- Body: X
- Headers: X

- Answer: A message object {message: string} that informs how many authors and post have been erased. The message has error status if author does not exists.

### **POSTS**

### Get All posts

- GET /api/posts
- Body: X
- Headers: X

- Answer: An array of posts. And empty array if no records are found.

### Get posts by author

- GET /api/posts/autor/id (where id is a number that identifies the author of those posts)
- Body: X
- Headers: X

- Answer: An array of posts. And empty array if no records are found.

### Get post By Id

- GET /api/posts/id (where id is a number that identifies the)
- Body: X
- Headers: X

- Answer: A Post object. An error 400 if post does not exist with {message} object.

### Post a new Post

- POST /api/posts
- Body:
  {
  "titulo": string,
  "descripcion": string,
  "categoria": "eventos" | "noticias" | "avisos",
  "texto": string,
  "autor_id": number (id of the author in autores table)
  }
- Headers: Content-Type: application/json

- Answer: Returns the new Post object with its Id included

### Update a Post

- PUT /api/posts/id (where id is a number that identifies the post)
- Body:
  {
  "titulo": string,
  "descripcion": string,
  "categoria": "eventos" | "noticias" | "avisos",
  "texto": string,
  "autor_id": number (id of the author in autores table)
  }
- Headers: Content-Type: application/json

- Answer: Returns the new Autor object with its Id included

### Delete a Post (Also removes every post of this Post)

- DELETE /api/posts/id (where id is a number that identifies the post)
- Body: X
- Headers: X

- Answer: A message object {message: string} that informs if post has been deleted or not. The message has error status if post does not exists.

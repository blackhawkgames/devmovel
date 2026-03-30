const cors = require('cors');
const express = require('express');
const pool = require('./db');
const swaggerUi = require('swagger-ui-express');
const swaggerSpec = require('./swagger');

const app = express();
app.use(express.json());
app.use(cors());

app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerSpec));

app.get('/', (req, res) => {
  res.send('API funcionando!');
});

//POST
app.post('/usuarios', async (req, res) => {
  const { nome, email } = req.body;

  try {
    const result = await pool.query(
      'INSERT INTO usuarios (nome, email) VALUES ($1, $2) RETURNING *',
      [nome, email]
    );

    res.status(201).json(result.rows[0]);
  } catch (err) {
    res.status(500).send('Erro ao criar usuário');
  }
});

//GET
app.get('/usuarios', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM usuarios');
    res.json(result.rows);
  } catch (err) {
    res.status(500).send('Erro ao buscar usuários');
  }
});

//DELETE
app.delete('/usuarios/:id', async (req, res) => {
  const { id } = req.params;

  try {
    await pool.query('DELETE FROM usuarios WHERE id = $1', [id]);
    res.sendStatus(204);
  } catch (err) {
    res.status(500).send('Erro ao deletar');
  }
});

//UPDATE
app.put('/usuarios/:id', async (req, res) => {
  const { id } = req.params;
  const { nome, email } = req.body;

  try {
    const result = await pool.query(
      'UPDATE usuarios SET nome = $1, email = $2 WHERE id = $3 RETURNING *',
      [nome, email, id]
    );

    res.json(result.rows[0]);
  } catch (err) {
    res.status(500).send('Erro ao atualizar');
  }
});

app.listen(3000, () => {
  console.log('Servidor rodando em http://localhost:3000');
});


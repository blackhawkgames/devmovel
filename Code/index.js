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

// POST /usuarios
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

// GET /usuarios
app.get('/usuarios', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM usuarios');
    res.json(result.rows);
  } catch (err) {
    res.status(500).send('Erro ao buscar usuários');
  }
});

app.listen(3000, () => {
  console.log('Servidor rodando em http://localhost:3000');
});
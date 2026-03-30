# Sistema de Gerenciamento de Usuários

## Tecnologias

* Node.js + Express
* PostgreSQL (Docker)
* Flutter Web
* Swagger

---

## Execução

### 1. Banco de dados (Docker)

Na pasta do docker-compose:

```bash
docker compose up -d
```

Acesse o pgAdmin em:
http://localhost:5050

Crie a tabela:

```sql
CREATE TABLE usuarios (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100),
  email VARCHAR(100)
);
```

---

### 2. Backend

Na pasta do backend:

```bash
node index.js
```

API disponível em:
http://localhost:3000

---

### 3. Frontend (Flutter)

Na pasta do projeto Flutter:

```bash
flutter pub get
flutter run -d chrome
```

---

## Observações

* Utilizar `http://127.0.0.1:3000/usuarios` nas requisições do Flutter.
* Backend e frontend devem estar rodando simultaneamente.

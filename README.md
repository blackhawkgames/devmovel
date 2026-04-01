# Sistema de Gerenciamento de Usuários

## Tecnologias

* Node.js + Express
* PostgreSQL (Docker)
* Flutter Web
* Swagger

---

## Execução

### 0. Para acessar as pastas

No terminal (São necessários 2 terminais para executar o front e o back)

```bash
cd backend
cd front_usuarios
```
Lembrando que é recomendável abrir a pasta "Code" no VS Code

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

CTRL + C Para Desligar

---

### 3. Frontend (Flutter)

Na pasta do projeto Flutter:

```bash
flutter pub get
flutter run -d chrome
```

Para reiniciar, é recomendado dar um clean no flutter:

```bash
flutter pub get
flutter run -d chrome
```

CTRL + C Para abrir o terminal para finalizar o batch
Apertar Y após isso.

---

## Observações

* Utilizar `http://127.0.0.1:3000/usuarios` nas requisições do Flutter.
* Backend e frontend devem estar rodando simultaneamente.

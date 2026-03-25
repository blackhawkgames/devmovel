# 📦 Sistema de Gerenciamento de Usuários

Este projeto consiste no desenvolvimento de uma aplicação completa com **Backend em Node.js** e **Frontend em Flutter Web**, conectados a um banco de dados **PostgreSQL via Docker**.

---

# 🚀 Tecnologias Utilizadas

## 🔙 Backend

* Node.js
* Express.js
* PostgreSQL
* Docker
* Swagger (documentação da API)

## 🎨 Frontend

* Flutter (Web)
* HTTP package

---

# 🐳 Configuração do Banco de Dados (Docker)

1. Certifique-se de ter o Docker instalado e em execução.

2. Na raiz do projeto backend, execute:

```bash
docker compose up -d
```

3. O banco PostgreSQL estará disponível em:

* Host: localhost
* Porta: 5432
* Usuário: admin
* Senha: admin
* Banco: teste

---

# 🧱 Criação da Tabela

Acesse o pgAdmin (http://localhost:5050) e execute:

```sql
CREATE TABLE usuarios (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100),
  email VARCHAR(100)
);
```

---

# ⚙️ Executando o Backend

1. Acesse a pasta do backend:

```bash
cd backend
```

2. Instale as dependências:

```bash
npm install
```

3. Execute o servidor:

```bash
node index.js
```

4. A API estará disponível em:

```
http://localhost:3000
```

---

# 📚 Documentação Swagger

Acesse:

```
http://localhost:3000/api-docs
```

Nesta interface é possível testar:

* POST /usuarios
* GET /usuarios

---

# 🌐 Executando o Frontend (Flutter Web)

1. Acesse a pasta do frontend:

```bash
cd front_usuarios
```

2. Instale as dependências:

```bash
flutter pub get
```

3. Execute o projeto:

```bash
flutter run -d chrome
```

---

# ⚠️ IMPORTANTE

No código Flutter, utilize:

```dart
http://127.0.0.1:3000/usuarios
```

Evite usar `localhost`, pois pode causar problemas de conexão no navegador.

---

# 📱 Funcionalidades

## 🏠 Tela Inicial

* Navegação entre telas
* Botões:

  * Cadastrar Usuário
  * Listar Usuários

## 📝 Cadastro de Usuário

* Formulário com nome e e-mail
* Envio via HTTP POST
* Feedback com SnackBar

## 📋 Listagem de Usuários

* Requisição HTTP GET
* Exibição em lista dinâmica
* Atualização ao recarregar a tela

---

# 🔄 Fluxo de Funcionamento

1. Usuário acessa o Flutter Web
2. Realiza cadastro
3. Dados são enviados para o backend
4. Backend salva no PostgreSQL
5. Listagem busca os dados atualizados

---

# ⚠️ Tratamento de Erros

* Exibe mensagem "Falha na conexão" caso o backend esteja offline
* Validação básica de resposta HTTP

---

# 🧪 Testes

* Cadastro via formulário Flutter
* Listagem atualizada
* Testes via Swagger

---

# 🎯 Objetivo da Atividade

* Integração entre frontend e backend
* Uso de API REST
* Manipulação de dados com banco real
* Navegação em Flutter Web
* Tratamento de requisições HTTP

---

# 👨‍💻 Autor

Projeto desenvolvido para fins acadêmicos na disciplina de Desenvolvimento Mobile.

---

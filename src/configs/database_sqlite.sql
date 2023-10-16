-- Cria a tabela turma
CREATE TABLE turma (
    id_turma INTEGER PRIMARY KEY,
    nome TEXT NOT NULL
);

-- Cria a tabela aluno
CREATE TABLE aluno (
    id_aluno INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    data_nascimento DATE,
    genero TEXT,
    endereco TEXT,
    numero_contato TEXT,
    email TEXT,
    id_turma INTEGER NOT NULL,
    FOREIGN KEY (id_turma) REFERENCES turma(id_turma)
);

-- Cria a tabela disciplina
CREATE TABLE disciplina (
    id_disciplina INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    descricao TEXT,
    carga_horaria INTEGER,
    professor_responsavel TEXT
);

-- Cria a tabela disciplina_alunos (relacionamento muitos-para-muitos)
CREATE TABLE disciplina_alunos (
    id_disciplina_aluno INTEGER PRIMARY KEY,
    id_aluno INTEGER NOT NULL,
    id_disciplina INTEGER NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina)
);

-- Cria a tabela tempos
CREATE TABLE tempos (
    id_tempo INTEGER PRIMARY KEY,
    id_disciplina INTEGER NOT NULL,
    data_hora_aula DATETIME,
    FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina)
);

-- Cria a tabela registos
CREATE TABLE registos (
    id_registo INTEGER PRIMARY KEY,
    id_aluno INTEGER NOT NULL,
    id_tempo INTEGER NOT NULL,
    assiduidade INTEGER NOT NULL DEFAULT 1,
    comportamento INTEGER NOT NULL,
    notas DECIMAL(5, 2), -- Exemplo de campo para notas
    observacoes TEXT,   -- Exemplo de campo para observações
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_tempo) REFERENCES tempos(id_tempo)
);

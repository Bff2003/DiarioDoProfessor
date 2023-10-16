-- Cria a tabela turma
CREATE TABLE turma (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    nome TEXT NOT NULL
);

-- Cria a tabela aluno
CREATE TABLE aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome TEXT NOT NULL,
    data_nascimento DATE,
    genero TEXT,
    endereco TEXT,
    numero_contato TEXT,
    email TEXT,
    id_turma INT NOT NULL,
    FOREIGN KEY (id_turma) REFERENCES turma(id_turma)
);

-- Cria a tabela disciplina
CREATE TABLE disciplina (
    id_disciplina INT AUTO_INCREMENT PRIMARY KEY,
    nome TEXT NOT NULL,
    descricao TEXT,
    carga_horaria INT,
    professor_responsavel TEXT
);

-- Cria a tabela disciplina_alunos (relacionamento muitos-para-muitos)
CREATE TABLE disciplina_alunos (
    id_disciplina_aluno INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_disciplina INT NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina)
);

-- Cria a tabela tempos
CREATE TABLE tempos (
    id_tempo INT AUTO_INCREMENT PRIMARY KEY,
    id_disciplina INT NOT NULL,
    data_hora_aula DATETIME,
    FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina)
);

-- Cria a tabela registos
CREATE TABLE registos (
    id_registo INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_tempo INT NOT NULL,
    assiduidade INT NOT NULL DEFAULT 1,
    comportamento INT NOT NULL,
    notas DECIMAL(5, 2),
    observacoes TEXT,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_tempo) REFERENCES tempos(id_tempo)
);

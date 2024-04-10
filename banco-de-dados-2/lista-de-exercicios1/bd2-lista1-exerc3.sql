DROP TABLE professores;

DROP TABLE alunos;

DROP TABLE disciplinas;

DROP TABLE turmas;


CREATE TABLE professores (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(200)
);


CREATE TABLE alunos (
	matricula VARCHAR(100) PRIMARY KEY,
	nome VARCHAR(200)
);


CREATE TABLE disciplinas (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(200)
);


CREATE TABLE turmas (
	bimestre INT,
	ano INT,
	disciplina_id INT,
	aluno_matricula VARCHAR(100),
	professor_id INT,
	CONSTRAINT fk_professor
          FOREIGN KEY(professor_id) 
            REFERENCES professores(id),
	CONSTRAINT fk_aluno
          FOREIGN KEY(aluno_matricula) 
            REFERENCES alunos(matricula),
	CONSTRAINT fk_disciplina
          FOREIGN KEY(disciplina_id) 
            REFERENCES disciplinas(id),
        PRIMARY KEY (disciplina_id, aluno_matricula, ano)
);

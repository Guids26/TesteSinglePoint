/*SCRIPT PARA CRIAÇÃO DAS TABELAS*/
CREATE TABLE Curso (
IdCurso INT PRIMARY KEY IDENTITY, 
Nome VARCHAR(100) NOT NULL
);

CREATE TABLE Aluno(
IdAluno INT PRIMARY KEY IDENTITY, 
Nome VARCHAR(80) NOT NULL
);

CREATE TABLE Turma (
IdTurma INT PRIMARY KEY IDENTITY,
IdCurso INT NOT NULL
);
ALTER TABLE Turma
ADD CONSTRAINT Turma_IdCurso_FK FOREIGN KEY (IdCurso) REFERENCES Curso (IdCurso)

CREATE TABLE Participante(
IdAluno INT NOT NULL,
IdTurma INT NOT NULL,
);
ALTER TABLE Participante
ADD CONSTRAINT Participante_IdAluno_FK FOREIGN KEY (IdAluno) REFERENCES Aluno(IdAluno)
ALTER TABLE Participante
ADD CONSTRAINT Participante_IdTurma_FK FOREIGN KEY (IdTurma) REFERENCES Turma(IdTurma)
ALTER TABLE Participante
ADD CONSTRAINT Participante_IdAluno_IdTurma_FK PRIMARY KEY CLUSTERED (IdAluno, IdTurma)


/*INSERÇÃO DE CURSOS*/
INSERT INTO Curso values ('Análise e desenvolvimento de sistemas')
INSERT INTO Curso values ('Arquitetura de redes')
INSERT INTO Curso values ('Algoritmos e lógica de programação')
INSERT INTO Curso values ('Redes TCP/IP')
INSERT INTO Curso values ('Cisco CDNA Data Center')
INSERT INTO Curso values ('Programação em C')
INSERT INTO Curso values ('Segurança da informação')
INSERT INTO Curso values ('Montagem e manutenção de computadores')
INSERT INTO Curso values ('Aprenda a programar')

/*INSERÇÃO DE ALUNOS*/
INSERT INTO Aluno values ('João Pedro')
INSERT INTO Aluno values ('Nathalia Medeiros')
INSERT INTO Aluno values ('Guilherme Souza')
INSERT INTO Aluno values ('Jonas Junior')
INSERT INTO Aluno values ('Bruna Carvalho')
INSERT INTO Aluno values ('Eli Barrico')
INSERT INTO Aluno values ('Júlio Barrela')
INSERT INTO Aluno values ('Damien Garrido')
INSERT INTO Aluno values ('Vasile Rolim Lobo')
INSERT INTO Aluno values ('Isaura Durão')
INSERT INTO Aluno values ('Kleyton Parracho')
INSERT INTO Aluno values ('Abraão Moreno')
INSERT INTO Aluno values ('Renan Melo Santos')
INSERT INTO Aluno values ('Danilo Melo Dias')
INSERT INTO Aluno values ('Nicolas Santos Lima')
INSERT INTO Aluno values ('Paulo Cardoso Cavalcanti')
INSERT INTO Aluno values ('Kauê Gomes Carvalho')
INSERT INTO Aluno values ('José Castro Goncalves')
INSERT INTO Aluno values ('Vitor Cardoso Pinto')
INSERT INTO Aluno values ('João Lima Araujo')
INSERT INTO Aluno values ('Enzo Melo Costa')


/*INSERÇÃO DAS TURMAS*/
INSERT INTO Turma values (6);
INSERT INTO Turma values (2);
INSERT INTO Turma values (3);
INSERT INTO Turma values (4);
INSERT INTO Turma values (5);
INSERT INTO Turma values (8);

/*INSERÇÃO DE PARTICIPANTES NAS TURMAS*/
INSERT INTO Participante(IdAluno, IdTurma) values (1,1)
INSERT INTO Participante(IdAluno, IdTurma) values (2,1)
INSERT INTO Participante(IdAluno, IdTurma) values (3,1)
INSERT INTO Participante(IdAluno, IdTurma) values (4,2)
INSERT INTO Participante(IdAluno, IdTurma) values (1,2)
INSERT INTO Participante(IdAluno, IdTurma) values (5,2)
INSERT INTO Participante(IdAluno, IdTurma) values (6,3)
INSERT INTO Participante(IdAluno, IdTurma) values (7,3)
INSERT INTO Participante(IdAluno, IdTurma) values (8,3)
INSERT INTO Participante(IdAluno, IdTurma) values (9,3)
INSERT INTO Participante(IdAluno, IdTurma) values (10,3)
INSERT INTO Participante(IdAluno, IdTurma) values (11,3)
INSERT INTO Participante(IdAluno, IdTurma) values (12,4)
INSERT INTO Participante(IdAluno, IdTurma) values (13,4)
INSERT INTO Participante(IdAluno, IdTurma) values (14,4)
INSERT INTO Participante(IdAluno, IdTurma) values (15,5)
INSERT INTO Participante(IdAluno, IdTurma) values (16,5)
INSERT INTO Participante(IdAluno, IdTurma) values (17,5)
INSERT INTO Participante(IdAluno, IdTurma) values (18,6)
INSERT INTO Participante(IdAluno, IdTurma) values (19,6)
INSERT INTO Participante(IdAluno, IdTurma) values (20,6)
INSERT INTO Participante(IdAluno, IdTurma) values (21,6)


/*RESOLUÇÃO DOS EXERCICIOS*/
/*a*/ SELECT * FROM Curso;
/*b*/ SELECT * FROM Curso WHERE Nome LIKE 'a%';
/*c*/ SELECT * FROM Curso WHERE Nome LIKE '%r';
/*d*/ SELECT A.IdAluno, A.Nome, C.IdCurso, C.Nome as Nome_Do_Curso  
	  FROM Curso AS C
	  JOIN Turma AS T 
	  ON T.IdCurso = C.IdCurso
	  JOIN Participante AS P
	  ON P.IdTurma = T.IdTurma
	  JOIN ALUNO AS A
	  ON A.IdAluno = P.IdAluno
	  WHERE C.Nome LIKE 'a%';

/*f*/ SELECT T.IdTurma, C.Nome AS Nome_Do_Curso, COUNT(P.IdAluno) AS Quantidade_de_Alunos 
	  FROM Turma AS T
	  JOIN Curso AS C ON C.IdCurso = T.IdCurso
	  JOIN Participante AS P ON P.IdTurma = T.IdTurma
	  GROUP BY T.IdTurma, C.Nome;
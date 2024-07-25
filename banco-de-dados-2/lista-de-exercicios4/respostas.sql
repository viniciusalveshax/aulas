--2)
select teacher.name from teacher where teacher.id =
(select student.teacher_id from student where student.name = 'Obi Wan')

-- 3)
select * from
teacher join
student on
teacher.id = student.teacher_id;

--4)
do $$
declare
nome varchar(500);
begin
-- Primeiro pegamos o id do professor
select student.name
into nome
from student where id = 5;

raise notice 'O nome de ID 5 é %', nome;

end $$

--5)
DO $$
DECLARE
maximo real;
nome varchar(50);
nivel real;
BEGIN

SELECT level
INTO maximo
FROM teacher ORDER BY level DESC LIMIT 1; 

RAISE NOTICE 'Máximo %', maximo;

FOR nome, nivel IN
SELECT teacher.name, teacher.level FROM teacher
LOOP
-- Exibimos os valores das colunas da linha atual
RAISE NOTICE 'Professor %, nível % %%', nome, (nivel/maximo)*100;
END LOOP;
END $$;

--6)

-- Solução sem usar uma sub-consulta e usando o tipo record
-- com o tipo record podemos pegar o resultado de uma linha mesmo
-- não sendo uma tabela específica
DO $$
DECLARE
linha record;
BEGIN
-- Usamos um loop FOR para iterar sobre cada linha do join
FOR linha IN
(SELECT teacher.name AS teacher_name, student.name AS student_name, teacher.level AS teacher_level
FROM teacher
RIGHT JOIN student ON teacher.id = student.teacher_id)
LOOP
RAISE NOTICE 'Eu sou %, e fui treinado por %, que tem nível de poder %',
linha.student_name, linha.teacher_name, linha.teacher_level;
END LOOP;
END $$;

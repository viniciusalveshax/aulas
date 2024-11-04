DO $$
DECLARE

NAME TEXT;
LEVEL REAL;

BEGIN

-- Usamos um loop FOR para iterar sobre cada linha da tabela 'teacher'
FOR NAME, LEVEL IN SELECT teacher.name, teacher.level FROM teacher
LOOP

	-- Exibimos os valores das colunas da linha atual
	RAISE NOTICE 'Professor(a) % tem nível %', NAME, LEVEL;

	CASE
		WHEN LEVEL < 50 THEN
		      RAISE NOTICE 'Professor %: Fraco', NAME;
		WHEN LEVEL >= 50 AND LEVEL < 70 THEN
		      RAISE NOTICE 'Professor %: Médio', NAME;
		WHEN LEVEL >= 70 AND LEVEL < 90 THEN
		      RAISE NOTICE 'Professor %: Forte', NAME;
		ELSE
		      RAISE NOTICE 'Professor %: Muito forte', NAME;
	END CASE; 

END LOOP;

END $$;



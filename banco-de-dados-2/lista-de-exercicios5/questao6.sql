
CREATE OR REPLACE FUNCTION calc_average() 
   RETURNS TRIGGER 
   LANGUAGE PLPGSQL
AS $$
DECLARE
   average REAL;
BEGIN

   SELECT AVG(level) INTO average FROM teacher;

   raise notice 'Média %', average; 
   
   UPDATE stats SET average_level = average;
   
END;
$$;
       
     

CREATE TRIGGER trigger_after_update2
   AFTER UPDATE
   ON teacher
   FOR EACH ROW 
       EXECUTE PROCEDURE calc_average();
       
       
       
       
       
       
       


CREATE OR REPLACE FUNCTION increment_teacher_count() 
   RETURNS TRIGGER 
   LANGUAGE PLPGSQL
AS $$
DECLARE
   counter INTEGER;
BEGIN

   SELECT teachers_count INTO counter FROM stats;

   counter := counter + 1; 
   
   UPDATE stats SET teachers_count = counter;
   
END;
$$;

CREATE OR REPLACE FUNCTION decrement_teacher_count() 
   RETURNS TRIGGER 
   LANGUAGE PLPGSQL
AS $$
DECLARE
   counter INTEGER;
BEGIN

   SELECT teachers_count INTO counter FROM stats;

   counter := counter - 1; 
   
   UPDATE stats SET teachers_count = counter;
   
END;
$$;     

CREATE TRIGGER trigger_after_insert2
   AFTER INSERT
   ON teacher
   FOR EACH ROW EXECUTE PROCEDURE increment_teacher_count();
       

CREATE TRIGGER trigger_after_delete2
   AFTER DELETE
   ON teacher
   FOR EACH ROW EXECUTE PROCEDURE decrement_teacher_count();
       
       
       
       
       
       

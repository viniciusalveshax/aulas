CREATE OR REPLACE FUNCTION fun_before_insert() 
   RETURNS TRIGGER 
   LANGUAGE PLPGSQL
AS $$
BEGIN
   raise notice 'Chamei um trigger antes de inserir o registro';
   return NEW;
END;
$$;

CREATE OR REPLACE FUNCTION fun_after_insert() 
   RETURNS TRIGGER 
   LANGUAGE PLPGSQL
AS $$
BEGIN
   raise notice 'Chamei um trigger depois de inserir o registro';
   return NEW;
END;
$$;


CREATE TRIGGER trigger_before_insert 
   BEFORE INSERT
   ON teacher
   FOR EACH ROW 
       EXECUTE PROCEDURE fun_before_insert();
       

CREATE TRIGGER trigger_after_insert 
   AFTER INSERT
   ON teacher
   FOR EACH ROW 
       EXECUTE PROCEDURE fun_after_insert();

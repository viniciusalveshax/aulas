CREATE OR REPLACE FUNCTION fun_before_delete() 
   RETURNS TRIGGER 
   LANGUAGE PLPGSQL
AS $$
BEGIN
   raise notice 'Chamei um trigger antes de deletar o registro';
   raise notice 'Nome era %', OLD.name; 
   return OLD;
END;
$$;


CREATE OR REPLACE FUNCTION fun_after_delete() 
   RETURNS TRIGGER 
   LANGUAGE PLPGSQL
AS $$
BEGIN
   raise notice 'Chamei um trigger depois de deletar o registro';
   raise notice 'Nome era %', OLD.name; 
   return OLD;
END;
$$;
       
    

CREATE TRIGGER trigger_before_delete 
   BEFORE UPDATE
   ON teacher
   FOR EACH ROW 
       EXECUTE PROCEDURE fun_before_delete();
       

CREATE TRIGGER trigger_after_delete
   AFTER UPDATE
   ON teacher
   FOR EACH ROW 
       EXECUTE PROCEDURE fun_after_delete();
       
       
       
       
       
       
       

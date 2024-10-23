CREATE OR REPLACE FUNCTION fun_before_update() 
   RETURNS TRIGGER 
   LANGUAGE PLPGSQL
AS $$
BEGIN
   raise notice 'Chamei um trigger antes de atualizar o registro';
   raise notice 'Nome é % e vai passar a ser %', OLD.name, NEW.name; 
   return NEW;
END;
$$;


CREATE OR REPLACE FUNCTION fun_after_update() 
   RETURNS TRIGGER 
   LANGUAGE PLPGSQL
AS $$
BEGIN
   raise notice 'Chamei um trigger depois de atualizar o registro';
   raise notice 'Nome era % e passou a ser %', OLD.name, NEW.name; 
   return NEW;
END;
$$;
       
    

CREATE TRIGGER trigger_before_update 
   BEFORE UPDATE
   ON teacher
   FOR EACH ROW 
       EXECUTE PROCEDURE fun_before_update();
       

CREATE TRIGGER trigger_after_update
   AFTER UPDATE
   ON teacher
   FOR EACH ROW 
       EXECUTE PROCEDURE fun_after_update();
       
       
       
       
       
       
       

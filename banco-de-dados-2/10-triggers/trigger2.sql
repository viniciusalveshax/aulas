CREATE OR REPLACE FUNCTION fun_before_insert() 
   RETURNS TRIGGER 
   LANGUAGE PLPGSQL
AS $$
BEGIN
   raise notice 'Nome antes do trigger %', NEW.name;
   NEW.name = 'Novo nome';
   return NEW;
END;
$$;

CREATE OR REPLACE FUNCTION fun_after_insert() 
   RETURNS TRIGGER 
   LANGUAGE PLPGSQL
AS $$
BEGIN
   raise notice 'Nome depois do trigger %', NEW.name;
   return NEW;
END;
$$;


CREATE OR REPLACE TRIGGER trigger_before_insert 
   BEFORE INSERT
   ON teacher
   FOR EACH ROW 
       EXECUTE PROCEDURE fun_before_insert();
       

CREATE OR REPLACE TRIGGER trigger_after_insert 
   AFTER INSERT
   ON teacher
   FOR EACH ROW 
       EXECUTE PROCEDURE fun_after_insert();

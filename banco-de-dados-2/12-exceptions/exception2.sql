do
$$
declare
registro record;
teste_id int = 30;
begin
select id into STRICT registro
from teacher where id = teste_id;

-- tratamento da exceção
exception
   when sqlstate 'P0002' then
      raise notice 'Não achei o registro %', teste_id;
end;
$$;

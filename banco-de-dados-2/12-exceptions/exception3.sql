do
$$
declare
denominador int = 0;
begin

raise notice 'Resultado da divisão %', 10/denominador;

exception
   when sqlstate '22012' then
      raise notice 'O valor de denominador é %', denominador;
end;
$$;

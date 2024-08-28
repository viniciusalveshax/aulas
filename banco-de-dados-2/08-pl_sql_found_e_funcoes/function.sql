create function multiplica(valor1 integer, valor2 integer)
   returns integer 
   language plpgsql
  as
$$
begin
   return valor1 * valor2;
end;
$$;


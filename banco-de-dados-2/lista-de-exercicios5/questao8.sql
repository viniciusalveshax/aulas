do $$
declare 
numero integer;
contador integer;
begin
   numero := 15; 
   contador := 0;
   while contador < 10 loop
       contador := contador + 1;
       raise notice 'Número vale %', numero;
	if (contador % 2) != 0 then
	      raise notice '% termina em cinco', numero;
		  insert into teacher (name, level, side) values ('yyy', numero, 'Light side');
	   else
	      raise notice '% não termina em cinco', numero;
		  insert into teacher (name, level, side) values ('yyy', numero, 'Dark side');
	   end if;
	   numero := numero + 5;
	   
   end loop;   
end; $$

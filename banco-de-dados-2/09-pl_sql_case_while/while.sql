do $$
declare 
numero integer;
begin
   numero := 0; 
   while numero < 10 loop
       raise notice 'Número vale %', numero;
	   numero := numero + 1;
   end loop;   
end; $$

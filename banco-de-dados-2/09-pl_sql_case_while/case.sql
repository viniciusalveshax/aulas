do $$
declare 
numero integer;
begin
	select level from teacher into numero where id = 1;
   case numero
   when 100 then
              raise notice 'Nível é 100';
   when 90 then
              raise notice 'Nível é 90';
   else
              raise notice 'Nível não é 100 e nem 90';
   end case;   
end; $$

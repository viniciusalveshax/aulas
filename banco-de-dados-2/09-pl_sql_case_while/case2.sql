do $$
declare 
numero integer;
begin
	select level from teacher into numero where id = 2;
   case 
   when numero <= 100 and numero > 90 then
              raise notice 'Nível está entre 100 e 90';
   when numero <= 90 and numero > 80 then
              raise notice 'Nível está entre 90 e 80';
   else
              raise notice 'Nível é menor ou igual que 80';
   end case;   
end; $$

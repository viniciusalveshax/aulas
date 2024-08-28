do $$
declare
  line teacher%rowtype;
begin  
  select * from teacher
  into line
  where id = 10;
  if not found then
     raise notice 'Não existe um professor com esse ID';
  else
     raise notice 'Nome do professor %', line.name;
  end if;
end $$;

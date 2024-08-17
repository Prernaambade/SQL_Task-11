------------------------------------------2.create function on your own data ------------------------------------------------------------
1. select * from car_order
   select sum(sales) from car_order
------ when sum > 10000 then car sale is 'excellent'
------when sum > 1000 then car sale is 'very good'
------when sum >100 then car sale is 'ok ok '

create or replace function checksale(sale int)
returns varchar as $$
declare
        output varchar;
begin 
     if sale > 10000 then output := 'excellent';
     elsif sale >1000 then output :='very good';
     elsif sale >100 then output:= 'ok ok';
     else output:='poor';
     end if;
     return output;
end 
$$ language plpgsql;

select checksale(10050)

2.select * from car_order
 select sum(profit) from car_order
------ when profit> 10000 then car sale is 'excellent'
------when profit > 1000 then car sale is 'very good'
------when profit >100 then car sale is 'ok ok '

create or replace function checkprofit(profit int)
returns varchar as $$
declare
        output varchar;
begin 
     if profit > 10000 then output := 'excellent';
     elsif profit >1000 then output :='very good';
     elsif profit >100 then output:= 'ok ok';
     else output:='poor';
     end if;
     return output;
end 
$$ language plpgsql;

select checkprofit(50)

----------------------------------------------3.create select and find function---------------------------------------------------------

select * from college_library   

create or replace function checkdays(studentId varchar)
returns varchar as $$
declare
       sumofdays float;
       output varchar;
begin
      select sum(days)into sumofdays from college_library where student_id=studentId;
      if sumofdays < 100 then output := 'No extra charges ';
      else output:='extra charges';
      end if;
      return output;
end;
$$ language plpgsql

DROP FUNCTION checkdays 

select sum(days),student_id from college_library group by student_id

select checkdays ('OP-31975')

select sum(days),student_id,checkdays(student_id)from college_library group by student_id

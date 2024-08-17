----------------------------------------------1.create 5 function on ecom---------------------------------------------------------------------------

select * from sales
1.-- sum of sales 
  select sum(sales)from sales
  select sales, 
	case
          when sales < 0 then 'no sale'
          when sales > 300 then  'good sale'
          when sales > 600 then'best sale'
          when sales > 900 then'great sale'
	      else 'min sale'
  end 
  from sales

create or replace function checksales(sales int)
returns varchar as $$
declare
       sales_status varchar;
begin
     case
          when sales < 0 then sales_status:='no sale';
          when sales > 300 then  sales_status :='good sale';
          when sales > 600 then sales_status:='best sale';
          when sales > 900 then sales_status:='great sale';
	      else sales_status:='no sale';
  end case;
  return sales_status;
end
$$ language plpgsql;

select checksales(200)
select checksales(600)

2.---discount
select discount from sales
--- when discount = o then 'no discount'
--- when discount > 0.2 then 'ok ok discount'
--- when discount > 0.8 then 'good discount'

create or replace function checkdiscount(discount float)
returns varchar as $$
declare
       output varchar;
begin 
      if discount >0.8 then output := 'excellent discount';
      elsif discount >0.2 then output := 'good discount';
      else output :='no discount';
      end if;
      return output ;
end
$$ language plpgsql;
      
select checkdiscount(0.3)

3.-- avg of sales 
  select avg(sales)from sales
  select sales, 
	case
          when sales < 0 then 'no sale'
          when sales > 50 then  'good sale'
          when sales > 100 then'best sale'
          when sales > 150 then'great sale'
	      else 'min sale'
  end 
  from sales

create or replace function checksales(sales int)
returns varchar as $$
declare
       sales_status varchar;
begin
     case
          when sales < 0 then sales_status:='no sale';
          when sales > 50 then  sales_status :='good sale';
          when sales > 100 then sales_status:='best sale';
          when sales > 150 then sales_status:='great sale';
	      else sales_status:='no sale';
  end case;
  return sales_status;
end
$$ language plpgsql;

select checksales(50)
select checksales(150)

4.---sum of profit
select profit from sales
select sum(profit)from sales
	select profit,  case 
			When profit < 500 THEN 'no profit'
			When profit > 100 THEN 'good profit'
			When profit > 1000 THEN 'avg profit'
			When profit > 10000  THEN 'excellent profit'
			Else 'min profit'
		end
from sales

create or replace function checkProfit(profit double precision)
RETURNS varchar AS $$
DECLARE
	    output varchar;
BEGIN
	case 
			When profit < 500  THEN  output := 'min profit' ;
			When profit > 100 THEN output := 'good profit';
			When profit > 1000 THEN output := 'best profit';
			When profit> 10000  THEN output := 'great profit'; 
			Else output := 'no  profit';
	END CASE;
	RETURN output;
END
$$ LANGUAGE plpgsql;

select checkProfit(100)

5.---age
select * from customer
select age from customer
----when age is > 20 then customer is 'young'
----when age is >50 then customer is 'old'
----when age is <20 then customer is 'teenager'
 
create or replace function checkage(age int)
returns varchar as $$
declare
       output varchar;
begin 
      if age > 20 then output := 'young';
      elsif age > 50 then output := 'old';
      else output := 'teenager';
	  end if;
      return output;
end
$$ language plpgsql;
 
select checkage(60)



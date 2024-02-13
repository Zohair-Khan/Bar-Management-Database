Drop schema if exists CocktailDB;
create schema CocktailDB;
use CocktailDB;

create table taste (
    taste_name varchar(20),
    taste_pairing varchar(20),
    primary key (taste_name)
);

create table supplier (
    sup_name varchar(20), 
    sup_representative varchar(20), 
    sup_contact bigint,
    primary key (sup_name)
);

create table ingredients (
    ingredients_name varchar(20),
    ingredients_type varchar(20),
    taste_name varchar(20),
    ingredients_inventory integer,
    sup_name varchar(20),
    ingredients_cost double,
    primary key (ingredients_name),
    foreign key (taste_name) references taste(taste_name),
    foreign key (sup_name) references supplier(sup_name)
);

create table recipe (
    rec_name varchar(20),
    rec_volume double,
    primary key (rec_name)
);

create table recipe_ingredients (
    rec_name varchar(20),
    ingredients_name varchar(20),
    num_units double,
    primary key (rec_name, ingredients_name),
    foreign key (rec_name) references recipe(rec_name),
    foreign key (ingredients_name) references ingredients(ingredients_name)
);    



create table employee (
    emp_id integer,
    emp_name varchar(20),
    emp_role varchar(20),
    primary key (emp_id)
);

create table cocktails (
    c_id integer, 
    rec_name varchar(20),
    c_category varchar(20),
    emp_id integer,
    taste_name varchar(20),
    c_cost double,
    c_price double,
    primary key (c_id),
    foreign key (rec_name) references recipe(rec_name),
    foreign key (emp_id) references employee(emp_id),
    foreign key (taste_name) references taste(taste_name)
);


insert into taste values 
('Spicy', 'Sweet'),
('Sweet','Salty'),
('Bitter','Salty'),
('Sour','Umami'),
('Salty', 'Sweet'),
('Astringent', 'Dilution'),
('Dilution', 'Boozy'),
('Umami', 'Sour'),
('Dry', 'Sour'),
('Boozy', 'Sweet'),
('Smoky', 'Sweet'),
('Botanical', 'Fruity'),
('Fruity', 'Botanical');

insert into supplier values 
('Bellboy', 'Jim Anderson', 6121234567),
('New France Wines', 'John Smith', 6122468102),
('Phillips', 'Mike Hart', 6121357913),
('Breakthru Bev', 'Tommy Lee', 6123456789),
('WCW', 'Brian Johnson', 6125556666),
('US Foods', 'Dwayne Johnson', 7639095637),
('Housemade', null, null);



insert into ingredients values 
('Vodka','Alcohol', 'Boozy' , 10,'WCW', 15.99),
('Gin','Alcohol', 'Botanical' , 20, 'Phillips', 25.99),
('Whiskey','Alcohol', 'Boozy', 20, 'Breakthru Bev', 25.99),
('Lite Rum','Alcohol', 'Boozy' , 15, 'Bellboy', 17.99),
('Dark Rum','Alcohol', 'Boozy' ,12, 'New France Wines', 18.99 ),
('Tequila','Alcohol', 'Boozy' , 30, 'Breakthru Bev', 35.99),
('Scotch', 'Alcohol', 'Smoky', 15, 'Breakthru Bev', 28.99),
('Dry Vermouth', 'Alcohol', 'Dry', 15, 'WCW', 21.99),
('Sweet Vermouth', 'Alcohol', 'Sweet', 18, 'WCW', 22.99),
('Campari', 'Alcohol', 'Bitter', 14, 'Bellboy', 27.99),
('Fernet', 'Alcohol', 'Bitter', 12, 'Breakthru Bev', 25.99),
('Simple Syrup', 'Non Alcohol', 'Sweet', 45, 'Housemade', 0.50),
('Orange Juice', 'Non Alcohol','Sweet', 40, 'US Foods', 4.50),
('Lime Juice', 'Non Alcohol', 'Sour', 40, 'Housemade', 2.70),
('Lemon Juice', 'Non Alcohol', 'Sour', 40, 'Housemade', 3.39),
('Tonic Water', 'Non Alcohol', 'Bitter', 40, 'Bellboy', 1.49); 

insert into recipe values 
('Old Fashioned', 6.0),
('Dirty Martini', 5.0),
('Margarita', 5.0),
('Tom Collins', 8.0),
('Mai Tai', 6.0),
('Vesper', 4.0),
('Penicillin', 7.0),
('Negroni', 6.0),
('Mojito', 3.0),
('Last Word', 4.0),
('Paloma', 5.0);


insert into recipe_ingredients values 
('Old Fashioned', 'Whiskey', 2.0),
('Dirty Martini', 'Gin', 2.0),
('Margarita', 'Tequila', 3.0),
('Tom Collins', 'Gin', 4.0),
('Mai Tai', 'Dark Rum', 3.0),
('Vesper', 'Gin', 4.0),
('Penicillin', 'Scotch', 3.0),
('Negroni', 'Campari', 2.0),
('Mojito', 'Lite Rum', 4.0),
('Last Word', 'Gin', 3.0),
('Paloma', 'Tequila', 4.0);

insert into employee values 
(0000, 'Pete', 'Owner'),
(1001, 'Nick', 'Manager'),
(1002, 'Kevin', 'Bartender'),
(1003, 'Sam', 'Barender'),
(1004, 'Kim', 'Bartender'),
(1005, 'Adam', 'Bartender'),
(1006, 'Travis', 'Manager'),
(1007, 'Marie', 'Bartender'),
(1008, 'Dan', 'Bartender');

insert into cocktails values 
(000, 'Old Fashioned', 'Whiskey', 1002, 'Sweet', 2.10,8.95),
(001, 'Dirty Martini', 'Gin', 1003, 'Salty', 3.35,11.95),
(002, 'Margarita', 'Tequila', 1002, 'Sour', 2.25,8.95),
(003, 'Tom Collins', 'Gin', 1003, 'Dry', 3.70, 11.95),
(004, 'Mai Tai', 'Dark Rum', 1004, 'Sweet', 2.60, 8.95),
(005, 'Vesper', 'Gin', 1008, 'Dry', 3.45, 11.95),
(006, 'Penicillin', 'Scotch', 1003, 'Sour', 3.60, 11.95),
(007, 'Negroni', 'Campari', 1006, 'Bitter', 3.20, 10.95),
(008, 'Mojito', 'Lite Rum', 1005, 'Botanical', 2.90, 10.95),
(009, 'Last Word', 'Gin', 1003, 'Sour', 3.50, 11.95),
(010, 'Paloma', 'Tequila', 1005, 'Sweet', 3.00, 10.95);
/*
-- Shows all ingredients in stock sorted by the supplier name in alphabetical order

SELECT ingredients_name, sup_name, ingredients_inventory
FROM ingredients
ORDER BY sup_name;

-- Shows the cocktails made by one employee with their cost, sale price 
SELECT emp_name, rec_name, c_cost, c_price
FROM cocktails natural join employee
WHERE emp_name = 'Sam';

-- Shows Who made all the Sweet and Sour cocktails 
SELECT rec_name, emp_name, taste_name
FROM cocktails natural join employee
WHERE taste_name = 'Sweet' or taste_name = 'Sour';

-- Shows the inventory from the supplier 
SELECT ingredients_name, ingredients_inventory 
FROM ingredients 
WHERE sup_name = 'Breakthru Bev';

-- Shows the total cost of each recipe
SELECT r.rec_name, SUM(i.ingredients_cost * ri.num_units) AS total_cost
FROM recipe r
JOIN recipe_ingredients ri ON r.rec_name = ri.rec_name
JOIN ingredients i ON ri.ingredients_name = i.ingredients_name
GROUP BY r.rec_name;

-- Trigger 1 
-- This trigger ensures that all employee names are stored in upper case letters to deferentiate employees from ingredients 
delimiter //
create trigger trg_emp_name
before insert on employee
for each row
begin
set new.emp_name = upper(new.emp_name);
end;
// delimiter ;



Create table ingredientLogs(
ingrendientId char(5),
status varchar (30)
);

-- Trigger 2
-- This trigger stores all newly added ingredients to a log (ingredientLogs) to keep track of what has been added.
delimiter //
Create trigger trg_ingredientsInsert
After insert on Ingredients
For each row
Begin
    Declare ingredientId char(5);
    Set ingredientId = new.ingredientId;
    Insert into ingredientLogs Values (ingredientId, 'inserted');
End;

#function that returns a profit margin given a price and a cost
delimiter //
CREATE FUNCTION profitMargin(cost double , price double)
RETURNS Double
deterministic
BEGIN
  DECLARE profit double; 
  SET profit = (price/cost)-1 ;
  RETURN profit;
END //
delimiter ;

#function that returns profit given a price and cost
delimiter //
CREATE FUNCTION profitCalc(cost double , price double)
RETURNS Double
deterministic
BEGIN
  DECLARE profit double; 
  SET profit = price-cost;
  RETURN profit;
END //
delimiter ;

# view that shows the profit coming in from each drink
CREATE VIEW cocktailProfit (CocktailName, RecipeAuthor, Cost, Price, Profit) AS
SELECT rec_name, emp_name, c_cost, c_price, FORMAT(profitCalc(c_cost, c_price), 2)
from cocktails natural join employee;
 

# stored procedure that shows the profit coming in from each employees drinks, as well as each employees profit margins
DELIMITER //
create procedure empMarginProfit()
begin
	select 
    emp_name, 
    FORMAT(sum(c_cost), 2) as TotalCost, 
    FORMAT(sum(c_price), 2) as TotalPrice, 
    FORMAT(profitCalc(sum(c_cost), sum(c_price)), 2) as TotalProfit, 
    CONCAT(FORMAT(profitMargin(sum(c_cost), sum(c_price)) * 100, 2), '%') as ProfitMargin
	from cocktails natural join employee
	group by emp_name;
end //
DELIMITER ;

call empMarginProfit();
*/



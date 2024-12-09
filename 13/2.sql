select *
from restaurant

select max(len(Category))
from restaurant

create table FoodCategory
(
    Id           int identity primary key,
    CategoryName nvarchar(10)
);

create table Food
(
    Id           int primary key identity,
    FoodName     nvarchar(22) not null,
    Price        float        not null,
    Calories     int          not null,
    FoodCategory int foreign key references FoodCategory (Id)
);

insert FoodCategory
select distinct Category
from restaurant

INSERT INTO Food (FoodName, Price, Calories, FoodCategory)
SELECT FoodName, Price, coalesce(Calories, 0), Id
FROM restaurant
JOIN FoodCategory ON CategoryName = Category;

-- The Ingredients column of the Food table contains stacked ingredients separated by slash. Extract the M:N relationship!
-- Create a table for unique ingredients
create table Ingredient
(
    Id   int identity primary key,
    Name nvarchar(50) not null
);
insert Ingredient
select distinct value
from restaurant
cross apply string_split(Main_Ingredients, '/');
-- Create a junction table
-- Set relationships and keys
create table FoodIngredient
(
    Food       int foreign key references Food (Id),
    Ingredient int foreign key references Ingredient (Id),
    primary key (Food, Ingredient)
)
-- Fillup the tables
insert FoodIngredient
select Food.Id, Ingredient.Id
from restaurant
cross apply string_split(Main_Ingredients, '/')
join        Ingredient on Ingredient.Name = value
join        Food on Food.FoodName = restaurant.FoodName
-- Drop the stacked column from the Food table


-- Create a view which contains the cheapest foods from every category. Columns: CategoryName, Foodname, Price.
-- Tip: use the row_number analytic function in a CTE/table-valued subquery and filter by the return value of the analytic function.


create view Cheapest as
select CategoryName, FoodName, Price
from (select CategoryName, FoodName, Price, row_number() over (partition by FoodCategory order by Price asc) as rn
      from Food
      join FoodCategory Fc on Food.FoodCategory = Fc.Id
      ) x
where rn = 1

select * from Cheapest

-- The values in the calories column are given in KCal. Sometimes we will need the values in KJoule. 1 Kcal  = 4.184 kjoule.
-- Create a User Defined Function which accepts KCal as parameter and return the value in KJoule!

create or alter function JOULEGANG(@kcal int) returns float as begin
    return @kcal * 4.184
    end

select dbo.JOULEGANG(120);

declare @chad xml;

set @chad = '<ingredients>
    <ingredient>
        <name>black beans</name>
        <calories>120</calories>
    </ingredient>
    <ingredient>
        <name>quinoa</name>
        <calories>220</calories>
    </ingredient>
    <ingredient>
        <name>sun-dried tomatoes</name>
        <calories>80</calories>
    </ingredient>
    <ingredient>
        <name>smoked salmon</name>
        <calories>180</calories>
    </ingredient>
    <ingredient>
        <name>cauliflower rice</name>
        <calories>25</calories>
    </ingredient>
    <ingredient>
        <name>kiwi</name>
        <calories>50</calories>
    </ingredient>
    <ingredient>
        <name>quorn</name>
        <calories>150</calories>
    </ingredient>
    <ingredient>
        <name>apple</name>
        <calories>30</calories>
    </ingredient>
    <ingredient>
        <name>almond butter</name>
        <calories>95</calories>
    </ingredient>
    <ingredient>
        <name>green onions</name>
        <calories>15</calories>
    </ingredient>
</ingredients>';

insert Ingredient
select X from
(select i.value('(name)[1]', 'varchar(50)') as X from @chad.nodes('ingredients/ingredient') as T(i)) y
left join Ingredient on Name = X
where name is null


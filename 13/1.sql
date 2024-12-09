declare @faggot Xml;

set @faggot = '
<Ratings>
    <Rating>
        <VarietyId>1</VarietyId>
        <Brand>Maruchan</Brand>
        <Variety>35% Less Sodium Beef</Variety>
        <Packagings>Cup/Pack</Packagings>
        <Rating>3.500000</Rating>
    </Rating>
    <Rating>
        <VarietyId>2</VarietyId>
        <Brand>Dragonfly</Brand>
        <Variety>Artificial Chicken</Variety>
        <Packagings>Pack/Bowl</Packagings>
        <Rating>4.250000</Rating>
    </Rating>
    <Rating>
        <VarietyId>3</VarietyId>
        <Brand>Dragonfly</Brand>
        <Variety>Artificial Hot &amp; Sour Shrimp</Variety>
        <Packagings>Bowl/Pack</Packagings>
        <Rating>4.250000</Rating>
    </Rating>
    <Rating>
        <VarietyId>4</VarietyId>
        <Brand>Dragonfly</Brand>
        <Variety>Artificial Pork Ribs</Variety>
        <Packagings>Pack/Bowl</Packagings>
        <Rating>3.750000</Rating>
    </Rating>
    <Rating>
        <VarietyId>5</VarietyId>
        <Brand>Dragonfly</Brand>
        <Variety>Artificial Seafood</Variety>
        <Packagings>Pack/Bowl</Packagings>
        <Rating>3.750000</Rating>
    </Rating>
    <Rating>
        <VarietyId>6</VarietyId>
        <Brand>JML</Brand>
        <Variety>Artificial Spicy Beef</Variety>
        <Packagings>Pack/Bowl</Packagings>
        <Rating>3.500000</Rating>
    </Rating>
    <Rating>
        <VarietyId>7</VarietyId>
        <Brand>JML</Brand>
        <Variety>Artificial Stew Beef</Variety>
        <Packagings>Pack/Bowl</Packagings>
        <Rating>3.750000</Rating>
    </Rating>
    <Rating>
        <VarietyId>8</VarietyId>
        <Brand>Samyang</Brand>
        <Variety>Beef</Variety>
        <Packagings>Cup/Bowl/Pack</Packagings>
        <Rating>3.833333</Rating>
    </Rating>
    <Rating>
        <VarietyId>9</VarietyId>
        <Brand>Paldo</Brand>
        <Variety>Bibim Men</Variety>
        <Packagings>Bowl/Pack</Packagings>
        <Rating>4.375000</Rating>
    </Rating>
    <Rating>
        <VarietyId>10</VarietyId>
        <Brand>Paldo</Brand>
        <Variety>Bul Jjamppong</Variety>
        <Packagings>Bowl/Pack</Packagings>
        <Rating>4.500000</Rating>
    </Rating>
    <Rating>
        <VarietyId>11</VarietyId>
        <Brand>Nongshim</Brand>
        <Variety>Champong Oriental Noodles</Variety>
        <Packagings>Cup/Pack</Packagings>
        <Rating>3.875000</Rating>
    </Rating>
    <Rating>
        <VarietyId>12</VarietyId>
        <Brand>Mama</Brand>
        <Variety>Chand Clear Soup</Variety>
        <Packagings>Bowl/Pack</Packagings>
        <Rating>3.250000</Rating>
    </Rating>
    <Rating>
        <VarietyId>13</VarietyId>
        <Brand>Ottogi</Brand>
        <Variety>Cheese Bokki</Variety>
        <Packagings>Cup/Bowl</Packagings>
        <Rating>3.750000</Rating>
    </Rating>
    <Rating>
        <VarietyId>14</VarietyId>
        <Brand>Mamee</Brand>
        <Variety>Chef Creamy Tom Yam Flavour</Variety>
        <Packagings>Pack/Cup</Packagings>
        <Rating>4.875000</Rating>
    </Rating>
    <Rating>
        <VarietyId>15</VarietyId>
        <Brand>Mamee</Brand>
        <Variety>Chef Curry Laksa Flavour</Variety>
        <Packagings>Pack/Cup</Packagings>
        <Rating>5.000000</Rating>
    </Rating>
    <Rating>
        <VarietyId>16</VarietyId>
        <Brand>Mamee</Brand>
        <Variety>Chef Lontong Flavour</Variety>
        <Packagings>Pack/Cup</Packagings>
        <Rating>5.000000</Rating>
    </Rating>
    <Rating>
        <VarietyId>17</VarietyId>
        <Brand>Myojo</Brand>
        <Variety>Chicken Abalone Flavour</Variety>
        <Packagings>Bowl/Pack</Packagings>
        <Rating>3.625000</Rating>
    </Rating>
    <Rating>
        <VarietyId>18</VarietyId>
        <Brand>Sapporo Ichiban</Brand>
        <Variety>Chicken Flavor</Variety>
        <Packagings>Cup/Pack</Packagings>
        <Rating>3.625000</Rating>
    </Rating>
    <Rating>
        <VarietyId>19</VarietyId>
        <Brand>Sichuan Baijia</Brand>
        <Variety>Chongqing Noodles Burning Dry Noodles</Variety>
        <Packagings>Pack/Bowl</Packagings>
        <Rating>5.000000</Rating>
    </Rating>
    <Rating>
        <VarietyId>20</VarietyId>
        <Brand>Emart</Brand>
        <Variety>Dare You! Habanero Ramen (New Edition)</Variety>
        <Packagings>Pack/Cup</Packagings>
        <Rating>3.625000</Rating>
    </Rating>
    <Rating>
        <VarietyId>21</VarietyId>
        <Brand>Samyang Foods</Brand>
        <Variety>Ganjjampong</Variety>
        <Packagings>Bowl/Pack</Packagings>
        <Rating>4.250000</Rating>
    </Rating>
    <Rating>
        <VarietyId>22</VarietyId>
        <Brand>Paldo</Brand>
        <Variety>Gomtang</Variety>
        <Packagings>Cup/Pack</Packagings>
        <Rating>4.375000</Rating>
    </Rating>
    <Rating>
        <VarietyId>23</VarietyId>
        <Brand>Tradition</Brand>
        <Variety>Imitation Chicken Vegetarian</Variety>
        <Packagings>Cup/Pack</Packagings>
        <Rating>3.750000</Rating>
    </Rating>
    <Rating>
        <VarietyId>24</VarietyId>
        <Brand>MAMA</Brand>
        <Variety>Instant Noodles Coconut Milk Flavour</Variety>
        <Packagings>Pack/Cup</Packagings>
        <Rating>5.000000</Rating>
    </Rating>
    <Rating>
        <VarietyId>25</VarietyId>
        <Brand>Ottogi</Brand>
        <Variety>Jin Ramen (Mild)</Variety>
        <Packagings>Cup/Pack</Packagings>
        <Rating>3.125000</Rating>
    </Rating>
    <Rating>
        <VarietyId>26</VarietyId>
        <Brand>Ottogi</Brand>
        <Variety>Kiss Myon</Variety>
        <Packagings>Pack/Cup</Packagings>
        <Rating>3.750000</Rating>
    </Rating>
    <Rating>
        <VarietyId>27</VarietyId>
        <Brand>Paldo</Brand>
        <Variety>Kokomen Spicy Chicken</Variety>
        <Packagings>Pack/Bowl/Cup</Packagings>
        <Rating>4.750000</Rating>
    </Rating>
    <Rating>
        <VarietyId>28</VarietyId>
        <Brand>Saigon Ve Wong</Brand>
        <Variety>Kung Fu Artificial Pork Flavor</Variety>
        <Packagings>Pack/Bowl</Packagings>
        <Rating>3.375000</Rating>
    </Rating>
    <Rating>
        <VarietyId>29</VarietyId>
        <Brand>Marutai</Brand>
        <Variety>Kuroma-Yu Tonkotsu Kumamoto Ramen</Variety>
        <Packagings>Pack/Bowl</Packagings>
        <Rating>4.000000</Rating>
    </Rating>
    <Rating>
        <VarietyId>30</VarietyId>
        <Brand>Koka</Brand>
        <Variety>Laksa Singapura</Variety>
        <Packagings>Pack/Bowl</Packagings>
        <Rating>4.250000</Rating>
    </Rating>
    <Rating>
        <VarietyId>31</VarietyId>
        <Brand>Sapporo Ichiban</Brand>
        <Variety>Original Flavor</Variety>
        <Packagings>Cup/Pack</Packagings>
        <Rating>3.500000</Rating>
    </Rating>
    <Rating>
        <VarietyId>32</VarietyId>
        <Brand>MyKuali</Brand>
        <Variety>Penang Red tom Yum Goong Noodle Authentic Taste</Variety>
        <Packagings>Pack/Cup</Packagings>
        <Rating>5.000000</Rating>
    </Rating>
    <Rating>
        <VarietyId>33</VarietyId>
        <Brand>Nissin</Brand>
        <Variety>Premium Instant Noodles Roasted Beef Flavour</Variety>
        <Packagings>Bowl/Pack</Packagings>
        <Rating>4.000000</Rating>
    </Rating>
    <Rating>
        <VarietyId>34</VarietyId>
        <Brand>Nissin</Brand>
        <Variety>Premium Instant Noodles Spicy Beef Flavour</Variety>
        <Packagings>Pack/Bowl</Packagings>
        <Rating>3.750000</Rating>
    </Rating>
    <Rating>
        <VarietyId>35</VarietyId>
        <Brand>Sapporo Ichiban</Brand>
        <Variety>Shrimp Flavor</Variety>
        <Packagings>Cup/Pack</Packagings>
        <Rating>2.125000</Rating>
    </Rating>
    <Rating>
        <VarietyId>36</VarietyId>
        <Brand>Ottogi</Brand>
        <Variety>Snack Ramyon</Variety>
        <Packagings>Cup/Pack</Packagings>
        <Rating>3.625000</Rating>
    </Rating>
    <Rating>
        <VarietyId>37</VarietyId>
        <Brand>Nongshim</Brand>
        <Variety>Soon Veggie Noodle Soup</Variety>
        <Packagings>Cup/Pack</Packagings>
        <Rating>5.000000</Rating>
    </Rating>
    <Rating>
        <VarietyId>38</VarietyId>
        <Brand>Wugudaochang</Brand>
        <Variety>Sour Bamboo Shoot &amp; Beef If Hot Pot Flavor Noodles</Variety>
        <Packagings>Bowl/Pack</Packagings>
        <Rating>4.000000</Rating>
    </Rating>
    <Rating>
        <VarietyId>39</VarietyId>
        <Brand>Sakurai Foods</Brand>
        <Variety>Soy Sauce Ramen</Variety>
        <Packagings>Bowl/Pack</Packagings>
        <Rating>4.500000</Rating>
    </Rating>
    <Rating>
        <VarietyId>40</VarietyId>
        <Brand>Thai Kitchen</Brand>
        <Variety>Spring Onion Rice Noodle</Variety>
        <Packagings>Pack/Bowl</Packagings>
        <Rating>3.750000</Rating>
    </Rating>
    <Rating>
        <VarietyId>41</VarietyId>
        <Brand>Master Kong</Brand>
        <Variety>Tomato Sauce Instant Noodle</Variety>
        <Packagings>Bowl/Pack</Packagings>
        <Rating>4.250000</Rating>
    </Rating>
    <Rating>
        <VarietyId>42</VarietyId>
        <Brand>Nongshim</Brand>
        <Variety>Udon</Variety>
        <Packagings>Bowl/Pack</Packagings>
        <Rating>4.125000</Rating>
    </Rating>
    <Rating>
        <VarietyId>43</VarietyId>
        <Brand>Nissin</Brand>
        <Variety>Yakisoba</Variety>
        <Packagings>Pack/Tray</Packagings>
        <Rating>5.000000</Rating>
    </Rating>
</Ratings>';


drop table #kike;
select c.value('(VarietyId)[1]', 'int')            as VarietyId,
       c.value('(Brand)[1]', 'nvarchar(100)')      as Brand,
       c.value('(Variety)[1]', 'nvarchar(100)')    as Variety,
       c.value('(Packagings)[1]', 'nvarchar(100)') as Packagings,
       c.value('(Rating)[1]', 'float')             as Rating
into #kike
from @faggot.nodes('/Ratings/Rating') as gsgsdgsd(c);

select max(len(Variety))
from #kike

select *
from #kike
--where cast(brand as varchar(max)) != Brand;

-- Create two tables: Ramen and Brand.
--
-- Ramen should contain all soup-related information except Brandname, including the stacked packagings
-- Brand should contain the brandname, and an identity column as a primary key.
-- Construct the tables and connect them by defining primary and foreign keys.
drop table if exists RamenPackaging;
drop table if exists Ramen;
drop table if exists Brand;

create table Brand
(
    BrandId   int identity primary key,
    BrandName varchar(15) not null
);
create table Ramen
(
    VarietyId  int primary key not null,
    BrandId    int             not null foreign key references Brand (BrandId),
    Variety    varchar(50)     not null,
    Packagings varchar(50)     not null,
    Rating     float           not null
);

insert Brand
select distinct Brand
from #kike

insert into Ramen
select VarietyId, BrandId, Variety, Packagings, Rating
from #kike
join Brand on Brand = BrandName

select *
from Ramen

-- Extract the M:N relationship between ramend and packagings.
--
-- Create a Packaging table for storing unique packagings
-- Create a junction table between Ramen and Packaging
-- Fill up tables
-- Set primary and foreign keys
-- Remove the stacked packaging column from Ramens
drop table if exists Packagings;
create table Packagings
(
    PackagingId   tinyint identity primary key not null,
    PackagingName varchar(4)                   not null
)

insert Packagings
select distinct value
from Ramen
cross apply string_split(Packagings, '/')

create table RamenPackaging
(
    PackagingId tinyint not null foreign key references Packagings (PackagingId),
    VarietyId   int     not null foreign key references Ramen (VarietyId),
    primary key (PackagingId, VarietyId)
);

insert RamenPackaging
select PackagingId, VarietyId
from Ramen
cross apply string_split(Packagings, '/')
join        Packagings on value = PackagingName

select *
from RamenPackaging

alter table Ramen
    drop column Packagings
select *
from Ramen


-- Write a query which constructs an xml with the following structure:
--
-- <Brands>
--   <Brand Id="1">
--     <Name>Dragonfly</Name>
--     <AverageRating>4.00</AverageRating>
--     <Ramens>
--       <Ramen>
--         <RamenId>2</RamenId>
--         <Variety>Artificial Chicken</Variety>
--       </Ramen>

select BrandId                                                                           as [@Id],
       BrandName                                                                         as Name,
       (select format(avg(Rating), 'n2') from Ramen where Brand.BrandId = Ramen.BrandId) as AverageRating,
       (select VarietyId as RamenId,
               Variety
        from Ramen
        where BrandId = Brand.BrandId
        for xml path ('Ramen'), type)                                                    as Ramens
from Brand
for xml path ('Brand'), root('Brands');

-- Create a view which lists the variety count and average rating grouped by the BrandName.
create view RAMENGANG as
select BrandId, count(distinct VarietyId) as NumberOfVarieties, avg(Rating) as AvgRating
from Ramen
group by BrandId

-- Create a function which returns category names for ratings. One input variable which is a floating point number, the output should be Poor, Fair or Good.
--
-- Poor if the input value is under 4,
-- Fair between 4 and 4.5,
-- Excellent above 4.5

create or alter function GetRatingName(@Rating float) returns varchar(9)
begin
    return case
               when @Rating < 4 then 'Poor'
               when @Rating > 4.5 then 'Excellent'
               else 'Fair'
        end
end

select dbo.Getratingname(3), dbo.Getratingname(4), dbo.Getratingname(5);

-- Write a stored procedure which receives a brandname and prints out the varieties of the brand with rating information.
-- Sample output (proc called with parameter  'JML'):

create or alter procedure CHAD(@BrandName varchar(15)) as
begin
    declare @rating float;
    declare @name varchar(50)
    declare banana cursor for select Variety, Rating
                              from Ramen
                              join Brand B on B.BrandId = Ramen.BrandId
                              where BrandName = @BrandName;
    open banana;

    fetch next from banana into @name, @rating;

    while @@FETCH_STATUS = 0 begin
        print @name + ' has a rating of ' + format(@rating, 'n2')
        fetch next from banana into @name, @rating;

    end

    close banana
    deallocate banana
end

go;
exec dbo.Chad 'JML';
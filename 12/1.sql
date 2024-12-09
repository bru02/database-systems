-- Our Countries table now only contains 2-character countrycode. Extend this with countryname and region
-- name!
-- • Import the importcountries.csv (Moodle)
-- • Measure the maximum length of the Country_Name column.
-- • Add a new column (CountryName) to our Country table, the length should be equal to the previous result.
-- • Update the column based on the imported data.
-- • Check if every country code from our Country table is present in the
-- "importcouintres.two_letter_country_code" column
-- • If there is a missing country, update it manually in the Country table
-- • In most cases the country name is in an unwanted format, e.g. "Hungary, Republic of". Update the Country
-- table so only the first part (ending with a comma) remains in the CountryName column.

select max(len(Country_Name)) from importcountries; -- 51

alter table Country
    add CountryName nvarchar(51);

update Country
set CountryName = i.Country_Name
from importcountries i
where Country.GenreName = i.two_letter_country_code;
update Country
set CountryName = case
                    when charindex(',', CountryName) > 0
                    then left(CountryName, charindex(',', CountryName) - 1)
                    else CountryName
                  end;
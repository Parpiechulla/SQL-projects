-- Select the part of the data that we are going to be working with 

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM covid.deaths 
ORDER BY location, date 

-- % of cases that lead to deaths 
SELECT location, date, total_cases, total_deaths, ROUND((total_deaths/total_cases)*100, 2) as mortality_rate
FROM covid.deaths 
WHERE location = 'Nigeria'
ORDER BY 1,2 



-- What percentage of population had covid (Nigeria)
SELECT location, population, date, total_cases, ROUND((total_cases/population)*100, 2) AS percentage_cases
FROM covid.deaths
WHERE location = 'Nigeria'
ORDER BY date desc
LIMIT 1



-- Countries with highest infetcion rate
SELECT location, population, MAX(total_cases) AS infection_count, ROUND(MAX(total_cases/population)*100, 2) AS infection_rate
FROM covid.deaths
WHERE continent IS NOT NULL
GROUP BY 1,2
ORDER BY infection_rate DESC 


--Countries with the highest mortality rate 
SELECT location, population, MAX(total_deaths) AS death_count, ROUND(MAX(total_deaths/population)*100, 2) AS death_rate
FROM covid.deaths
WHERE continent IS NOT NULL
GROUP BY 1, 2
ORDER BY death_rate DESC


-- Countries with the most deaths 
SELECT location, population, MAX(total_deaths) AS death_count
FROM covid.deaths
WHERE continent IS NOT NULL
GROUP BY 1, 2
ORDER BY death_count DESC


-- Deaths by Continent 
SELECT location, population, MAX(total_deaths) AS death_count, (Max(total_deaths)/population)*100 AS mortality_rate
FROM covid.deaths
WHERE continent IS NULL
GROUP BY 1, 2
ORDER BY mortality_rate DESC


 -- Global Numbers 
SELECT date,population, (SUM(new_cases)) AS worldwide_cases, SUM(new_deaths) AS worldwide_deaths
FROM covid.deaths
WHERE continent IS NOT NULL
GROUP BY date, population
ORDER BY date


Combine deaths table with vaccination table
SELECT *
FROM covid.deaths as deaths
  Join covid.vaccinations as vacc
  ON deaths.date = vacc.date

-- Total Population vs Vaccinations: This query gives a result indicating the number of people who got vaccinated on a daily basis (date), per location (country) 

CREATE VIEW covid.firstview AS
SELECT deaths.continent, deaths.location, deaths.date, deaths.population, vacc.new_vaccinations, SUM(vacc.new_vaccinations) OVER (PARTITION BY deaths.location ORDER BY deaths.location, deaths.date) AS country_vaccination 
FROM covid.deaths as deaths
  Join covid.vaccinations as vacc
  ON deaths.date = vacc.date AND deaths.location = vacc.location
WHERE deaths.continent IS NOT NULL 
-- ORDER BY deaths.location, deaths.date  


 
WITH vacc_roll_count AS
(
SELECT deaths.continent, deaths.location, deaths.date, deaths.population, vacc.new_vaccinations, SUM(vacc.new_vaccinations) OVER (PARTITION BY deaths.location ORDER BY deaths.location, deaths.date) AS country_vaccination 
FROM covid.deaths as deaths
  Join covid.vaccinations as vacc
  ON deaths.date = vacc.date AND deaths.location = vacc.location
WHERE deaths.continent IS NOT NULL AND deaths.location = "Albania" 
ORDER BY deaths.location, deaths.date
)

-- SELECT *

-- FROM vacc_roll_count

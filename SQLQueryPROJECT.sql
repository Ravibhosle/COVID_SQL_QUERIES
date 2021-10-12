CREATE DATABASE COVIDPROJECT;
 
 SELECT *
 FROM COVIDPROJECT..covidvaccinations
 ORDER BY 3,4;

 SELECT *
 FROM COVIDPROJECT..coviddeaths
 ORDER BY 3,4;

 --Looking at total cases vs total deaths
 SELECT location,date,total_cases,total_deaths,(total_deaths/total_cases*100) AS DeathsPercentage
 FROM COVIDPROJECT..coviddeaths
 ORDER BY 1,2;

 SELECT location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 AS DeathsPercentage
 FROM COVIDPROJECT..coviddeaths
 WHERE location LIKE '%india%'
 ORDER BY 1,2;
 
 SELECT location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 AS DeathsPercentage
 FROM COVIDPROJECT..coviddeaths
 WHERE location LIKE '%states%'
 ORDER BY 1,2;

 -- looking at total cases vs population
 -- shows what percentage of population got covid
 SELECT location,date,population,total_cases,(total_cases/population)*100 
 FROM COVIDPROJECT..coviddeaths
 WHERE location LIKE '%india%'
 ORDER BY 1,2;

 -- looking at countries with Highest infection rate compared to population
 SELECT location,population,MAX(total_cases) AS HighestInfectioncount,MAX((total_cases/population))*100  as PercentPopulationInfected
 FROM COVIDPROJECT..coviddeaths
 GROUP BY location,population
 ORDER BY PercentPopulationInfected DESC;

 --countries with Highest death rate per population
 SELECT location,population,MAX(total_deaths) AS HighestDeathcount,MAX((total_deaths/population))*100 
 as PercentPopulationDeath FROM COVIDPROJECT..coviddeaths
 GROUP BY location,population
 ORDER BY PercentPopulationDeath DESC;

 SELECT location,MAX(CAST(total_deaths AS INT)) AS HighestDeathcount
 FROM COVIDPROJECT..coviddeaths
 GROUP BY location
 ORDER BY HighestDeathcount DESC;

 SELECT 
 * FROM COVIDPROJECT..covidvaccinations
 ORDER BY 3,4;

 -- joining the two tables
 SELECT *
 from COVIDPROJECT..coviddeaths
 JOIN
 COVIDPROJECT..covidvaccinations
 ON  coviddeaths.location = covidvaccinations.location
 AND coviddeaths.date = covidvaccinations.date ;

 --Looking at  total vaccinations
 SELECT location,MAX(CAST(total_vaccinations AS INT)) AS total
 FROM COVIDPROJECT..covidvaccinations
 GROUP BY location
 ORDER BY total desc;







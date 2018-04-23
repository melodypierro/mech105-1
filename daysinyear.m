%% Homework 4
% 
% Melody Pierro
% 
% Mech 105
% 
% 1/31/2018
%% Counting the Days
function [totaldays] = daysinyear(mo,da,leap)
%This function determines how many days have past after you enter the date
%and year. It will acount for the leap years.
%inputs:
% mo = month, inserted in numerical values
%da = days for the date desired
%leap = refers to the leap year and if there is an added day
%output:
%totaldays = the total number of days up to the date entered
% 

clear
clc
clear all

%input desired month
mo = input('What month do you desire to look at?\n');

%input desired day of the month
da = input('What day of the month are you looking at?\n');

%input desired year
leap = input('What year are you looking at?\n');

totaldays = 0;
%this matrix is used for a regular year, meaning it is not a leap year
calmatrix = [31 59 90 120 151 181 212 242 272 303 333 364];
%this matrix will be used if the year in question is a leap year, adding
%one day to Febuary
leapyearmatrix = [31 60 91 121 152 182 213 243 273 304 334 365];
%possibleleap --> this is a way of checking if the year entered is a leap
%year because if it is a leap year the remainder will be a whole real
%number
possibleleap = rem(leap, 4);
% this if loop tests if the year is a leap year and if not then it refers
% back to the regular yearly schedule
if isreal(possibleleap)
    totaldays = leapyearmatrix(:, mo - 1) + da;
    fprintf('The number of days that have passed is %4.2f days\n', totaldays);
else 
    totaldays = calmatrix(:,mo-1) + da;
    fprintf('The number of days that have passed is %4.2f days\n', totaldays);
end

end
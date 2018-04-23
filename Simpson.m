function [I] = Simpson(x,y)
% this function will provide an estimate to the integral of a given function's values 
%input:
% x = x values from the function (independent values)
% y = y values corresponding to the x values (dependent values)
%outputs:
% I = estimated value for the integral

if nargin =~ 2 %checking the number of inputs
    error('please make sure there are the correct amount of inputs')
end
n = length(x); %taking note of the number of values in x

segs = diff(x);
if segs(1,1) ~= segs(1,n)
    error ('the x values are not evenly spaced')
end

if n ~= length(y) %this checks if the length of x equals the length of y
    error(the length of x is not equal to the length of y)
end
%this checks the number of segments in the x value, used to determine if
%the code is odd lengthed or even lengthed
secs = length(x) - 1;

if mod(secs,2) == 0 %this checks to see if there are an odd number of values in x -- meaning we have to use the trapazoid rule
    t = 1;
else t = 0;
    disp ('the trapazoid rule will be used since the number of segments is odd')
end
%creating variables a and b for the upper and lower bounds 
b = x(length(x)); % upper limit
a = x(1); %lower limit
ba = (b-a); %front value of the equation
xodd = find(rem(n,2)~=0); %finds all the odd x values
xeven = find(rem(n,2) = 0); %find all the even x values
Iodd = 2 * y(xodd); %multiplying the odd terms by 2
Ieven = 4 * y(xeven); %multiplying the even terms by 4

if t = 1 %if the trapazoid rule does not need to be used then the code will just use the composite simpsons 1/3 rule
    I = (ba/(3*n)) * (sum(Iodd) + sum(Ieven) - y(1)*2 + y(1) - y(n));
else
    I = ((ba/(3*n)) * sum(Iodd) + sum(Ieven) - y(1)*2 + y(1) - y(n-1)*4 -y(n) +y(n-1)) + ((ba/2) * (y(n) - y(n-1)));
end

I

end


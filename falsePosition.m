function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxiter)
%this function estimates the root of a given function using a false
%position equation
%inputs:
%func = the function being evaluated
%xl = lower guess
%xu = upper guess
%es = the desired relative error - optional (default to 0.0001%)
%maxiter = the maximum number of iterations - optional (default to 200)
%outputs:
%root = the estimated root location of func
%fx = function evaluated at the root location
%ea = the approxiate relative error (%)
%iter = how many iterations were performed
%   

format long

%make sure that users enter the correct number of inputs
if nargin <4 && nargin >2
    es = 0.0001;
    maxiter = 200;
elseif nargin <5 && nargin >3
    maxiter = 200;
elseif nargin< 3
    error('you need to enter at least three inputs')
elseif nargin > 5
    error('cannot enter more than five inputs, please enter no less then three or more than five')
end

%checking if both entries are on the same side of the axis
if xl*xu > 0 
    error('enter two points that are on different sides of the axis')
end

%seting iter to zero
iter = 0;
while iter< maxiter %makes sure that the cycle ends if either the maxiter 
    %is hit or the approximate error is greater than the desired error
    prevx = xl; %sets the previous bound as the upper bound
    fpr = (xu - ((func(xu) * (xl - xu))/(func(xl) - func(xu))));
    iter = iter +1; %adds to the iteration each cycle
    if fpr ~= 0  %assuming that the code will not get the correct root it will calculate the error
        ea = (abs(fpr - prevx)/(fpr))*100; %approximate relative error calculation
    end
    if func(xl)*func(fpr)<0
        xu = fpr;
    elseif func(xu)*func(fpr)<0
        xl = fpr;
    else 
        ea = 0;
    end
    root = fpr;
    fx = func(fpr);
end
formatspec = ('The root is %12.5f , the function value at the root is %12.5f , the approximate error value is %12.5f , and the number of iterations that the code cycled through is %12.5f');
fprintf(formatspec, root, fx, ea, iter)


end


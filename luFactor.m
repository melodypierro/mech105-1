function [L, U, P] = luFactor(A)
%luFactor is used to create a lower and upper matrix from the original A
%matrix and keep track of the changes in rows using the P matrix
%   This function is meant to use the input A to create a lower triangular
%   matrix filled with the terms used to create the upper matrix which is
%   outputed as U and is filled with the new coefficients for the
%   functions. The P matrix keeps track of pivoting and which rows are
%   switched in the pivoting process
%Inputs:
% A - coefficient matrix
%Outputs:
% L - lower triangluar matrix
% U - upper triangular matrix
% P - pivot matrix
%Created by: Melody Pierro
%03/26/2018

%make sure that there is a correct amount of inputs
if nargin ~= 1
    error ('please only enter your coefficient matrix (A)')
end

% counting the number of rows & columns of A
[r,c] = size(A);

%make sure that the matrix that is entered is square
if r ~= c
    error ('please check that the matrix(A) you entered has as many columns as it does rows')
end

%fining the number of rows in A
y = length(A);
%since U is a different version of A, the starting values of U is A
U = A;
%set starting L & P values 
L = eye(y);
P = L;

%Partial pivoting
for k = 1:y %makes the code go through each column
    [pivot p] = max(abs(U(k:y, k))); %finding the max value in that column
    p = p + k -1;
    if p ~= k
        %pivoting rows p & k in U
        piv = U (k, :);
        U(k, :) = U(p, :);
        U(p, :) = piv;
        %pivoting rows p&k in P
        piv = P(k, :);
        P(k, :) = P(p,:);
        P(p, :) = piv;
        if k>=2 %
            piv = L(k, 1 : k-1);
            L (k, 1 : k-1) = L(p, 1 : k-1);
            L(p, 1 : k-1) = piv;
        end
    end
    %elimination of the variables in U 
    for j = k +1 : y
        L(j,k) = U(j,k) / U(k,k); % puts the elimination factor into L
        U(j,:) = U(j,:) - L(j,k) * U(k,:); %replaces the old U value with the new one
    end
    
end
    
L = L
U = U
P = P
end


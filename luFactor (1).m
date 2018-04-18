function [L,U,P] = luFactor(A)
%luFactor uses LU factorization of matrixes to solve for matrix varribles.
%Partial pivoting and backwards substitution is used to solve matrix. it
%makes sure the inputed varrible is a square matrix
%   Syntax:
%       [L,U,P]=luFactor(A)
%   Inputs:
%       A - coefficient matrix (square)
%   Outsputs:
%       L - lower triangular matrix
%       U - upper triangular matrix
%       P - the pivot matrix

% Number of argument inputs must be 1 
if nargin < 1
    error('Please enter a matrix');
elseif nargin > 1
    error('Please enter only one');
end

%Check to see if A is a square matrix
[m,n]=size(A);
if (m/n)~=1
    error('Please enter a square matrix');
end

% Set L matrix as an I matrix
L=eye(m);

%Set U matrix for minipulation
U=A;

% Set P matrix to track pivoting
P=L;

for iter=1:m-1 % runs the gaussian elemination method through the proper numnber of iterations
    
    %Pivot the greatest value of the A matrix to the top of the matrix
    Question=U(:,iter); %Single row vertical matrix used to find max vale of row
    
    % Finds the rown number with largest absolute value
    rowCheck=iter-1; % setting counter forrow number with the largest absolute value
    Max=Question(iter,1);
    for i=iter:m
        if abs(Max) <= abs(Question(i,1))
            Max = Question (i,1);
            rowCheck=i;
        end
    end
    
    %Swapping rows so the abs greates value in the top collum of the
    %elimanation prossess
    A([iter rowCheck],:) = A([rowCheck iter],:);
    P([iter rowCheck],:) = P([rowCheck iter],:);
    U([iter rowCheck],:) = U([rowCheck iter],:);
    if iter > 1
        if rowCheck ~= iter
            count = 0;
            for l=1:(iter-1)
                L([iter+(m*count) rowCheck+(m*count)]) = L([rowCheck+(m*count) iter+(m*count)]);
                count=count+1;
            end
        end
    end
        
        
    
    %Eliminating varribles in the U matrix using guassian elimination
    for j=iter+1:m
        KillerMultiplier=U(j,iter)/U(iter,iter);
        L(j,iter)=KillerMultiplier;
    end
    
    for k=iter+1:m
        KillerRow=U(iter,:)*L(k,iter);
        EliminationRow = U(k,:)-KillerRow;
        U(k,:)=EliminationRow;
    end
    
end
end


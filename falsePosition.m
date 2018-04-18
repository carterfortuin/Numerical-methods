function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxiter)
%False Position uses the false positiopn method for entering roots. User
%inputs a polynomial fuction with upper and lower bounds and the
%falsePosition estimates the roots.
%   Inputs: 
%       func - INCLUDE @(X) WITH THE FUNCTION, the function being
%              evaluated. THE BOUNDS MUST EXIST
%       xl - the lower bound
%       xu - the upper bound
%       es - OPTINAL the desired relative error (default to 0.0001%)
%       maxiter - OPTINAL the number of iterations desired (default to 200)
%   Outputs:
%       root - the estimated root location
%       fx - the function evaluated at the root location
%       ea - the approximate relative error (%)
%       iter - how many iterations were performed
% WRITTEN BY: CARTER FORTUIN 
% LAST EDDITTED 02/22/2018

% checking the number of arguments inputed and setting defaluts
if nargin < 3 % too few inputs
    error('falsePosition requires at least 3 inputs') 
elseif nargin == 3 % minimum inputs
    es = 0.0001;
    maxiter = 200;
elseif nargin == 4 
    maxiter = 200;
elseif nargin >= 6 % more inputs that required
    error('Too many inputs')
else
    
end

% setting varribles
fx = func;                   %output
ea = 100;                    %Setting error at 100%
count = 1;                   %Starting counter at 1 for vector addressing
yl = (func(xl));             % "y" varrible in the slop formula for lower bound
yu = (func(xu));             % "y" varrible in the slope formula for upper bound
newestRoot = 0;    


%while the error is less than the the desired error AND while the
%iterations (count - 1) are less than 200 iterations
while ea > es && count <= maxiter 
       
   if (yl*yu) > 0 %multiplying the limits should be a negitive number of they did not bracket a root
        error('There is no root in the given interval');

   elseif (yl*yu) < 0 %calculating the root        
        
        % equation for false position
        newestRoot = (((yu*(-1))*(xu-xl))/(yu-yl))+xu;
        rootVector(count+1)=newestRoot;
        
        % equation to calculate error
        ea = (abs((rootVector(count+1)-rootVector(count))/rootVector(count+1)))*100;
        eaaVector(count+1)=ea;
        
        yNew=func(newestRoot);
        
        % reassign the interval
        if yNew*yu < 0
            xl = newestRoot;
        elseif yNew*yl <0
            xu = newestRoot;
        end
        
        % next iteration
        count = count+1; 
        
        root = rootVector(count);
        iter = count-1;
     
   else(yl*yu)==0 %If one of the bounds is a root
        % finding which bound is a root and setting outputs
        if yl*1==0 
            fprintf('your upper bound is a root')
            root = xl;
            ea = 0;
            iter = 0;
        else
            fprintf('your lower bound is a root')
            root = xu;
            ea = 0;
            iter = 0;
        end
   end
end
% root
% fx
% ea
% iter
end


        
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


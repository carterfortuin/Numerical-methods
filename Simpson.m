function [I] =  Simpson(x,y)
%Simpson uses the simpson 1/3 rules to estamate the itegral of none
%countinous data. The independent varrible must be equally spaced. If there 
% is an odd number of spaces between the seconts of data, the trapazoid 
% method will be used to estimate the final section.
%   Inputs: 
%       x is the independant varrible, an equally spaced array
%       y is the dependant varrible
%   Outputs:
%       I is the estimated integral   

% Checking number of inputs, 

if nargin > 2
    error('Too many inputs');
elseif nargin < 2
    error('Too few inputs');
end

% creating varribles for the length of vectors

xlength=length(x);
ylength=length(y);

% Checking to make sure the x and y vector are the same length and greater
% than 1 varrible

if xlength < 2
    error('vector contains single varrible, Integral will equal 0, go learn some calculus to understand why.');
elseif xlength ~= ylength
    error('The number of independant and dependant varribles are not equal');
end

% Checking to make sure that the spacing for x varrible is equal
for i=1:xlength-2
    left=x(i+1)-x(i); % difference between the 1st, etc, x values
    right=x(i+2)-x(i+1); % difference between 2nd, etc, x values
    if left ~= right % comparing those varrible created above
        error('independant varrible is unequally spaced');
    end
end

% Warn user if the the trapazodial methed is used or not.
trapcheck=(x(xlength)-x(1))/2; %creates a varrible to check if even or odd number of sections
if trapcheck ~= ceil(trapcheck) % if the sections are odd, trapcheck will be a decimal
    warning('The trapozodial method will be used on the last section');
    usetrap=1; % used later to initiate trapazoidal estimation on last section
else
    usetrap=0; % used later  NOT initiate trapazoidal estimation on last section
end

% Setting number of iterations that simpsons rule needs to be used
iter=0; %number of iterations
if usetrap == 1 %TRAP IN USE
    iter=((xlength-1)-1)/2; % 3 x values is 1 iter of simpsons 1/3 so if length:iter.
                            % 3:1, 5:2, 7:3
else  
    iter=((xlength-1))/2 ; % same idea but we dont need to remove the trap from the inter calc
end
    
% estimating the integral
I=0; %creating integral varrible
if usetrap == 1 %only useing the 1/3 rule and trap  
    for i=1:iter %iter is based on the above section
        I=((x(i+i+1)-x(i+i-1))*((y(i+i-1)+4*(y(i+i))+y(i+i+1))/6))+I; % adds each itteration of the 1/3 rule. 
    end
    I=I+((x(xlength)-x(xlength-1))*(y(ylength)+y(ylength-1))/2); % trap section, only calculate one section as a remander section
else % using the 1/3 rule WITHOUT TRAP, see explinations above
    for i=1:iter
        I=((x(i+i+1)-x(i+i-1))*((y(i+i-1)+4*(y(i+i))+y(i+i+1))/6))+I;
    end
end
    
end


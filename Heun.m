function [t,y] = Heun(dydt,tspan,y0,h,es,maxit)
%The Heun function to aproximate the values along a ordinary differential 
%equation points given to the funtion. 
%   Heun's method takes a Euler's method aproximation of an ODE
%   and uses an average method to get a more accurate data point. It
%   takes the Euler's estimations as the two slope end points and averages them
%   together. outputs include a graph of the output values for t and y
%  
%   Inputs:
%       dydt:  the ordinary differential equation being investigated, enter
%              as anonomus function
%      
%       tspan: the time span that the ODE covers wrieten ex: [0 2] for 2
%              seconds
%       
%       y0:    the starting condition y value
%       
%       h:     step size ex: 0.5 for half a second steps, smaller step sizes
%              will increase output accuracy
%       
%       es:    OPTINAL, accuracy estimation. default if empty is 0.0001
%      
%       maxit: OPTINAL, max number of iterations. default if empty is 50
%   
%   Output:
%       
%       t:     last time point
%       
%       y:     last y value for ODE
%       
%       Graph of t and y

% setting nargin boundries, and creating default conditions if inputs are
% left empty
if nargin > 6
    err('Too many inputs')
elseif nargin < 4
    err('too few inputs')
elseif nargin == 4
    es=0.0001;
    maxit=50;
elseif nargin == 5
    maxit = 50;
end

%% setting the t vector using the tspan
TimeStart=tspan(1);
TimeEnd=tspan(2);

% checking and setting time window to fit with step size, rounding the data point to next step size if time window is too small
TimeCheck=TimeEnd/h;
if TimeCheck ~= ceil(TimeCheck)
    warning('step size does not fit evenly in time span, will calculate with odd data point');
    % Calculates the reaminder in the time window and creates a vector with
    % of the time span with the remainder as the last element
    TimeEndLengthShort=floor(TimeCheck); %Length of vector without remainder
    TimeEndRemainder=TimeEnd-(TimeEndLengthShort*h); % Remainder value of time
    TimeEndShort=(TimeEndLengthShort*h); %Time value at end with out reaminder
    TimeSpan=[TimeStart:h:TimeEndShort]; %Vecotr of time without remainder
    TimeEndLong=(TimeEndShort+TimeEndRemainder); %Value of remainder in time
    TimeSpan=[TimeSpan,TimeEndLong]; %Adding remainder to the end of the vector
else% The step size fits nicely into the time span, making the time vector
    TimeSpan=[TimeStart:h:TimeEnd];
end

% Setting vector for y values
y=[];
y(1)=y0;


%% Running Euler's method then correcting using Heun's Method
%setting error and iteration bounds
iter=0;
err=100;
for i = 1:(length(TimeSpan)-1) %run the correction for each point
    y(i+1)=y(i)+h*dydt(y(i),TimeSpan(i));%Eulers Method
    yold=y(i+1);
    while iter < maxit && es < err %Heun's method
        y(i+1)=y(i)+(h/2)*(dydt(y(i),TimeSpan(i))+dydt(y(i+1),TimeSpan(i+1)));
        ynew=y(i+1);
        err=(ynew-yold)/ynew; %Error check
        y(i+1)=ynew;
        iter=iter+1;
    end
end       
t=TimeSpan;

%% Plotting a graph of the data
plot(t,y);
xlabel('Time')
ylabel('y')
title('Time vs y')

end


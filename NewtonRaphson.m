x = 55;
x_old = 100;
x_true = 23.805;
iter = 0;
while abs(x_old-x) > 10^-4 && x ~= 0
    x_old = x;
    x = x-((x*0.687289278791-16.3610249337)/(0.687289278791));
    iter = iter + 1;
    fprintf('Iteration %d: x=%.20f, err=%.20f\n', iter, x, x_true-x);
    %pause;
end
%%

figure; hold on;
syms x
f=-1.5*x^6 - 2*x^4 + 12*x
a=0;                            % start of interval
b=2;                            % end of interval
epsilon=0.000001;               % accuracy value
iter= 50;                       % maximum number of iterations
tau=double((sqrt(5)-1)/2);      % golden proportion coefficient, around 0.618
k=0;                            % number of iterations


x1=a+(1-tau)*(b-a);             % computing x values
x2=a+tau*(b-a);

f_x1=f(x1);                     % computing values in x points
f_x2=f(x2);

plot(x1,f_x1,'rx')              % plotting x
plot(x2,f_x2,'rx')

while ((abs(b-a)>epsilon) && (k<iter))
    k=k+1;
    if(f_x1<f_x2)
        b=x2;
        x2=x1;
        x1=a+(1-tau)*(b-a);
        
        f_x1=f(x1);
        f_x2=f(x2);
        
        plot(x1,f_x1,'rx');
    else
        a=x1;
        x1=x2;
        x2=a+tau*(b-a);
        
        f_x1=f(x1);
        f_x2=f(x2);
        
        plot(x2,f_x2,'rx')
    end
    
    k=k+1;
end


% chooses minimum point
if(f_x1<f_x2)
    sprintf('x_min=%f', x1)
    sprintf('f(x_min)=%f ', f_x1)
    plot(x1,f_x1,'ro')
else
    sprintf('x_min=%f', x2)
    sprintf('f(x_min)=%f ', f_x2)
    plot(x2,f_x2,'ro')
end

%% golden ration parabolic finder
clear
clc
func=@(x) -1.5*x^6-2*x^4+12*x; % function in question
a=0; % lower bound
b=2; % upper bound
golden=(sqrt(5)-1)/2;
d=golden*(b-a);
x2=a+d;
x1=b-d;
err = 100;
iter=0;
tol = 0.00000001;
totaliter=3;
while  iter < totaliter;
    iter=iter+1;
    if func(x1) > func(x2)
        xopt=x1;
        err = (1-golden)*(abs((b-a)/xopt));
        if err > tol
            b = x2;
            x2 = x1;
            d = golden*(b-a);
            x1 = b-d;
        end
    else
        xopt=x2;
        err=(1-golden)*(abs((b-a)/xopt));
        if err > tol
            a=x2;
            x1=x2;
            d=golden*(b-a);
            x2=a+d;
        end
    end
end
xopt
func(xopt)
iter

%% parabolic thinginy

clear
clc
f=@(x) -1.5*x^6-2*x^4+12*x;
x1=0;
x2=1;
x3=2;
iter=0;
totaliter = 3;
while iter < totaliter
    iter=iter+1;
    x4=x2-(1/2)*(((x2-x1)^2)*(f(x2)-f(x3))-((x2-x3)^2)*(f(x2)-f(x1)))/((x2-x1)*(f(x2)-f(x3))-(x2-x3)*(f(x2)-f(x1)));
    if x4>x1 && x4<x2
        x1=x4;
    elseif x4<x3 && x4 > x2
        x3=x4;
    else
        error('problem');
    end
end       
iter
x4
    
    
    
















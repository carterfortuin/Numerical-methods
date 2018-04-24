# Numerical-methods
Matlab code, started in first year Mechanical engineering course

# Huen's
The Heun function to aproximate the values along a ordinary differential 
equation points given to the funtion. 
   Heun's method takes a Euler's method aproximation of an ODE
   and uses an average method to get a more accurate data point. It
   takes the Euler's estimations as the two slope end points and averages them
   together. outputs include a graph of the output values for t and y
  
   Inputs:
       dydt:  the ordinary differential equation being investigated, enter
              as anonomus function      
       tspan: the time span that the ODE covers wrieten ex: [0 2] for 2
              seconds
       y0:    the starting condition y value
       h:     step size ex: 0.5 for half a second steps, smaller step sizes
              will increase output accuracy
       es:    OPTINAL, accuracy estimation. default if empty is 0.0001
       maxit: OPTINAL, max number of iterations. default if empty is 50
   Output:
       t:     last time point
       y:     last y value for ODE
       Graph of t and y

# Simpson.m
Simpson uses the simpson 1/3 rules to estamate the itegral of none
countinous data. The independent varrible must be equally spaced. If there 
is an odd number of spaces between the seconts of data, the trapazoid 
method will be used to estimate the final section.
   Inputs: 
       x is the independant varrible, an equally spaced array
       y is the dependant varrible
   Outputs:
       I is the estimated integral 
       
# False Position
False Position uses the false positiopn method for entering roots. User
inputs a polynomial fuction with upper and lower bounds and the
falsePosition estimates the roots.
   Inputs: 
       func - INCLUDE @(X) WITH THE FUNCTION, the function being
              evaluated. THE BOUNDS MUST EXIST
       xl - the lower bound
       xu - the upper bound
       es - OPTINAL the desired relative error (default to 0.0001%)
       maxiter - OPTINAL the number of iterations desired (default to 200)
   Outputs:
       root - the estimated root location
       fx - the function evaluated at the root location
       ea - the approximate relative error (%)
       iter - how many iterations were performed
       
# LU Factor
luFactor uses LU factorization of matrixes to solve for matrix varribles.
Partial pivoting and backwards substitution is used to solve matrix. it
makes sure the inputed varrible is a square matrix
   Syntax:
       [L,U,P]=luFactor(A)
   Inputs:
       A - coefficient matrix (square)
   Outsputs:
       L - lower triangular matrix
       U - upper triangular matrix
       P - the pivot matrix

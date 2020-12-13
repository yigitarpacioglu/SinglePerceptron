function J = computecost(X, td, w)

  % This function computes cost for 
 
 [r,~]=size(X);
  

  J = (1/r)*(sum(((X*w)-td).^2));

 
end
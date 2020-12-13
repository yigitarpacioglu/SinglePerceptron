% -----------------------------------------------------------------------
%
% This script is written to train and test perceptron (single unit) with 
% gradient descent and stochastic gradient descent methods.
%
% -----------------------------------------------------------------------
% #######################################################################


clc; clear all; close all; 

%% Part 1: Reading and Visualizing Data

traindata = load('class2_tr.txt'); 
% data is read from txt file and assigned to

X=traindata(:,1:2); td = traindata(:,3);                                  
% Visualizing is provided with another function called 'plotData'

plotData(X,td), 
title('Training Data Distribution')
xlabel('Feature 1')
ylabel('Feature 2')
legend('Feature 1', 'Feature 2')

% For using vectorized operations, there is a need to add a column vector 
% that consists from 'ones'. (That colum will be multiplied with bias) x0=1


%% Part 2: Initializing Neccessary Variables

[m,n] = size (X);

X = [ones(m, 1) X];  % X is padded for bias.
% (That column will be multiplied with bias) w(1)


w = rand(n + 1, 1); % Weights are initialized.


max_iter=input('Please enter a suitable iteration number for learning\n'); 
alpha=input('Please enter learning rate\n'); 
J_history = zeros(max_iter, 1);
iter=1;

SGD='SGD';
GD='GD';
MBGD='MBGD';
%% Part 3: Train Data

 selection = input(['\nPlease enter: \n''GD'' for Gradient Descent',...
                    '\n''SGD'' for Stochastic Gradient Descent\n',...
                    'MBGD'' for Mini-Batch Gradient Descent\n'],'s'); 
while ~(isequal(selection,'GD') || isequal(selection,'SGD') || isequal(selection,'MBGD')) 
    selection = input('Your selection is wrong, please enter suitable selection\n');
end
if isequal(selection,GD)
 tic          
    % Gradient Descent
    
    while iter<max_iter 
    

h  = X * w;             % Instead of using nested loops, to increase 
od = hardlimit(h);      % processing speed, vectorized operations are 
                        % preferred. 
                        

                        
grad = (alpha/m)*X'*(td-od);% e.g. This line is almost same with:
                        % sum = sum + (t(d) - o(d))) where
                        % d=1,2...m(training examples)
J_history(iter) = computecost(X,td,w);
                        % Cost has been computed. Plotting iter number
                        % against to cost will represent learning
                        % performance
iter=iter+1;
w=w+grad;

    end 
   toc
    % Stochastic Gradient Descent

elseif isequal(selection,SGD) 
 tic  
     
    k=1;
    grad=zeros(size(X,2),1);
    rnd_ind=randperm(size(X,1));
    Xsto=X(rnd_ind,:);
    td_sto=td(rnd_ind,:);     
    count=0;
    J=0;
    
   while iter<max_iter         
      
         if k==size(Xsto,1)
             k=1;
         end 
         
         h = Xsto(k,:)*w;
         od = hardlimit(h);
         cost=(1/2)*((od-td_sto(k,1))^2);
         J=J+(1/size(Xsto,1))*cost;
         J_history(iter)=J;
         
        
         grad=alpha*Xsto(k,:)'*(td_sto(k,1)-od);
         
                  
         w=w+grad;
    iter=iter+1;    
    k=k+1;
    
   end
J_history=-J_history;
toc;
else
  tic  
    % Minibatch Gradient Descent
      
while iter<max_iter
         rnd_ind=randperm(size(X,1));
         Xmini=X(rnd_ind,:);
         Data_Points=1:5:size(Xmini,1);  % Randomly taking instances from
         Xmini=[ Xmini(Data_Points,:)];   % dataset.
         
         td_mini=td(rnd_ind,:);
         td_mini=[ td_mini(Data_Points,:)];
         
    
         h= Xmini*w;
         od = hardlimit(h);
         
         grad=zeros(size(Xmini,2),1);
         
                        % Cost has been computed. Plotting iter number
                        % against to cost will represent learning
                        % performance
         
                       
         
         for i=1:size(Xmini,2)   
                for j=1:size(Xmini,1)
             grad(i,1) = grad(i,1)+(alpha/m)*Xmini(j,i)*(td_mini(j,1)-od(j,1)); 
                end
         end
         J_history(iter) = computecost(X,td,w);
    w=w+grad;
    iter=iter+1;
end 
   toc;
end


bounDary(w, X, td);    % This function draws boundary with trained weights
hold on;
  % Legend, specific for the exercise
    title('Training Data Classification')
    legend('Feature 1', 'Feature 2', 'Boundary')
    axis([-4, 4, -0.5, 4.5])
hold off

p = hardlim(X*w);
fprintf('Train Accuracy: %f\n', mean(double(p == td)) * 100);
fprintf('Please press enter to continue...\n')
pause; 

%% Part 4: Test Data

testdata = load('class2_test.txt');          % data is read from txt file and assigned to
X_t=testdata(:,1:2); td_t = testdata(:,3);   % assigned to seperate matrices.

plotData(X_t,td_t), 
title('Test Data Distribution')
xlabel('Feature 1')
ylabel('Feature 2')
legend('Feature 1', 'Feature 2')
pause;


[m_t, n_t] = size(X_t);

X_t=[ones(m_t,1) X_t];
test = hardlimit(X_t*w); 

hold on
bounDary(w, X_t, td_t);    % This function draws boundary with trained weights

  % Legend, specific for the exercise
    title('Test Data Classification')
    legend('Feature 1', 'Feature 2', 'Boundary')
    axis([-4, 4, -0.5, 4.5])
hold off
pause;

fprintf('Test Accuracy: %f\n', mean(double(test == td_t)) * 100);
fprintf('Program executed...\n')
pause; 



figure
plot(1:max_iter, J_history, '-b', 'LineWidth', 2);

title('Learning Performance');
xlim([0 (max_iter-1)]);
xlabel('Number of iterations');
ylabel('Cost');


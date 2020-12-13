function plotData(X, y)
%   Plots the data points X and y into a new figure 

% Create New Figure
figure; hold on;


    pos = find(y==1); neg = find(y == 0);
    plot(X(pos, 1), X(pos, 2), 'rx','LineWidth', 2, 'MarkerSize', 7);
    plot(X(neg, 1), X(neg, 2), 'bo','LineWidth', 2, 'MarkerSize', 7)
 
hold off;

end

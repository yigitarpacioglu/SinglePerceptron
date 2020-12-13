function bounDary(weight, X, y)
%This function plots the data points X and y into a new figure with
%the decision boundary defined by weights

% Plot Data
plotData(X(:,2:3), y);
hold on

    % Only need 2 points to define a line, so choose two endpoints
    plot_x = [min(X(:,2))-2,  max(X(:,2))+2];

    % Calculate the decision boundary line
    plot_y = (-1./weight(3)).*(weight(2).*plot_x + weight(1));

    % Plot, and adjust axes for better viewing
    plot(plot_x, plot_y)
    
hold off
function Project

    % Getting input from user and assign in to the workspace
    
    prompt = {'Enter X array with 6 integer:','Enter Y array with 6 integer:','Enter Z Array with 6 integer:'}; % Request user input
    answer = inputdlg(prompt); % Create dialog box to gather user input
    
    x = str2num(answer{1}); 
    y = str2num(answer{2});    % str2num =  Converts assigned values ??from string format to num format.
    z = str2num(answer{3});
    

    assignin('base','x',x);    % assignin('base','x',x) assigns the value x to the variable 'x' in the workspace 'base'. 
    assignin('base','y',y);    % assignin = Assign value to variable in specified workspace.
    assignin('base','z',z)


    % Plot the measurement


figure(1)      % Create figure window
stem3(x, y, z) % stem3(X,Y,Z) plots entries in Z as stems extending from the xy-plane where X and Y specify the stem locations in the xy-plane
grid on        % grid on displays the major grid lines for the current axes or chart returned by the gca command.
xv = linspace(min(x), max(x), 20);  % Generate linearly spaced vector. 
yv = linspace(min(y), max(y), 20);  % Generates n points. The spacing between the points is (max(y)-min(Y))/(20-1).
[X,Y] = meshgrid(xv, yv);           % Returns 3-D grid coordinates based on the coordinates contained in vectors xv and yv.
B = [x(:) y(:) ones(size(x(:)))] \ z(:);
Z = X*B(1) + Y*B(2) + B(3);
hold on        % retains plots in the current axes so that new plots added to the axes do not delete existing plots.
mesh(X, Y, Z)  % creates a mesh plot, which is a three-dimensional surface that has solid edge colors and no face colors.
hold off       % sets the hold state to off so that new plots added to the axes clear existing plots and reset all axes properties
view(150,24)   % sets the 150 and 24 angles of the camera's line of sight for the current axes.
xlabel('X')    % labels the x-axis of the current axes
ylabel('Y')    % labels the y-axis of the current axes
zlabel('Z')    % labels the z-axis of the current axes
legend('Data', 'Linear Regression Plane', 'Location','southoutside') % gives data of Linear Regression Plane 
% Legend location with respect to the axes, specified as one of the location values listed in this table.
set(gcf,'color','[ 0.6000    0.8000    1.0000]') % background color
colorbar('Direction','reverse') % adding colorbar
end
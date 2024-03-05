% Plotting Template
% Ayaaz Yasin - Mar 04, 2024 


%% Importing Excel Data
% Use this section to read data from an excel file with several columns.
% xlsread loads all the entire table as a matrix, from which you can
% separate the columns before plotting/processing. 

data = xlsread('path/to/your/filename.xlsx');           % <-- insert filepath
col1 = data(:,1);                                       % <-- parsing columns
col2 = data(:,2);
col3 = data(:,3);

%% Plotting code
% Here I am going to generate some random numbers and plot them but you can
% modify the code accoring to your use.
clear; clc; close all;

x1 = sort(rand(10,1));
y1 = sort(rand(10,1));
x2 = sort(rand(10,1));
y2 = sort(rand(10,1));
x3 = sort(rand(10,1));
y3 = sort(rand(10,1));
allX = [x1, x2, x3];
allY = [y1, y2, y3];

x = linspace(0,1,1000);                             % just an x-grid
[coeff, S] = polyfit(allX, allY, 1);                % <-- linear fit through all the data sets, change the last 1 to change the order of fit
R2 = 1 - (S.normr/norm(allY - mean(allY)))^2;       % <-- R^2 value of the fit
y = polyval(coeff, x);                              % y-points of the fit line


fig = figure; 
fig.Position = [680   458   560   420];  % <-- change limits to resize the window
plot(x, y, 'k-',  'LineWidth', 2,'DisplayName','curve fit'); hold on;
plot(x1, y1, 'bs', 'LineWidth', 2,'DisplayName','squares'); hold on;
plot(x2, y2, 'b^', 'LineWidth', 2,'DisplayName','triangles'); hold on;
plot(x3, y3, 'b+', 'LineWidth', 2,'DisplayName','plus'); hold on;

% making a box    
% you can do this using the patch function if you want to color the box
box_x1 = 0.7;  box_y1 = 0.4;
box_x2 = 0.9;  box_y2 = 0.7;
box_x = [box_x1, box_x2, box_x2, box_x1, box_x1];
box_y = [box_y1, box_y1, box_y2, box_y2, box_y1];
plot(box_x, box_y, '-','LineWidth',2,'HandleVisibility','off','Color',[0,.5,0])
text(0.71, 0.6, 'Green Box','FontSize',12','FontWeight','bold','Color',[0,.5,0])

% now some commands to make your plots look nice
set(gca,'FontWeight','bold','FontSize',12,'FontName','times')                       % <-- you can define more properties
ylabel('\boldmath{$\alpha^2+d\beta/dt$}','interpreter','latex','FontSize',12);  % <-- ylabel using latex
xlabel("\boldmath{$\dot{m}''$}",'interpreter','latex','FontSize',12)                % <-- xlabel using latex
text(0.75,0.1,sprintf('$R^2=%0.4f$',R2),'interpreter','latex','FontSize',14)      % <-- this is how you put text on the plot
legend('Location','northwest')   % <-- you can pick your favorite location

% some more advanced functions
yticks(0:0.1:1)             % <-- define how many ticks you want on the y-axis
xticks([0,0.1,0.3,0.7,1])   % <-- you can also define exact numbers
xticklabels({'you','can','customize','tick','labels'}) % <-- change tick labels, you can do this on the y-axis as well
grid minor  % "minor" gives fine grid, "on" gives a course grid
axis padded % try "padded", "tight"
% xlim([0,1]); ylim([0,1]);         % these commands set exact axis limits

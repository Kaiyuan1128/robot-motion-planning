%function plotPointsFlag(points,flags)
%Plot  points with a color that depends on  flags. Each element in  flag
%corresponds to a column in  points (i.e., to a point). If an element in  flag is
% true, the corresponding point should be plotted in red, while if it is  false,
%it should be plotted in green.

%Email: neiltan@bu.edu
%Date: 9/9/2019

%Define variables:
%points_num--number of points to be plot
%x_point--x-coordinate of the point
%y_point--y-coordinate of the point

function plotPointsFlag(points,flags)
points_num = size(points,2);
for i = 1:points_num
    %Obtain coordinates of each point
    x_point = points(1,i);
    y_point = points(2,i);
    if flags(i) == 1
        plot(x_point,y_point,'*g');
    else
        plot(x_point,y_point,'*r');
    end
    hold on;
end
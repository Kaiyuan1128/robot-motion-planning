%function polygon_plot(vertices,style)
%Draws a closed polygon described by  vertices using the style (e.g., color)
%given by  style.

%Coder: Kaiyuan Tan
%Date: 9/2/2019

%Define variables:
%coordinates--coordinates of polygon vertices
%x--x-coordinate of polygon vertices
%y--y-coordinate of polygon vertices
%a--rank of vertix to calculate the projection
%u--projection on x-coordinate
%v--projection on y-coordinate
%num--number of vertices

function polygon_plot(vertices,style)
%Extract coordinates of vertices
x = vertices(1,:);
y = vertices(2,:);
a = 1;
u = [];
v = [];
num = length(x);
%Calculate the projection of each vector
for ii = 1:num
    a = mod(ii,num)+1;
    u = [u,x(a) - x(ii)];
    v = [v,y(a) - y(ii)];
end
%Plot the polygon
quiver(x,y,u,v,0,style)
%identify whether the polygon is filled or not and painted with grey
filled = polygon_isFilled(vertices)
if filled == 0
    set(gca,'color',[96 96 96]/255);
    patch(x,y,'w');
else
    set(gca,'color','w');
    patch(x,y,[0.6 0.6 0.6]);
end

    
%Each edge in the polygon must be an arrow pointing from one vertex to the next.
%In Matlab, use the function quiver to actually perform the drawing. The function
%should  not create a new figure.

%function polygon_isVisible_test()
%This function should perform the following operations: enumerate  an array 
%testPoints with dimensions [ 2 $ $  5] containing points generated uniformly at
%random using rand and scaled to approximately occupy the rectangle $[0,5]
%[-2,2]$ (i.e., the $x$ coordinates of the points should fall between $0$ and
%$5$, while the $y$ coordinates between $-2$ and $2$).  the coordinates 
%vertices1 and  vertices2 of two polygons from twolink_polygons.  two  logical
%vectors  flag1 and  flag2 by calling polygon_isVisible using  testPoints and,
%respectively,  vertices1 and  vertices2 as argument. item:test-polygon For each
%polygon  vertices1,  vertices2, display a separate figure using the following:
%enumerate  the array  testPointsWithPolygon by concatenating  testPoints with
%the coordinates of the polygon (i.e., the coordinates of the polygon become also
%test points).  the polygon (use polygon_plot). item:test-visibility For each
%vertex $v$ in the polygon: enumerate  the visibility of each point in 
%testPointsWithPolygon with respect to that polygon (using polygon_isVisible). 
%lines from the vertex $v$ to each point in  testPointsPolygon according in green
%if the corresponding point is visible, and in red otherwise. enumerate enumerate
% the order of the vertices in  vertices1,  vertices2 using the function fliplr. 
%item item:test-polygon above with the reversed edges. enumerate

%Coder: Kaiyuan Tan
%Date: 9/8/2019

%Define variables:
%testPoints--A set of random test points
%testPointsWithPolygon--set of test points and polygon vertices
%polygon_num--number of polygon vertices
%flagPoints--logical result set of testPointsWithPolygon's visibility
%pointsStart--vertices to line up test points

function polygon_isVisible_test()
%Obtain a set of random test points
testPoints = [0+5*rand(1,5);-2+4*rand(1,5)];
%Obtain two polygons
%Using function [vertices1,vertices2]=twolink_polygons()
[vertices1,vertices2] = twolink_polygons();

%Figure 1
figure
%Concatenating test points with coordinates of polygon
testPointsWithPolygon1 = [vertices1,testPoints];
%Obtain number of vertices
polygon_num = size(vertices1,2);
%Plot polygon
polygon_plot(vertices1,'k');
hold on;
for indexVertex = 1:size(vertices1,2)
    %Obtain logical result of visibility
    %Using function [flagPoints]=polygon_isVisible(vertices,indexVertex,testPoints)
    flagPoints = polygon_isVisible(vertices1,indexVertex,testPointsWithPolygon1);
    pointsStart1 = vertices1(:,indexVertex).*ones(2,size(flagPoints,2));
    %Line up selected vertex and every test point logically
    %Using function plotLinesFlag(pointsStart,pointsEnd,flags)
    plotLinesFlag(pointsStart1,testPointsWithPolygon1,flagPoints);
    title('Polygon is Visible Test 1');
end

%Figure 2
figure
testPointsWithPolygon2 = [vertices2,testPoints];
polygon_num = size(vertices2,2);
polygon_plot(vertices2,'k');
hold on;
for indexVertex = 1:size(vertices2,2)
    %Obtain logical result of visibility
    %Using function [flagPoints]=polygon_isVisible(vertices,indexVertex,testPoints)
    flagPoints = polygon_isVisible(vertices2,indexVertex,testPointsWithPolygon2);
    pointsStart2 = vertices2(:,indexVertex).*ones(2,size(flagPoints,2));
    %Line up selected vertex and every test point logically
    %Using function plotLinesFlag(pointsStart,pointsEnd,flags)
    plotLinesFlag(pointsStart2,testPointsWithPolygon2,flagPoints);
    title('Polygon is Visible Test 2');
end

%Figure 3
figure
%Reverse the order of the vertices1
vertices3 = fliplr(vertices1);
testPointsWithPolygon3 = [vertices3,testPoints];
polygon_num = size(vertices3,2);
polygon_plot(vertices3,'k');
hold on;
for indexVertex = 1:size(vertices3,2)
    %Obtain logical result of visibility
    %Using function [flagPoints]=polygon_isVisible(vertices,indexVertex,testPoints)
    flagPoints = polygon_isVisible(vertices3,indexVertex,testPointsWithPolygon3);
    pointsStart3 = vertices3(:,indexVertex).*ones(2,size(flagPoints,2));
    %Line up selected vertex and every test point logically
    %Using function plotLinesFlag(pointsStart,pointsEnd,flags)
    plotLinesFlag(pointsStart3,testPointsWithPolygon3,flagPoints);
    title('Polygon is Visible Test 3');
end

%Figure 4
figure
%Reverse the order of the vertices2
vertices4 = fliplr(vertices2);
testPointsWithPolygon4 = [vertices4,testPoints];
polygon_num = size(vertices4,2);
polygon_plot(vertices4,'k');
hold on;
for indexVertex = 1:size(vertices4,2)
    %Obtain logical result of visibility
    %Using function [flagPoints]=polygon_isVisible(vertices,indexVertex,testPoints)
    flagPoints = polygon_isVisible(vertices4,indexVertex,testPointsWithPolygon4);
    pointsStart4 = vertices4(:,indexVertex).*ones(2,size(flagPoints,2));
    %Line up selected vertex and every test point logically
    %Using function plotLinesFlag(pointsStart,pointsEnd,flags)
    plotLinesFlag(pointsStart4,testPointsWithPolygon4,flagPoints);
    title('Polygon is Visible Test 4');
end


%The function should display four separate figures in total, each one with a
%single polygon and lines from each vertex in the polygon, to each point.

%function polygon_isCollision_test()
%This function is the same as polygon_isVisible_test, but instead of step 
%item:test-visibility, use the following: enumerate  whether each point in 
%testPointsWithPolygon is in collision with the polygon or not using
%polygon_isCollision.  each point in  testPointsWithPolygon in green if it is not
%in collision, and red otherwise. enumerate Moreover, increase the number of test
%points from $5$ to $100$ (i.e.,  testPoints should have dimension [ 2 $ $ 
%100]).

%Coder: Kaiyuan Tan
%Date: 9/9/2019

%Define variables:
%testPoints--A set of random test points
%testPointsWithPolygon--set of test points and polygon vertices
%polygon_num--umber of polygon vertices
%flagPoints--logical result set of testPointsWithPolygon's collision

function polygon_isCollision_test()
testPoints = [0+5*rand(1,100);-2+4*rand(1,100)];
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
    %Obtain logical result of collision
    %Using function [flagPoints]=polygon_isCollision(vertices,testPoints)
    flagPoints = polygon_isCollision(vertices1,testPointsWithPolygon1);
    %Paint every test point logically with collision status
    %Using function plotPointsFlag(points,flags)
    plotPointsFlag(testPointsWithPolygon1,flagPoints);
    title('Polygon is Collision Test 1');
end

%Figure 2
figure
%Concatenating test points with coordinates of polygon
testPointsWithPolygon2 = [vertices2,testPoints];
%Obtain number of vertices
polygon_num = size(vertices2,2);
%Plot polygon
polygon_plot(vertices2,'k');
hold on;
for indexVertex = 1:size(vertices2,2)
    %Obtain logical result of collision
    %Using function [flagPoints]=polygon_isCollision(vertices,testPoints)
    flagPoints = polygon_isCollision(vertices2,testPointsWithPolygon2);
    %Paint every test point logically with collision status
    %Using function plotPointsFlag(points,flags)
    plotPointsFlag(testPointsWithPolygon2,flagPoints);
    title('Polygon is Collision Test 2');
end

%Figure 3
figure
%Concatenating test points with coordinates of polygon
vertices3 = fliplr(vertices1);
testPointsWithPolygon3 = [vertices3,testPoints];
%Obtain number of vertices
polygon_num = size(vertices3,2);
%Plot polygon
polygon_plot(vertices3,'k');
hold on;
for indexVertex = 1:size(vertices3,2)
    %Obtain logical result of collision
    %Using function [flagPoints]=polygon_isCollision(vertices,testPoints)
    flagPoints = polygon_isCollision(vertices3,testPointsWithPolygon3);
    %Paint every test point logically with collision status
    %Using function plotPointsFlag(points,flags)
    plotPointsFlag(testPointsWithPolygon3,flagPoints);
    title('Polygon is Collision Test 3');
end
    
%Figure 4
figure
%Concatenating test points with coordinates of polygon
vertices4 = fliplr(vertices2);
testPointsWithPolygon4 = [vertices4,testPoints];
%Obtain number of vertices
polygon_num = size(vertices4,2);
%Plot polygon
polygon_plot(vertices4,'k');
hold on;
for indexVertex = 1:size(vertices4,2)
    %Obtain logical result of collision
    %Using function [flagPoints]=polygon_isCollision(vertices,testPoints)
    flagPoints = polygon_isCollision(vertices4,testPointsWithPolygon4);
    %Paint every test point logically with collision status
    %Using function plotPointsFlag(points,flags)
    plotPointsFlag(testPointsWithPolygon4,flagPoints);
    title('Polygon is Collision Test 4');
end
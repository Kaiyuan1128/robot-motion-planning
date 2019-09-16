%function [flagPoints]=polygon_isCollision(vertices,testPoints)
%Checks whether the a point is in collsion with a polygon (that is, inside for a
%filled in polygon, and outside for a hollow polygon).

%Coder: Kaiyuan Tan
%Date: 9/9/2019

%Define variables:
%visibleStatus--logical result of every test point's visibility
%               with every vertex
%insideStatus--logical result of every test point's collision
%flagPoints--logical result of every test point's collision
%inside--logical result of specific test point's collision

function [flagPoints]=polygon_isCollision(vertices,testPoints)
%Initialize logical result of visible&inside status
visibleStatus = [];
insideStatus = [];
for indexVertex = 1:size(vertices,2)
    %Obtain logical result of every test point's visibility with one vertex
    %Using function [flagPoints]=polygon_isVisible(vertices,indexVertex,testPoints)
    flagPoints = polygon_isVisible(vertices,indexVertex,testPoints);
    visibleStatus = [visibleStatus;flagPoints];
end
for indexTest = 1:size(testPoints,2)
    if visibleStatus(:,indexTest) == zeros(size(vertices,2),1)
        inside = true;%point is inside polygon
        insideStatus = [insideStatus,inside];
    else
        inside = false;%point is not inside polygon
        insideStatus = [insideStatus,inside];
    end
end
flagPoints = logical(insideStatus);
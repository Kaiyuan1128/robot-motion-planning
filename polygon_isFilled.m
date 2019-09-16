%function [flag]=polygon_isFilled(vertices)
%Checks the ordering of the vertices, and returns whether the polygon is filled
%in or not.
function [flag]=polygon_isFilled(vertices)
vertices_num = size(vertices,2);
totalAngle = 0;
for i = 1:vertices_num
    switch(i)
        case{1}
            totalAngle = totalAngle+edge_angle(vertices(:,1),vertices(:,size(vertices,2)),vertices(:,2),'signed');
        otherwise
            rank = mod(i,size(vertices,2))+1;
            totalAngle = totalAngle+edge_angle(vertices(:,i),vertices(:,(i-1)),vertices(:,rank),'signed');
    end
end
if totalAngle < 0
    flag = true;
else
    flag = false;
end
%function [flagPoints]=polygon_isVisible(vertices,indexVertex,testPoints)
%Checks whether a point $p$ is visible from a vertex $v$ of a polygon. In order
%to be visible, two conditions need to be satisfied: enumerate  point $p$ should
%not be self-occluded with respect to the vertex $v$\\ (see
%polygon_isSelfOccluded).  segment $p$--$v$ should not collide with  any of the
%edges of the polygon (see edge_isCollision). enumerate

%Coder: Kaiyuan Tan
%Date: 9/7/2019

%Define variables:
%vertices--array where each column represents the coordinates of a vertex in the polygon.
%indexVertex--a single index identifying a the column in vertices
%testPoints--array where each column represents the coordinates of a point for which visibility should be tested
%v--the vertex we choose to identify visibility of test points
%test_length--number of test points
%vertex_length--number of vertices
%flagPoints--logical results set of test points' visibility
%m--index of test points in one for loop to identify visibility
%test_pt--the point among testPoints we test in this for loop
%self_occluded--logical result of test points' occlusion
%visible--single logical result of test point's visibility
%collision--logical result of test point's collisions
%collision_set--logical results set of test points' collisions
%a--index of the first vertex to identify collision
%b--index of the second vertex to identify collision

function [flagPoints]=polygon_isVisible(vertices,indexVertex,testPoints)
%Extract the specific vertex v from vertices
v = vertices(:,indexVertex);
%Obtain the number of test points
test_length = size(testPoints,2);
%Obtain the number of vertices
vertex_length = size(vertices,2);
%Initialize the logical results of test points' visibility
flagPoints = [];
%Select a test point initial index
m = 1;
for i = 1:test_length
    test_pt = testPoints(:,m);%Extract selected test point
    %Identify self-occluded by considering different specific vertex
    %Using function [flagPoint]=polygon_isSelfOccluded(vertex,vertexPrev,vertexNext,point)
    switch(indexVertex)
        case{1}
            vertex = v;
            vertexPrev = vertices(:,vertex_length);
            vertexNext = vertices(:,indexVertex+1);
            point = test_pt;
            self_occluded = polygon_isSelfOccluded(vertex,vertexPrev,vertexNext,point); 
        case{vertex_length}
            vertex = v;
            vertexPrev = vertices(:,(indexVertex-1));
            vertexNext = vertices(:,1);
            point = test_pt;
            self_occluded = polygon_isSelfOccluded(vertex,vertexPrev,vertexNext,point); 
        otherwise
            vertex = v;
            vertexPrev = vertices(:,(indexVertex-1));
            vertexNext = vertices(:,(indexVertex+1));
            point = test_pt;
            self_occluded = polygon_isSelfOccluded(vertex,vertexPrev,vertexNext,point);
    end
     if self_occluded == 1
         visible = 0;%self-occluded vertex is not visible
         flagPoints = [flagPoints,visible];
     else
         a = 1;%Initialize a collision idetification index
         collision_set = [];
         for ii = 1:vertex_length
             b = mod(a,vertex_length)+1;
             vertices1 = [vertices(:,a),vertices(:,b)];
             vertices2 = [v,test_pt];
             %Using function [flag]=edge_isCollision(vertices1,vertices2)
             collision = edge_isCollision(vertices1,vertices2);
             collision_set = [collision_set,collision];
             a = a+1;
         end
         if collision_set == zeros(1,vertex_length)
             visible = true;%point is visible
             flagPoints = [flagPoints,visible];
         else
             visible = false;%point is not visible
             flagPoints = [flagPoints,visible];
         end
     end
     m = m+1;
end
flagPoints = logical(flagPoints);
%Note that, with the definitions of edge collision and self-occlusion given in
%the previous questions, a vertex should be visible from the previous and
%following vertices in the polygon.

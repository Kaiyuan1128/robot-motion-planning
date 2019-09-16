%function [flag]=edge_isCollision(vertices1,vertices2)
%Returns  true if the two edges intesect.  Note: if the two edges overlap but are
%colinear, or they overlap only at a single endpoint, they are not considered as
%intersecting (i.e., in these cases the function returns  false). If one of the
%two edges has zero length, the function should always return the result that
%edges are non-intersecting.

%ME570 Homework1 Question 1.1(Code)
%Coder: Kaiyuan Tan
%Email: neiltan@bu.edu
%BUID: U15339982
%Date: 9/3/2019

%Define variables:
%A1,A2,B1,B2--transpose of vertices' coordinates
%c--cross product
%d--sign of dot product
%flag--status of whether two edges intersect

function [flag]=edge_isCollision(vertices1,vertices2)
%Extract coordinates of different points and then transpose
A1 = vertices1(:,1);
A2 = vertices1(:,2);
B1 = vertices2(:,1);
B2 = vertices2(:,2);
%Supplement the size of matrices
A1 = [A1;0];A2 = [A2;0];B1 = [B1;0];B2 = [B2;0];
A1A2 = A2 - A1;A1B1 = B1 - A1;A1B2 = B2 - A1;
B1B2 = B2 - B1;B1A1 = A1 - B1;B1A2 = A2 - B1;
%Calculate cross product
c1 = cross(A1B1,A1A2);
c2 = cross(A1B2,A1A2);
c3 = cross(B1A1,B1B2);
c4 = cross(B1A2,B1B2);
%Identify the sign of dot product
d1 = sign(dot(c1,c2));
d2 = sign(dot(c3,c4));
%Identify the interact of two edges
if (d1 > 0 || d2 > 0)
    flag = false;%two edges do not interact
elseif any(c1)== 0 || any(c2) == 0
    flag = false;%only one endpoint overlaps or edges are colinear, two edges do not interact
else
    flag = true;%two edges interact
end
%The function should be able to handle any orientation of the edges (including
%both vertical and horizontal). Note that the ``overlap'' case needs to be
%checked up to floating-point precision.

%function [flagPoint]=polygon_isSelfOccluded(vertex,vertexPrev,vertexNext,point)
%Given the corner of a polygon, checks whether a given point is self-occluded or
%not by that polygon (i.e., if it is ``inside'' the corner's cone or not). Points
%on boundary (i.e., on one of the sides of the corner) are not considered
%self-occluded.  Note that to check self-occlusion from one vertex, knowing the
%two lines formed with the previous and next vertices (and their ordering) is
%sufficient.

%Coder: Kaiyuan Tan
%Date: 9/4/2019

%Define variables:
%vertex--coordinate of the endpoint of a line starting from a vertex of a polygon
%vertexPrev--coordinates of the vertices preceding the vertex above
%vertexNext--coordinates of the vertices following the vertex above
%point--coordinates of an arbitratry point need to be test
%flagPoint--logical result of whether a point is self-occluded by a corner of a polygon
%edgeAngle1--angle of vertexPrev, vertex, and vertexNext
%edgaAngle2--angle of point, vertex, and vertexNext

function [flagPoint]=polygon_isSelfOccluded(vertex,vertexPrev,vertexNext,point)
if vertex == vertexPrev
    flagPoint = NaN;
    disp('NaN');%vertex1 coincides with vertex0
    return;
elseif vertex == vertexNext
    flagPoint = NaN;
    disp('NaN');%vertex2 coincides with vertex0
    return;
else
    %Using function [edgeAngle]=edge_angle(vertex0,vertex1,vertex2,angleType)
    edgeAngle1 = edge_angle(vertex,vertexPrev,vertexNext,'unsigned');
    edgeAngle2 = edge_angle(vertex,point,vertexNext,'unsigned');
    if edgeAngle1 < edgeAngle2
        flagPoint = true;%the point is self-occluded
    else
        flagPoint = false;%the point is not self-occluded
    end
end
%Use the function edge_angle to check the angle between the segment  vertex--
%point and the segments  vertex-- vertexPrev and  vertex-- vertexNext. The
%function returns  NaN if  vertex1 or  vertex2 coincides with  vertex0.

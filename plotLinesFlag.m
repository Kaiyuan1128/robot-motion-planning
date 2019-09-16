%function plotLinesFlag(pointsStart,pointsEnd,flags)
%Plot lines going from  pointsStart to  pointsEnd with a color that depends on 
%flags. Each element in  flag corresponds to a column in  pointsStart and one in 
%pointsEnd (i.e., to the endpoints of a line). If an element in  flag is  true,
%the corresponding line should be plotted in red, while if it is  false, it
%should be plotted in green.

%Coder: Kaiyuan Tan
%Date: 9/8/2019

%Define variables:
%start_length--number of start points

function plotLinesFlag(pointsStart,pointsEnd,flags)
start_length = size(pointsStart,2);
for i = 1:start_length
    if flags(i) == 1
        plot([pointsStart(1,i) pointsEnd(1,i)],[pointsStart(2,i) pointsEnd(2,i)],'g');
        hold on;
    else
        plot([pointsStart(1,i) pointsEnd(1,i)],[pointsStart(2,i) pointsEnd(2,i)],'r');
        hold on;
    end
end
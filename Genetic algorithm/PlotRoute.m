%输入route：           路线
%输入x,y：             x,y坐标
function PlotRoute(partRoute,Route_cell)
R1 = partRoute{1,1};
R2 = partRoute{1,2};
R3 = partRoute{1,3};
R4 = partRoute{1,4};
for i=2:length(R1)
    p1=Route_cell{R1(i-1),R1(i)};
    plot(p1(:,2)+0.5,p1(:,1)+0.5,'r-','LineWidth',2);
    hold on
end
for j=2:length(R2)
    p2=Route_cell{R2(j-1),R2(j)};
    plot(p2(:,2)+0.5,p2(:,1)+0.5,'g-','LineWidth',2);
    hold on
end
for k=2:length(R3)
    p3=Route_cell{R3(k-1),R3(k)};
    plot(p3(:,2)+0.5,p3(:,1)+0.5,'b-','LineWidth',2);
    hold on
end
for k=2:length(R4)
    p4=Route_cell{R4(k-1),R4(k)};
    plot(p4(:,2)+0.5,p4(:,1)+0.5,'y-','LineWidth',2);
    hold on
end
xlabel('x');
ylabel('y');
end
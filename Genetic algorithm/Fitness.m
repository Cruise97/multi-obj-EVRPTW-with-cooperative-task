%% 计算每个个体的适应度值，即最大距离的倒数    
%输入Obj：        每个个体的目标函数值
%输出Fitvalue：   每个个体的适应度值
function Fitvalue=Fitness(Obj)
    [row,~]=size(Obj);
    Fitvalue=zeros(row,1);
    Fitvalue=1./Obj;
end
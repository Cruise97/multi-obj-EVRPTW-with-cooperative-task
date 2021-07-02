%% 交叉操作
% 输入
%newpop  被选择的个体
%Pc      交叉概率
%输出：
% newpop 交叉后的个体
function newpop=elitecross(newpop,Pc,Time_matrix,Power_matrix,Timecost,Powercost,index_coo,num_coo,TimeWin)
global NUM Norig
    
% 固定交叉概率
for i = 1:2:Norig
    if Pc>=rand %交叉概率Pc
        [newpop(i,:),newpop(i+1,:)]=elitePBX(newpop(i,:),newpop(i+1,:),Time_matrix,Power_matrix,Timecost,Powercost,index_coo,num_coo,TimeWin);
    end
end
end




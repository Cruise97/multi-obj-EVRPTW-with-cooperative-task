%% 交叉操作
% 输入
%newpop  被选择的个体
%Pc      交叉概率
%输出：
% newpop 交叉后的个体
function newpop=cross(newpop,FitnV,index_coo,Pc1,Pc2)
global NUM 

%自适应遗传算法
%计算种群适应度
Maxfitvalue = max(FitnV);
Meanfitvalue = sum(FitnV)/NUM;

%由种群适应度确定交叉概率
for i = 1:2:NUM-mod(NUM,2)
    if max(FitnV(i),FitnV(i+1)) >= Meanfitvalue
        Pc = Pc1*(Maxfitvalue-max(FitnV(i),FitnV(i+1)))/(Maxfitvalue-Meanfitvalue);
    else
        Pc = Pc2;
    end
    if Pc>=rand %交叉概率Pc
        [newpop(i,:),newpop(i+1,:)]=PBX(newpop(i,:),newpop(i+1,:),index_coo);
    end
end
    
% 固定交叉概率
% for i = 1:2:NUM-mod(NUM,2)
%     if Pc1>=rand %交叉概率Pc
%         [newpop(i,:),newpop(i+1,:)]=PBX(newpop(i,:),newpop(i+1,:),index_coo1);
%     end
% end
end




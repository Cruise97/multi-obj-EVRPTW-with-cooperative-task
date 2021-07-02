%% 种群初始化
%输入NUM：         种群大小
%输入N：           染色体长度
%输出pop：         随机生成的初始种群
function pop=InitPop(NUM,N)
global nt NR
    pop=zeros(NUM,N);              %种群初始化为NUM行N列的零矩阵
    pop_1=zeros(NUM,nt-1);
for i=1:NUM
    pop_1(i,:)=randperm(nt-1);           %1~n-1的随机排列
    pop_1(i,:)=pop_1(i,:)+1;            %2~n的随机排列
    pop(i,:)=[ones(1,NR-1),pop_1(i,:)];
    seq=randi([NR,N],1,NR-1);
    for j=1:(NR-1)
        pop(i,[j seq(j)])=pop(i,[seq(j),j]);%交换
    end
    
end
end
%% 种群初始化
%输入NUM：         种群大小
%输入N：           染色体长度
%输出pop：         随机生成的初始种群
function pop=InitPop_coo(NUM,index_coo,index_coo1,num_coo,num_coo1)
global nt NR N
    nt_coo = length(index_coo);
    nt_coo1=length(index_coo1);
    pop=zeros(NUM,N);              %种群初始化为NUM行N列的零矩阵
    pop_1=zeros(NUM,nt-1);
for i=1:NUM
    midmat = [];
    pop_1(i,:)=randperm(nt-1);           %1~n-1的随机排列
    pop_1(i,:)=pop_1(i,:)+1;            %2~n的随机排列
    for k = 1:nt_coo
        for p = 1:num_coo(k)-1
            midmat = [midmat,index_coo(k)];
        end
    end
    pop(i,:)=[ones(1,NR-1),midmat,pop_1(i,:)];
    
%%%%%%%此部分是直接修改染色体，不管可行性%%%%%%
    seq=randi([N-nt+2,N],1,NR-1+sum(num_coo)-nt_coo);           %选择NR-1个位置插入1和重复的合作任务点：[1,1,2,4,rand(2~n)]
    popa=pop(i,:);
    for j=1:(NR-1+sum(num_coo)-nt_coo)
        popa([j seq(j)])=popa([seq(j) j]);%交换
    end
    pop(i,:)=popa;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
%%%%%以下是while内容是循环直到所有染色体可行%%%%%%%%%%
%     while 1
%     seq=randi([N-nt+2,N],1,NR-1+sum(num_coo)-nt_coo);           %选择NR-1个位置插入1和重复的合作任务点：[1,1,2,4,rand(2~n)]
%     popa=pop(i,:);
%     for j=1:(NR-1+sum(num_coo)-nt_coo)
%         popa([j seq(j)])=popa([seq(j) j]);%交换
%     end
%     index_1 = find(popa==1);
%     flag=[];
%     for m=1:nt_coo1
%         index_extra = find(popa==index_coo1(m));%重复任务点的位置
%         F=0;
%         for n = 1:num_coo1(m)-1  %有n个重复数字
%             for t = 1:length(index_1)
%                 if index_1(t)>index_extra(n)&&index_1(t)<index_extra(n+1)%如果其中一个1在重复数字中间
%                     F=1;%大于1代表无需调整
%                 end
%             end
%             flag = [flag,F];
%             F=0;
%         end
%     end
%     if prod(flag)~=0
%         pop(i,:)=popa;
%         break;
%     end
%     end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%     %调整种群结果，尽量减少无用个体
%     index_1 = find(pop(i,:)==1);
%     for m=1:nt_coo
%     index_extra = find(pop(i,:)==index_coo(m));%重复任务点的位置
%         for n = 1:num_coo(m)-1
%             if ~(sum(index_extra(n)<index_1)&&sum(index_1<index_extra(n+1)))%如果两个重复任务点序号中间没有1
%                 pop(i,:)=AdjustOrder(pop(i,:),index_coo(m));
%                 
%                 if index_extra(n)+1 == index_extra(n+1)
%                     popa=[pop(i,1:index_extra(n)),1,pop(i,index_extra(n+1):end)];
%                     if popa(index_1(n))==1
%                         popa(index_1(n))=[];
%                     else
%                         popa(index_1(n)+1)=[];
%                     end
%                     pop(i,:) = popa;
%                 else
%                     ind_change = randi([index_extra(n)+1,index_extra(n+1)-1]);
%                     pop(i,[ind_change,index_1(n)]) = pop(i,[index_1(n),ind_change]);
%                     index_1 = find(pop(i,:)==1);
%                 end
%             end
%         end
%     end
    
end
end
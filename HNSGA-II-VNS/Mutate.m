%% 变异操作
%输入newpop：           被选择的个体
%输入Pm1,Pm2：         变异概率
%输入pSwap：           选择交换结构的概率
%输入pReversion：      选择逆转结构的概率
%输入pInsertion：      选择插入结构的概率
%输入dist              距离矩阵
%输出newpop：           变异后的个体
function newpop=Mutate(newpop,Pm,pSwap,pReversion,pInsertion,index_coo)
global NUM nt Norig
nt1=length(index_coo);
for i=1:Norig
%     if  Fitvalue(i) >= Meanfitvalue
%         Pm = Pm1*(Maxfitvalue-Fitvalue(i))/(Maxfitvalue-Meanfitvalue);
%     else
%         Pm = Pm2;
%     end
    
    if Pm>=rand
        index=Roulette(pSwap,pReversion,pInsertion);
        route1=newpop(i,:);
        %父代改造，多余的合作项——>L+1,L+2...
        extend=nt+1;
        length_coo1=[];%每个合作任务改造的次数
        for j = 1:nt1
            seatcoo=find(route1==index_coo(j));
            length_coo1=[length_coo1,length(seatcoo)-1];
            for k=1:length(seatcoo)-1
                route1(seatcoo(k))=extend;
                extend=extend+1;
            end
        end
        extend=nt+1;
        %%%%%%%
        if index==1
            %交换结构
            route2=Swap(route1);
        elseif index==2
            %逆转结构
            route2=Reversion(route1);
        else
            %插入结构
            route2=Insertion(route1);
        end
        %子代复原
        for j=1:nt1
            for k=1:length_coo1(j)
                route2(find(route2==extend))=index_coo(j);
                extend=extend+1;
            end
        end
        %%%%%%%%%%
        newpop(i,:)=route2;
    end
end
%% �������
%����newpop��           ��ѡ��ĸ���
%����Pm1,Pm2��         �������
%����pSwap��           ѡ�񽻻��ṹ�ĸ���
%����pReversion��      ѡ����ת�ṹ�ĸ���
%����pInsertion��      ѡ�����ṹ�ĸ���
%����dist              �������
%���newpop��           �����ĸ���
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
        %�������죬����ĺ������>L+1,L+2...
        extend=nt+1;
        length_coo1=[];%ÿ�������������Ĵ���
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
            %�����ṹ
            route2=Swap(route1);
        elseif index==2
            %��ת�ṹ
            route2=Reversion(route1);
        else
            %����ṹ
            route2=Insertion(route1);
        end
        %�Ӵ���ԭ
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
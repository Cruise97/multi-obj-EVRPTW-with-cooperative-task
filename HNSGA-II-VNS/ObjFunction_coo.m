%% ������ȺĿ�꺯��ֵ
%����pop��             ��Ⱥ
%����Time_matrix��     ·;ʱ�����
%����Power_matrix��    ·;��������
%����Timecost��        ����ʱ������
%����Powercost��       �����������
%���Obj��             ÿ�������Ŀ�꺯��ֵ,ʱ��T
%���real_partRoute��  ��ǰ��Ⱥ����ʵ·��
function [Obj,real_partRoute]=ObjFunction_coo(pop,Time_matrix,Power_matrix,Timecost,Powercost,index_coo,num_coo,TimeWin)
global Tch NR Cs Ce
[row,~]=size(pop);
Obj=zeros(row,2);                        %Ŀ�꺯����ʼ��Ϊ0
real_partRoute = cell(row,NR);
Punish = 0;
wait=zeros(NR,1);
for i=1:row
    route=pop(i,:);                      %��ǰ����
    midroute = [1,route,1];
    index=find(midroute==1);
    Time = zeros(1,NR);
    Power = zeros(1,NR);
    Time_t = zeros(1,NR);
    Power_t = zeros(1,NR);
    
%     for m=1:NR
%         partlength(m)=index(m+1)-index(m)+1;
%     end
%     maxlength = max(partlength);%�������ĳ����ĳ���
    
%     partRoute_cell=cell(NR,1);
    for j = 1:NR
        partRoute=midroute(index(j):index(j+1));
%         len=length(partRoute);
%         if len<maxlength
%             partRoute=[partRoute,zeros(maxlength-len)];%�̸��岹1
%         end
        real_partRoute{i,j}=partRoute;
    end
    nt_coo1=length(index_coo);
    coo1Cell=cell(NR,1);
    for j = 1:NR
        midcoo1=real_partRoute{i,j};
        for m = 1:length(midcoo1)
            if ~sum(midcoo1(m)==index_coo)
                midcoo1(m)=0;
            end
        end
        midcoo1(find(midcoo1==0))=[];
        coo1Cell{j,1}=midcoo1;
    end
%�������Ƿ����
%�ȼ��һ�������Ƿ���������ͬ��������
    for j=1:NR
        for k=1:nt_coo1
            if length(find(real_partRoute{i,j}==index_coo(k)))>1
                Obj(i,1)=1000;
            end
        end
    end
%�ټ��ִ��˳���Ƿ����
    if Obj(i,1)==0
    while 1
        for j = 1:NR
            if isempty(coo1Cell{j,1})
                C1(j)=0;
            else
                C1(j) = coo1Cell{j,1}(1);%��һ��Ԫ��
            end
        end
        if prod(C1==0)
            break
        end
        C2=C1;
        for m=1:nt_coo1%��������Ƿ��ظ�num_coo1�Σ���������
            reindex=find(C2==index_coo(m));
            if length(reindex)==num_coo(m)
                for n = 1:length(reindex)
                    coo1Cell{reindex(n),1}(1)=[];
                    C2(reindex(n))=0;
                end
            end
        end
        if C2==C1
            Obj(i,1) = 1000;
            break
        end
    end
    end
    if Obj(i,1)==0
    Time_coo=zeros(1,nt_coo1);
    %����ÿ�����������ִ��ʱ��
    while 1
        for j=1:nt_coo1%���ο���3,4,5
            indd=[];
            if Time_coo(j)==0
                for k=1:NR          %ÿ������3������3�����
                    set=find(real_partRoute{i,k}==index_coo(j));
                    if isempty(set)
                        indd=[indd,0];
                    else
                        indd=[indd,set];
                    end
                end
                flag=[];
                for m = 1:NR
                    if (indd(m)~=0)&&(indd(m)~=1)%�жϴ˳���������ǰ��û����һ��δ֪��������,0���У�1������
                        flag1=[];
                        for n = 1:indd(m)-1
                            if sum(real_partRoute{i,m}(n)==index_coo)
                                if Time_coo(find(index_coo==real_partRoute{i,m}(n)))~=0
                                    flag1=[flag1,0];
                                else
                                    flag1=[flag1,1];
                                end
                            else
                                flag1=[flag1,0];
                            end
                        end
                        flag=[flag,sum(flag1)];
                    else
                        flag=[flag,0];
                    end
                end
                if sum(flag)==0    %��һ��1�Ͳ�����
                    %����ʱ��
                    inddd=find(indd~=0);
                    for p=1:length(inddd)
                        partRoute_t=real_partRoute{i,inddd(p)};
                        for k = 2:100
                            if partRoute_t(k)~=1
                                Power_t(inddd(p)) = Power_t(inddd(p))+Power_matrix(partRoute_t(k-1),partRoute_t(k));%���ϵ��������·�̵ĺĵ���
                                Time_t(inddd(p)) = Time_t(inddd(p))+Time_matrix(partRoute_t(k-1),partRoute_t(k));
                                if partRoute_t(k)==index_coo(j)
                                    Time_coo(j)=max(Time_coo(j),Time_t(inddd(p)));
                                    Power_t(inddd(p))=0;
                                    Time_t(inddd(p))=0;
                                    break
                                end
                                if sum(partRoute_t(k)==index_coo)         %����Ǻ���Эͬ����
                                    Power_t(inddd(p)) = Power_t(inddd(p))+Powercost(partRoute_t(k));
                                    Time_t(inddd(p))=Time_coo(find(index_coo==partRoute_t(k)))+Timecost(partRoute_t(k));
                                else
                                    Power_t(inddd(p))=Power_t(inddd(p))+Powercost(partRoute_t(k));
                                    Time_t(inddd(p))=Time_t(inddd(p))+Timecost(partRoute_t(k));
                                end
                                if (k < length(partRoute_t))&&(Power_t(inddd(p))+Power_matrix(partRoute_t(k),partRoute_t(k+1))+Powercost(partRoute_t(k+1))+Power_matrix(partRoute_t(k+1),partRoute_t(1))>100)   %���û������´����񲢷��ػ��أ����Ȼػ��س��
                                    partRoute_t = [partRoute_t(1:k),1,partRoute_t(k+1:end)];
                                    Time_t(inddd(p)) = Time_t(inddd(p))+Time_matrix(partRoute_t(k),1)+Tch*Power_t(inddd(p));
                                    Power_t(inddd(p)) = 0;
                                end
                            end
                        end
                    end
                end
            end
        end
        %���Time_coo������break
        if prod(Time_coo~=0)
            break
        end
    end
    
    for j = 1:NR
        partRoute=real_partRoute{i,j};
        for k = 2:100
            if partRoute(k)~=1
                Power(j) = Power(j)+Power_matrix(partRoute(k-1),partRoute(k));%���ϵ��������·�̵ĺĵ���
                Time(j) = Time(j)+Time_matrix(partRoute(k-1),partRoute(k));
                
                if sum(partRoute(k)==index_coo)        %����Ǻ���Эͬ����
                        %��������,ʱ��ᱣ����Time_coo��
                        ind=find(index_coo==partRoute(k));%��ind����������
                        Punish = Punish+Cs*hardlim(TimeWin(partRoute(k),1)-Time_coo(ind))*(TimeWin(partRoute(k),1)-Time_coo(ind));
                        if Time_coo(ind)~=0
                            Power(j)=Power(j)+Powercost(partRoute(k));
                            wait(j)=wait(j)+Time_coo(ind)-Time(j);
                            Time(j)=Time_coo(ind)+Timecost(partRoute(k));
                            Punish = Punish+Ce*hardlim(Time(j)-TimeWin(partRoute(k),2))*(Time(j)-TimeWin(partRoute(k),2));
                        end
                else
                    Punish = Punish+Cs*hardlim(TimeWin(partRoute(k),1)-Time(j))*(TimeWin(partRoute(k),1)-Time(j));
                    Power(j)=Power(j)+Powercost(partRoute(k));
                    Time(j)=Time(j)+Timecost(partRoute(k));
                    Punish = Punish+Ce*hardlim(Time(j)-TimeWin(partRoute(k),2))*(Time(j)-TimeWin(partRoute(k),2));
                end
                if (k < length(partRoute))&&(Power(j)+Power_matrix(partRoute(k),partRoute(k+1))+Powercost(partRoute(k+1))+Power_matrix(partRoute(k+1),partRoute(1))>100)   %���û������´����񲢷��ػ��أ����Ȼػ��س��
                    partRoute = [partRoute(1:k),1,partRoute(k+1:end)];
                    Time(j) = Time(j)+Time_matrix(partRoute(k),1)+Tch*Power(j);
                    Power(j) = 0;
                    real_partRoute{i,j}=partRoute;
                end
            else
                if (k == length(partRoute))
                    real_partRoute{i,j}=partRoute;
                    break
                end
            end
        end
    end
    Obj(i,1) = max(Time);
    Obj(i,2)= Punish+0.5*sum(wait);
    wait=zeros(NR,1);
    Punish=0;
    end

end
end
%% ��Ⱥ��ʼ��
%����NUM��         ��Ⱥ��С
%����N��           Ⱦɫ�峤��
%���pop��         ������ɵĳ�ʼ��Ⱥ
function pop=InitPop_coo(NUM,index_coo,index_coo1,num_coo,num_coo1)
global nt NR N
    nt_coo = length(index_coo);
    nt_coo1=length(index_coo1);
    pop=zeros(NUM,N);              %��Ⱥ��ʼ��ΪNUM��N�е������
    pop_1=zeros(NUM,nt-1);
for i=1:NUM
    midmat = [];
    pop_1(i,:)=randperm(nt-1);           %1~n-1���������
    pop_1(i,:)=pop_1(i,:)+1;            %2~n���������
    for k = 1:nt_coo
        for p = 1:num_coo(k)-1
            midmat = [midmat,index_coo(k)];
        end
    end
    pop(i,:)=[ones(1,NR-1),midmat,pop_1(i,:)];
    
%%%%%%%�˲�����ֱ���޸�Ⱦɫ�壬���ܿ�����%%%%%%
    seq=randi([N-nt+2,N],1,NR-1+sum(num_coo)-nt_coo);           %ѡ��NR-1��λ�ò���1���ظ��ĺ�������㣺[1,1,2,4,rand(2~n)]
    popa=pop(i,:);
    for j=1:(NR-1+sum(num_coo)-nt_coo)
        popa([j seq(j)])=popa([seq(j) j]);%����
    end
    pop(i,:)=popa;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
%%%%%������while������ѭ��ֱ������Ⱦɫ�����%%%%%%%%%%
%     while 1
%     seq=randi([N-nt+2,N],1,NR-1+sum(num_coo)-nt_coo);           %ѡ��NR-1��λ�ò���1���ظ��ĺ�������㣺[1,1,2,4,rand(2~n)]
%     popa=pop(i,:);
%     for j=1:(NR-1+sum(num_coo)-nt_coo)
%         popa([j seq(j)])=popa([seq(j) j]);%����
%     end
%     index_1 = find(popa==1);
%     flag=[];
%     for m=1:nt_coo1
%         index_extra = find(popa==index_coo1(m));%�ظ�������λ��
%         F=0;
%         for n = 1:num_coo1(m)-1  %��n���ظ�����
%             for t = 1:length(index_1)
%                 if index_1(t)>index_extra(n)&&index_1(t)<index_extra(n+1)%�������һ��1���ظ������м�
%                     F=1;%����1�����������
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


%     %������Ⱥ����������������ø���
%     index_1 = find(pop(i,:)==1);
%     for m=1:nt_coo
%     index_extra = find(pop(i,:)==index_coo(m));%�ظ�������λ��
%         for n = 1:num_coo(m)-1
%             if ~(sum(index_extra(n)<index_1)&&sum(index_1<index_extra(n+1)))%��������ظ����������м�û��1
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
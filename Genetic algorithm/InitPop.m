%% ��Ⱥ��ʼ��
%����NUM��         ��Ⱥ��С
%����N��           Ⱦɫ�峤��
%���pop��         ������ɵĳ�ʼ��Ⱥ
function pop=InitPop(NUM,N)
global nt NR
    pop=zeros(NUM,N);              %��Ⱥ��ʼ��ΪNUM��N�е������
    pop_1=zeros(NUM,nt-1);
for i=1:NUM
    pop_1(i,:)=randperm(nt-1);           %1~n-1���������
    pop_1(i,:)=pop_1(i,:)+1;            %2~n���������
    pop(i,:)=[ones(1,NR-1),pop_1(i,:)];
    seq=randi([NR,N],1,NR-1);
    for j=1:(NR-1)
        pop(i,[j seq(j)])=pop(i,[seq(j),j]);%����
    end
    
end
end
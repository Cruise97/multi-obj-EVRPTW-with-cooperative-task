%% �������
% ����
%newpop  ��ѡ��ĸ���
%Pc      �������
%�����
% newpop �����ĸ���
function newpop=cross(newpop,FitnV,index_coo,Pc1,Pc2)
global NUM 

%����Ӧ�Ŵ��㷨
%������Ⱥ��Ӧ��
Maxfitvalue = max(FitnV);
Meanfitvalue = sum(FitnV)/NUM;

%����Ⱥ��Ӧ��ȷ���������
for i = 1:2:NUM-mod(NUM,2)
    if max(FitnV(i),FitnV(i+1)) >= Meanfitvalue
        Pc = Pc1*(Maxfitvalue-max(FitnV(i),FitnV(i+1)))/(Maxfitvalue-Meanfitvalue);
    else
        Pc = Pc2;
    end
    if Pc>=rand %�������Pc
        [newpop(i,:),newpop(i+1,:)]=PBX(newpop(i,:),newpop(i+1,:),index_coo);
    end
end
    
% �̶��������
% for i = 1:2:NUM-mod(NUM,2)
%     if Pc1>=rand %�������Pc
%         [newpop(i,:),newpop(i+1,:)]=PBX(newpop(i,:),newpop(i+1,:),index_coo1);
%     end
% end
end




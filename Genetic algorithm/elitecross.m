%% �������
% ����
%newpop  ��ѡ��ĸ���
%Pc      �������
%�����
% newpop �����ĸ���
function newpop=elitecross(bestIndividual,newpop,Pc,Time_matrix,Power_matrix,Timecost,Powercost,index_coo,num_coo,TimeWin)
global NUM Norig
    
% �̶��������
for i = 1:Norig
    if Pc>=rand %�������Pc
        [newpop(i,:)]=elitePBX(newpop(i,:),bestIndividual,Time_matrix,Power_matrix,Timecost,Powercost,index_coo,num_coo,TimeWin);
    end
end
end




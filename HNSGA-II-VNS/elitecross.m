%% �������
% ����
%newpop  ��ѡ��ĸ���
%Pc      �������
%�����
% newpop �����ĸ���
function newpop=elitecross(newpop,Pc,Time_matrix,Power_matrix,Timecost,Powercost,index_coo,num_coo,TimeWin)
global NUM Norig
    
% �̶��������
for i = 1:2:Norig
    if Pc>=rand %�������Pc
        [newpop(i,:),newpop(i+1,:)]=elitePBX(newpop(i,:),newpop(i+1,:),Time_matrix,Power_matrix,Timecost,Powercost,index_coo,num_coo,TimeWin);
    end
end
end




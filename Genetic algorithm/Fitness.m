%% ����ÿ���������Ӧ��ֵ����������ĵ���    
%����Obj��        ÿ�������Ŀ�꺯��ֵ
%���Fitvalue��   ÿ���������Ӧ��ֵ
function Fitvalue=Fitness(Obj)
    [row,~]=size(Obj);
    Fitvalue=zeros(row,1);
    Fitvalue=1./Obj;
end
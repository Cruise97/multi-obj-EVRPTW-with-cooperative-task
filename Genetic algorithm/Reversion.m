%��6�����У���ǰ��Ϊ123456���������ѡ������λ�ã�Ȼ��������λ��֮���Ԫ�ؽ����������С�
%����˵����ת2��5֮�������Ԫ�أ�����ת��Ľ�Ϊ154326��

%����route1��          ·��1
%���route2��          ������ת�ṹ�任���·��2
function route2=Reversion(route1)
n=length(route1);
seq=randperm(n);
I=seq(1:2);
i1=min(I);
i2=max(I);
route2=route1;
route2(i1:i2)=route1(i2:-1:i1);
end
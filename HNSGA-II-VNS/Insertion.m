%��6�����У���ǰ��Ϊ123456���������ѡ������λ�ã�Ȼ�����һ��λ���ϵ�Ԫ�ز��뵽�ڶ���Ԫ�غ��档
%����˵����һ��ѡ��5���λ�ã��ڶ���ѡ��2���λ�ã�������Ľ�Ϊ125346��

%����route1��          ·��1
%���route2��          ��������ṹ�任���·��2
function route2=Insertion(route1)
% n=length(route1);
% seq=randperm(n);
% I=seq(1:2);
% i1=I(1);
% i2=I(2);
% if i1<i2
%     route2=route1([1:i1-1 i1+1:i2 i1 i2+1:end]);
% else
%     route2=route1([1:i2 i1 i2+1:i1-1 i1+1:end]);
% end

n=length(route1);
seq=randperm(n,2);
if seq(1)>seq(2)
    seq=flip(seq);
end
if seq(2)-seq(1)==n-1
    route2=route1;
else
    son=[route1(1:seq(1)-1),route1(seq(2)+1:end)];
    insertInd=randi(length(son));
    route2=[son(1:insertInd),route1(seq(1):seq(2)),son(insertInd+1:end)];
end
end
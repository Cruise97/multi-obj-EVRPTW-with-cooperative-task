%有6个城市，当前解为123456，我们随机选择两个位置，然后将这第一个位置上的元素插入到第二个元素后面。
%比如说，第一个选择5这个位置，第二个选择2这个位置，则插入后的解为125346。

%输入route1：          路线1
%输出route2：          经过插入结构变换后的路线2
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
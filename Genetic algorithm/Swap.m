%����route1��          ·��1
%���route2��          ���������ṹ�任���·��2
function route2=Swap(route1)
n=length(route1);
seq=randperm(n);
I=seq(1:2);
i1=I(1);
i2=I(2);
route2=route1;
route2([i1 i2])=route1([i2 i1]);

end
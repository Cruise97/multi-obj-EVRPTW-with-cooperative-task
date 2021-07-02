%输入route1：          路线1
%输出route2：          经过交换结构变换后的路线2
function route2=Swap(route1)
n=length(route1);
seq=randperm(n);
I=seq(1:2);
i1=I(1);
i2=I(2);
route2=route1;
route2([i1 i2])=route1([i2 i1]);

end
%输入pSwap：           选择交换结构的概率
%输入pReversion：      选择逆转结构的概率
%输入pInsertion：      选择插入结构的概率
%输出index：           最终选择哪一个邻域结构，即序号：1 2 3
function index=Roulette(pSwap,pReversion,pInsertion)
p=[pSwap pReversion pInsertion];
r=rand;
c=cumsum(p);
index=find(r<=c,1,'first');
end
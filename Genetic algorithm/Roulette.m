%����pSwap��           ѡ�񽻻��ṹ�ĸ���
%����pReversion��      ѡ����ת�ṹ�ĸ���
%����pInsertion��      ѡ�����ṹ�ĸ���
%���index��           ����ѡ����һ������ṹ������ţ�1 2 3
function index=Roulette(pSwap,pReversion,pInsertion)
p=[pSwap pReversion pInsertion];
r=rand;
c=cumsum(p);
index=find(r<=c,1,'first');
end
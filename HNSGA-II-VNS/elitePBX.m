%���룺
%a��bΪ����������ĸ���
%�����
%a��bΪ�����õ�����������
function [son1,son2]=elitePBX(a,b,Time_matrix,Power_matrix,Timecost,Powercost,index_coo,num_coo,TimeWin)
global nt
    L=length(a);
    nt1=length(index_coo);
    son1=zeros(1,L);
    son2=zeros(1,L);
    %�������죬����ĺ������>L+1,L+2...
    extend=nt+1;
    length_coo1=[];%ÿ�������������Ĵ���
    for i = 1:nt1
        seatcoo=find(a==index_coo(i));
        length_coo1=[length_coo1,length(seatcoo)-1];
        for j=1:length(seatcoo)-1
            a(seatcoo(j))=extend;
            extend=extend+1;
        end
    end
    extend=nt+1;
    for i = 1:nt1
        seatcoo=find(b==index_coo(i));
        for j=1:length(seatcoo)-1
            b(seatcoo(j))=extend;
            extend=extend+1;
        end
    end
    extend=nt+1;
    %%%%%%%%%
    branchsize=randi([1,L]);    %���֦辴�С
    indexbranch=randperm(L);   
    indexbranch(branchsize+1:end)=[];    %���branchsize��λ��(���ظ���
    indexbranch=sort(indexbranch);       %��С��������
    for i=1:branchsize                   %ɾ��������1�����к�
        if a(indexbranch(i))==1
            indexbranch(i)=0;
        end
    end
    indexbranch(indexbranch==0)=[];
    branchsize=length(indexbranch);
    son1(indexbranch)=a(indexbranch);
    sample1=a;
    sample1(indexbranch)=[];              %a����Ҫ�����ȥ������
    
    indexbranch_b=zeros(1,branchsize);
    for i=1:branchsize
        [~,indexbranch_b(1,i)]=find(b==a(indexbranch(i)));
    end
    indexbranch_b=sort(indexbranch_b);    %��С��������
    son2(indexbranch_b)=b(indexbranch_b);
    sample2=b;
    sample2(indexbranch_b)=[];                %b����Ҫ�����ȥ������
    m=1;
    n=1;
    for i=1:L
        if son1(i)==0
            son1(i)=sample2(m);
            m=m+1;
        end
    end
    for i=1:L
        if son2(i)==0
            son2(i)=sample1(n);
            n=n+1;
        end
    end
    
    %�Ӵ���ԭ
    for i=1:nt1
        for j=1:length_coo1(i)
            son1(find(son1==extend))=index_coo(i);
            son2(find(son2==extend))=index_coo(i);
            extend=extend+1;
        end
    end
end
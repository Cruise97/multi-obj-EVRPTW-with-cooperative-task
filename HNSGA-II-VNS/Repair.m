function newpop=Repair(pop,index_coo1,num_coo1)
global NR
[row,col]=size(pop);
nt_coo1 = length(index_coo1);
newpop=zeros(row,col);
for i=1:row
    midroute = [1,pop(i,:),1];
    index=find(midroute==1);
    partRoute=cell(3,1);
    for j=1:NR
        partRoute{j,1}=midroute(index(j):index(j+1));
        partRoute{j,1}(1)=[];
        partRoute{j,1}(end)=[];
    end
    %一类不可行修复
    for j=1:NR
        for k=1:nt_coo1
            if length(find(partRoute{j,1}==index_coo1(k)))>1
                ind=find(partRoute{j,1}==index_coo1(k));
                for n=2:length(ind)
                    for m=1:NR
                        if isempty(find(partRoute{m,1}==index_coo1(k)))
                            %随机一个位置插入一个合作点
                            setplace=randi([0,length(partRoute{m,1})]);
                            if setplace==0
                                partRoute{m,1}=[index_coo1(k),partRoute{m,1}];
                            else
                                if setplace==length(partRoute{m,1})
                                    partRoute{m,1}=[partRoute{m,1},index_coo1(k)];
                                else
                                    partRoute{m,1}=[partRoute{m,1}(1:setplace),index_coo1(k),partRoute{m,1}(setplace+1:end)];
                                end
                            end
                            break
                        end
                    end
                    %删除当前子路径下的闭环交点
                    partRoute{j,1}(ind(n))=0;
                end
                partRoute{j,1}(find(partRoute{j,1}==0))=[];
            end
        end
    end
%     %第二类不可行修复
    coo1Cell=cell(NR,1);
    indexcoo1Cell=cell(NR,1);%与coo1Cell一一对应的索引
       for j = 1:NR
            midcoo1=partRoute{j,1};
            for m = 1:length(midcoo1)
                if ~sum(midcoo1(m)==index_coo1)
                    midcoo1(m)=0;
                end
            end
            midcoo1(find(midcoo1==0))=[];
            coo1Cell{j,1}=midcoo1;
        end

        
    while 1
        for j=1:NR
            [~,indexcoo1Cell{j,1}]=ismember(coo1Cell{j,1},partRoute{j,1});
        end
        for j = 1:NR
            if isempty(coo1Cell{j,1})
                C1(j)=0;
            else
                C1(j) = coo1Cell{j,1}(1);%第一列元素
            end
        end
        if prod(C1==0)
            break
        end
        C2=C1;
        for m=1:nt_coo1%挨个检查是否重复num_coo1次，是则消掉
            reindex=find(C2==index_coo1(m));
            if length(reindex)==num_coo1(m)
                for n = 1:length(reindex)
                    coo1Cell{reindex(n),1}(1)=[];
                    C2(reindex(n))=0;
                end
            end
        end
        if C2==C1
            indfirst=find(C2~=0,1);
            for j=indfirst+1:NR
                if ~isempty(find(coo1Cell{j,1}==C2(indfirst)))&&find(coo1Cell{j,1}==C2(indfirst))~=1
                    leftInd=indexcoo1Cell{j,1}(1);
                    rightInd=indexcoo1Cell{j,1}(find(coo1Cell{j,1}==C2(indfirst)));
                    coo1Cell{j,1}=[fliplr(coo1Cell{j,1}(1:find(coo1Cell{j,1}==C2(indfirst)))),coo1Cell{j,1}(find(coo1Cell{j,1}==C2(indfirst))+1:end)];
                    partRoute{j,1}=[partRoute{j,1}(1:leftInd-1),fliplr(partRoute{j,1}(leftInd:rightInd)),partRoute{j,1}(rightInd+1:end)];
                end
            end
        end
    end
    chrom=[];
    for j=1:NR
        chrom=[chrom,partRoute{j,1},1];
    end
    chrom(end)=[];
    newpop(i,:)=chrom;
end

end
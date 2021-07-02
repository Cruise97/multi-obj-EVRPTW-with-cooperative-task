function MatingPool = Mating(Population,FrontValue,CrowdDistance)
%交配池选择。规模为2的锦标赛选择方式，
%这是在进化算法中常见的选择方式，模拟自然界中一个普遍存在的规律，即优秀个体有更大的概率能够繁衍后代。
%MatingPool：经过交配池留下的种群
global Norig
    [N,D] = size(Population);
    
    %二元联赛选择
    %先生成100随机序列，两两比较选择更优的个体，于是得到50个子代，再随机排序两两比较选择50个更优的个体
    MatingPool = zeros(N,D);%Norig
    Rank = randperm(N); %randperm将一列序号随机打乱,序号必须是整数
    Pointer = 1;
    for i = 1 : 2 : N%Norig
        %选择父母
        k = zeros(1,2);
        for j = 1 : 2
            if Pointer >= N
                Rank = randperm(N);
                Pointer = 1;
            end
            p = Rank(Pointer);
            q = Rank(Pointer+1);%规模为2的锦标赛选择方式
            if FrontValue(p) < FrontValue(q)
                k(j) = p;
            elseif FrontValue(p) > FrontValue(q)%选择前沿面靠前的
                k(j) = q;
            elseif CrowdDistance(p) > CrowdDistance(q)%前沿面相同就选择拥挤聚集距离大的
                k(j) = p;
            else
                k(j) = q;
            end
            Pointer = Pointer+2;
        end
        MatingPool(i,:) = Population(k(1),:);
        MatingPool(i+1,:) = Population(k(2),:);
    end
end


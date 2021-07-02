function CrowdDistance = CrowdDistances(FunctionValue,FrontValue)
%分前沿面计算种群中每个个体的拥挤距离

    [N,M] = size(FunctionValue);
    CrowdDistance = zeros(1,N);
    Fronts = setdiff(unique(FrontValue),inf);
    for f = 1 : length(Fronts)
        Front = find(FrontValue==Fronts(f));
        Fmax = max(FunctionValue(Front,:),[],1);%max(X,[],1)返回每列的最大值，max(X,[],2)返回每行的最大值
        Fmin = min(FunctionValue(Front,:),[],1);
        for i = 1 : M
            [~,Rank] = sortrows(FunctionValue(Front,i));%在同一前沿面上，f1大的个体f2必然小，反之f1小的个体f2必然大，因此按f1排序后的Rank和按f2排序后的Rank顺序正好相反
            CrowdDistance(Front(Rank(1))) = inf;
            CrowdDistance(Front(Rank(end))) = inf;
            for j = 2 : length(Front)-1
                CrowdDistance(Front(Rank(j))) = CrowdDistance(Front(Rank(j)))+(FunctionValue(Front(Rank(j+1)),i)-FunctionValue(Front(Rank(j-1)),i))/(Fmax(i)-Fmin(i));
            end
        end
    end
end


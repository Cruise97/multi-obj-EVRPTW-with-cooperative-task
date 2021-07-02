function CrowdDistance = CrowdDistances(FunctionValue,FrontValue)
%��ǰ���������Ⱥ��ÿ�������ӵ������

    [N,M] = size(FunctionValue);
    CrowdDistance = zeros(1,N);
    Fronts = setdiff(unique(FrontValue),inf);
    for f = 1 : length(Fronts)
        Front = find(FrontValue==Fronts(f));
        Fmax = max(FunctionValue(Front,:),[],1);%max(X,[],1)����ÿ�е����ֵ��max(X,[],2)����ÿ�е����ֵ
        Fmin = min(FunctionValue(Front,:),[],1);
        for i = 1 : M
            [~,Rank] = sortrows(FunctionValue(Front,i));%��ͬһǰ�����ϣ�f1��ĸ���f2��ȻС����֮f1С�ĸ���f2��Ȼ����˰�f1������Rank�Ͱ�f2������Rank˳�������෴
            CrowdDistance(Front(Rank(1))) = inf;
            CrowdDistance(Front(Rank(end))) = inf;
            for j = 2 : length(Front)-1
                CrowdDistance(Front(Rank(j))) = CrowdDistance(Front(Rank(j)))+(FunctionValue(Front(Rank(j+1)),i)-FunctionValue(Front(Rank(j-1)),i))/(Fmax(i)-Fmin(i));
            end
        end
    end
end


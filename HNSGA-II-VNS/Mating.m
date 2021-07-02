function MatingPool = Mating(Population,FrontValue,CrowdDistance)
%�����ѡ�񡣹�ģΪ2�Ľ�����ѡ��ʽ��
%�����ڽ����㷨�г�����ѡ��ʽ��ģ����Ȼ����һ���ձ���ڵĹ��ɣ�����������и���ĸ����ܹ����ܺ����
%MatingPool��������������µ���Ⱥ
global Norig
    [N,D] = size(Population);
    
    %��Ԫ����ѡ��
    %������100������У������Ƚ�ѡ����ŵĸ��壬���ǵõ�50���Ӵ�����������������Ƚ�ѡ��50�����ŵĸ���
    MatingPool = zeros(N,D);%Norig
    Rank = randperm(N); %randperm��һ������������,��ű���������
    Pointer = 1;
    for i = 1 : 2 : N%Norig
        %ѡ��ĸ
        k = zeros(1,2);
        for j = 1 : 2
            if Pointer >= N
                Rank = randperm(N);
                Pointer = 1;
            end
            p = Rank(Pointer);
            q = Rank(Pointer+1);%��ģΪ2�Ľ�����ѡ��ʽ
            if FrontValue(p) < FrontValue(q)
                k(j) = p;
            elseif FrontValue(p) > FrontValue(q)%ѡ��ǰ���濿ǰ��
                k(j) = q;
            elseif CrowdDistance(p) > CrowdDistance(q)%ǰ������ͬ��ѡ��ӵ���ۼ�������
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


%% 轮盘赌选择
%输入pop：                 种群
%输入Fitvalue：            种群适应度
%输出selectpop：           轮盘赌选择出的种群
function selectpop=RouletteSelct(num,pop,Fitvalue)
global N NUM
selectpop=zeros(num,N);                    %初始化轮盘赌选择出的个体
%计算累加概率
PP = cumsum( Fitvalue ./ sum(Fitvalue) );

for i = 1:num
    r = rand;
    for j = 1:NUM
        if r <= PP(j)
            selectpop(i,:) = pop(j,:);
            break;
        end
    end
end



%% ���̶�ѡ��
%����pop��                 ��Ⱥ
%����Fitvalue��            ��Ⱥ��Ӧ��
%���selectpop��           ���̶�ѡ�������Ⱥ
function selectpop=RouletteSelct(num,pop,Fitvalue)
global N NUM
selectpop=zeros(num,N);                    %��ʼ�����̶�ѡ����ĸ���
%�����ۼӸ���
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



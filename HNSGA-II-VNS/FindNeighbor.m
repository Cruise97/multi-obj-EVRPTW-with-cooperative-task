function newpop=FindNeighbor(pop,Time_matrix,Power_matrix,Timecost,Powercost,index_coo1,num_coo1,TimeWin)
global N NR
[row,~]=size(pop);
newpop=pop;
maxiter=5;
for i=1:row
% for iter=1:15
% pop(i,:)=newpop(i,:);
[Obj_current,~]=ObjFunction_coo(pop(i,:),Time_matrix,Power_matrix,Timecost,Powercost,index_coo1,num_coo1,TimeWin);
while 1
while 1
%¡Ï”Ú1
while 1
for k=1:maxiter
    index_border=find(pop(i,:)==1);
    index_border=[0,index_border,N+1];    
    changeNR=randperm(NR,2);
    if index_border(changeNR(1))+1~=index_border(changeNR(1)+1) && index_border(changeNR(2))+1~=index_border(changeNR(2)+1)
        changeind(1)=randi([index_border(changeNR(1))+1,index_border(changeNR(1)+1)-1]);
        changeind(2)=randi([index_border(changeNR(2))+1,index_border(changeNR(2)+1)-1]);
        testpop=pop(i,:);
        testpop(changeind)=testpop(flip(changeind));
        [Obj_test,~]=ObjFunction_coo(testpop,Time_matrix,Power_matrix,Timecost,Powercost,index_coo1,num_coo1,TimeWin);
        if Obj_test(1)<=Obj_current(1)&&Obj_test(2)<=Obj_current(2)
            newpop(i,:)=testpop;
            Obj_current=Obj_test;
        end
    end
end
    if prod(newpop(i,:)==pop(i,:))
        break
    else
        pop(i,:)=newpop(i,:);
    end
end
%¡Ï”Ú2
for k=1:maxiter
    index_border=find(pop(i,:)==1);
    index_border=[0,index_border,N+1];    
    changeNR=randperm(NR,2);
    if index_border(changeNR(1))+1~=index_border(changeNR(1)+1)
        moveind(1)=randi([index_border(changeNR(1))+1,index_border(changeNR(1)+1)-1]);
        moveind(2)=randi([index_border(changeNR(2)),index_border(changeNR(2)+1)-1]);
        testpop=pop(i,:);
        if moveind(1)<moveind(2)
            testpop=testpop([1:moveind(1)-1 moveind(1)+1:moveind(2) moveind(1) moveind(2)+1:end]);
        else
            testpop=testpop([1:moveind(2) moveind(1) moveind(2)+1:moveind(1)-1 moveind(1)+1:end]);
        end
        [Obj_test,~]=ObjFunction_coo(testpop,Time_matrix,Power_matrix,Timecost,Powercost,index_coo1,num_coo1,TimeWin);
        if Obj_test(1)<=Obj_current(1)&&Obj_test(2)<=Obj_current(2)
            newpop(i,:)=testpop;
            Obj_current=Obj_test;
        end
    end
end
    if prod(newpop(i,:)==pop(i,:))
        break
    else
        pop(i,:)=newpop(i,:);
    end
end
%¡Ï”Ú3
for k=1:maxiter
    index_border=find(pop(i,:)==1);
    index_border=[0,index_border,N+1];    
    changeNR=randperm(NR,2);
    if index_border(changeNR(1))+1~=index_border(changeNR(1)+1)
        segind=randi([index_border(changeNR(1))+1,index_border(changeNR(1)+1)-1],1,2);
        testpop=pop(i,:);
        if segind(1)>segind(2)
            segind=flip(segind);
        end
        remain=[testpop(1:segind(1)-1),testpop(segind(2)+1:end)];
        index1=find(remain==1);
        index1=[0,index1,length(remain)+1];
        Insertind=randi([index1(changeNR(2)),index1(changeNR(2)+1)-1]);
        testpop=[remain(1:Insertind),testpop(segind(1):segind(2)),remain(Insertind+1:end)];
        [Obj_test,~]=ObjFunction_coo(testpop,Time_matrix,Power_matrix,Timecost,Powercost,index_coo1,num_coo1,TimeWin);
        if Obj_test(1)<=Obj_current(1)&&Obj_test(2)<=Obj_current(2)
            newpop(i,:)=testpop;
            Obj_current=Obj_test;
        end
    end
end
    if prod(newpop(i,:)==pop(i,:))
        break
    else
        pop(i,:)=newpop(i,:);
    end
end
% if newpop(i,:)==pop(i,:)
%     break
% end
end
end
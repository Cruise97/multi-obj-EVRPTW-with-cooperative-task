function Dist=Route_Dist(p)
    Dist = 0;
    for i=2:length(p)
        Dist=Dist+sqrt((p(i,1)-p(i-1,1))^2+(p(i,2)-p(i-1,2))^2);
    end
end
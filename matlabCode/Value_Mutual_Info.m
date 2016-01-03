function val = Value_Mutual_Info(data,N,P_Z)
    
    [var_support,~,indx] = unique(data,'rows');
    m = size(var_support,1);
    prob = zeros(1,3);
    val = 0;
    for i = 1:1:m
        prob(1,1) = sum(indx == i) / N;
        prob(1,2) = sum(data(:,1) == var_support(i,1)) / N;
        prob(1,3) = sum(data(:,2) == var_support(i,2)) / N;
        tmp = prob(1,1) * (log( (P_Z * prob(1,1))/(prob(1,2)*prob(1,3)) ));
        val = val + tmp;
    end
end
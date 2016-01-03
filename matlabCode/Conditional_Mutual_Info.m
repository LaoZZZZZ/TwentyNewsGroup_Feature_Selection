function val = Conditional_Mutual_Info(data)
 
[m,n] = size(data);
val = 0;
if n == 2
    val = Value_Mutual_Info(data,m,1);
else
    [var_support,~,indx] = unique(data(:,3:n),'rows');
    for i = 1:1:size(var_support,1)
        indx_i = logical(indx == i);
        p_z = sum(indx_i) / m;
        val = val + Value_Mutual_Info(data(indx_i,:),m,p_z);
    end
end
end
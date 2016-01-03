function var_indx = SimAnn_ChiSquare(count, label, var_cond, max_iteration)
% simulated annealing

[~,n] = size(count);
t_ini = 450;
t_end = 0.1;
cool_rate = (t_end / t_ini) ^ (1 / max_iteration);
t = t_ini;
pValue = inf;
while t > t_end
    while 1
        new_feature = floor(rand()*n);
        if new_feature > 0 && new_feature <= n && sum(var_cond == new_feature) == 0
            break;
        end
    end
    data = [count(:,new_feature),count(:,var_cond)];
    [~,pValue_tmp] = Conditional_ChiSquare(data,label);
    if pValue_tmp < pValue || (pValue_tmp >= pValue && SimAnn_Accept_Worse_Sol(pValue_tmp - pValue,t))
        var_indx = new_feature;
        pValue = pValue_tmp;
    end
        
    t = t * cool_rate;
end
end
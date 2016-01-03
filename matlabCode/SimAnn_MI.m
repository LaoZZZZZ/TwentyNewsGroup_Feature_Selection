function var_indx = SimAnn_MI(count, label, var_cond, max_iteration)
% simulated annealing

[~,n] = size(count);
t_ini = 450;
t_end = 0.1;
cool_rate = (t_end / t_ini) ^ (1 / max_iteration);
t = t_ini;
mi = inf;
while t > t_end
    while 1
        new_feature = floor(rand()*n);
        if new_feature > 0 && new_feature <= n && sum(var_cond == new_feature) == 0
            break;
        end
    end
    mi_tmp = - Score_Mutual_Info_new(count,label,new_feature,var_cond);
    if mi_tmp < mi || (mi_tmp >= mi && SimAnn_Accept_Worse_Sol(mi_tmp - mi,t))
        var_indx = new_feature;
        mi = mi_tmp;
    end
        
    t = t * cool_rate;
end
end
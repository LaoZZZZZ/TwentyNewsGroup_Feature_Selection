function var_indx = SimAnn_DF(count, var_cond, max_iteration)
% simulated annealing

[~,n] = size(count);
t_ini = 450;
t_end = 0.1;
cool_rate = (t_end / t_ini) ^ (1 / max_iteration);
t = t_ini;
score = inf;
while t > t_end
    while 1
        new_feature = floor(rand()*n);
        if new_feature > 0 && new_feature <= n && sum(var_cond == new_feature) == 0
            break;
        end
    end
    score_tmp = - Score_Doc_Freq(count,new_feature);
    if score_tmp < score || (score_tmp >= score && SimAnn_Accept_Worse_Sol(score_tmp - score,t))
        var_indx = new_feature;
        score = score_tmp;
    end
        
    t = t * cool_rate;
end
end
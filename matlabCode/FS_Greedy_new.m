function var_indx = FS_Greedy_new( counts, label, max_num, var_ini)
% find a subset of features that max the score at each iteration
var_indx = zeros(1,max_num);
n_ini = size(var_ini,2);
if n_ini > 0
    var_indx(1,1:n_ini) = var_ini;
end
n = size(counts,2);
for i = (n_ini + 1):1:max_num
    score_max = -Inf;
    for j = 1:1:n
        if sum(var_indx == j) == 0
            score = Score_Mutual_Info_new( counts, label, j, var_indx(1:(i-1)) );
            if score > score_max
                var_indx(i) = j;
                score_max = score;
            end
        end
    end
end
end
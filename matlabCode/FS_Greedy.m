function var_indx = FS_Greedy( counts, label, max_num, var_ini)
% find a subset of features that max the score at each iteration
var_indx = zeros(1,max_num);
n_ini = size(var_ini,2);
if n_ini > 0
    var_indx(1,1:n_ini) = var_ini;
end
n = size(counts,2);
for i = (n_ini + 1):1:max_num
    i
    score_max = -Inf;
    for j = 1:1:n
        j
        if sum(var_indx == j) == 0
            if i == 1
                score = Score_Mutual_Info( counts, label, j, [] );
            else
                score = Score_Mutual_Info( counts, label, j, var_indx(1:(i-1)) );
            end
            if score > score_max
                var_indx(i) = j;
                score_max = score;
            end
        end
    end
end
end
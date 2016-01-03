function var_indx = FS_Greedy_ChiSquare( count, label, max_num, var_indx_ini)
% find a subset of features that max the score (x-square) at each iteration
var_indx = zeros(1,max_num);
n = size(count,2);
n_ini = size(var_indx_ini,2);
if n_ini > 0
    var_indx(1,1:n_ini) = var_indx_ini;
end
for i = (n_ini + 1):1:max_num
    if n_ini >= max_num
        break;
    end
    score_min = Inf;
    for j = 1:1:n
        if sum(var_indx == j) == 0
            if i == 1
                data = count(:,j);
            else
                data = [count(:,j),count(:,var_indx(1,1:(i-1)))];
            end
            [~,score] = Conditional_ChiSquare(data,label);
            if score < score_min
                var_indx(i) = j;
                score_min = score;
                if score == 0
                    break;
                end
            end
        end
    end
end
end
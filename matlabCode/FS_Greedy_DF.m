function var_indx = FS_Greedy_DF( counts, max_num)
% find a subset of features that max the score at each iteration
var_indx = zeros(1,max_num);
n = size(counts,2);
conditional_counts = counts;
for i = 1:1:max_num
    score_max = -Inf;
    for j = 1:1:n
        if sum(var_indx == j) == 0
            score = Score_Doc_Freq(conditional_counts,j);
            if score > score_max
                var_indx(i) = j;
                score_max = score;
            end
        end
    end
    indx = logical( conditional_counts(:,var_indx(i)) > 0 );
    conditional_counts = conditional_counts(indx,:);
end
end
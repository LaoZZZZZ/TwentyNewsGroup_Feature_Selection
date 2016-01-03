function var_indx = FS_SimAnn_MI( counts, label, max_num, n, k)
% find a subset of features that max the score at each iteration
var_indx = zeros(1,max_num);
for i = 1:1:max_num
    if i == 1
        var_indx(i) = SimAnn_MI(counts,label,[], n * k);
    else
        var_indx(i) = SimAnn_MI(counts,label,var_indx(1,1:(i-1)), n * k);
    end
end
end
function var_indx = FS_SimAnn_DF( count, max_num, n, k)
% find a subset of features that max the score (x-square) at each iteration
var_indx = zeros(1,max_num);
conditional_count = count;
for i = 1:1:max_num
    if i == 1
        var_indx(i) = SimAnn_DF(conditional_count,[], n * k);
    else
        var_indx(i) = SimAnn_DF(conditional_count,var_indx(1,1:(i-1)), n * k);
    end
    indx = logical( conditional_count(:,var_indx(i)) > 0 );
    conditional_count = conditional_count(indx,:);
end
end
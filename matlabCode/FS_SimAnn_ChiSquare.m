function var_indx = FS_SimAnn_ChiSquare( count, label, max_num, n, k)
% find a subset of features that max the score (x-square) at each iteration
var_indx = zeros(1,max_num);
for i = 1:1:max_num
    if i == 1
        var_indx(i) = SimAnn_ChiSquare(count,label,[],k * n);
    else
        var_indx(i) = SimAnn_ChiSquare(count,label,var_indx(1,1:(i-1)),k * n);
    end
end
end
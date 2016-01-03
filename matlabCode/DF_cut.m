function [y, indx] = DF_cut( x, threshold)
% delete feature from x whose document frequency <= threshold
[m,~] = size(x);
x_indicator = sum(x > 0) > threshold;
x = Trim_Matrix_BaseOn_Column([x;x_indicator]', m + 1)';
y = x(1:m,:);

% index
tmp = x_indicator > 0;
for i = 1:1:size(x_indicator,2)
    if tmp(i) == 1
        tmp(i) = tmp(i) + i;
    end
end
if size(tmp,2) == 1
    tmp = tmp';
end
[~,tmp_indx] = sort(tmp);
indx = tmp_indx(1,(size(tmp,2) - sum(tmp) + 1):size(tmp,2));
end
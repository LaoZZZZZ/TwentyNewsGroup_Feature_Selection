function [x_square, dof] = Value_ChiSquare_TestOfIndpendence(data,label)
% calculate x^2 statistics of test of independence of given data
N = size(data,1);
i_freq = tabulate([data;-1]);
j_freq = tabulate([label;-1]);
i_num = size(i_freq,1);
j_num = size(j_freq,1);
%i_support = unique(data);
%j_support = unique(label);
%i_num = size(i_support,1);
%j_num = size(j_support,1);
x_square = 0;
for i = 2:1:i_num
    for j = 2:1:j_num
        O_ij = sum( (data == i_freq(i,1)) .* (label == j_freq(j,1)) );
        E_ij = i_freq(i,2) * j_freq(j,2) / (1 * N);
        %O_ij = sum( (data == i_support(i)) .* (label == j_support(j)) );
        %E_ij = sum( data == i_support(i) ) * sum( label == j_support(j) ) / N;
        x_square = x_square + (O_ij - E_ij)^2 / E_ij;
    end
end
dof = (i_num - 2) * (j_num - 2);
end
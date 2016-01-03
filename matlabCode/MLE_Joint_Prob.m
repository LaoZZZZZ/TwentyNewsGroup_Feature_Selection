function p = MLE_Joint_Prob( data )
% p is the mle estimate of the joint probability.

% value of each variable in probability matirx
[m_data,n_data] = size(data);
i = n_data - 1;
p_tmp = unique(data(:,n_data));
while i > 0
    [m_tmp,n_tmp] = size(p_tmp);
    i_unique = unique(data(:,i));
    i_unique_size = size(i_unique,1);
    p_new = ones(m_tmp * i_unique_size,n_tmp + 1);
    for j = 1:1:i_unique_size
        p_new( (m_tmp * (j-1) + 1):(m_tmp * j),1 ) = ...
            p_new( (m_tmp * (j-1) + 1):(m_tmp * j),1 ) * i_unique(j);
        p_new( (m_tmp * (j-1) + 1):(m_tmp * j),2:n_tmp + 1 ) = p_tmp;
    end
    p_tmp = p_new;
    i = i - 1;
end

% calculate probability associates with each value
[m_prob,~] = size(p_new);
p_prob = zeros(m_prob,1);
for i = 1:1:m_prob
    n_count = 0;
    for j = 1:1:m_data
        if sum(data(j,:) == p_new(i,:)) == n_data
            n_count = n_count + 1;
        end
        p_prob(i) = n_count / m_data;
    end
end

% delete zero probability row
[~,sort_indx] = sort(p_prob);
num_zero = sum(p_prob == 0);
p = Delete_Selected_Row([p_new, p_prob],sort_indx(1:num_zero));
end
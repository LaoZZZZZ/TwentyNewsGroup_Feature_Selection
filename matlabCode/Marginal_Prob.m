function prob = Marginal_Prob(joint_prob, var)
% marginal distribution of var
[~,n] = size(joint_prob);
p = joint_prob(:,n);
[var_support,~,indx] = unique(joint_prob(:,var),'rows');
p_support = zeros(size(var_support,1),1);
for i = 1:1:size(var_support,1);
    p_support(i) = sum( p .* (indx == i) );
end
prob = p_support(indx);
end
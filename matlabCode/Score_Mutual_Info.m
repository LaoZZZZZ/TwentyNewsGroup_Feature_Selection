function score = Score_Mutual_Info( counts, label, x, z )
% score = I(x;y|z), x and y are single variable, z is a set of varibles (1*n),
% counts and label are input data. y is label, x and z are indice.
%
%   I(x;y|z) = Sum_x Sum_y Sum_z p(x,y,z)log( p(z)p(x,y,z) / (p(x,z)p(y,z)) )
%

% extract data corresponding to x,y,z
[m,~] = size(counts);
m_z = size(z,2);
data = zeros(m, m_z + 2);
data(:,1) = counts(:,x);
data(:,2) = label;
for i = 1:1:m_z
    data(:,i+2) = counts(:,z(i));
end

% estimate joint probability of given list of varibles.
joint_prob = MLE_Joint_Prob(data);
prob_xyz = joint_prob(:,size(joint_prob,2));

% calculate marginal distribution of z, (z,x) and (y,z)
marginal_z = Marginal_Prob(joint_prob,3:(m_z + 2) );
marginal_xz = Marginal_Prob(joint_prob,[1 3:(m_z + 2)]);
marginal_yz = Marginal_Prob(joint_prob,2:(m_z + 2));

% conditional mutual information
score = sum( prob_xyz .* ( log( marginal_z .* prob_xyz ) - ...
    log( marginal_xz .* marginal_yz ) ) );
end
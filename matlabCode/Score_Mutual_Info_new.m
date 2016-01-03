function score = Score_Mutual_Info_new( counts, label, x, z )
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

% conditional mutual information
score = Conditional_Mutual_Info(data);
end
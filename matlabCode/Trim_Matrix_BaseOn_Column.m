function y = Trim_Matrix_BaseOn_Column( x, var)
% delete row i from x if its value in column var is zero.
x_var = x(:,var) ~= 0;
[~,indx] = sort(x_var);
y = Delete_Selected_Row( x,indx( 1:( size(x,1) - sum(x_var) ) ) );
end
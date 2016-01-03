function [val,pValue] = Conditional_ChiSquare(count,label)
% conditional chi-square statistics equal the summation of all chi-square
% statistics given each value of condition variable.
val = 0;
dof = 0;
n = size(count,2);
if n == 1
    val = Value_ChiSquare_TestOfIndpendence(count,label);
else
    [var_support,~,indx] = unique(count(:,2:n),'rows');
    for i = 1:1:size(var_support,1)
        indx_i = logical( indx == i );
        [val_tmp,dof_tmp] = Value_ChiSquare_TestOfIndpendence(count(indx_i,1),label(indx_i,1));
        dof = dof + dof_tmp;
        val = val + val_tmp;
    end
end
pValue = chi2cdf(val,dof,'upper');
%pValue = 1 - chi2cdf(val,dof);
end
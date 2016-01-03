function y = Delete_Selected_Row( x, delete_indx )
% delete_indx - index of rows to delete
[~,n] = size(delete_indx);
if n == 1
    delete_indx = delete_indx';
end
indx = true(1,size(x,1));
indx(delete_indx) = false;
y = x(indx,:);
end
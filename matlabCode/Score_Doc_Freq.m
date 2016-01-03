function score = Score_Doc_Freq( counts, x)
% document frequency score of feature x given a subset of features var
score = sum( counts(:,x) ~= 0 );
end
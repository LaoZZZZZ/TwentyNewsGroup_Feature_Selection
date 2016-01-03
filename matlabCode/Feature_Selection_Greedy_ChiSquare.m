greedy_max_num = 100;
input_dir = '../features';
input_file = strcat(input_dir,'/bagofword_train.mat');
load(input_file);
output_dir = '../selectedFeatures';
output_file = strcat(output_dir,'/FS_GREEDY_CHISQUARE.mat');
if size(labels,1) == 1
    labels = labels';
end
[m,~] = size(counts);
var_indx_ini = [];

% cut features whose document frequency < 1% of total number of doc
[counts_cut,indx_cut] = DF_cut(counts, floor(0.01 * m));

tic
feature_greedy_chisquare = FS_Greedy_ChiSquare(counts_cut, labels, greedy_max_num,var_indx_ini);
t = toc;

train_counts_greedy_chisquare = counts_cut(:,feature_greedy_chisquare);
feature_greedy_chisquare = indx_cut(1,feature_greedy_chisquare);
input_file = strcat(input_dir,'/bagofword_test.mat');
load(input_file);
test_counts_greedy_chisquare = counts(:,feature_greedy_chisquare);

save(output_file,'feature_greedy_chisquare',...
    'train_counts_greedy_chisquare','test_counts_greedy_chisquare','t');

greedy_max_num = 100;
input_dir = '../features';
input_file = strcat(input_dir,'/bagofword_train.mat');
load(input_file);
output_dir = '../selectedFeatures';
output_file = strcat(output_dir,'/FS_GREEDY_MI.mat');
if size(labels,1) == 1
    labels = labels';
end
[m,~] = size(counts);
var_greedy = [];

% cut features whose document frequency < 1% of total number of doc
[counts_cut,indx_cut] = DF_cut(counts, floor(0.01 * m));

tic
feature_greedy_mi = FS_Greedy_new(counts_cut,labels,greedy_max_num,var_greedy);
t = toc;

train_counts_greedy_mi = counts_cut(:,feature_greedy_mi);
feature_greedy_mi = indx_cut(1,feature_greedy_mi);
input_file = strcat(input_dir,'/bagofword_test.mat');
load(input_file);
test_counts_greedy_mi = counts(:,feature_greedy_mi);

save(output_file,'feature_greedy_mi',...
    'train_counts_greedy_mi','test_counts_greedy_mi','t');
greedy_max_num = 100;
input_dir = '../features';
input_file = strcat(input_dir,'/bagofword_train.mat');
load(input_file);
output_dir = '../selectedFeatures';
output_file = strcat(output_dir,'/FS_GREEDY_DF.mat');
[m,~] = size(counts);
% cut features whose document frequency < 1% of total number of doc
[counts_cut,indx_cut] = DF_cut(counts, floor(0.01 * m));

tic
feature_greedy_df = FS_Greedy_DF(counts_cut,greedy_max_num);
t = toc;

train_counts_greedy_df = counts_cut(:,feature_greedy_df);
feature_greedy_df = indx_cut(1,feature_greedy_df);
input_file = strcat(input_dir,'/bagofword_test.mat');
load(input_file);
test_counts_greedy_df = counts(:,feature_greedy_df);

save(output_file,'feature_greedy_df',...
    'train_counts_greedy_df','test_counts_greedy_df','t');
simann_max_num = 100;
n_replication = 10;
cut_per = 0.01;
k = 10;

input_dir = '../features';
input_file = strcat(input_dir,'/bagofword_train.mat');
load(input_file);
output_dir = '../selectedFeatures';
file_name = strcat(output_dir,'/FS_SIMANN_MI_REP_');
file_mat = '.mat';
if size(labels,1) == 1
    labels = labels';
end
train_labels = labels;
[m,~] = size(counts);
% cut features whose document frequency < 1% of total number of doc
[counts_cut,indx_cut] = DF_cut(counts, floor(cut_per * m));
[~,n] = size(counts_cut);

input_file = strcat(input_dir,'/bagofword_test.mat');
load(input_file);
for i = 1:1:n_replication
    tic
    feature_simann_mi = FS_SimAnn_MI(counts_cut, train_labels, simann_max_num, n, k);
    t = toc;
    train_counts_simann_mi = counts_cut(:,feature_simann_mi);
    feature_simann_mi = indx_cut(1,feature_simann_mi);
    test_counts_simann_mi = counts(:,feature_simann_mi);
    file_name_rep = strcat(file_name,int2str(i),file_mat);
    save(file_name_rep,'feature_simann_mi',...
        'train_counts_simann_mi','test_counts_simann_mi','t');
end
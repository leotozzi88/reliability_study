% Computing statistical tests

% Input folders
ICC_outputpath='/Users/ltozzi/Desktop/ICCs'; % where edges will be saved
edges_outputpath='/Users/ltozzi/Desktop/Edges'; % where edges will be saved

% Loading networks
icc_nws=csvread(strcat(ICC_outputpath, '/ICC_RSN_gordon_icc.csv'));
icc_nws_gsr=csvread(strcat(ICC_outputpath, '/ICC_RSN_gordon_icc_gsr.csv'));

% Loading BNT data
icc_bnt=csvread(strcat(ICC_outputpath, '/ICC_BNT_edgw1.csv'));
icc_bnt_gsr=csvread(strcat(ICC_outputpath, '/ICC_BNT_edgw1_gsr.csv'));
edg1=csvread(strcat(edges_outputpath, '/BNT_edgw1.csv'));
edg2=csvread(strcat(edges_outputpath, '/BNT_edgw2.csv'));
fc_bnt=mean((edg1+edg2)/2, 1);
abs_ratio_bnt=csvread(strcat(ICC_outputpath, '/abs_ratiokept_lvl_BNT.csv'));
perc_ratio_bnt=csvread(strcat(ICC_outputpath, '/perc_ratiokept_lvl_BNT.csv'));
abs_icc_bnt=csvread(strcat(ICC_outputpath, '/abs_icc_onlycons_lvl_BNT.csv'));
perc_icc_bnt=csvread(strcat(ICC_outputpath, '/perc_icc_onlycons_lvl_BNT.csv'));

% Loading Glasser data
icc_gla=csvread(strcat(ICC_outputpath, '/ICC_glasser_edgw1.csv'));
icc_gla_gsr=csvread(strcat(ICC_outputpath, '/ICC_glasser_edgw1_gsr.csv'));
edg1=csvread(strcat(edges_outputpath, '/glasser_edgw1.csv'));
edg2=csvread(strcat(edges_outputpath, '/glasser_edgw2.csv'));
fc_gla=mean((edg1+edg2)/2, 1);
abs_ratio_gla=csvread(strcat(ICC_outputpath, '/abs_ratiokept_lvl_glasser.csv'));
perc_ratio_gla=csvread(strcat(ICC_outputpath, '/perc_ratiokept_lvl_glasser.csv'));
abs_icc_gla=csvread(strcat(ICC_outputpath, '/abs_icc_onlycons_lvl_glasser.csv'));
perc_icc_gla=csvread(strcat(ICC_outputpath, '/perc_icc_onlycons_lvl_glasser.csv'));

% Loading Gordon data
icc_gor=csvread(strcat(ICC_outputpath, '/ICC_gordon_edgw1.csv'));
icc_gor_gsr=csvread(strcat(ICC_outputpath, '/ICC_gordon_edgw1_gsr.csv'));
edg1=csvread(strcat(edges_outputpath, '/gordon_edgw1.csv'));
edg2=csvread(strcat(edges_outputpath, '/gordon_edgw2.csv'));
fc_gor=mean((edg1+edg2)/2, 1);
abs_ratio_gor=csvread(strcat(ICC_outputpath, '/abs_ratiokept_lvl_gordon.csv'));
perc_ratio_gor=csvread(strcat(ICC_outputpath, '/perc_ratiokept_lvl_gordon.csv'));
abs_icc_gor=csvread(strcat(ICC_outputpath, '/abs_icc_onlycons_lvl_gordon.csv'));
perc_icc_gor=csvread(strcat(ICC_outputpath, '/perc_icc_onlycons_lvl_gordon.csv'));

% Test for a difference between atlases
alliccs=[icc_bnt'; icc_gla'; icc_gor'];
groups=[zeros(size(icc_bnt, 2), 1); ones(size(icc_gla, 2), 1); 2*ones(size(icc_gor, 2), 1)]; 
[p,tbl,stats] = kruskalwallis(alliccs, groups);

% Test for a difference between GSR for each atlas
[p,h,stats] = signrank(icc_bnt, icc_bnt_gsr)
[p,h,stats] = signrank(icc_gla, icc_gla_gsr)
[p,h,stats] = signrank(icc_gor, icc_gor_gsr)

% Test for a difference between GSR for each network
[p,h,stats] = signrank(icc_nws, icc_nws_gsr)

% Test for a correlation between ICC and FC
[rho,pval] = corr(icc_bnt',fc_bnt', 'Type', 'Spearman')
[rho,pval] = corr(icc_gla',fc_gla', 'Type', 'Spearman')
[rho,pval] = corr(icc_gor',fc_gor', 'Type', 'Spearman')

% Test for a correlation between ratio of consistent edges and absolute
% thresholds for each atlas

thresholds=0.05:0.05:1;

[rho,pval] = corr(thresholds',abs_ratio_bnt(:,5), 'Type', 'Spearman', 'rows','complete')
[rho,pval] = corr(thresholds',perc_ratio_bnt(:,5), 'Type', 'Spearman', 'rows','complete')
[rho,pval] = corr(thresholds',abs_icc_bnt(:,5), 'Type', 'Spearman', 'rows','complete')
[rho,pval] = corr(thresholds',perc_icc_bnt(:,5), 'Type', 'Spearman', 'rows','complete')

[rho,pval] = corr(thresholds',abs_ratio_gla(:,5), 'Type', 'Spearman', 'rows','complete')
[rho,pval] = corr(thresholds',perc_ratio_gla(:,5), 'Type', 'Spearman', 'rows','complete')
[rho,pval] = corr(thresholds',abs_icc_gla(:,5), 'Type', 'Spearman', 'rows','complete')
[rho,pval] = corr(thresholds',perc_icc_gla(:,5), 'Type', 'Spearman', 'rows','complete')

[rho,pval] = corr(thresholds',abs_ratio_gor(:,5), 'Type', 'Spearman', 'rows','complete')
[rho,pval] = corr(thresholds',perc_ratio_gor(:,5), 'Type', 'Spearman', 'rows','complete')
[rho,pval] = corr(thresholds',abs_icc_gor(:,5), 'Type', 'Spearman', 'rows','complete')
[rho,pval] = corr(thresholds',perc_icc_gor(:,5), 'Type', 'Spearman', 'rows','complete')

% Plot difference between atlases
groups=[zeros(size(icc_bnt, 2), 1); ones(size(icc_gla, 2), 1); 2*ones(size(icc_gor, 2), 1)]; 
h=boxplot(alliccs, groups, 'Colors', 'k')
set(h,{'linew'},{1})
xticklabels({'Brainnetome', 'Glasser',  'Gordon'})
ylabel('ICC of atlas edges')

% Plot difference between GSR
groups=[zeros(size(icc_bnt, 2), 1); ones(size(icc_bnt, 2), 1); 2*ones(size(icc_gla, 2), 1); 3*ones(size(icc_gla, 2), 1); 4*ones(size(icc_gor, 2), 1); 5*ones(size(icc_gor, 2), 1)]; 
h=boxplot([icc_bnt'; icc_bnt_gsr'; icc_gla'; icc_gla_gsr'; icc_gor'; icc_gor_gsr'],groups, 'Symbol', 'k', 'Colors', [46 114 183; 189 85 43]/255)
set(h,{'linew'},{2})
xticklabels({'Brainnetome (GSR-)','Brainnetome (GSR+)','Glasser (GSR-)','Glasser (GSR+)','Gordon (GSR-)', 'Gordon (GSR+)'})
ylabel('ICC of atlas edges')
box_vars = findall(gca,'Tag','Box');
hLegend = legend(findall(gca,'Tag','Box'), {'GSR-','GSR+'});

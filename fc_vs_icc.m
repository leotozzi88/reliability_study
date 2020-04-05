% This plots average edgewise FC versus ICC

% Input folders
edges_outputpath='/Users/ltozzi/Desktop/Edges'; % where edges will be saved
ICC_outputpath='/Users/ltozzi/Desktop/ICCs'; % where edges will be saved

% Loading BNT data

edg1=csvread(strcat(edges_outputpath, '/BNT_edgw1.csv'));
edg2=csvread(strcat(edges_outputpath, '/BNT_edgw2.csv'));
edg_icc_bnt=csvread(strcat(ICC_outputpath, '/ICC_BNT_edgw1.csv'));

fc_bnt=mean((edg1+edg2)/2, 1);

% Loading Glasser data

edg1=csvread(strcat(edges_outputpath, '/glasser_edgw1.csv'));
edg2=csvread(strcat(edges_outputpath, '/glasser_edgw2.csv'));
edg_icc_gla=csvread(strcat(ICC_outputpath, '/ICC_glasser_edgw1.csv'));

fc_gla=mean((edg1+edg2)/2, 1);

% Loading Gordon data

edg1=csvread(strcat(edges_outputpath, '/gordon_edgw1.csv'));
edg2=csvread(strcat(edges_outputpath, '/gordon_edgw2.csv'));
edg_icc_gor=csvread(strcat(ICC_outputpath, '/ICC_gordon_edgw1.csv'));

fc_gor=mean((edg1+edg2)/2, 1);

% Plotting

subplot(3, 2, 1)
scatter(fc_bnt, edg_icc_bnt, 5, 'k', 'filled', 'MarkerFaceAlpha', 0.3)
grid on
xticks(0:0.1:1)
xlabel('Edge functional connectivity (r)')
ylabel('Edge reliability (ICC)')
title('Edgewise FC vs. reliability (Brainnetome)')

subplot(3, 2, 2)
histogram2(fc_bnt,edg_icc_bnt, 'DisplayStyle','tile')
xticks(0:0.1:1)
xlabel('Edge functional connectivity (r)')
ylabel('Edge reliability (ICC)')
colorbar
title('Number of edges by FC and reliability (Brainnetome)')

subplot(3, 2, 3)
scatter(fc_gla, edg_icc_gla, 5, 'k', 'filled', 'MarkerFaceAlpha', 0.3)
grid on
xticks(0:0.1:1)
xlabel('Edge functional connectivity (r)')
ylabel('Edge reliability (ICC)')
title('Edgewise FC vs. reliability (Glasser)')

subplot(3, 2, 4)
histogram2(fc_gla,edg_icc_gla, 'DisplayStyle','tile')
xticks(0:0.1:1)
xlabel('Edge functional connectivity (r)')
ylabel('Edge reliability (ICC)')
colorbar
title('Number of edges by FC and reliability (Glasser)')

subplot(3, 2, 5)
scatter(fc_gor, edg_icc_gor, 5, 'k', 'filled', 'MarkerFaceAlpha', 0.3)
grid on
xticks(0:0.1:1)
xlabel('Edge functional connectivity (r)')
ylabel('Edge reliability (ICC)')
title('Edgewise FC vs. reliability (Gordon)')

subplot(3, 2, 6)
histogram2(fc_gor,edg_icc_gor, 'DisplayStyle','tile')
xticks(0:0.1:1)
xlabel('Edge functional connectivity (r)')
ylabel('Edge reliability (ICC)')
colorbar
title('Number of edges by FC and reliability (Gordon)')

sgtitle('FC strength and reliability')


% This plot p-values versus ICC

% Input folders
ICC_outputpath='/Users/ltozzi/Desktop/ICCs'; % where edges will be saved

% Loading BNT data
icc_bnt=csvread(strcat(ICC_outputpath, '/ICC_BNT_edgw1.csv'));
p_bnt=csvread(strcat(ICC_outputpath, '/ICC_BNT_edgw1_p_unr.csv'));

% Loading Glasser data
icc_gla=csvread(strcat(ICC_outputpath, '/ICC_glasser_edgw1.csv'));
p_gla=csvread(strcat(ICC_outputpath, '/ICC_glasser_edgw1_p_unr.csv'));

% Loading Gordon data
icc_gor=csvread(strcat(ICC_outputpath, '/ICC_gordon_edgw1.csv'));
p_gor=csvread(strcat(ICC_outputpath, '/ICC_gordon_edgw1_p_unr.csv'));

% plot

subplot(3, 1, 1)
scatter(p_bnt, icc_bnt, 5, 'k', 'filled', 'MarkerFaceAlpha', 0.3)
yline(0, '-', 'Poor')
yline(0.4, '-', 'Fair')
yline(0.6, '-', 'Good')
yline(0.75, '-', 'Excellent')
xlabel('ICC p-value')
ylabel('Edge reliability (ICC)')
xticks(0:0.05:1)
title('Edgewise p-value vs. reliability (Brainnetome)')

subplot(3, 1, 2)
scatter(p_gla, icc_gla, 5, 'k', 'filled', 'MarkerFaceAlpha', 0.3)
yline(0, '-', 'Poor')
yline(0.4, '-', 'Fair')
yline(0.6, '-', 'Good')
yline(0.75, '-', 'Excellent')
xlabel('ICC p-value')
ylabel('Edge reliability (ICC)')
xticks(0:0.05:1)
title('Edgewise p-value vs. reliability (Glasser)')

subplot(3, 1, 3)
scatter(p_gor, icc_gor, 5, 'k', 'filled', 'MarkerFaceAlpha', 0.3)
yline(0, '-', 'Poor')
yline(0.4, '-', 'Fair')
yline(0.6, '-', 'Good')
yline(0.75, '-', 'Excellent')
xlabel('ICC p-value')
ylabel('Edge reliability (ICC)')
xticks(0:0.05:1)
title('Edgewise p-value vs. reliability (Gordon)')

sgtitle('ICC p-values')

% This plot ICC with their confidence intervals

% Input folders
ICC_outputpath='/Users/ltozzi/Desktop/ICCs'; % where edges will be saved

% Loading BNT data
icc_bnt=csvread(strcat(ICC_outputpath, '/ICC_BNT_edgw1.csv'));
ub_bnt=csvread(strcat(ICC_outputpath, '/ICC_BNT_edgw1_ub_unr.csv'));
ib_bnt=csvread(strcat(ICC_outputpath, '/ICC_BNT_edgw1_ib_unr.csv'));

% Loading Glasser data
icc_gla=csvread(strcat(ICC_outputpath, '/ICC_glasser_edgw1.csv'));
ub_gla=csvread(strcat(ICC_outputpath, '/ICC_glasser_edgw1_ub_unr.csv'));
ib_gla=csvread(strcat(ICC_outputpath, '/ICC_glasser_edgw1_ib_unr.csv'));

% Loading Gordon data
icc_gor=csvread(strcat(ICC_outputpath, '/ICC_gordon_edgw1.csv'));
ub_gor=csvread(strcat(ICC_outputpath, '/ICC_gordon_edgw1_ub_unr.csv'));
ib_gor=csvread(strcat(ICC_outputpath, '/ICC_gordon_edgw1_ib_unr.csv'));

% Plot

figure('Renderer', 'painters', 'Position', [10 10 900 900])

subplot(3,1, 1)
[B,I] = sort(icc_bnt);
y = icc_bnt(I); % icc vector;
x = 1:numel(y);
plot(x, y, 'k', 'LineWidth', 2);
hold on 
scatter(x, ub_bnt(I), 1, 'filled', 'r', 'MarkerFaceAlpha',0.2,'MarkerEdgeAlpha',0.2);
scatter(x, ib_bnt(I), 1, 'filled', 'b', 'MarkerFaceAlpha',0.2,'MarkerEdgeAlpha',0.2);
title('Sorted ICC confidence intervals (Brainnetome)')
xlabel('ICC')
ylabel('Edge')
yline(0, '-', 'Poor')
yline(0.4, '-', 'Fair')
yline(0.6, '-', 'Good')
yline(0.75, '-', 'Excellent')
[~,h_legend] = legend({'ICC', 'Upper CI', 'Lower CI'}, 'Location','WestOutside')

subplot(3,1,2)
[B,I] = sort(icc_gla);
y = icc_gla(I); % icc vector;
x = 1:numel(y);
plot(x, y, 'k', 'LineWidth', 2);
hold on 
scatter(x, ub_gla(I), 1, 'filled', 'r', 'MarkerFaceAlpha',0.05,'MarkerEdgeAlpha',0.05);
scatter(x, ib_gla(I), 1, 'filled', 'b', 'MarkerFaceAlpha',0.05,'MarkerEdgeAlpha',0.05);
title('Sorted ICC confidence intervals (Glasser)')
xlabel('ICC')
ylabel('Edge')
yline(0, '-', 'Poor')
yline(0.4, '-', 'Fair')
yline(0.6, '-', 'Good')
yline(0.75, '-', 'Excellent')
[~,h_legend] = legend({'ICC', 'Upper CI', 'Lower CI'}, 'Location','WestOutside')

subplot(3,1,3)
[B,I] = sort(icc_gor);
y = icc_gor(I); % icc vector;
x = 1:numel(y);
plot(x, y, 'k', 'LineWidth', 2);
hold on 
scatter(x, ub_gor(I), 1, 'filled', 'r', 'MarkerFaceAlpha',0.05,'MarkerEdgeAlpha',0.05);
scatter(x, ib_gor(I), 1, 'filled', 'b', 'MarkerFaceAlpha',0.05,'MarkerEdgeAlpha',0.05);
title('Sorted ICC confidence intervals (Gordon)')
xlabel('ICC')
ylabel('Edge')
yline(0, '-', 'Poor')
yline(0.4, '-', 'Fair')
yline(0.6, '-', 'Good')
yline(0.75, '-', 'Excellent')
[~,h_legend] = legend({'ICC', 'Upper CI', 'Lower CI'}, 'Location','WestOutside')

sgtitle('ICC confidence intervals')



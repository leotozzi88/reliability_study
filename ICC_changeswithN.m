% Is the ICC of edges dependent on sample size?

% load edge weigths
matrix1=csvread('/Users/leonardotozzi/Desktop/Server_Leo/HCP_HYA_REST_FIX/Graphmetrics/BNT/edgw1_BNT_1_fixednodiag.csv');
matrix2=csvread('/Users/leonardotozzi/Desktop/Server_Leo/HCP_HYA_REST_FIX/Graphmetrics/BNT/edgw2_BNT_1_fixednodiag.csv');

% making steps of sample sizes, each time taking random rows, permuting
% 1000 times

i=1

for subnum=10:10:size(matrix1, 1)
    
    [meanicc_allfeat, sdicc_allfeat, meanicc_global, sdicc_global, meansum_excellent, meansum_good, meansum_fair, meansum_poor, sdsum_excellent, sdsum_good, sdsum_fair, sdsum_poor ]=icc_firstNrows(matrix1, matrix2, subnum, 1000);
    meansums(i,:)=[meansum_excellent meansum_good meansum_fair meansum_poor];
    sdsums(i,:)=[sdsum_excellent sdsum_good sdsum_fair sdsum_poor];
    allfeat(i,:)=[meanicc_allfeat, sdicc_allfeat];
    globalfeat(i,:)=[meanicc_global, sdicc_global];
    i=i+1;
    
end

levelnames={'excellent' 'good' 'fair' 'poor'};
errorbar(meansums,sdsums)
legend(levelnames)

csvwrite(strcat('/Users/leonardotozzi/Desktop/Repeatability_study/Results/ICCsubnum10steplevels1000p_meansums.csv'), meansums);
csvwrite(strcat('/Users/leonardotozzi/Desktop/Repeatability_study/Results/ICCsubnum10steplevels1000p_sdsums.csv'), sdsums);
csvwrite(strcat('/Users/leonardotozzi/Desktop/Repeatability_study/Results/ICCsubnum10steplevels1000p_allfeat.csv'), allfeat);
csvwrite(strcat('/Users/leonardotozzi/Desktop/Repeatability_study/Results/ICCsubnum10steplevels1000p_globalfeat.csv'), globalfeat);

% % removing nans generated because of mistake of keeping the diagonal of the conn matrix
% alliccs(:, sum(isnan(alliccs),1)==83)=[];
% csvwrite(strcat('ICCsubnum10steplevels_randpermut.csv'), alliccs);

% binning edges
poor=sum(alliccs<0.40, 2)/size(alliccs, 2);
fair=sum((0.40<=alliccs) & (alliccs<0.60), 2)/size(alliccs, 2);
good=sum((0.60<=alliccs) & (alliccs<0.75), 2)/size(alliccs, 2);
excellent=sum(alliccs>=0.75, 2)/size(alliccs, 2);
notcomputed=sum(isnan(alliccs), 2)/size(alliccs, 2);
medianicc=nanmedian(alliccs, 2);

levels=[ poor'; fair'; good'; excellent'; notcomputed' ; medianicc'];

csvwrite(strcat('ICCsubnum10steplevels_randpermut.csv'), levels);

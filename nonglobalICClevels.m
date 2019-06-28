metrics={'clunegw' 'cluposw' 'cluu' 'deg' 'edgw' 'leffu' 'leffw' 'stru' 'strw'} %leaving out lgobal metrics
thresholds=0.05:0.05:1;
atlas='BNT'
path='/Users/leonardotozzi/Desktop/Server_Leo/HCP_HYA_REST_FIX/ICC'

for gmet=1:length(metrics)
    
    disp(strcat('Computing levels of metric', {' '}, metrics{gmet}))
    
    icc=csvread(strcat(path, '/ICC_', metrics{gmet}, '_', atlas, '.csv'));
    poor=sum(icc<0.40, 1)/size(icc, 1);
    fair=sum((0.40<=icc) & (icc<0.60), 1)/size(icc, 1);
    good=sum((0.60<=icc) & (icc<0.75), 1)/size(icc, 1);
    excellent=sum(icc>=0.75, 1)/size(icc, 1);
    notcomputed=sum(isnan(icc), 1)/size(icc, 1);
    medianicc=nanmedian(icc);
    
    levels=[ poor; fair; good; excellent; notcomputed ; medianicc]; 
    
    csvwrite(strcat('ICClevels_', metrics{gmet}, '_', atlas, '.csv'), levels);
    
end


% jaccard

ji=csvread(strcat(path, '/JI_edgu_', atlas, '.csv'));
poor=sum(ji<0.40, 1)/size(ji, 1);
fair=sum((0.40<=ji) & (ji<0.60), 1)/size(ji, 1);
good=sum((0.60<=ji) & (ji<0.75), 1)/size(ji, 1);
excellent=sum(ji>=0.75, 1)/size(ji, 1);
notcomputed=sum(isnan(ji), 1)/size(ji, 1);
medianji=median(ji);

levels=[ poor; fair; good; excellent; notcomputed ; medianji];

csvwrite(strcat('JIlevels_edgu_', atlas, '.csv'), levels);

altases={'BNT' 'glasser' 'gordon'};
inputpath='/Users/leonardotozzi/Desktop/Server_Leo/HCP_HYA_REST_FIX/Graphmetrics';

for atlas=1:length(atlases)
    
    disp(atlases{atlas})
    
    clear icc_noGSR
    clear icc_GSR
    
    time1_nogsr=csvread(strcat(inputpath, '/', atlases{atlas},'/edgw1_', atlases{atlas}, '_1_fixednodiag.csv'));
    time2_nogsr=csvread(strcat(inputpath, '/', atlases{atlas},'/edgw2_', atlases{atlas}, '_1_fixednodiag.csv'));
    
    time1_gsr=csvread(strcat(inputpath, '/', atlases{atlas},'/edgw1_', atlases{atlas}, '_1_fixednodiag_gsr.csv'));
    time2_gsr=csvread(strcat(inputpath, '/', atlases{atlas},'/edgw2_', atlases{atlas}, '_1_fixednodiag_gsr.csv'));
    
    for feat=1:size(time1_nogsr, 2)
        
        data=[ time1_nogsr(:,feat) time2_nogsr(:,feat) ];
        icc_noGSR(1,feat) = ICC(data, 'C-1');
        
        data=[ time1_gsr(:,feat) time2_gsr(:,feat) ];
        icc_GSR(1,feat) = ICC(data, 'C-1');
        
    end
    
    poor_nogsr=sum(icc_noGSR<0.40, 2)/size(icc_noGSR, 2);
    fair_nogsr=sum((0.40<=icc_noGSR) & (icc_noGSR<0.60), 2)/size(icc_noGSR, 2);
    good_nogsr=sum((0.60<=icc_noGSR) & (icc_noGSR<0.75), 2)/size(icc_noGSR, 2);
    excellent_nogsr=sum(icc_noGSR>=0.75, 2)/size(icc_noGSR, 2);
    medianicc_nogsr=median(icc_noGSR, 2);
    
    icclevelsnoGSR=[poor_nogsr fair_nogsr good_nogsr excellent_nogsr medianicc_nogsr];
    
    poor_gsr=sum(icc_GSR<0.40, 2)/size(icc_GSR, 2);
    fair_gsr=sum((0.40<=icc_GSR) & (icc_GSR<0.60), 2)/size(icc_GSR, 2);
    good_gsr=sum((0.60<=icc_GSR) & (icc_GSR<0.75), 2)/size(icc_GSR, 2);
    excellent_gsr=sum(icc_GSR>=0.75, 2)/size(icc_GSR, 2);
    medianicc_gsr=median(icc_GSR, 2);
    
    icclevelsGSR=[poor_gsr fair_gsr good_gsr excellent_gsr medianicc_gsr];

    csvwrite(strcat('/Users/leonardotozzi/Desktop/Repeatability_study/Results/',  atlases{atlas}, '_edgw_1_ICC_nogsr.csv'), icc_noGSR);
    csvwrite(strcat('/Users/leonardotozzi/Desktop/Repeatability_study/Results/',  atlases{atlas}, '_edgw_1_ICC_nogsr_levels.csv'), icclevelsnoGSR);

    csvwrite(strcat('/Users/leonardotozzi/Desktop/Repeatability_study/Results/',  atlases{atlas}, '_edgw_1_ICC_gsr.csv'), icc_GSR);
    csvwrite(strcat('/Users/leonardotozzi/Desktop/Repeatability_study/Results/',  atlases{atlas}, '_edgw_1_ICC_gsr_levels.csv'), icclevelsGSR);

end
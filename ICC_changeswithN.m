% Is the ICC of edges dependent on sample size?

edges_outputpath='/Volumes/LT_storage/Edges'; % where edges will be saved
ICC_outputpath='/Users/leonardotozzi/Desktop/Repeatability_study/ICCs'; % where ICCs will be saved
atlases={'BNT' 'glasser' 'gordon'};

% making steps of sample sizes, each time taking random rows, permuting
% 100 times

for atlas=1:length(atlases)
    
    disp(atlases{atlas})
    
    % preallocating the 3d matrices
    
    if strcmp(atlases{atlas}, 'BNT')
        
        feats=26106;
        
    elseif strcmp(atlases{atlas}, 'glasser')
        
        feats=71631;
        
    elseif strcmp(atlases{atlas}, 'gordon')
        
        feats=61776;
        
    end

    % load edge weigths
    matrix1=csvread(strcat(edges_outputpath, '/', atlases{atlas}, '_edgw1_unr.csv'));
    matrix2=csvread(strcat(edges_outputpath, '/', atlases{atlas}, '_edgw2_unr.csv'));
    
    subnumvec=1:10:size(matrix1, 1);
    
    meansums=nan(length(subnumvec), 4);
    sdsums=nan(length(subnumvec), 4);
    allfeat=nan(length(subnumvec), 2*feats);
    globalfeat=nan(length(subnumvec), 2);

    i=1;
    
    for subnum=subnumvec
        [meanicc_allfeat, sdicc_allfeat, meanicc_global, sdicc_global, meansum_excellent, meansum_good, meansum_fair, meansum_poor, sdsum_excellent, sdsum_good, sdsum_fair, sdsum_poor ]=icc_firstNrows(matrix1, matrix2, subnum, 100, true);
        meansums(i,:)=[meansum_excellent meansum_good meansum_fair meansum_poor];
        sdsums(i,:)=[sdsum_excellent sdsum_good sdsum_fair sdsum_poor];
        allfeat(i,:)=[meanicc_allfeat, sdicc_allfeat];
        globalfeat(i,:)=[meanicc_global, sdicc_global];
        i=i+1;
        
    end
    
    levelnames={'excellent' 'good' 'fair' 'poor'};
    errorbar(meansums,sdsums)
    legend(levelnames)
    title(atlases{atlas})
    xlabel('Sample size')
    ylabel('Mean edges ratio')
    
    csvwrite(strcat(ICC_outputpath, '/ICC_', atlases{atlas}, '_subnum10steplevels100p_meansums_unr_resam.csv'), meansums);
    csvwrite(strcat(ICC_outputpath, '/ICC_', atlases{atlas}, '_subnum10steplevels100p_sdsums_unr_resam.csv'), sdsums);
    csvwrite(strcat(ICC_outputpath, 'ICC_', atlases{atlas}, '_subnum10steplevels100p_allfeat_unr_resam.csv'), allfeat);
    csvwrite(strcat(ICC_outputpath, 'ICC_', atlases{atlas}, '_subnum10steplevels100p_globalfeat_unr_resam.csv'), globalfeat);
    
end
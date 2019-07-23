atlases={'BNT' 'glasser' 'gordon'};
ICC_inputpath='/Users/leonardotozzi/Desktop/Repeatability_study/ICCs'; % where edges will be saved
results_path='/Users/leonardotozzi/Desktop/Repeatability_study/Results';


for atlas=1:length(atlases)
    
    if strcmp(atlases{atlas}, 'BNT')
        
        nodes=229;
        
    elseif strcmp(atlases{atlas}, 'glasser')
        
        nodes=379;
        
    elseif strcmp(atlases{atlas}, 'gordon')
        
        nodes=352;
        
    end
    
    % Load the ICC data
    iccbnt=csvread(strcat(ICC_inputpath, '/ICC_', atlases{atlas}, '_edgw1.csv'));
    
    % Convert to connectivity matrix
    iccbnt_mat=repackconnmat(iccbnt, nodes);
    
    % Nan the diagonal
    iccbnt_mat_nodiag=iccbnt_mat;
    mask=logical(diag(ones(size(iccbnt_mat_nodiag, 1), 1)));
    iccbnt_mat_nodiag(mask)=NaN;
    
    % Average ICC of nodes connections
    nodes_avg_ICC=nanmean(iccbnt_mat_nodiag, 1);
    
    % Sum of ICC bins of nodes connections
    nodes_sum_ICC_poor=nansum(iccbnt_mat_nodiag<0.40, 1);
    nodes_sum_ICC_fair=nansum((0.40<=iccbnt_mat_nodiag) & (iccbnt_mat_nodiag<0.60), 1);
    nodes_sum_ICC_good=nansum((0.60<=iccbnt_mat_nodiag) & (iccbnt_mat_nodiag<0.75), 1);
    nodes_sum_ICC_excellent=nansum(iccbnt_mat_nodiag>=0.75, 1);
    
    % Creating CIFTIs to plot nodewise
    
    cif=ciftiopen(strcat('/Users/leonardotozzi/Desktop/Server_Leo/HCP_HYA_REST_FIX/ParcellatedData/', atlases{atlas}, '/100206_rfMRI_REST1_LR_', atlases{atlas}, '.ptseries.nii'),'/Applications/workbench/bin_macosx64/wb_command');
    
    cif.cdata=nodes_avg_ICC';
    ciftisave(cif, strcat(results_path, '/', atlases{atlas}, '_nodes_avg_ICC.ptseries.nii'), '/Applications/workbench/bin_macosx64/wb_command');
    
    cif.cdata=nodes_sum_ICC_poor';
    ciftisave(cif, strcat(results_path, '/', atlases{atlas}, '_nodes_sum_ICC_poor.ptseries.nii'), '/Applications/workbench/bin_macosx64/wb_command');
    cif.cdata=nodes_sum_ICC_fair';
    ciftisave(cif, strcat(results_path, '/', atlases{atlas}, '_nodes_sum_ICC_fair.ptseries.nii'), '/Applications/workbench/bin_macosx64/wb_command');
    cif.cdata=nodes_sum_ICC_good';
    ciftisave(cif, strcat(results_path, '/', atlases{atlas}, '_nodes_sum_ICC_good.ptseries.nii'), '/Applications/workbench/bin_macosx64/wb_command');
    cif.cdata=nodes_sum_ICC_excellent';
    ciftisave(cif, strcat(results_path, '/', atlases{atlas}, '_nodes_sum_ICC_excellent.ptseries.nii'), '/Applications/workbench/bin_macosx64/wb_command');
    
    % Saving excellent connections matrix as tdf for brainviewer
    iccbnt_mat_exc=iccbnt_mat;
    iccbnt_mat_exc(iccbnt_mat_exc<0.75)=0;
    
    dlmwrite(strcat(results_path, '/', atlases{atlas}, '_ICC_mat_exc.edge'),iccbnt_mat_exc,'Delimiter','\t')
    
end
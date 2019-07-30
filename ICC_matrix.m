% This script creates reliability "masks" for each atlas and a matrix with
% ICC for each edge.


atlases={'BNT' 'glasser' 'gordon'};
ICC_path='/Users/leonardotozzi/Desktop/Repeatability_study/ICCs'; % where ICCs will be saved


for atlas=1:length(atlases)
    
    if strcmp(atlases{atlas}, 'BNT')
        
        roinum=229;
        
    elseif strcmp(atlases{atlas}, 'glasser')
        
        roinum=379;
        
    elseif strcmp(atlases{atlas}, 'gordon')
        
        roinum=352;
        
    end
    
    
    ICC=csvread(strcat(ICC_path, '/ICC_', atlases{atlas}, '_edgw1.csv'));
    
    iccmat=repackconnmat(ICC, roinum);
    
    csvwrite(strcat('icc_', atlases{atlas}, '_mat.csv'), iccmat);
    csvwrite(strcat('poor_', atlases{atlas}, '_mat.csv'),iccmat<0.40);
    csvwrite(strcat('fair_', atlases{atlas}, '_mat.csv'),(0.40<=iccmat) & (iccmat<0.60));
    csvwrite(strcat('good_', atlases{atlas}, '_mat.csv'),(0.60<=iccmat) & (iccmat<0.75));
    csvwrite(strcat('excellent_', atlases{atlas}, '_mat.csv'),iccmat>=0.75);
    
end
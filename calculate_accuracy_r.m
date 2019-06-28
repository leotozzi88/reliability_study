metrics={'clunegw' 'cluposw' 'clutotnegw' 'clutotposw' 'cluu' 'deg' 'edgu' 'edgw' 'effu' 'geffu' 'geffw' 'leffu' 'leffw' 'stru' 'strw'}
thresholds=0.05:0.05:1;
atlas='BNT'
path='/Users/leonardotozzi/Desktop/Server_Leo/HCP_HYA_REST_FIX/Graphmetrics'

for gmet=1:length(metrics)
    
    disp(strcat('Computing metric', {' '}, metrics{gmet}))
    allacc=nan(1, length(thresholds));

    for thresh=1:length(thresholds)
        
        disp(strcat('Computing threshold', {' '}, num2str(thresholds(thresh))))
        
        t1=csvread(strcat(path, '/', atlas, '/', metrics{gmet}, num2str(1), '_', atlas, '_', num2str(thresholds(thresh)), '.csv'));
        t2=csvread(strcat(path, '/', atlas, '/', metrics{gmet}, num2str(2), '_', atlas, '_', num2str(thresholds(thresh)), '.csv'));
        acc_count=0;
        
        for sub=1:size(t1, 1)
            
           vec=t1(sub,:)
           allrssub=corr(vec', t2', 'Type', 'Pearson');
           [M,I]=max(allrssub);
           acc_count=acc_count+(sub==I);
            
        end
        
        allacc(1, thresh)=acc_count/size(t1, 1);
        
    end
    
    csvwrite(strcat('ACC_', metrics{gmet}, '_', atlas, '.csv'), allacc)
    
end

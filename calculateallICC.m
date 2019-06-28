metrics={'clunegw' 'cluposw' 'clutotnegw' 'clutotposw' 'cluu' 'deg' 'edgw' 'geffu' 'geffw' 'leffu' 'leffw' 'stru' 'strw'}

% use jaccard  'edgu'
thresholds=0.05:0.05:1;
atlas='BNT'
path='/Users/leonardotozzi/Desktop/Server_Leo/HCP_HYA_REST_FIX/Graphmetrics'


for gmet=1:length(metrics)
    
    disp(strcat('Computing ICC of metric', {' '}, metrics{gmet}))
    
    clear allicc % different metrics have different sizes
    
    for thresh=1:length(thresholds)
        
        disp(strcat('Computing threshold', {' '}, num2str(thresholds(thresh))))
        
        t1=csvread(strcat(path, '/', atlas, '/', metrics{gmet}, num2str(1), '_', atlas, '_', num2str(thresholds(thresh)), '.csv'));
        t2=csvread(strcat(path, '/', atlas, '/', metrics{gmet}, num2str(2), '_', atlas, '_', num2str(thresholds(thresh)), '.csv'));
        
        for feat=1:size(t1, 2)
            
            data=[ t1(:,feat) t2(:,feat) ];
            allicc(feat, thresh) = ICC(data, 'C-1');
            
        end
        
    end
    
    csvwrite(strcat('ICC_', metrics{gmet}, '_', atlas, '.csv'), allicc)
    
end


% use jaccard  'edgu'


metrics={'edgu'}
thresholds=0.05:0.05:1;
atlas='BNT'
path='/Users/leonardotozzi/Desktop/Server_Leo/HCP_HYA_REST_FIX/Graphmetrics'


for gmet=1:length(metrics)
    
    disp(strcat('Computing ICC of metric', {' '}, metrics{gmet}))
    clear allji

    for thresh=1:length(thresholds)
        
        disp(strcat('Computing threshold', {' '}, num2str(thresholds(thresh))))
        
        t1=csvread(strcat(path, '/', atlas, '/', metrics{gmet}, num2str(1), '_', atlas, '_', num2str(thresholds(thresh)), '.csv'));
        t2=csvread(strcat(path, '/', atlas, '/', metrics{gmet}, num2str(2), '_', atlas, '_', num2str(thresholds(thresh)), '.csv'));
        
        for feat=1:size(t1, 2)
            
            data=[ t1(:,feat) t2(:,feat) ];
            
            if sum(logical(data(:,1)) | logical(data(:,2)))==0
                allji(feat, thresh)=1;
            else
                allji(feat, thresh) = sum(data(:, 1)==1 & data(:, 2)==1)/(sum(data(:,1)) + sum(data(:,2)));
            end
        end
        
    end
    
    csvwrite(strcat('JI_', metrics{gmet}, '_', atlas, '.csv'), allji)
    
end



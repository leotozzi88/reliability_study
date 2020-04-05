% This script calculates ICC 'C-1' for unthresholded matrices

% Subject list
allsubs={'100206' '100307' '100408' '100610' '101006' '101309' '101915' '102008' '102109' '102311' '102513' '102614' '102715' '102816' '103010' '103111' '103212' '103414' '103515' '103818' '104012' '104416' '104820' '105014' '105115' '105216' '105923' '106319' '106521' '106824' '107018' '107321' '107422' '107725' '108020' '108121' '108222' '108525' '108828' '109123' '109325' '110007' '110411' '111009' '111211' '111413' '111514' '112314' '112516' '112920' '113215' '113316' '113619' '113922' '114217' '114318' '114419' '114621' '114823' '115017' '115219' '115320' '115724' '115825' '116524' '117021' '117122' '117324' '117930' '118023' '118124' '118225' '118730' '118831' '118932' '119025' '119126' '120111' '120212' '120414' '120717' '121416' '121618' '121921' '122317' '122822' '123117' '123420' '123521' '123723' '123824' '123925' '124220' '124624' '124826' '125222' '125424' '125525' '126325' '126426' '126628' '127226' '127630' '127731' '127832' '127933' '128026' '128127' '128632' '128935' '129028' '129129' '129331' '129634' '130013' '130114' '130316' '130417' '130619' '130720' '130821' '130922' '131217' '131419' '131722' '131823' '131924' '132017' '132118' '133019' '133625' '133827' '133928' '134021' '134223' '134324' '134425' '135124' '135225' '135528' '135629' '135730' '135932' '136227' '136732' '136833' '137027' '137128' '137229' '137431' '137532' '137633' '137936' '138231' '138332' '138534' '138837' '139435' '139839' '140319' '140824' '140925' '141119' '141422' '142828' '143224' '143325' '143426' '144125' '144226' '144428' '144731' '144832' '144933' '145834' '146331' '146432' '146533' '146735' '146937' '147030' '147636' '148032' '148133' '148335' '148941' '149236' '149337' '149539' '149741' '149842' '150726' '150928' '151223' '151324' '151425' '151526' '151627' '151829' '151930' '152225' '152427' '152831' '153025' '153126' '153227' '153429' '153631' '153732' '153833' '153934' '154229' '154330' '154431' '154532' '154734' '154835' '154936' '155938' '156031' '156233' '156334' '156536' '156637' '157336' '157437' '157942' '158035' '158136' '158338' '158540' '159138' '159239' '159340' '159441' '159744' '160123' '160729' '160830' '161327' '161731' '161832' '162026' '162228' '162329' '162935' '163129' '163331' '163836' '164030' '164131' '164636' '164939' '165032' '165436' '165638' '165840' '166640' '167036' '167440' '167743' '168240' '168341' '168745' '168947' '169040' '169343' '169444' '169545' '169949' '171330' '171532' '171633' '172029' '172130' '172332' '172433' '172534' '172938' '173334' '173435' '173536' '173637' '173738' '173839' '173940' '174437' '174841' '175136' '175237' '175338' '175439' '175540' '175742' '176037' '176441' '176542' '176845' '177645' '177746' '178142' '178243' '178748' '178950' '179245' '179346' '180129' '180230' '180432' '180533' '180735' '180937' '181636' '182032' '182436' '182739' '182840' '183034' '185139' '185341' '185442' '185846' '185947' '186141' '186444' '186545' '186848' '187143' '187345' '187547' '187850' '188145' '188347' '188448' '188549' '188751' '189349' '189450' '190031' '191033' '191235' '191336' '191437' '191942' '192035' '192136' '192237' '192439' '192540' '192641' '192843' '193239' '193845' '194140' '194443' '194645' '194746' '195041' '195445' '195647' '195950' '196144' '196346' '196750' '197348' '197550' '198047' '198350' '198451' '198653' '198855' '199150' '199251' '199352' '199453' '200008' '200109' '200311' '200513' '200614' '200917' '201111' '201414' '201818' '202113' '202719' '203923' '204016' '204319' '204420' '204521' '204622' '205119' '205220' '205725' '205826' '206222' '206323' '206525' '206727' '206828' '207123' '207426' '208024' '208125' '208226' '208327' '208630' '209127' '209228' '209329' '209834' '209935' '210011' '210112' '210415' '210617' '211114' '211316' '211417' '211619' '211821' '211922' '212015' '212116' '212217' '212318' '212419' '212823' '213017' '213421' '213522' '214019' '214221' '214423' '214524' '214625' '214726' '217126' '217429' '219231' '220721' '221319' '223929' '227432' '228434' '233326' '236130' '237334' '239136' '239944' '245333' '246133' '248339' '249947' '250427' '250932' '251833' '255639' '255740' '256540' '257542' '257845' '263436' '268749' '268850' '274542' '275645' '280739' '280941' '281135' '283543' '285345' '285446' '286347' '286650' '287248' '289555' '290136' '293748' '295146' '298051' '298455' '299154' '300618' '300719' '303119' '303624' '304020' '304727' '305830' '307127' '308129' '309636' '310621' '311320' '314225' '316633' '316835' '318637' '320826' '321323' '322224' '325129' '329440' '329844' '330324' '333330' '334635' '341834' '342129' '346137' '346945' '348545' '349244' '350330' '352132' '352738' '353740' '356948' '358144' '361234' '361941' '365343' '366042' '366446' '368551' '368753' '371843' '376247' '377451' '378756' '378857' '379657' '380036' '381038' '381543' '385450' '387959' '389357' '390645' '391748' '392447' '393247' '394956' '395251' '395756' '395958' '397154' '397760' '397861' '406432' '406836' '412528' '414229' '419239' '421226' '422632' '424939' '429040' '432332' '436239' '436845' '441939' '445543' '448347' '449753' '453542' '454140' '456346' '459453' '463040' '467351' '475855' '479762' '480141' '481042' '481951' '485757' '486759' '495255' '497865' '499566' '500222' '506234' '510225' '512835' '513130' '513736' '516742' '517239' '519647' '519950' '520228' '523032' '524135' '525541' '529549' '529953' '530635' '531536' '531940' '536647' '540436' '541640' '541943' '545345' '547046' '548250' '552241' '553344' '555348' '555651' '557857' '558960' '559053' '559457' '561242' '561444' '561949' '562345' '562446' '565452' '566454' '567052' '567961' '568963' '570243' '571144' '572045' '573249' '573451' '576255' '578057' '579665' '579867' '580044' '580650' '580751' '581349' '581450' '583858' '585256' '585862' '586460' '587664' '588565' '589567' '592455' '594156' '597869' '598568' '599065' '599671' '601127' '604537' '611938' '613538' '615441' '615744' '616645' '617748' '618952' '620434' '622236' '623844' '626648' '627852' '633847' '634748' '635245' '638049' '645450' '645551' '647858' '654350' '654552' '654754' '656253' '657659' '660951' '663755' '664757' '665254' '667056' '668361' '671855' '672756' '673455' '675661' '677766' '677968' '679568' '679770' '680250' '680452' '680957' '683256' '685058' '686969' '687163' '690152' '692964' '693764' '694362' '695768' '698168' '700634' '702133' '704238' '705341' '707749' '713239' '715041' '715647' '715950' '720337' '724446' '725751' '727553' '727654' '728454' '729254' '729557' '731140' '732243' '735148' '737960' '742549' '744553' '748258' '748662' '749058' '749361' '751348' '753150' '753251' '756055' '757764' '759869' '760551' '761957' '765056' '769064' '770352' '773257' '774663' '782561' '784565' '788674' '788876' '789373' '792564' '792867' '793465' '800941' '802844' '803240' '809252' '810843' '812746' '814548' '814649' '816653' '820745' '825048' '825654' '826353' '826454' '827052' '828862' '832651' '833148' '833249' '835657' '837560' '837964' '841349' '843151' '844961' '845458' '849264' '849971' '852455' '856766' '856968' '857263' '859671' '861456' '865363' '867468' '869472' '870861' '871762' '871964' '872158' '872562' '873968' '877168' '877269' '878776' '878877' '882161' '884064' '885975' '886674' '887373' '888678' '889579' '891667' '894067' '894673' '894774' '896778' '896879' '898176' '899885' '901038' '901139' '901442' '904044' '905147' '907656' '908860' '910241' '910443' '911849' '912447' '917255' '917558' '919966' '922854' '923755' '926862' '927359' '930449' '932554' '933253' '937160' '942658' '947668' '951457' '952863' '955465' '959574' '965771' '966975' '971160' '978578' '979984' '983773' '984472' '987074' '989987' '990366' '991267' '992673' '992774' '993675' '996782'};
excluded={'102008' '104820' '124220' '140824' '147030' '151223' '151526' '153833' '159138' '161327' '161832' '163331' '171532' '175439' '205220' '223929' '233326' '298051' '311320' '352132' '366446' '392447' '453542' '562345' '748662' '833249' '947668'};
subs=allsubs(~ismember(allsubs, excluded));
 
% % Run only on unrelated subjects
% disp('Running only on unrelated subjects')
% unrelated={'100307' '100408' '101107' '101309' '101915' '103111' '103414' '103818' '105014' '105115' '106016' '108828' '110411' '111312' '111716' '113619' '113922' '114419' '115320' '116524' '117122' '118528' '118730' '118932' '120111' '122317' '122620' '123117' '123925' '124422' '125525' '126325' '127630' '127933' '128127' '128632' '129028' '130013' '130316' '131217' '131722' '133019' '133928' '135225' '135932' '136833' '138534' '139637' '140925' '144832' '146432' '147737' '148335' '148840' '149337' '149539' '149741' '151223' '151526' '151627' '153025' '154734' '156637' '159340' '160123' '161731' '162733' '163129' '176542' '178950' '188347' '189450' '190031' '192540' '196750' '198451' '199655' '201111' '208226' '211417' '211720' '212318' '214423' '221319' '239944' '245333' '280739' '298051' '366446' '397760' '414229' '499566' '654754' '672756' '751348' '756055' '792564' '856766' '857263' '899885'};
% subs=subs(ismember(subs, unrelated));

% Name of the atlases (consistent with file naming)
atlases={'BNT' 'glasser' 'gordon'};

% Input and output folders
matpath='/Users/ltozzi/Desktop/Connmats'; % path to the matrices
edges_outputpath='/Users/ltozzi/Desktop/Edges'; % where edges will be saved
ICC_outputpath='/Users/ltozzi/Desktop/ICCs'; % where edges will be saved

for atlas=1:length(atlases)
    
    % preallocating the 3d matrices
    
    if strcmp(atlases{atlas}, 'BNT')
        
        feats=26106;
        
    elseif strcmp(atlases{atlas}, 'glasser')
        
        feats=71631;
        
    elseif strcmp(atlases{atlas}, 'gordon')
        
        feats=61776;
        
    end
    
    alledgw1=nan(length(subs), feats);
    alledgw2=nan(length(subs), feats);
    alledgw1_gsr=nan(length(subs), feats);
    alledgw2_gsr=nan(length(subs), feats);
    
    for sub=1:length(subs)
        
        disp(subs{sub})
        
        % load edge weigths
        matrix1=csvread(strcat(matpath, '/', atlases{atlas}, '/', subs{sub}, '_rfMRI_REST1_concat_', atlases{atlas}, '.csv'));
        matrix2=csvread(strcat(matpath, '/', atlases{atlas}, '/', subs{sub}, '_rfMRI_REST2_concat_', atlases{atlas}, '.csv'));
        
        matrix1_gsr=csvread(strcat(matpath, '/', atlases{atlas}, '/', subs{sub}, '_rfMRI_REST1_concat_', atlases{atlas}, '_gsr.csv'));
        matrix2_gsr=csvread(strcat(matpath, '/', atlases{atlas}, '/', subs{sub}, '_rfMRI_REST2_concat_', atlases{atlas}, '_gsr.csv'));
        
        % create matrix of edge weigths
        alledgw1(sub, :)=unpackconnmat(matrix1);
        alledgw2(sub, :)=unpackconnmat(matrix2);
        
        alledgw1_gsr(sub, :)=unpackconnmat(matrix1_gsr);
        alledgw2_gsr(sub, :)=unpackconnmat(matrix2_gsr);
        
    end
    
    % saving edges as a sub x edge 2d matrix
    csvwrite(strcat(edges_outputpath, '/', atlases{atlas}, '_edgw1.csv'), alledgw1)
    csvwrite(strcat(edges_outputpath, '/', atlases{atlas}, '_edgw2.csv'), alledgw2)
    
    csvwrite(strcat(edges_outputpath, '/', atlases{atlas}, '_edgw1_gsr.csv'), alledgw1_gsr)
    csvwrite(strcat(edges_outputpath, '/', atlases{atlas}, '_edgw2_gsr.csv'), alledgw2_gsr)
    
    % Now calculate ICC
    
    disp('Calculating ICC')
    
    iccall=nan(1, feats);
    iccall_gsr=nan(1, feats);
    pall=nan(1, feats);
    pall_gsr=nan(1, feats);
    lball=nan(1, feats);
    lball_gsr=nan(1, feats);
    uball=nan(1, feats);
    uball_gsr=nan(1, feats);

    for feat=1:size(alledgw1, 2)
        %no GSR
        data=[ alledgw1(:,feat) alledgw2(:,feat) ];
        [r, LB, UB, F, df1, df2, p] = ICC(data, 'C-1');
        iccall(1,feat) = r;
        pall(1,feat) = p;
        lball(1,feat)=LB;
        uball(1,feat)=UB;

        % GSR
        data_gsr=[ alledgw1_gsr(:,feat) alledgw2_gsr(:,feat) ];
        [r, LB, UB, F, df1, df2, p] = ICC(data_gsr, 'C-1');
        iccall_gsr(1,feat) = r;
        pall_gsr(1,feat) = p;
        lball_gsr(1,feat)=LB;
        uball_gsr(1,feat)=UB;
    end
    
    % Calculate ICC levels
    
    %no GSR
    ICC_poor_nogsr=sum(iccall<0.40, 2)/size(iccall, 2);
    ICC_fair_nogsr=sum((0.40<=iccall) & (iccall<0.60), 2)/size(iccall, 2);
    ICC_good_nogsr=sum((0.60<=iccall) & (iccall<0.75), 2)/size(iccall, 2);
    ICC_excellent_nogsr=sum(iccall>=0.75, 2)/size(iccall, 2);
    ICC_medianicc_nogsr=median(iccall, 2);
    ICC_minicc_nogs=min(iccall,[], 2);
    ICC_maxicc_nogs=max(iccall,[], 2);
    
    icclevelsnoGSR=[ICC_poor_nogsr ICC_fair_nogsr ICC_good_nogsr ICC_excellent_nogsr ICC_medianicc_nogsr ICC_minicc_nogs ICC_maxicc_nogs];
    
    % GSR
    ICC_poor_gsr=sum(iccall_gsr<0.40, 2)/size(iccall_gsr, 2);
    ICC_fair_gsr=sum((0.40<=iccall_gsr) & (iccall_gsr<0.60), 2)/size(iccall_gsr, 2);
    ICC_good_gsr=sum((0.60<=iccall_gsr) & (iccall_gsr<0.75), 2)/size(iccall_gsr, 2);
    ICC_excellent_gsr=sum(iccall_gsr>=0.75, 2)/size(iccall_gsr, 2);
    ICC_medianicc_gsr=median(iccall_gsr, 2);
    ICC_minicc_gsr=min(iccall_gsr, [], 2);
    ICC_maxicc_gsr=max(iccall_gsr, [], 2);

    icclevelsGSR=[ICC_poor_gsr ICC_fair_gsr ICC_good_gsr ICC_excellent_gsr ICC_medianicc_gsr ICC_minicc_gsr ICC_maxicc_gsr];
    
    % Calculate ICC levels with alternative thresholds
    
    %no GSR
    ICC_slight_nogsr=sum(iccall<0.20, 2)/size(iccall, 2);
    ICC_fairalt_nogsr=sum((0.20<=iccall) & (iccall<0.40), 2)/size(iccall, 2);
    ICC_moderate_nogsr=sum((0.40<=iccall) & (iccall<0.60), 2)/size(iccall, 2);
    ICC_substantial_nogsr=sum((0.60<=iccall) & (iccall<0.80), 2)/size(iccall, 2);
    ICC_perfect_nogsr=sum(iccall>=0.80, 2)/size(iccall, 2);

    icclevelsnoGSR_alt=[ICC_slight_nogsr ICC_fairalt_nogsr ICC_moderate_nogsr ICC_substantial_nogsr ICC_perfect_nogsr ICC_medianicc_nogsr ICC_minicc_nogs ICC_maxicc_nogs];

    % GSR
    ICC_slight_gsr=sum(iccall_gsr<0.20, 2)/size(iccall_gsr, 2);
    ICC_fairalt_gsr=sum((0.20<=iccall_gsr) & (iccall_gsr<0.40), 2)/size(iccall_gsr, 2);
    ICC_moderate_gsr=sum((0.40<=iccall_gsr) & (iccall_gsr<0.60), 2)/size(iccall_gsr, 2);
    ICC_substantial_gsr=sum((0.60<=iccall_gsr) & (iccall_gsr<0.80), 2)/size(iccall_gsr, 2);
    ICC_perfect_gsr=sum(iccall_gsr>=0.80, 2)/size(iccall_gsr, 2);

    icclevelsGSR_alt=[ICC_slight_gsr ICC_fairalt_gsr ICC_moderate_gsr ICC_substantial_gsr ICC_perfect_gsr ICC_medianicc_gsr ICC_minicc_gsr ICC_maxicc_gsr];

    % Save ICC
    
    csvwrite(strcat(ICC_outputpath, '/', 'ICC_', atlases{atlas}, '_edgw1.csv'), iccall)
    csvwrite(strcat(ICC_outputpath, '/', 'ICC_', atlases{atlas}, '_edgw1_lvls.csv'), icclevelsnoGSR)
    csvwrite(strcat(ICC_outputpath, '/', 'ICC_', atlases{atlas}, '_edgw1_lvls_alt.csv'), icclevelsnoGSR_alt)

    csvwrite(strcat(ICC_outputpath, '/', 'ICC_', atlases{atlas}, '_edgw1_gsr.csv'), iccall_gsr)
    csvwrite(strcat(ICC_outputpath, '/', 'ICC_', atlases{atlas}, '_edgw1_lvls_gsr.csv'), icclevelsGSR)
    csvwrite(strcat(ICC_outputpath, '/', 'ICC_', atlases{atlas}, '_edgw1_lvls_gsr_alt.csv'), icclevelsGSR_alt)
    
    % Save p-values and boundaries
    
    csvwrite(strcat(ICC_outputpath, '/', 'ICC_', atlases{atlas}, '_edgw1_p.csv'), pall)
    csvwrite(strcat(ICC_outputpath, '/', 'ICC_', atlases{atlas}, '_edgw1_p_gsr.csv'), pall_gsr)
    csvwrite(strcat(ICC_outputpath, '/', 'ICC_', atlases{atlas}, '_edgw1_ib.csv'), lball)
    csvwrite(strcat(ICC_outputpath, '/', 'ICC_', atlases{atlas}, '_edgw1_ib_gsr.csv'), lball_gsr)
    csvwrite(strcat(ICC_outputpath, '/', 'ICC_', atlases{atlas}, '_edgw1_ub.csv'), uball)
    csvwrite(strcat(ICC_outputpath, '/', 'ICC_', atlases{atlas}, '_edgw1_ub_gsr.csv'), uball_gsr)

end

% Plot results
% Loading BNT data
icc_bnt=csvread(strcat(ICC_outputpath, '/ICC_BNT_edgw1.csv'));
icc_bnt_gsr=csvread(strcat(ICC_outputpath, '/ICC_BNT_edgw1_gsr.csv'));
ICC_BNT_lvls=csvread(strcat(ICC_outputpath, '/', 'ICC_BNT_edgw1_lvls.csv'));
ICC_BNT_lvls_gsr=csvread(strcat(ICC_outputpath, '/', 'ICC_BNT_edgw1_lvls_gsr.csv'));

% Loading Glasser data
icc_gla=csvread(strcat(ICC_outputpath, '/ICC_glasser_edgw1.csv'));
icc_gla_gsr=csvread(strcat(ICC_outputpath, '/ICC_glasser_edgw1_gsr.csv'));
ICC_glasser_lvls=csvread(strcat(ICC_outputpath, '/', 'ICC_glasser_edgw1_lvls.csv'));
ICC_glasser_lvls_gsr=csvread(strcat(ICC_outputpath, '/', 'ICC_glasser_edgw1_lvls_gsr.csv'));

% Loading Gordon data
icc_gor=csvread(strcat(ICC_outputpath, '/ICC_gordon_edgw1.csv'));
icc_gor_gsr=csvread(strcat(ICC_outputpath, '/ICC_gordon_edgw1_gsr.csv'));
ICC_gordon_lvls=csvread(strcat(ICC_outputpath, '/', 'ICC_gordon_edgw1_lvls.csv'));
ICC_gordon_lvls_gsr=csvread(strcat(ICC_outputpath, '/', 'ICC_gordon_edgw1_lvls_gsr.csv'));

% Plot difference between GSR
figure('Position', [10 10 900 600])

subplot(1, 2, 1)
groups=[zeros(size(icc_bnt, 2), 1); ones(size(icc_bnt, 2), 1); 2*ones(size(icc_gla, 2), 1); 3*ones(size(icc_gla, 2), 1); 4*ones(size(icc_gor, 2), 1); 5*ones(size(icc_gor, 2), 1)]; 
h=boxplot([icc_bnt'; icc_bnt_gsr'; icc_gla'; icc_gla_gsr'; icc_gor'; icc_gor_gsr'],groups, 'Symbol', 'k', 'Colors', [46 114 183; 189 85 43]/255)
set(h,{'linew'},{2})
xticklabels({'Brainnetome (GSR-)','Brainnetome (GSR+)','Glasser (GSR-)','Glasser (GSR+)','Gordon (GSR-)', 'Gordon (GSR+)'})
ylabel('ICC of atlas edges')
box_vars = findall(gca,'Tag','Box');
hLegend = legend(findall(gca,'Tag','Box'), {'GSR-','GSR+'}, 'Location', 'WestOutside');
xtickangle(45)

subplot(1, 2, 2)
ctrs = 1:6;
data = [ICC_BNT_lvls(1:4); ICC_BNT_lvls_gsr(1:4); ICC_glasser_lvls(1:4); ICC_glasser_lvls_gsr(1:4); ICC_gordon_lvls(1:4); ICC_gordon_lvls_gsr(1:4)];
H=bar(ctrs,data,'stacked', 'LineWidth',1)
myC= [0 0 1; 0.91 0.41 0.17; 1 1 0; 0 1 0];
ylim([0 1.1])

for k=1:4
  set(H(k),'facecolor',myC(k,:))
end

xticklabels({'Brainnetome (GSR-)' 'Brainnetome (GSR+)' 'Glasser (GSR-)' 'Glasser (GSR+)' 'Gordon (GSR-)' 'Gordon (GSR)'})
ylabel('Proportion of edges')
legend({'Poor' 'Fair' 'Good' 'Excellent'}, 'Location','EastOutside')
xtickangle(45)

% Plot results with alternative thresholds

figure('Position', [10 10 800 700])

ICC_BNT_lvls=csvread(strcat(ICC_outputpath, '/', 'ICC_BNT_edgw1_lvls_alt.csv'));
ICC_BNT_lvls_gsr=csvread(strcat(ICC_outputpath, '/', 'ICC_BNT_edgw1_lvls_gsr_alt.csv'));
ICC_glasser_lvls=csvread(strcat(ICC_outputpath, '/', 'ICC_glasser_edgw1_lvls_alt.csv'));
ICC_glasser_lvls_gsr=csvread(strcat(ICC_outputpath, '/', 'ICC_glasser_edgw1_lvls_gsr_alt.csv'));
ICC_gordon_lvls=csvread(strcat(ICC_outputpath, '/', 'ICC_gordon_edgw1_lvls_alt.csv'));
ICC_gordon_lvls_gsr=csvread(strcat(ICC_outputpath, '/', 'ICC_gordon_edgw1_lvls_gsr_alt.csv'));

ctrs = 1:6;
data = [ICC_BNT_lvls(1:5); ICC_BNT_lvls_gsr(1:5); ICC_glasser_lvls(1:5); ICC_glasser_lvls_gsr(1:5); ICC_gordon_lvls(1:5); ICC_gordon_lvls_gsr(1:5)];
H=bar(ctrs,data,'stacked', 'LineWidth',1)
myC= [0 0 1; 0.91 0.41 0.17; 1 1 0; 0 1 0];
ylim([0 1.1])

for k=1:4
  set(H(k),'facecolor',myC(k,:))
end

xticklabels({'Brainnetome' 'Brainnetome (GSR)' 'Glasser' 'Glasser (GSR)' 'Gordon' 'Gordon (GSR)'})
ylabel('Proportion of edges')
title('Reliability of edges')
legend({'Slight' 'Fair' 'Moderate' 'Substantial' 'Perfect'}, 'Location','EastOutside')
xtickangle(45)






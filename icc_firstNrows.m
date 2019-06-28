% computes the edgewise ICC on the first N rows of 2 edge x subjects
% matrices, with shuffling of the rows for a certain number of permutations
% and returns information of various means, sds and reliability of edges

function [meanicc_allfeat, sdicc_allfeat, meanicc_global, sdicc_global, meansum_excellent, meansum_good, meansum_fair, meansum_poor, sdsum_excellent, sdsum_good, sdsum_fair, sdsum_poor ]=icc_firstNrows(matrix1, matrix2, rows, shufflenum)

disp(strcat('N=', num2str(rows)))
icc=nan(shufflenum, rows);


for perm=1:shufflenum
    
disp(strcat('Permutation', {' '}, num2str(perm)))
shufflevec = randperm(size(matrix1, 1));
matrix1= matrix1(shufflevec,:);
matrix2= matrix2(shufflevec,:);
newmat1=matrix1(1:rows, :);
newmat2=matrix2(1:rows, :);

for feat=1:size(newmat1, 2)
    
    data=[ newmat1(:,feat) newmat2(:,feat) ];
    icc(perm, feat) = ICC(data, 'C-1');
    
end

end

meanicc_allfeat=mean(icc, 1);
sdicc_allfeat=std(icc, 1);
meanicc_global=mean(mean(icc, 1));
sdicc_global=mean(std(icc, 1));
meansum_excellent=mean(sum(icc>=0.75, 2)/size(icc, 2));
meansum_good=mean(sum((0.60<=icc) & (icc<0.75), 2)/size(icc, 2));
meansum_fair=mean(sum((0.40<=icc) & (icc<0.60), 2)/size(icc, 2));
meansum_poor=mean(sum(icc<0.40, 2)/size(icc, 2));
sdsum_excellent=std(sum(icc>=0.75, 2)/size(icc, 2));
sdsum_good=std(sum((0.60<=icc) & (icc<0.75), 2)/size(icc, 2));
sdsum_fair=std(sum((0.40<=icc) & (icc<0.60), 2)/size(icc, 2));
sdsum_poor=std(sum(icc<0.40, 2)/size(icc, 2));

end
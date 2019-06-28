% computes the edgewise ICC on the first N rows of 2 edge x subjects
% matrices, with shuffling of the rows if requested

function icc=icc_firstNrows(matrix1, matrix2, rows, shuffle)

newmat1=matrix1(1:rows, :);
newmat2=matrix2(1:rows, :);

if shuffle==1
    disp('Shuffling the rows')
    shufflevec = randperm(size(newmat1, 1));
    newmat1= newmat1(shufflevec,:);
    newmat2= newmat2(shufflevec,:);
end

disp(strcat('N=', num2str(rows)))
disp('Calculating ICCs')

for feat=1:size(newmat1, 2)
    
    data=[ newmat1(:,feat) newmat2(:,feat) ];
    icc(feat) = ICC(data, 'C-1');
    
end

end
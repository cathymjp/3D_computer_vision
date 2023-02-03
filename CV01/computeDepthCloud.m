function [D]= computeDepthCloud(M)
[X,Y,Z]=size(M);


for i=1:9
    w=2*i+1;
            for j=1:Z
                A=M(:,:,j);
                B = imboxfilt(A,w);
                M2(:,:,j)=B;
            end
            
           [a d]=max(M2,[],3); 
           
           D(:,i)=d(:);
    

end
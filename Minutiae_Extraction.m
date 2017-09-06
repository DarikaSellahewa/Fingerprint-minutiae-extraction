%Program for Fingerprint Minutiae Extraction


%Read Input Image
global fullFileName;

binary_image=im2bw(imread(fullFileName));
%binary_image = roipoly(binary_image);
 
%Small region is taken to show output clear
%binary_image = binary_image(10:500,10:296);
%figure;imshow(binary_image);title('Input image');

%Thinning
thin_image=~bwmorph(binary_image,'thin',Inf);
%figure;imshow(thin_image);title('Thinned Image');

%Minutiae extraction
s=size(thin_image);
N=3;% pixel window size
n=(N-1)/2;
r=s(1)+2*n;
c=s(2)+2*n;
double temp(r,c);   
temp=zeros(r,c);bifurcation=zeros(r,c);ridge=zeros(r,c);
temp((n+1):(end-n),(n+1):(end-n))=thin_image(:,:); %to the matrix
outImg=zeros(r,c,3);%For Display
outImg(:,:,1) = temp .* 255;
outImg(:,:,2) = temp .* 255;
outImg(:,:,3) = temp .* 255;
for x=(n+1+10):(s(1)+n-10)
    for y=(n+1+10):(s(2)+n-10)
        e=1;
        for k=x-n:x+n
            f=1;
            for l=y-n:y+n
                mat(e,f)=temp(k,l);
                f=f+1;
            end
            e=e+1;
        end;
         if(mat(2,2)==0)%chk whether center element of 3 by 3 matrix is 0 
            ridge(x,y)=sum(sum(~mat));
            bifurcation(x,y)=sum(sum(~mat));
         end
    end;
end;

%spurios minutiae removal
 

 



% RIDGE END FINDING
[ridge_x ridge_y]=find(ridge==2);% returns a matrix containing the indices of non zero elements of array ridge
centroidRend=[ridge_x ridge_y];





%BIFURCATION FINDING
[bifurcation_x bifurcation_y]=find(bifurcation==4);
centroidRbif=[bifurcation_x bifurcation_y];



D = 6;

% process1:if the distance between a termination and a biffurcation is smaller than D
Distance=DistEuclidean(centroidRend,centroidRbif);
SpuriousMinutiae=Distance<D;
[i,j]=find(SpuriousMinutiae);
%ridge_x(i)=[]; ridge_y(i)=[];
%bifurcation_x(j)=[]; bifurcation_y(j)=[];
centroidRend(i,:)=[]; centroidRbif(j,:)=[];

%process2:  if the distance between two biffurcations is smaller than D
Distance=DistEuclidean(centroidRbif);
SpuriousMinutiae=Distance<D;
[i,j]=find(SpuriousMinutiae);
%bifurcation_x(i)=[]; bifurcation_y(i)=[]; 
centroidRbif(i,:)=[];


%process3:  if the distance between two terminations is smaller than D
Distance=DistEuclidean(centroidRend);
SpuriousMinutiae=Distance<D;
[i,j]=find(SpuriousMinutiae);
centroidRend(i,:)=[];
%ridge_x(i)=[]; ridge_y(i)=[];

%ROI
imgOpen = imclose(thin_image,strel('square',7));
imgOpenClean  = imfill(imgOpen,'holes');
imgOpenClean = bwareaopen(imgOpenClean,5);
ROI=imerode(imgOpenClean,strel('disk',10));


save('Minutiae.mat','centroidRend','centroidRbif');


%For Display
len1=size(centroidRend,1);
%making the ridge endings appear in red colour
for i=1:len1
    outImg((centroidRend(i,1)-3):(centroidRend(i,1)+3),(centroidRend(i,2)-3),2:3)=0;
    outImg((centroidRend(i,1)-3):(centroidRend(i,1)+3),(centroidRend(i,2)+3),2:3)=0;
    outImg((centroidRend(i,1)-3),(centroidRend(i,2)-3):(centroidRend(i,2)+3),2:3)=0;
    outImg((centroidRend(i,1)+3),(centroidRend(i,2)-3):(centroidRend(i,2)+3),2:3)=0;
    
    outImg((centroidRend(i,1)-3):(centroidRend(i,1)+3),(centroidRend(i,2)-3),1)=255;
    outImg((centroidRend(i,1)-3):(centroidRend(i,1)+3),(centroidRend(i,2)+3),1)=255;
    outImg((centroidRend(i,1)-3),(centroidRend(i,2)-3):(centroidRend(i,2)+3),1)=255;
    outImg((centroidRend(i,1)+3),(centroidRend(i,2)-3):(centroidRend(i,2)+3),1)=255;
end 


%For Display
len2=size(centroidRbif,1);
%making the ridge bifurcations appear in blue colour
for i=1:len2
    outImg((centroidRbif(i,1)-3):(centroidRbif(i,1)+3),(centroidRbif(i,2)-3),1:2)=0;
    outImg((centroidRbif(i,1)-3):(centroidRbif(i,1)+3),(centroidRbif(i,2)+3),1:2)=0;
    outImg((centroidRbif(i,1)-3),(centroidRbif(i,2)-3):(centroidRbif(i,2)+3),1:2)=0;
    outImg((centroidRbif(i,1)+3),(centroidRbif(i,2)-3):(centroidRbif(i,2)+3),1:2)=0;
    
    outImg((bifurcation_x(i)-3):(bifurcation_x(i)+3),(centroidRbif(i,2)-3),3)=255;
    outImg((bifurcation_x(i)-3):(bifurcation_x(i)+3),(centroidRbif(i,2)+3),3)=255;
    outImg((bifurcation_x(i)-3),(centroidRbif(i,2)-3):(centroidRbif(i,2)+3),3)=255;
    outImg((bifurcation_x(i)+3),(centroidRbif(i,2)-3):(centroidRbif(i,2)+3),3)=255;
end











 
%figure;imshow(outImg);title('Minutiae');

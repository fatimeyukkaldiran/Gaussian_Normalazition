clc
clear
%the input image
[I0,map]=imread('hand','jpg');
colormap(map);
I0=double(I0); %double precision
[row col deep]=size(I0); %image size
%gray-level image creation
IG0=I0;
%conversion to grayscale
IG0(:,:,1)=(I0(:,:,1)+I0(:,:,2)+I0(:,:,3))/3;
IG0(:,:,2)=IG0(:,:,1);
IG0(:,:,3)=IG0(:,:,1);

IG1=IG0(:,:,1);


% %RGB of the input image
% I_in_R=I_in(:,:,1);
% I_in_G=I_in(:,:,2);
% I_in_B=I_in(:,:,3);
% 
% %colour to grey
% I_in_grey=I_in; %grey image initialisation
% I_in_grey(:,:,1)=(I_in_R+I_in_G+I_in_B)/3; %RGB2grey
% I_in_grey(:,:,2)=I_in_grey(:,:,1);
% I_in_grey(:,:,3)=I_in_grey(:,:,1);
% 
%output image initialisation
mask=[0  0 0;
      1  0 0;
      0 -1 0];
mask_sum=sum(sum(mask));
%image processing
for k=1:1;
    for i=2:row-1;
        for j=2:col-1;
            s=0;
            for r=-1:1;
                for c=-1:1;
                    s=s+mask(r+2,c+2)*IG0(i+r,j+c,k);
                end;
            end;
            %IG0(i,j,k)=s/mask_sum;
            IG1(i,j)=s;
        end;
    end;
end;
Lmin=min(min(IG1(:,:,1)));
Lmax=max(max(IG1(:,:,1)));
IG1=255*(IG1-Lmin)/(Lmax-Lmin);
IG1(:,:,2)=IG1(:,:,1);
IG1(:,:,3)=IG1(:,:,1);


%displaying input image
figure(1);
image(uint8(I0));
title('INPUT IMAGE - colour');

%input gray-level image displaying
figure(2);
image(uint8(IG0));
title('GRAY-LEVEL INPUT IMAGE'); 

%output gray-level image displaying
figure(3);
image(uint8(IG1));
title('GRAY-LEVEL INPUT IMAGE'); 


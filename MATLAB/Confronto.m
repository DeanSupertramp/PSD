%% Init
clc
clear
close all
tic                                                 %inizia il cronometro

%% Import immagine iniziale 16bit
lena = imread('lena16.png');                        %16 bit 64x64

%% Import File elaborati in VIVADO 16bit
[f16_v, msg16_v] = fopen('file16_postimplementation_Sobel.txt','r');
vivadoFile16 = fscanf(f16_v,'%d',[4096 1]);
img16 = vec2mat(vivadoFile16,64);                   % img 16 bit (64x64) -- VIVADO

%% Import File elaborati in VIVADO 8bit
[f8_v, msg8_v] = fopen('file8_postimplementation_Sobel.txt','r');
vivadoFile8 = fscanf(f8_v,'%d',[8192 1]);
img8 = vec2mat(vivadoFile8,128);                    % img 8 bit (64x128) -- VIVADO

for ii=1:64
    k=1;
    for jj=1:2:128
        img8M(ii,k) = img8(ii,jj);                  % img 8 bit MSB (64x64) -- VIVADO
        img8L(ii,k) = img8(ii,jj+1);                % img 8 bit LSB (64x64) -- VIVADO
        k=k+1;
    end
end

%% Import File COE 16 bit
[f16_m, msg16_m] = fopen('file_COE_64_NOCOMMA.coe','r');
A16 = fscanf(f16_m,'%d',[4096 1]);
coe16 = vec2mat(A16,64);

%% Import File COE 8 bit
[f8_m, msg_m] = fopen('file_COE_64_NOCOMMA.coe','r');
A8 = fscanf(f8_m,'%d',[4096 1]);
coe8_column = vec2mat(A8,64);

%% reshape COE 8 bit
coe8_bin = reshape(cellstr(dec2bin(coe8_column)), size(coe8_column));

%% create LSB and MSB 8 bit Matrix
for ii=1:64
    for jj=1:64
            coe8_dec_msb(ii,jj) = bin2dec(string(coe8_bin{ii,jj}(1:8)));    %decimale
            coe8_dec_lsb(ii,jj) = bin2dec(string(coe8_bin{ii,jj}(9:16)));
    end
end

%% immagine 128x64
for ii=1:64
    for jj=2:2:128
        immagine128(ii,jj-1)=coe8_dec_msb(ii,jj/2);                         % decimale
        immagine128(ii,jj)=coe8_dec_lsb(ii,jj/2);
    end
end

%% Filtraggio COE 16 bit
%kernel = [1 1 1; 1 1 1; 1 1 1]; %Smoothing
%kernel = [0 1 0; 1 -4 1; 0 1 0];  %Laplacian
kernel = [-1 -2 -1; 0 0 0; 1 2 1]; % Sobel
Res16=filter2(kernel, coe16);
for ii=1:64
    for jj=1:64
    Res16_convertito(ii,jj) = typecast(int32(Res16(ii,jj)),'uint32');
    %Res16=imboxfilt(uint32(coe16),3,'NormalizationFactor',1,'Padding',0);
    end
end

%% Filtraggio COE 8 bit
Res8=filter2(kernel, immagine128);

for ii=1:64
    for jj=1:128
        Res8_convertito(ii,jj) = typecast(int16(Res8(ii,jj)),'uint16');
    end
end

for ii=1:64
    k=1;
    for jj=1:2:128
        Res8M(ii,k) = Res8(ii,jj);                  % img 8 bit MSB (64x64) -- VIVADO
        Res8L(ii,k) = Res8(ii,jj+1);                % img 8 bit LSB (64x64) -- VIVADO
        
        Res8M_convertito(ii,k) = Res8_convertito(ii,jj);                  
        Res8L_convertito(ii,k) = Res8_convertito(ii,jj+1);                
        
        k=k+1;
    end
end


%% Confronto finale
LogicalStr = {'false', 'true'};
fprintf("Confronto 16 bit, risultato = %s\n",LogicalStr{isequal(Res16,img16) + 1})
fprintf("Confronto 8 bit, risultato = %s\n",LogicalStr{isequal(Res8_convertito,img8) + 1})

%% Plot
figure(1);
imshow(lena);
title('Immagine 16bit iniziale');

figure(2);
subplot(1,2,1);
imshow(uint16(img16));
title('Immagine 16bit elaborata in VIVADO');
subplot(1,2,2);
imshow(uint16(Res16));
title('Immagine 16bit elaborata in MATLAB');

figure(3);
subplot(2,3,1);
imshow(uint8(img8));
title('Immagine 8bit elaborata in VIVADO');
subplot(2,3,2);
%imshow(uint8(Res8M));
imshow(uint8(Res8M_convertito));
title('Res8M');
subplot(2,3,3);
%imshow(uint8(Res8L));
imshow(uint8(Res8L_convertito));
title('Res8L');
subplot(2,3,4);
imshow(uint8(Res8_convertito));
title('Immagine 8bit elaborata in MATLAB');
subplot(2,3,5);
imshow(uint8(img8M));
title('img8M');
subplot(2,3,6);
imshow(uint8(img8L));
title('img8L');

%% close
tempo = toc;
fprintf("Tempo impiegato dallo script in sec = %g\n", tempo);
fclose('all');
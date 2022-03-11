clc,clear;
%initial
disp('initial')
tic%計時開始
im_output=zeros(1322,1897,3,'uint8');
im_001=imread('001.jpg');%讀原圖
im_002=imread('002.jpg');%讀原圖
im_003=imread('003.jpg');%讀原圖
im_004=imread('004.jpg');%讀原圖
point_001=[39 195 712 41 736 755 145 730];%001 4個頂點
point_002=[16 334 672 26 363 828 169 844];%002 4個頂點
point_003=[11 221 743 191 738 575 69 633];%003 4個頂點
point_004=[41 314 603 319 624 642 1 1000];%004 4個頂點
point_target1=[1021 321 1740 90 1838 922 1109 825];%001 對應4個頂點
point_target2=[792 448 1416 126 1128 936 933 947];%002 對應4個頂點
point_target3=[468 329 1183 300 1197 656 530 751];%003 對應4個頂點
point_target4=[96 394 778 407 812 715 3 1313];%004 對應4個頂點
temp_001=[point_001(1) point_001(2) 1 0 0 0 -point_target1(1)*point_001(1) -point_target1(1)*point_001(2);
    0 0 0 point_001(1) point_001(2) 1 -point_target1(2)*point_001(1) -point_target1(2)*point_001(2);
    point_001(3) point_001(4) 1 0 0 0 -point_target1(3)*point_001(3) -point_target1(3)*point_001(4);
    0 0 0 point_001(3) point_001(4) 1 -point_target1(4)*point_001(3) -point_target1(4)*point_001(4);
    point_001(5) point_001(6) 1 0 0 0 -point_target1(5)*point_001(5) -point_target1(5)*point_001(6);
    0 0 0 point_001(5) point_001(6) 1 -point_target1(6)*point_001(5) -point_target1(6)*point_001(6);
    point_001(7) point_001(8) 1 0 0 0 -point_target1(7)*point_001(7) -point_target1(7)*point_001(8);
    0 0 0 point_001(7) point_001(8) 1 -point_target1(8)*point_001(7) -point_target1(8)*point_001(8)];%計算001對應方程式所需矩陣(inverse前)
temp_002=[point_002(1) point_002(2) 1 0 0 0 -point_target2(1)*point_002(1) -point_target2(1)*point_002(2);
    0 0 0 point_002(1) point_002(2) 1 -point_target2(2)*point_002(1) -point_target2(2)*point_002(2);
    point_002(3) point_002(4) 1 0 0 0 -point_target2(3)*point_002(3) -point_target2(3)*point_002(4);
    0 0 0 point_002(3) point_002(4) 1 -point_target2(4)*point_002(3) -point_target2(4)*point_002(4);
    point_002(5) point_002(6) 1 0 0 0 -point_target2(5)*point_002(5) -point_target2(5)*point_002(6);
    0 0 0 point_002(5) point_002(6) 1 -point_target2(6)*point_002(5) -point_target2(6)*point_002(6);
    point_002(7) point_002(8) 1 0 0 0 -point_target2(7)*point_002(7) -point_target2(7)*point_002(8);
    0 0 0 point_002(7) point_002(8) 1 -point_target2(8)*point_002(7) -point_target2(8)*point_002(8)];%計算002對應方程式所需矩陣(inverse前)
temp_003=[point_003(1) point_003(2) 1 0 0 0 -point_target3(1)*point_003(1) -point_target3(1)*point_003(2);
    0 0 0 point_003(1) point_003(2) 1 -point_target3(2)*point_003(1) -point_target3(2)*point_003(2);
    point_003(3) point_003(4) 1 0 0 0 -point_target3(3)*point_003(3) -point_target3(3)*point_003(4);
    0 0 0 point_003(3) point_003(4) 1 -point_target3(4)*point_003(3) -point_target3(4)*point_003(4);
    point_003(5) point_003(6) 1 0 0 0 -point_target3(5)*point_003(5) -point_target3(5)*point_003(6);
    0 0 0 point_003(5) point_003(6) 1 -point_target3(6)*point_003(5) -point_target3(6)*point_003(6);
    point_003(7) point_003(8) 1 0 0 0 -point_target3(7)*point_003(7) -point_target3(7)*point_003(8);
    0 0 0 point_003(7) point_003(8) 1 -point_target3(8)*point_003(7) -point_target3(8)*point_003(8)];%計算003對應方程式所需矩陣(inverse前)
temp_004=[point_004(1) point_004(2) 1 0 0 0 -point_target4(1)*point_003(1) -point_target4(1)*point_003(2);
    0 0 0 point_004(1) point_004(2) 1 -point_target4(2)*point_004(1) -point_target4(2)*point_004(2);
    point_004(3) point_004(4) 1 0 0 0 -point_target4(3)*point_004(3) -point_target4(3)*point_004(4);
    0 0 0 point_004(3) point_004(4) 1 -point_target4(4)*point_004(3) -point_target4(4)*point_004(4);
    point_004(5) point_004(6) 1 0 0 0 -point_target4(5)*point_004(5) -point_target4(5)*point_004(6);
    0 0 0 point_004(5) point_004(6) 1 -point_target4(6)*point_004(5) -point_target4(6)*point_004(6);
    point_004(7) point_004(8) 1 0 0 0 -point_target4(7)*point_004(7) -point_target4(7)*point_004(8);
    0 0 0 point_004(7) point_004(8) 1 -point_target4(8)*point_004(7) -point_target4(8)*point_004(8)];%計算004對應方程式所需矩陣(inverse前)
%%
%calculate
clc
disp('calculate')
temp_h_001=inv(temp_001)*transpose(point_target1);%計算001對應的H矩陣(直線排列,8 unknown)
temp_h_002=inv(temp_002)*transpose(point_target2);%計算002對應的H矩陣(直線排列,8 unknown)
temp_h_003=inv(temp_003)*transpose(point_target3);%計算003對應的H矩陣(直線排列,8 unknown)
temp_h_004=inv(temp_004)*transpose(point_target4);%計算004對應的H矩陣(直線排列,8 unknown)
h_001=[transpose(temp_h_001(1:3));
    transpose(temp_h_001(4:6));
    transpose(temp_h_001(7:8)) 1];%將001對應的H矩陣排列還原
h_002=[transpose(temp_h_002(1:3));
    transpose(temp_h_002(4:6));
    transpose(temp_h_002(7:8)) 1];%將002對應的H矩陣排列還原
h_003=[transpose(temp_h_003(1:3));
    transpose(temp_h_003(4:6));
    transpose(temp_h_003(7:8)) 1];%將003對應的H矩陣排列還原
h_004=[transpose(temp_h_004(1:3));
    transpose(temp_h_004(4:6));
    transpose(temp_h_004(7:8)) 1];%將004對應的H矩陣排列還原
ih_001=inv(h_001);%將001對應的H矩陣做inverse
ih_002=inv(h_002);%將002對應的H矩陣做inverse
ih_003=inv(h_003);%將003對應的H矩陣做inverse
ih_004=inv(h_004);%將004對應的H矩陣做inverse
%%
for x=1:450%對目標圖每個pixel計算對應的值
    for y=1:1322
        postion_004=ih_004*transpose([x y 1]);%計算出正歸化前座標
        postion_004=round(postion_004/postion_004(3));%正歸化
        
        if(postion_004(1)>=1 && postion_004(1)<=750 && postion_004(2)>=1 && postion_004(2)<=1000)%座標必須在圖內
            if(im_output(y,x,:)==0)
                im_output(y,x,:)=im_004(postion_004(2),postion_004(1),:);%轉換
            end
        end
        
    end
    clc
    disp([num2str(round(x/18.97)) '%']);
    toc
end
w=0.005;
for x=451:650%對目標圖每個pixel計算對應的值
    for y=1:1322
        postion_003=ih_003*transpose([x y 1]);%計算出正歸化前座標
        postion_004=ih_004*transpose([x y 1]);%計算出正歸化前座標
        postion_003=round(postion_003/postion_003(3));%正歸化
        postion_004=round(postion_004/postion_004(3));%正歸化
        
        if(postion_003(1)>=1 && postion_003(1)<=750 && postion_003(2)>=1 && postion_003(2)<=1000)%座標必須在圖內
            if(im_output(y,x,:)==0)
                im_output(y,x,:)=im_003(postion_003(2),postion_003(1),:);%轉換
            end
        end
        if(postion_004(1)>=1 && postion_004(1)<=750 && postion_004(2)>=1 && postion_004(2)<=1000)%座標必須在圖內
            if(im_output(y,x,:)==0)
                im_output(y,x,:)=im_004(postion_004(2),postion_004(1),:);%轉換
            else
                im_output(y,x,:)=(1-w)*im_004(postion_004(2),postion_004(1),:)+w*im_output(y,x,:);%轉換
            end
        end
        
    end
    w=w+0.005;
    clc
    disp([num2str(round(x/18.97)) '%']);
    toc
end
for x=651:776%對目標圖每個pixel計算對應的值
    for y=1:1322
        postion_003=ih_003*transpose([x y 1]);%計算出正歸化前座標
        postion_004=ih_004*transpose([x y 1]);%計算出正歸化前座標
        postion_003=round(postion_003/postion_003(3));%正歸化
        postion_004=round(postion_004/postion_004(3));%正歸化
        
        if(postion_003(1)>=1 && postion_003(1)<=750 && postion_003(2)>=1 && postion_003(2)<=1000)%座標必須在圖內
            if(im_output(y,x,:)==0)
                im_output(y,x,:)=im_003(postion_003(2),postion_003(1),:);%轉換
            end
        end
        if(postion_004(1)>=1 && postion_004(1)<=750 && postion_004(2)>=1 && postion_004(2)<=1000)%座標必須在圖內
            if(im_output(y,x,:)==0)
                im_output(y,x,:)=im_004(postion_004(2),postion_004(1),:);%轉換
            end
        end
    end
    clc
    disp([num2str(round(x/18.97)) '%']);
    toc
end
w=0.005;
for x=777:976%對目標圖每個pixel計算對應的值
    for y=1:1322
        postion_003=ih_003*transpose([x y 1]);%計算出正歸化前座標
        postion_002=ih_002*transpose([x y 1]);%計算出正歸化前座標
        postion_004=ih_004*transpose([x y 1]);%計算出正歸化前座標
        postion_003=round(postion_003/postion_003(3));%正歸化
        postion_002=round(postion_002/postion_002(3));%正歸化
        postion_004=round(postion_004/postion_004(3));%正歸化
        if(postion_003(1)>=1 && postion_003(1)<=750 && postion_003(2)>=1 && postion_003(2)<=1000)%座標必須在圖內
            if(im_output(y,x,:)==0)
                im_output(y,x,:)=im_003(postion_003(2),postion_003(1),:);%轉換
            end
        end
        if(postion_002(1)>=1 && postion_002(1)<=750 && postion_002(2)>=1 && postion_002(2)<=1000)%座標必須在圖內
            if(im_output(y,x,:)==0)
                im_output(y,x,:)=im_002(postion_002(2),postion_002(1),:);%轉換
            else
                im_output(y,x,:)=w*im_002(postion_002(2),postion_002(1),:)+(1-w)*im_output(y,x,:);%轉換
            end
        end
        if(postion_004(1)>=1 && postion_004(1)<=750 && postion_004(2)>=1 && postion_004(2)<=1000)%座標必須在圖內
            if(im_output(y,x,:)==0)
                im_output(y,x,:)=im_004(postion_004(2),postion_004(1),:);%轉換
            end
        end
        
    end
    w=w+0.005;
    clc
    disp([num2str(round(x/18.97)) '%']);
    toc
end
for x=977:1490%對目標圖每個pixel計算對應的值
    for y=1:1322
        postion_001=ih_001*transpose([x y 1]);%計算出正歸化前座標
        postion_002=ih_002*transpose([x y 1]);%計算出正歸化前座標
        postion_003=ih_003*transpose([x y 1]);%計算出正歸化前座標
        postion_004=ih_004*transpose([x y 1]);%計算出正歸化前座標
        postion_001=round(postion_001/postion_001(3));%正歸化
        postion_002=round(postion_002/postion_002(3));%正歸化
        postion_003=round(postion_003/postion_003(3));%正歸化
        postion_004=round(postion_004/postion_004(3));%正歸化
        
        if(postion_002(1)>=1 && postion_002(1)<=750 && postion_002(2)>=1 && postion_002(2)<=1000)%座標必須在圖內
            if(im_output(y,x,:)==0)
                im_output(y,x,:)=im_002(postion_002(2),postion_002(1),:);%轉換
            end
        end
        if(postion_001(1)>=1 && postion_001(1)<=750 && postion_001(2)>=1 && postion_001(2)<=1000)%座標必須在圖內
            if(im_output(y,x,:)==0)
                im_output(y,x,:)=im_001(postion_001(2),postion_001(1),:);%轉換
            end
        end
        if(postion_003(1)>=1 && postion_003(1)<=750 && postion_003(2)>=1 && postion_003(2)<=1000)%座標必須在圖內
            if(im_output(y,x,:)==0)
                im_output(y,x,:)=im_003(postion_003(2),postion_003(1),:);%轉換
            end
        end
        if(postion_004(1)>=1 && postion_004(1)<=750 && postion_004(2)>=1 && postion_004(2)<=1000)%座標必須在圖內
            if(im_output(y,x,:)==0)
                im_output(y,x,:)=im_004(postion_004(2),postion_004(1),:);%轉換
            end
        end
    end
    clc
    disp([num2str(round(x/18.97)) '%']);
    toc
end
w=0.005;
for x=1491:1690%對目標圖每個pixel計算對應的值
    for y=1:1322
        postion_001=ih_001*transpose([x y 1]);%計算出正歸化前座標
        postion_002=ih_002*transpose([x y 1]);%計算出正歸化前座標
        postion_001=round(postion_001/postion_001(3));%正歸化
        postion_002=round(postion_002/postion_002(3));%正歸化
        
        if(postion_002(1)>=1 && postion_002(1)<=750 && postion_002(2)>=1 && postion_002(2)<=1000)%座標必須在圖內
            if(im_output(y,x,:)==0)
                im_output(y,x,:)=im_002(postion_002(2),postion_002(1),:);%轉換
            end
        end
        if(postion_001(1)>=1 && postion_001(1)<=750 && postion_001(2)>=1 && postion_001(2)<=1000)%座標必須在圖內
            if(im_output(y,x,:)==0)
                im_output(y,x,:)=im_001(postion_001(2),postion_001(1),:);%轉換
            else
                im_output(y,x,:)=w*im_001(postion_001(2),postion_001(1),:)+(1-w)*im_output(y,x,:);%轉換
            end
        end
        
    end
    w=w+0.005;
    clc
    disp([num2str(round(x/18.97)) '%']);
    toc
end
for x=1691:1897%對目標圖每個pixel計算對應的值
    for y=1:1322
        postion_001=ih_001*transpose([x y 1]);%計算出正歸化前座標
        postion_002=ih_002*transpose([x y 1]);%計算出正歸化前座標
        postion_001=round(postion_001/postion_001(3));%正歸化
        postion_002=round(postion_002/postion_002(3));%正歸化
        
        if(postion_001(1)>=1 && postion_001(1)<=750 && postion_001(2)>=1 && postion_001(2)<=1000)%座標必須在圖內
            if(im_output(y,x,:)==0)
                im_output(y,x,:)=im_001(postion_001(2),postion_001(1),:);%轉換
            end
        end
        if(postion_002(1)>=1 && postion_002(1)<=750 && postion_002(2)>=1 && postion_002(2)<=1000)%座標必須在圖內
            if(im_output(y,x,:)==0)
                im_output(y,x,:)=im_002(postion_002(2),postion_002(1),:);%轉換
            end
        end
    end
    clc
    disp([num2str(round(x/18.97)) '%']);
    toc
end
%%
%finish
clc
disp('finish')
imwrite(im_output,'B10607044.jpg');%寫入新照片檔
toc
figure
imshow('ICE.jpg')
title('ICE')
figure
imshow(im_output)
title('purpose')
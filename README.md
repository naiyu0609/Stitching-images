# Stitching-images
NTUST Computer Vision and Applications

本專案為市面上常見的全景照片功能，此目的可以用多種方式做出，但這次我使用的方法非常簡單，就如上課所教，找出各張圖片的對應點進行homography的轉換，當然過程中有許多問題必須解決，但只要仔細做下來就會發現不難。  

首先我利用市面上的一個程式Image Composite Editor(ICE, Microsoft開發)進行融合，得到一張全景的相片，對這張圖找尋四張影像的各四個對應點，以利我之後對homography的計算。最初我只利用少許幾個點做轉換，但發現成像的結果不如預期，各圖不容易對準，因此我每張圖都找四個不同的對應點進行計算。  
![](https://github.com/naiyu0609/Stitching-images/blob/main/png/1.png)  

利用swap-image的方式進行轉換，但在轉換的過程中一樣會遇到上次專案的問題，就是如果利用X=HX這個方式進行轉換的話會出現下圖情形，可能會有黑洞的情況產生。因此我這次是利用X=H^(-1)X'這樣的方式去進行轉換，這樣的方式跟上式不同的地方在於，他是利用表回去四張圖找顏色，而非利用四張圖對應到輸出的座標去填顏色。  
![](https://github.com/naiyu0609/Stitching-images/blob/main/png/2.PNG)  

而做完上述過程基本上就能輸出一張融合完的圖，但因為並未對圖做任何的處理，因此對於交接處一定會有很明顯的接縫，所以我必須想方法把接縫的地方進行處理。  
![](https://github.com/naiyu0609/Stitching-images/blob/main/png/3.jpg)  

![](https://github.com/naiyu0609/Stitching-images/blob/main/png/4.jpg)  
我想到利用權重的方式進行成像。而靈感的來源為上圖，對於中間的交接處採用漸變的方式進行處理，而對於全景照片的融合方式為交接處權重的調整，對於越靠左邊的交接處左邊圖片權重越高，反之越右邊的交接處右邊圖片。下圖為成像的效果，可以發現利用漸變的方式去做處理得到的效果其實很不錯，這也是我最終的結果輸出。  
![](https://github.com/naiyu0609/Stitching-images/blob/main/png/5.jpg)  

# BankNote_Classification
This repository is a project which I implemented during  studied at Mahidol University.
There are 2 types of feature which are color and texture feature.

## Reading a data set

Initialize a path and read a excel file

```bash
excel = 'E:\MATLAB\R2018\bin\Project\DB_Train.xlsx';
datasetpath ='E:\MATLAB\R2018\bin\Project\Dataset\';

tab=xlsread(excel);
[rr,cc]=size(tab);
```

## Extract a features

This feature are from each individual image

```bash
% ............................ Calculate Features
 data(1)=mean(mean(pic(:,:,1)));
 data(2)=mean(mean(pic(:,:,2)));
 data(3)=mean(mean(pic(:,:,3)));
 gray=rgb2gray(pic);
 data(4)=mean(mean(gray));
 gray=rgb2gray(pic);
 glcm = graycomatrix(gray, 'o', [0,1]);
 S = graycoprops(glcm);
 rngfil = rangefilt(pic);
 data(5) = entropy(rngfil)*100;
 data(6) = S.Energy*100;
 data(7) = S.Homogeneity*100;
 data(8) = S.Contrast*100;
 data(9) =S.Correlation*100;
```

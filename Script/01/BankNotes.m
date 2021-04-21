function varargout = BankNotes(varargin)
% BANKNOTES MATLAB code for BankNotes.fig
%      BANKNOTES, by itself, creates a new BANKNOTES or raises the existing
%      singleton*.
%
%      H = BANKNOTES returns the handle to a new BANKNOTES or the handle to
%      the existing singleton*.
%
%      BANKNOTES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BANKNOTES.M with the given input arguments.
%
%      BANKNOTES('Property','Value',...) creates a new BANKNOTES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BankNotes_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to BankNotes_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BankNotes

% Last Modified by GUIDE v2.5 24-Sep-2019 01:27:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BankNotes_OpeningFcn, ...
                   'gui_OutputFcn',  @BankNotes_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before BankNotes is made visible.
function BankNotes_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BankNotes (see VARARGIN)

% Choose default command line output for BankNotes
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes BankNotes wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = BankNotes_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Trainbtn.
function Trainbtn_Callback(hObject, eventdata, handles)
% hObject    handle to Trainbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
global pic;
global filename;
global excel;
excel = 'E:\MATLAB\R2018\bin\Project\DB_Train.xlsx';


tab=xlsread(excel);
[rr,cc]=size(tab);
% ............................ Calculate Features
 mred=mean(mean(pic(:,:,1)));
 mgreen=mean(mean(pic(:,:,2)));
 mblue=mean(mean(pic(:,:,3)));
 gray=rgb2gray(pic);
 mgray=mean(mean(gray));
 %energy
 gray=rgb2gray(pic);
 glcm = graycomatrix(gray, 'o', [0,1]);
 S = graycoprops(glcm);
 energy = S.Energy*100;
 

 %entropy 
 rngfil = rangefilt(pic);
 entro = entropy(rngfil)*100;
 
 %homo
 Homo = S.Homogeneity*100;
 
 %contrast
 Contrast = S.Contrast*100;
 
 %Correlation
 correlation=S.Correlation*100;
 
% ............................... calculate Excel Cell
 cell1=cat(2,'A',num2str(rr+2));
 cell2=cat(2,'B',num2str(rr+2));
 cell3=cat(2,'C',num2str(rr+2));
 cell4=cat(2,'D',num2str(rr+2));
 cell5=cat(2,'E',num2str(rr+2));
 cell6=cat(2,'F',num2str(rr+2));
 cell7=cat(2,'G',num2str(rr+2));
 cell8=cat(2,'H',num2str(rr+2));
 cell9=cat(2,'I',num2str(rr+2));
 cell10=cat(2,'J',num2str(rr+2));

% .................................. Write Excel Data

 xlswrite(excel,[{filename}],1,cell1);
 xlswrite(excel,[mred],1,cell2);
 xlswrite(excel,[mgreen],1,cell3);
 xlswrite(excel,[mblue],1,cell4);
 xlswrite(excel,[mgray],1,cell5);
 xlswrite(excel,[entro],1,cell6);
 xlswrite(excel,[energy],1,cell7);
 xlswrite(excel,[Homo],1,cell8);
 xlswrite(excel,[Contrast],1,cell9);
 xlswrite(excel,[correlation],1,cell10);
 
 system('taskkill /F /IM EXCEL.EXE');

% --- Executes on button press in Recogbtn.
function Recogbtn_Callback(hObject, eventdata, handles)
% hObject    handle to Recogbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
global pic;
global excel;

excel = 'E:\MATLAB\R2018\bin\Project\DB_Train.xlsx';
datasetpath ='E:\MATLAB\R2018\bin\Project\Dataset\';

tab=xlsread(excel);
[rr,cc]=size(tab);


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
 
 
 
 
 
% ............................ Matching 

min=999;
rec=0;

for i=1 : rr
diff=0;    
    for j=1 : cc
        diff=diff+sqrt((tab(i,j)-data(j))); 
    end
if (diff <=12 ) 
    min=diff;
    rec=i;
end
end

if (rec ~= 0)
    %found
   cellx=cat(2,'A',num2str(rec+1));
    %cellx = A3
   [~,ff]=xlsread(excel,1,cellx);
   file=ff{1};
   imgfile = strcat(datasetpath,file);
   result=imread(imgfile);
   axes(handles.axes2); imshow(result);
   file= strcat('Found : ',file);
   set (handles.edit2, 'string',file);
else
    % not found
   fig=zeros(250,300);
   axes(handles.axes2); imshow(fig);
   set (handles.edit2, 'string','UNFOUND');
end




% --- Executes on button press in Clearbtn.
function Clearbtn_Callback(hObject, eventdata, handles)
% hObject    handle to Clearbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1); cla;
axes(handles.axes2); cla;

set (handles.edit1, 'string','                         ');
set (handles.edit2, 'string','                         ');
% --- Executes on button press in Exitbtn.
function Exitbtn_Callback(hObject, eventdata, handles)
% hObject    handle to Exitbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close 


% --- Executes on button press in Uploadbtn.
function Uploadbtn_Callback(hObject, eventdata, handles)
% hObject    handle to Uploadbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
global pic;
global filename;

[filename pathname]=uigetfile({'*.bmp','*.jpg'},'file select');

image = strcat(pathname,filename);
pic = imread(image);

axes(handles.axes1); imshow(pic);
axes(handles.axes2); cla;

set(handles.edit1,'string',filename);


% --- Executes on button press in PrepareDatabtn.
function PrepareDatabtn_Callback(hObject, eventdata, handles)
% hObject    handle to PrepareDatabtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pic;
hsvImage = rgb2hsv(pic);
sImage = hsvImage(:, :, 2);
mask = sImage > 0.1;
mask = bwareafilt(mask,1);
mask = imfill(mask, 'holes');
props = regionprops(logical(mask), 'BoundingBox');
croppedImage = imcrop(pic, props.BoundingBox);
axes(handles.axes1); imshow(croppedImage);



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Typebtn.
function Typebtn_Callback(hObject, eventdata, handles)
% hObject    handle to Typebtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global pic;


 r=mean(mean(pic(:,:,1)));
 g=mean(mean(pic(:,:,2)));
 b=mean(mean(pic(:,:,3)));
 

 if (r > g) && (r > b)
     set(handles.edit3,'string','100');
         elseif (g>r) && (g>b)
     set(handles.edit3,'string','20');
         elseif (b>r) && (b>g)
     set(handles.edit3,'string','50');
    else
        set(handles.edit3,'string','1000');
 end

 
 


% --- Executes on button press in Rotate.
function Rotate_Callback(hObject, eventdata, handles)
% hObject    handle to Rotate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pic
pic = imrotate(pic,45);

axes(handles.axes1); imshow(pic);



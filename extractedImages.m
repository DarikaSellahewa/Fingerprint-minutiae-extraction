function varargout = extractedImages(varargin)
% EXTRACTEDIMAGES MATLAB code for extractedImages.fig
%      EXTRACTEDIMAGES, by itself, creates a new EXTRACTEDIMAGES or raises the existing
%      singleton*.
%
%      H = EXTRACTEDIMAGES returns the handle to a new EXTRACTEDIMAGES or the handle to
%      the existing singleton*.
%
%      EXTRACTEDIMAGES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXTRACTEDIMAGES.M with the given input arguments.
%
%      EXTRACTEDIMAGES('Property','Value',...) creates a new EXTRACTEDIMAGES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before extractedImages_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to extractedImages_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help extractedImages

% Last Modified by GUIDE v2.5 24-Jun-2016 08:05:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @extractedImages_OpeningFcn, ...
                   'gui_OutputFcn',  @extractedImages_OutputFcn, ...
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


% --- Executes just before extractedImages is made visible.
function extractedImages_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to extractedImages (see VARARGIN)

% Choose default command line output for extractedImages
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes extractedImages wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = extractedImages_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


Minutiae_Extraction
axes(handles.axes1)
imshow(binary_image)
axes(handles.axes2)
imshow(thin_image)
axes(handles.axes3)
imshow(binary_image)
hold on
imshow(ROI)
alpha(0.5)
hold on
imshow(outImg)
hold off




 


 

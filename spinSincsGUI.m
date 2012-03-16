function varargout = spinSincsGUI(varargin)
% SPINSINCSGUI MATLAB code for spinSincsGUI.fig
%      SPINSINCSGUI, by itself, creates a new SPINSINCSGUI or raises the existing
%      singleton*.
%
%      H = SPINSINCSGUI returns the handle to a new SPINSINCSGUI or the handle to
%      the existing singleton*.
%
%      SPINSINCSGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPINSINCSGUI.M with the given input arguments.
%
%      SPINSINCSGUI('Property','Value',...) creates a new SPINSINCSGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before spinSincsGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to spinSincsGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help spinSincsGUI

% Last Modified by GUIDE v2.5 27-Feb-2012 22:10:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @spinSincsGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @spinSincsGUI_OutputFcn, ...
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


% --- Executes just before spinSincsGUI is made visible.
function spinSincsGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to spinSincsGUI (see VARARGIN)

firLength = 511;%should be odd
bandWidth = .2;
transitionLength = .001;
extendLength = 4096;
phaseShift = .0002;

set(handles.phaseslider,'Value',phaseShift);
set(handles.bandslider,'Value',bandWidth);
set(handles.phasetext, 'String',num2str(phaseShift));
set(handles.bandtext, 'String',num2str(bandWidth));
handles = makeplots(handles);




% Choose default command line output for spinSincsGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes spinSincsGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = spinSincsGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function phaseslider_Callback(hObject, eventdata, handles)
% hObject    handle to phaseslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

a = get(hObject,'Value');
set(handles.phasetext, 'String',num2str(a));
handles = makeplots(handles);
guidata(hObject, handles);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function phaseslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to phaseslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function bandwidth_Callback(hObject, eventdata, handles)
% hObject    handle to bandwidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bandwidth as text
%        str2double(get(hObject,'String')) returns contents of bandwidth as a double


% --- Executes during object creation, after setting all properties.
function bandwidth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bandwidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function bandslider_Callback(hObject, eventdata, handles)
% hObject    handle to phaseslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = get(hObject,'Value');
set(handles.bandtext, 'String',num2str(a));
handles = makeplots(handles);
guidata(hObject, handles);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function bandslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to phaseslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end




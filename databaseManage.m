



conn = OpenMySqlConnection();% connect to database
s=isconnection(conn);
s;
sprintf('\\\\\\\\\\\\\\\\\\\\\\\\');

% select all data from table prestored
alldata = SelectAllFromDB(conn,'prestored');
alldata;

%retrieving data from gui


image = getimage(handles.axes1);%finger print image
person = getimage(handles.axes2);%person image

 name = get(handles.edit1,'String'); %name 
 %fprintf(name);
 if isempty(name)
   fprintf('Error: Enter Text first\n');
 end
 
 hometown = get(handles.edit2,'String');%hometown
 if isempty(hometown)
   fprintf('Error: Enter Text first\n');
 end
 
 %gender
 if (get(handles.radiobutton1,'Value') == 0 && get(handles.radiobutton2,'Value') == 0)
 
    %user did not select any radio button, then do this
  else
    %do this if a user selected a radio button
 
      switch get(get(handles.uipanel1,'SelectedObject'),'Tag')
 
      case 'radiobutton1',  gender = 'Male';
 
      case 'radiobutton2',  gender = 'Female';
 
      
      end
 end

  
    
%inserting data to database
InsertIntoPrestoredTable(conn,name,hometown,gender);

% select all data from table prestored
alldata = SelectAllFromDB(conn,'prestored');
alldata;

%retriecving index from database
qry = 'SELECT LAST_INSERT_ID()';
index = fetch(conn,qry);

%getting results from extraction

mObj = matfile('Minutiae.mat');
centroidRend = mObj.centroidRend;
centroidRbif = mObj.centroidRbif;

%Inserting extracted matrices to database
%insertIntoRidge_endTable(conn,index);
%insertIntoRidge_bifTable(conn,index);







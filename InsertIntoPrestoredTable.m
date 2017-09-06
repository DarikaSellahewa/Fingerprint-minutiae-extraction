function InsertIntoPrestoredTable(conn,name,hometown,gender)
if isconnection(conn)
    
    %s = size(image);
    %image = reshape(image,[],1);
    %person=reshape(person,[],1);
    
    table_name='prestored';
    column_names = {'name','hometown','gender'};
    data_set  = {name,hometown,gender};
    fastinsert(conn,table_name,column_names,data_set);




else
    display('MySql Connection Error');
end
end

function insertIntoRidge_endTable(conn,index)

if isconnection(conn)
    
    table_name='ridge_end';
    column_names = {'Rend_index'};
    
    %Preparing the data set
%    s=size(Rend);
    %{
    for i=1:s
       row_number = i;
       Rend_x = Rend(i,1);
       Rend_y = Rend(i,2);
    end
    %}
    data_set  = {index};
    fastinsert(conn,table_name,column_names,data_set);




else
    display('MySql Connection Error');
end
end

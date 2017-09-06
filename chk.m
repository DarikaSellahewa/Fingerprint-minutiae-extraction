

%Database connection

function conn = OpenMySqlConnection()

%# JDBC connector path
javaaddpath('C:\Users\User\Documents\MATLAB\mysql-connector-java-5.0.8\mysql-connector-java-5.0.8-bin.jar');
%# connection parameteres
host = 'localhost'; %MySQL hostname
user = 'user'; %MySQL username
password = '';%MySQL password
dbName = 'fingerprint'; %MySQL database name
%# JDBC parameters
jdbcString = sprintf('jdbc:mysql://%s/%s', host, dbName);
jdbcDriver = 'com.mysql.jdbc.Driver';
%# Create the database connection object


%s = isconnection(conn);
%s
%fprintf('\\\\\\\\\\\\\\\\\\\\\\\\');
conn = database(dbName, user , password, jdbcDriver, jdbcString);
end

function alldata = SelectAllFromDB(conn,tableName)

if isconnection(conn)
qry = sprintf('Select * From %s;',tableName);
display(qry);
rs = fetch(exec(conn, qry));
alldata = get(rs, 'Data');
display(alldata);
else
display('MySql Connection Error');
end

end


<html>
<%

set openConnection = Server.CreateObject("ADODB.Connection")
openConnection.Open "DSN=fishauction_sqlConn;uid=fishauction;pwd=tavel2004;Initial Catalog=DB_74423"

'openConnection.Close

Dim SQL
SQL = "BidsGetWonByProcId 1,'01/01/2004 13:00','01/01/2004'" 
set results = openConnection.Execute(SQL)

%>
<%= DateAdd("n", 270, Now)%>

</html>
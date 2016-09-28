<%
 set conex = createobject("ADODB.connection")
 set rs = createobject("ADODB.recordset")
 CONEX.OPEN "Provider=SQLOLEDB.1;Data Source=127.0.0.1;User ID=sa;Password=0f6c654$"
 conex.commandtimeout=3000
 server.scripttimeout=900
 
%>



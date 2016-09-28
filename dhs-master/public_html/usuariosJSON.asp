<%Response.ContentType= "text/html; charset=ISO 8859-1" 'resuelve problemas de ajax%>
<%'@ Language=VBScript CODEPAGE="1252" LCID="1034"%>
<!--#include file="stringconex.asp" -->
<% 
  sSQL="Proto..sp_buscouser"+request("filtros")
 
 'response.Write(ssql)
 set rs=conex.execute(sSQL) 
 if not rs.eof then
%>
[
<% a=0
while not rs.EOF%>
<%if a>0 then%>,<%end if%>
{<% for i = 0 to rs.fields.Count - 1 %> 
"<%=rs.fields(i).name%>":"<%=rs.fields(i)%>"<%if i < rs.fields.Count - 1 then%>,<%end if%>
<% next %>}
<% rs.movenext 
a=a+1
response.Flush() 
wend%>
]
<%else%>
[{"Sin Registros":"No hay registros para mostrar"}]
<%
 end if
 rs.close 
 conex.Close 
%>





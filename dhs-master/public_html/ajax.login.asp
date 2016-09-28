<!--#include file="stringconex.asp" -->
<%
	'response.write str_usuario 
	rs.open"select * from Proto..Usuarios where(Usuario='" & request("usuario") & "' and pass= '" & request("password") & "')", conex ,0,1
	if not rs.eof then
		session("usr_id")=rs("usuario")
		session("nombre")=rs("nombre")
		usr_id=rs("usuario")
		nombre=rs("nombre")
		response.redirect"landing.html"
	end if
	rs.close
	'response.write " Sesion iniciada como: [" & session("usr_id") & "]"
%>

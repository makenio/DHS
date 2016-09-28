<%Response.ContentType= "text/html; charset=ISO 8859-1" 'resuelve problemas de ajax%>
<%'@ Language=VBScript CODEPAGE="1252" LCID="1034"%>
<!--#include file="stringconex.asp" -->
<% 

 if request("accion")="Editusuario" or request("accion")="Altausuario" then
 	'response.write "Proto..sp_abm_usuario'"& request("cd_objeto") &"','"& request("accion") &"','"& request("usuario") &"','"& request("Contraseña") &"','"& request("nombre") &"','"& request("Descripcion") &"','"& request("Idioma") &"'"
 	msj=Conex.Execute("Proto..sp_abm_usuario'"& request("cd_objeto") &"','"& request("accion") &"','"& request("usuario") &"','"& request("Contraseña") &"','"& request("nombre") &"','"& request("Descripcion") &"'")("MSG")
	
	response.write msj
 end if
 
  if request("accion")="borrarUser" then
 	msj=Conex.Execute("Proto..sp_abm_usuario'"& request("cd_usuario") &"','"& request("accion") &"'")("MSG")
	
	response.write msj
 end if
 
 if request("accion")="Editrack" or request("accion")="Altarack" then
 	msj=Conex.Execute("Proto..sp_abm_rack'"& request("cd_objeto") &"','"& request("accion") &"','"& request("Cantidad de Bandejas") &"','"& request("Ubicación") &"','"& request("Descripción") &"','"& request("Dirección IP") &"','"& request("Altura de bandeja") &"','"& request("Ancho de bandeja") &"','"& request("Profundidad de bandeja") &"'")("MSG")
	
	response.write msj
 end if
 
  if request("accion")="borrarRack" then
 	msj=Conex.Execute("Proto..sp_abm_rack'"& request("cd_rack") &"','"& request("accion") &"'")("MSG")
	
	response.write msj
 end if
 
 conex.Close 
%>





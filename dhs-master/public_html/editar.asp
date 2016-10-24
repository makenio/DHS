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
 
 
 if request("accion")="AltaGuia" then
 	msj=Conex.Execute("Proto..sp_abm_guia'"& request("cd_objeto") &"','"& request("accion") &"','"& request("barcode") &"','"& request("guiadesc") &"','"& request("guiaancho") &"','"& request("guiaprof") &"','"& request("guiaalto") &"'")("MSG")
	
	response.write msj
 end if
 
  if request("accion")="borrarGuia" then
  	hasta=request("qguias")
	a=0
	msj=1
	for a=0 to hasta
 		submsj=Conex.Execute("Proto..sp_abm_guia'"& request("cd_guia") &"','"& request("accion") &"','"& request("guiabarcode"+CStr(a)) &"'")("MSG")
		if submsj <> 1 then
			msj=0
		end if
	next
	
	response.write msj
 end if
 conex.Close 
%>





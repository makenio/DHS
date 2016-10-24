<script src="scripts.js"></script>

<script>

$( document ).ready(function() {
		
	$("#buscaru").click(function(){
		var buscar=$("#txtbuscaru").val();
		var filtros=" '"+buscar+"','0','0'"
		$("#CargoUSuarios").html("");
		
		$.getJSON("usuariosJSON.asp",{'filtros':filtros},
		function (data) {
			var mydata = eval(data);
			var table = $.makeTable(mydata,'usuarios');
			$(table).appendTo("#CargoUSuarios");
			
			$("#CargoUSuarios tr td:last-child").each(function(){
				var id= $(this).html();
				$(this).html('<button id="editus'+id+'" cd_user="'+id+'" type="button" class="editus btn btn-default"><i class="fa fa-user"></i></button> <button id="borrarus'+id+'" cd_user="'+id+'" type="button" class="borrarus btn btn-default"><i class="fa fa-user-times"></i></button>');
			});
			
			$(".editus").click(function(){
				var cd_usuario=$(this).attr("cd_user")
				var filtros=" '0','"+cd_usuario+"','1'"
				$("#AMUSuarios").html("");
				
				$.getJSON("usuariosJSON.asp",{'filtros':filtros},
				function (data) {
					var mydata = eval(data);
					var table = $.makeForm(mydata,'Editusuario',cd_usuario);
					$(table).appendTo("#AMUSuarios");
					
					var TableRow = "<div class='row'><div class='col-md-6'><button type='submit' class='col-md-4 col-md-offset-1 btn btn-default pull-right'><span class='glyphicon glyphicon-ok-circle' id='Guardar'>ACEPTAR</span></button><span class='Cancelar col-md-4 btn btn-default pull-right'><span class='glyphicon glyphicon-remove-circle'>CANCELAR</span></span></div>";
					
					$(TableRow).appendTo("#AMUSuarios");
					
					$(".Cancelar").click(function(){
						$("#AMUSuarios").html("");
						});
				});	
				
			});
			
			$(".borrarus").click(function(){
				var cd_usuario=$(this).attr("cd_user")
				var filtros=" '"+cd_usuario+"'"
				$("#CargoUSuarios").load("editar.asp",{'cd_usuario': cd_usuario, 'accion':'borrarUser'});
				var valor=$("#CargoUSuarios").val();
					if (valor==1) {
						$("#AMUSuarios").html('<i class="fa fa-check fa-4x"></i>');
						}
					else {
						$("#AMUSuarios").html('<i class="fa fa-close fa-4x"></i>');
						}	
					$("#CargoUSuarios").html("");	
			});
		});
			
		
	});	
		
	$("#nuevous").click(function(){
			var filtros=" '0','0','1'"
			$("#AMUSuarios").html("");
			
			$.getJSON("usuariosJSON.asp",{'filtros':filtros},
			function (data) {
				var mydata = eval(data);
				var table = $.makeForm(mydata,'Altausuario',0);
				$(table).appendTo("#AMUSuarios");
				
				var TableRow = "<div class='row'><div class='col-md-6'><button type='submit' class='col-md-4 col-md-offset-1 btn btn-default pull-right'><span class='glyphicon glyphicon-ok-circle' id='Guardar'>ACEPTAR</span></button><span class='Cancelar col-md-4 btn btn-default pull-right'><span class='glyphicon glyphicon-remove-circle'>CANCELAR</span></span></div>";
			
			$(TableRow).appendTo("#AMUSuarios");
			
			$(".Cancelar").click(function(){
				$("#AMUSuarios").html("");
				});	
			});	
		});	
	
	
	
	$('form').submit(function() {
		event.preventDefault();
		$.ajax({
					type: 'POST',
					url: $(this).attr('action'),
					data: $(this).serialize(),
					success: function(data) {
						$("#CargoUSuarios").html("");
						if (data==1) {
							$("#AMUSuarios").html('<i class="fa fa-check fa-4x"></i>');
							}
						else {
							$("#AMUSuarios").html('<i class="fa fa-close fa-4x"></i>');
							}	
						
						}
		});	
	});	

});

</script>
<div class="container-fluid">
    <div class="row">
        <div class="well">ABM DE USUARIOS</div>
    </div>
    <div class="row">
        <div id="buscador1" style="padding:10px;">
        <input name="txtbuscaru" id="txtbuscaru" type="text" style="width:50%; height: 34px;"  class="borde text ui-widget-content ui-corner-all" />
        <button id="buscaru" type="button" class="btn btn-default"><i class="fa fa-search"></i></button>
        <button id="nuevous" type="button" class="btn btn-default"><i class="fa fa-user-plus"></i></button>
        </div>

        <form role="form" id="AMUSuarios" name="frm_user" action="editar.asp"></form>
        </div>  

<div id="CargoUSuarios" class="col col-md-12">
</div>  


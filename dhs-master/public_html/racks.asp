<script src="scripts.js"></script>

<script>

$( document ).ready(function() {
		
	$("#buscarr").click(function(){
		var buscar=$("#txtbuscarr").val();
		var filtros=" '"+buscar+"','0','0'"
		$("#CargoRacks").html("");
		
		$.getJSON("racksJSON.asp",{'filtros':filtros},
		function (data) {
			var mydata = eval(data);
			var table = $.makeTable(mydata,'Racks');
			$(table).appendTo("#CargoRacks");
			
			$("#CargoRacks tr td:last-child").each(function(){
				var id= $(this).html();
				$(this).html('<button id="editra'+id+'" cd_rack="'+id+'" type="button" class="editra btn btn-default"><i class="fa fa-reorder"></i></button> <button id="borrarra'+id+'" cd_rack="'+id+'" type="button" class="borrarra btn btn-default"><i class="fa fa-times-circle"></i></button>');
			});
			
			$(".editra").click(function(){
				var cd_rack=$(this).attr("cd_rack")
				var filtros=" '0','"+cd_rack+"','1'"
				$("#AMRacks").html("");
				
				$.getJSON("racksJSON.asp",{'filtros':filtros},
				function (data) {
					var mydata = eval(data);
					var table = $.makeForm(mydata,'Editrack',cd_rack);
					$(table).appendTo("#AMRacks");
					
					var TableRow = "<div class='row'><div class='col-md-6'><button type='submit' class='col-md-4 col-md-offset-1 btn btn-default pull-right'><span class='glyphicon glyphicon-ok-circle' id='Guardar'>ACEPTAR</span></button><span class='Cancelar col-md-4 btn btn-default pull-right'><span class='glyphicon glyphicon-remove-circle'>CANCELAR</span></span></div>";
			
					$(TableRow).appendTo("#AMRacks");
					
					$(".Cancelar").click(function(){
						$("#AMRacks").html("");
						});	
				});	
				
			});
			
			$(".borrarra").click(function(){
				var cd_rack=$(this).attr("cd_rack")
				var filtros=" '"+cd_rack+"'"
				$("#CargoRacks").load("editar.asp",{'cd_rack': cd_rack, 'accion':'borrarRack'});
				var valor=$("#CargoRacks").val();
					if (valor==1) {
						$("#AMRacks").html('<i class="fa fa-check fa-4x"></i>');
						}
					else {
						$("#AMRacks").html('<i class="fa fa-close fa-4x"></i>');
						}	
					$("#CargoRacks").html("");	
			});
		});
			
		
	});	
		
	$("#nuevora").click(function(){
			var filtros=" '0','0','1'"
			$("#AMRacks").html("");
			
			$.getJSON("racksJSON.asp",{'filtros':filtros},
			function (data) {
				var mydata = eval(data);
				var table = $.makeForm(mydata,'Altarack',0);
				$(table).appendTo("#AMRacks");
				
				var TableRow = "<div class='row'><div class='col-md-6'><button type='submit' class='col-md-4 col-md-offset-1 btn btn-default pull-right'><span class='glyphicon glyphicon-ok-circle' id='Guardar'>ACEPTAR</span></button><span class='Cancelar col-md-4 btn btn-default pull-right'><span class='glyphicon glyphicon-remove-circle'>CANCELAR</span></span></div>";
			
			$(TableRow).appendTo("#AMRacks");
			
			$(".Cancelar").click(function(){
				$("#AMRacks").html("");
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
						$("#CargoRacks").html("");
						if (data==1) {
							$("#AMRacks").html('<i class="fa fa-check fa-4x"></i>');
							}
						else {
							$("#AMRacks").html('<i class="fa fa-close fa-4x"></i>');
							}	
						
						}
		});	
	});	

});

</script>
<div class="container-fluid">
    <div class="row">
        <div class="well">SETTINGS DE ALMAC&Eacute;N</div>
    </div>
    <div class="row">
    <div id="buscador1" style="padding:10px;">
    <input name="txtbuscarr" id="txtbuscarr" type="text" style="width:50%; height: 34px;"  class="borde text ui-widget-content ui-corner-all" />
    <button id="buscarr" type="button" class="btn btn-default"><i class="fa fa-search"></i></button>
    <button id="nuevora" type="button" class="btn btn-default"><i class="fa fa-plus-circle"></i></button>
    </div>

    <form role="form" id="AMRacks" name="frm_racks" action="editar.asp">
    </form>
   </div>
</div>          

<div id="CargoRacks" class="col col-md-12">
</div>  



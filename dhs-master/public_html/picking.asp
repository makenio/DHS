<script src="scripts.js"></script>

<script>

$( document ).ready(function() {
	contador=0;
	
	$("#linepicking").click(function(){
		contador+=1;
		$("#codbarras").append("<input class='form-control guiabarcode' type='text' id='guiabarcode"+contador+"' name='guiabarcode"+contador+"'></br>");
		$("#qguias").val(contador+1);
		});
		
	$(".Cancelar").click(function(){
		document.location.href="landing.html"
		});		
	
	
	$('form').submit(function() {
		event.preventDefault();
		$.ajax({
					type: 'POST',
					url: $(this).attr('action'),
					data: $(this).serialize(),
					success: function(data) {
						$("#CargoPicking").html("");
						if (data==1) {
							$("#AMPicking").html('<i class="fa fa-check fa-4x"></i>');
							}
						else {
							$("#AMPicking").html('<i class="fa fa-close fa-4x"></i>');
							}	
						
						}
		});	
	});	

});

</script>
<!-- PICKING -->
<div class="container-fluid">
    <div class="row">
        <div class="well">PICKING</div>
    </div>
    <div class="row">
    <div id="CargoPicking" class="col col-md-12">
        <form role="form" id="frm_picking" name="frm_picking" action="editar.asp">
            <div class="form-group col-md-8">
                <label for="guiabarcode">C&oacute;digo/s de barras de la gu&iacute;a: </label>
                <span id="codbarras">
                <input class='form-control guiabarcode' type='text' id='guiabarcode0' name='guiabarcode0'></br>
                </span>
                <input type='hidden' name='cd_guia' id='cd_guia' value='1'>
                <input type='hidden' name='qguias' id='qguias' value='0'>
        		<input type='hidden' name='accion' id='accion' value='borrarGuia'>
            </div>
        <div class="row">
        <div class="col-md-12 col-xs-12">
            <div id="linepicking" class="btn btn-info">AGREGAR NUEVA LÍNEA DE PICKING</div>
        </div>
        </div>
        <div class="row">
            <div class="col-md-6">
            <button class="col-md-4 col-md-offset-1 btn btn-default pull-right"><span class="glyphicon glyphicon-ok-circle">ACEPTAR</span></button>
            <div class="col-md-4 btn btn-default pull-right"><span class="glyphicon glyphicon-remove-circle">CANCELAR</span></div>
            </div>
        </div>
        </form>
    </div>
    <div id="AMPicking"></div>    
    </div>
    
  </div>                        
<!-- PICKING -->

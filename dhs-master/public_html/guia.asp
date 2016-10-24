<script src="scripts.js"></script>

<script>

$( document ).ready(function() {
		
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
						$("#CargoGuia").html("");
						if (data>=1) {
							$("#AMGuia").fadeOut("slow",function() {
								$(this).html('<i class="fa fa-check fa-4x"></i>');
								}).fadeIn("slow",function(){
									$("#AMGuia").load("ubicbandeja.asp",{'cd_guia':data});
									});
							}
						else {
							$("#AMGuia").html('<i class="fa fa-close fa-4x"></i>');
							}	
						
						}
		});	
	});	

});

</script>
<!-- CARGA DE GUIA -->
<div class="container-fluid">
    <div class="row">
        <div class="well">CARGA SIMPLE DE GU&Iacute;A</div>
    </div>
    <div class="row">
    <div id="CargoGuia" class="col col-md-12">
	<form role="form" id="frm_guia" name="frm_guia" action="editar.asp">
    <div class="form-group col-md-8">
        <label for="guiabarcode">C&oacute;digo de barras</label>
        <input class="form-control" type="text" name="barcode">
        <label for="guiadesc">Descripci&oacute;n</label>
        <input class="form-control" type="text" name="guiadesc">
        <label for="guiaancho">Ancho de gu&iacute;a</label>
        <input class="form-control" type="text" name="guiaancho">
        <label for="guiaprof">Profundidad de gu&iacute;a</label>
        <input class="form-control" type="text" name="guiaprof">
        <label for="guiaaltura">Altura de gu&iacute;a</label>
        <input class="form-control" type="text" name="guiaalto">
        <input type='hidden' name='cd_objeto' id='cd_objeto' value='0'>
        <input type='hidden' name='accion' id='accion' value='AltaGuia'>
     </div>
    <div class="row">
        <div class="col-md-6">
        <button class="col-md-4 col-md-offset-1 btn btn-default pull-right"><span class="glyphicon glyphicon-ok-circle">ACEPTAR</span></button>
        <div class="Cancelar col-md-4 btn btn-default pull-right"><span class="glyphicon glyphicon-remove-circle">CANCELAR</span></div>
        </div>
    </div>
 	</form>
    </div>
    <div id="AMGuia"></div>
    </div>
  </div>                        
<!-- FIN CARGA DE GUIA --> 



<script>

$( document ).ready(function() {
	$.getJSON("ubicbandejaJSON.asp",{'cd_guia':<%=request("cd_guia")%>},
		function (data) {
			var mydata = eval(data);
			var table = $.makeTable(mydata,'Racks');
			$(table).appendTo("#CargoUbicband");
			
			$("#CargoUbicband tr td:last-child").each(function(){
				var id= $(this).html();
				$(this).html('<button id="selband'+id+'" cd_band="'+id+'" type="button" class="selband btn btn-default"><i class="fa fa-reorder"></i></button>');
			});	
		});	
});

</script>

<div id="CargoUbicband" class="col col-md-12">
</div>  



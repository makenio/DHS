$.makeTable = function (mydata,titulo) {
            var table = $('<table border="1" align="center" cellspacing="0" class="tabla table table-bordered" id="'+titulo+'" style="border-collapse:collapse;">');
            var tblHeader = "<tr class='text-center text-bold bg-blue10 blanco'>";
            for (var k in mydata[0]) tblHeader += "<th class='text-center text-bold' scope='col'>" + k + "</th>";
            tblHeader += "</tr>";
            $(tblHeader).appendTo(table);
            $.each(mydata, function (index, value) {
				if (index % 2 == 0) {
					var TableRow = "<tr class='text-center bg-gray'>";
					}
                else {
					var TableRow = "<tr class='text-center bg-blanco'>";
					}
                $.each(value, function (key, val) {
                    TableRow += "<td>" + val + "</td>";
                });
                TableRow += "</tr>";
                $(table).append(TableRow);
            });
			$(table).append("</table>");
            return ($(table));
        };


$.makeForm = function (mydata,titulo,cd_objeto) {
            var table = $('<div class="form-group col-md-8" id="'+titulo+'">');
            $.each(mydata, function (index, value) {
					var TableRow = "";
                $.each(value, function (key, val) {
					if (val=='##########'){	var tipo='password' } else {var tipo='text'};	
					TableRow += "<label for=" + key + ">" + key + ": </label>";
					TableRow += "<input type='"+tipo+"' name='" + key + "' id='" + key + "' value='" + val + "' class='form-control'>";
                });
                TableRow += "<input type='hidden' name='cd_objeto' id='cd_objeto' value='"+cd_objeto+"'><input type='hidden' name='accion' id='accion' value='"+titulo+"'></div></div></div>"
				TableRow +="</div>"
				
                $(table).append(TableRow);
            });
			
            return ($(table));
        };

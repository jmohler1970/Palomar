$(document).ready(function () {

	$('form').submit(function () {

		var $this = $(this);  // $(this) is the 'form' field tag you binded to

		var empty_fields = $this.find('input,textarea,select').filter(function () {

			//return empty required fields
			return $(this).attr("required") && $(this).val() === "";
		});

		// if empty required field stop the form submitting and let the user know
		if (empty_fields.length) {
			alert('All required fields must have data');
			return false;
		}

		$this.find('button[type="submit"].login').removeClass("btn-primary").addClass("btn-success");
		
		});


	});
	
	
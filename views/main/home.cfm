



<div class="row">
	<div class="col-md-6 col-md-offset-3">
		<div class="well">
			
			<!--- See: http://stackoverflow.com/questions/2530/how-do-you-disable-browser-autocomplete-on-web-form-field-input-tag --->
			<form class="form-horizontal" action="~/" method="post" data-append="#ajax-message" autocomplete="off">
				<!--- <input type="hidden" name="format" value="json" /> ajax--->
				
				<cfoutput>
				<input type="hidden" name="token" value="#CSRFGenerateToken()#" />
				<input type="password" name="fake" value="" style="display : none;" /><!--- This serves 2 purposes: 1) it kills autocomplete, 2) attacks don't expect two password fields ---> 
				</cfoutput>
				
				<fieldset>
					<legend>Login</legend>
					
						<div class="form-group">
							<label for="email" class="col-lg-4 control-label">Username / Email</label>
							<div class="col-lg-8">
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
									<input type="email" class="form-control" name="email" id="email" required="required" autofocus="autofocus" maxlength="80" />
								</div>
							</div>
						</div><!-- /.form-group -->

						<div class="form-group">
							<label for="inputPassword" class="col-lg-4 control-label">Password</label>
							<div class="col-lg-8">
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
									<input type="password" class="form-control" name="password" id="pwd" required="required" maxlength="80" readonly="readonly" autocomplete="off" />
								</div>	
							</div>
						</div><!-- /.form-group -->
				</fieldset> 
				
				<div class="form-group">
					<div class="col-md-4 col-md-offset-4">
						<button type="submit" class="btn btn-primary save" role="button" id="login"><i class="glyphicon glyphicon-log-in"></i> Login</button>
					</div>
				</div><!-- /.form-group -->	

			</form>
		</div><!-- /.well -->
	</div><!-- /.column -->
</div><!-- /.row -->




<script>
$(document).ready(function(){
	$('#pwd').prop('readonly', false); // no autofill
	$('#login').prop('disabled',true);

	// begin make sure both fields are filled    
	$('#email').keyup(function(){
		$('#login').prop('disabled', this.value == "" || $('#pwd').val() == "" ? true : false);     
		});
		
	$('#pwd').keyup(function(){
		$('#login').prop('disabled', this.value == "" || $('#email').val() == "" ? true : false);     
		});
	// end	
		
});  
</script>
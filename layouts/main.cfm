
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Palomar Services</a>
		</div>
	
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li <cfif getItem() EQ "home">class="active"</cfif>><a href="~/"><i class="glyphicon glyphicon-home"></i> Home</a></li>
				<li <cfif getItem() EQ "about">class="active"</cfif>><a href="~/about">About Us</a></li>
			</ul>
	
			<ul class="nav navbar-nav navbar-right">
				<cfif IsUserLoggedIn()>
				<li><a href="~/logout">Logout <i class="glyphicon glyphicon-log-out"></i> </a></li>
				</cfif>
			</ul>
		</div><!-- /.navbar-collapse -->
	</div><!-- /.container-fluid -->
</nav>


<div class="jumbotron">
	<h1>Welcome to Palomar Services!</h1>
	<p>Palomar Services is a leader in cloud-based ColdFusion software delivering advanced graphical information anytime, anywhere. </p>
	<p><a class="btn btn-primary btn-lg" href="https://www.google.com/" role="button">Learn more</a></p>
</div>

<!--- AJAX placeholder --->
<div style="position: fixed; top: 0px; width: 70%;  z-index : 500">
	<div id="ajax-message" style="margin: 0 auto;"></div>
</div>


<cfoutput>#application.showMessage(rc.arMessage)#</cfoutput> 


<cfoutput>#body#</cfoutput>

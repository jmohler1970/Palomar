<cfif rc.format EQ "silent">
	<cfoutput>
		#body.replacelist("~/", application.GSROOTLINK)#  <!--- make sure that inner layouts have all ready done the escape--->
	</cfoutput>
	<cfexit>
</cfif>

<cfif rc.format EQ "json">
	<cfsetting showDebugOutput="No">
	<cfif rc.ajaxLocation NEQ "">
		<cfoutput>#serializeJSON({ "location" = rc.ajaxLocation })#</cfoutput>
		<cfexit>
	</cfif>

	<cfoutput>#serializeJSON({ "html" = application.genMessage(rc.message) })#</cfoutput>
	<cfexit>
</cfif><!--- No fuseaction message should be shown --->



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head title="Pet Check Alert">

	<meta name="author" content="James Mohler" />
	<meta name="description" content="Sample Login for Palomar Services" />
	<meta name="KEYWORDS" content="ColdFusion, bootstrap, framework, java, enterprise, server, faces, jquery, usability, next-gen, web, html5, easy, modern, well-designed, website, state-of-the-art" />
	<meta name="robots" content="index, follow" />

	<meta name="viewport" content="width=device-width, initial-scale=1" />

	<title>Palomar Services</title>

	<cfoutput>	
		<link rel="stylesheet" href="#application.GSVENDOR#cache/combo.css" />
		<script src="#application.GSVENDOR#cache/combo.js"></script>
		<script src="#application.GSASSETS#app.js"></script>
	</cfoutput>

</head>

<body>




<main class="container">


	<cfoutput>
		#body.replacelist("~/", application.GSROOTLINK)#  <!--- make sure that inner layouts have all ready done the escape--->
	</cfoutput>


	<p>&nbsp;</p>
	<p>&nbsp;</p>


	<p>Made by <a href="https://github.com/jmohler1970" rel="nofollow">James Mohler</a> for <cfoutput>#application.GSVERSION#</cfoutput>.</p>

</main>
</body>
</html> 

<cfoutput>User: #GetAuthUser()#</cfoutput>

<!---
<cfdump var="#session#">
--->

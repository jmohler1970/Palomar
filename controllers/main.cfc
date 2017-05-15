<cfscript>
component	accessors="true" output="false"	{

	property	beanFactory;
	property	framework;

	property	loginService;



void function home(required struct rc) output="false"	{

	if (cgi.request_method == "POST" && rc.keyExists("token") && CSRFverifyToken(rc.token))	{

		// clean up incoming fields
		rc.response = loginService.doLogin(arguments.rc.email.canonicalize(true, true).left(80), arguments.rc.password.canonicalize(true, true).left(80) ); // Make more robust on errors

		rc.arMessage.append(rc.response); // to be removed
		
		if (rc.response CONTAINS "success")	{
			variables.framework.redirect(".landing", "all"); // to be removed
			}
		}
	}


void function logout(required struct rc) output="false"	{


	rc.response = loginService.doLogout();

	rc.arMessage.append(rc.response); // to be removed

	variables.framework.redirect(".home", "all");
	}


}
</cfscript>
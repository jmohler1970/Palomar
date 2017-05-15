<cfscript>
component output="false"	{
	

	
	
string function doLogin(email, pwd) output="false"	{


	session.arPermission = [];

	local.entAccount = EntityLoad("Users", { email = arguments.email, passhash = hash(arguments.pwd) }, true);
	
	if (isNull(local.entAccount))	{
		return "<b>Error:</b> Email and Password combination did not work. Try again";
		}
	
	
	cflogin() { 
		cfloginuser(name = local.entAccount.getID(), password = hash(arguments.pwd), roles = "User");
		};
		
	return "<b>Success:</b> You are in";
	}


string function doLogout() output="false"	{

	cflogout();

	return "<b>Success:</b> This is a successful logout. Please come again";
	}

}
</cfscript>


<cfscript>
component extends="framework.one" output="false"	{
	

this.name="env_cf_029";
this.applicationManagement = true;
this.sessionManagement = true;

this.datasource = "Palomar";
this.ormenabled = true;
this.ormsettings.eventhandling = true;



variables.framework	=	{
	home			= "main.home",
	baseURL		= 'useCGIScriptName',
	defaultItem	= "home",
	generateSES	= true,
	SESomitIndex	= false,
	trace = false
	};
	
variables.framework.routes	= [
	// PetCheck
	{ "main/home"					= "main/home"			},
	{ "about"						= "main/about"			},
	{ "login"						= "main/home"			},
	{ "logout"					= "main/logout"		}
	
	];


function setupApplication()	{
	
	application.initialized = now();
	
	local.objAppFile = fileopen(expandpath('./Application.cfc'), 'read');
	
	application.GSVERSION = "Version 0.0.1.#right(year(local.objAppFile.lastmodified), 2)#.#month(local.objAppFile.lastmodified)#.#day(local.objAppFile.lastmodified)#";
fileclose(objAppFile);


	// Common variables and paths
 	application.GSAUTHOR			= "James Mohler and Web World Inc";
 	application.GSSITE_FULL_NAME		= "PlumaCMS";
 	application.GSSITE_LINK_BACK_URL	= "https://github.com/jmohler1970";
	application.GSROOTPATH			= "http://" & cgi.server_name & cgi.script_name.replace("index.cfm", "");
	application.GSROOTLINK			= "http://" & cgi.server_name & cgi.script_name & "/";
	application.GSASSETS			= application.GSROOTPATH & "assets/";
	application.GSVENDOR			= application.GSROOTPATH & "vendor/";
	
 	application.WIROOTPATH 			= getdirectoryfrompath(getBaseTemplatePath());
	application.WIVENDOR			= application.WIROOTPATH & "vendor\";

 	// I actually have a more robust version of this that takes care of missing files and min variations
	// Bundle all CSS.
	local.renderCSSFile = application.WIVENDOR & "cache/combo.css";
	if (FileExists(local.renderCSSFile)) FileDelete(local.renderCSSFile);

	local.renderCSS = "";
	for (var myCSS in ListToArray("bootstrap.min, bootstrap-theme.min"))	{
		
		local.renderCSS &= FileRead(application.WIVENDOR & "css\" & trim(myCSS) & ".css");
		}
	FileWrite(local.renderCSSFile, local.renderCSS);
	
	
	// Bundle all JS.
	local.renderJSFile = application.WIVENDOR & "cache/combo.js";
	if (FileExists(local.renderJSFile)) FileDelete(local.renderJSFile);

	local.renderJS = "";
	for (var myJS in ListToArray("jquery.min, bootstrap.min, eldarion-ajax"))	{
		
		local.renderJS &= FileRead(application.WIVENDOR & "js\" & trim(myJS) & ".js");
		}
	FileWrite(local.renderJSFile, local.renderJS);
	// end vendor file cacheing
	
	
	
	// For later use
	application.showMessage = function(required array arMessage) output="false"	{


		local.strMessage = "<!-- Start of message queue -->";
	
			
		for(local.i in arguments.arMessage)	{
			
			local.strMessage &= '<div class="row">';
			local.strMessage &= '<div class="col-sm-offset-2 col-sm-8">';
			
			if (local.i CONTAINS "success")	{
				local.strMessage &= '<div class="alert alert-success">';
				local.strMessage &= '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>';
				local.strMessage &= '<i class="glyphicon glyphicon-ok-sign text-success"></i> #local.i#';
				local.strMessage &= '</div>';
				}
				
			else if (local.i CONTAINS "error")	{	
				local.strMessage &= '<div class="alert alert-danger">';
				local.strMessage &= '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>';
				local.strMessage &= '<i class="glyphicon glyphicon-exclamation-sign text-danger"></i> #local.i#';
				local.strMessage &= '</div>';
				}
				
			else if (local.i CONTAINS "info")	{	
				local.strMessage &= '<div class="alert alert-info">';
				local.strMessage &= '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>';
				local.strMessage &= '<i class="glyphicon glyphicon-info-sign text-info"></i> #local.i#';
				local.strMessage &= '</div>';
				}
		
			else if (local.i CONTAINS "debug")	{
				if (isdebugmode())	{ // this cannot be merged with the previous line
					local.strMessage &= '<div class="alert alert-danger">';
					local.strMessage &= '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>';
					local.strMessage &= '<i class="glyphicon glyphicon-wrench text-danger"></i> #local.i#';
					local.strMessage &= '</div>';
					}
				}
				
			else	{
				local.strMessage &= '<div class="alert alert-warning">';
				local.strMessage &= '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>';
				local.strMessage &= '<i class="glyphicon glyphicon-warning-sign text-danger"></i> #local.i#';
				local.strMessage &= '</div>';
				}	
				
			
			local.strMessage &= '</div>';
			local.strMessage &= '</div>';		
			} // end for
			
		
		return local.strMessage & "<!-- end of message queue -->";
		};
	
	} // end setupApplication
	

	

	
void function setupSession() output="false"	{
	
	session.UserID = 0;
	}	



function setupRequest() output="false"	{
	
	
	} // end setupRequest


function before() output="false"	{
	
	param rc.arMessage 	= [];
	param rc.format 	= "";
	} // end setupRequest
	
	
string function onMissingView()	{


	if (rc.keyExists("response"))
		variables.fw.renderData("json", rc.response);

	
	setview("main.error");
	}

}
</cfscript>



<cfscript>

component persistent="true" output="false" {

	property name="id" fieldtype="id" generator="identity";

	property name="email";
	property name="passhash";
	property name="modifyDate"	insert="false";
	property name="createDate"	update="false" insert="false";
	
	
	


void function preUpdate() output="false"	{

	this.setModifyDate(now());
	}	
	
}
</cfscript>

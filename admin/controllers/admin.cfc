component accessors="true" displayname="Admin controller"{

    public any function init (fw) 
    {
        variables.fw = fw;

        return this;
    }
    public void function dashboard ( rc ) {

    	var admin = session.adminid;

    }

    function logout( rc ) 
    {
        // reset session variables
        session.auth.isLoggedIn = false;

        structdelete( session, "adminid" );

        rc.message = ["You have safely logged out"];

        location('/scart/');
    }
}
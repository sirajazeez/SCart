component accessors="true" displayname="Admin controller - Users"{

    property userServcices;

    public any function init (fw) 
    {
        variables.fw = fw;

        return this;
    }

    public void function view( rc ) {

        rc.users = variables.userServcices.getUsers();

    }

    public void function order(rc)
    {
        rc.orders = variables.userServcices.getOrders();
    }

    public function changeorder(rc){

        rc.getstatus = variables.userServcices.changeOrderStatus(rc.oid, rc.status);
        
        var result = rc.getstatus.status;

        variables.fw.renderData( "html", result );
    }

}
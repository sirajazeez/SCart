component accessors="true" displayname="Cart controller"{

    property cartServices;
    
    public any function init (fw) 
    {
        variables.fw = fw;

        return this;
    }
    public void function list ( rc ) {

    	var user = session.id;
        rc.cart = variables.cartServices.getCarts(user.id);

    }
    function updatecart(rc)
    {
        rc.updatecart = variables.cartServices.updateCart(rc.cid, rc.qty);

        rc.pprice = variables.cartServices.getCartsById(rc.cid);

        var result =  (rc.pprice.product_quantity * rc.pprice.product_price);

        variables.fw.renderData( "json", result );
    }   
    function deletecart(rc)
    {
        rc.deletecart = variables.cartServices.deleteCart(rc.cid);

        var rc.pprice = variables.cartServices.getCarts();

        var result =  1;

        variables.fw.renderData( "json", result );
    } 

    function checkout(rc)
    {

    	var user = session.id;

    	rc.product = variables.cartServices.getCarts(user.id);

    	rc.total = variables.cartServices.getTotalSum(user.id);

    }  

    function order_now(rc)
    {
    	var user = session.id;

    	rc.cart = variables.cartServices.getCarts(user.id);
        
        cfloop(query=rc.cart)
        {

    	rc.insert = variables.cartServices.insertOrder(user.id, rc.cart.product_id, rc.cart.product_quantity, rc.cart.product_price);
        
        }
        
   	}

    function buy(rc)
    {
        rc.productBuy  = variables.cartServices.productBuy(rc.id);

        variables.fw.redirect( action='cart.success');

    }
}
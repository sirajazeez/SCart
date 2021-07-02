component displayname="Product view, registration and login" accessors="true" 
{
    property productServices;

    property userServices;

    property cartServices;

    
    public any function init (fw) 
    {
        variables.fw = fw;

        return this;
    }

    function default(rc) 
    {
       
        this.list(rc);

    }

    function list(rc)
    {
        rc.products = variables.productServices.getProducts();

    }

    
    function register(rc)
    {
        rc.userId = userServices.register(rc.userName, rc.userEmail, rc.userMobile, rc.userAddress, rc.userPin, rc.userPassword);

        rc.message = ["You have successfully registered on shopping cart website"];

        variables.fw.redirect( action='main.registration',preserve="message");
    }

    function userlogin( rc )
    {

        if (!structKeyExists( rc, "email" ) || !structKeyExists( rc, "password" ) ) 
        {

            variables.fw.redirect( action='main.login');
        }
        
       var userValid = variables.userServices.getByUser( rc.email, rc.password);

        if ( userValid.recordCount == 0 ) 
        {
            rc.message = ["Invalid Username or Password"];

            variables.fw.redirect( action='main.login', preserve="message" );
        }
        else
        {
        if(userValid.user_type == 0)
        {    
            session.auth.isLoggedIn = true;

            session.id = userValid;
            
            //session.auth.user = user;
            variables.fw.redirect( action='main.default' );
        }
        else
        {   
            session.auth.isLoggedIn = true;

            session.adminid = userValid.id;
            
            //session.auth.user = user;
            location('admin/');
        }
        }
    }
    function logout( rc ) 
    {
        // reset session variables
        session.auth.isLoggedIn = false;

        structdelete( session, "id" );

        rc.message = ["You have safely logged out"];

        variables.fw.redirect( action="main.default", preserve="message" );
    }

    function addtocart(rc){

        if(structKeyExists( session, "id" )){
        var users = session.id;

        rc.user = variables.userServices.getUserBySession(users.id);

        rc.products = variables.productServices.getProductsById(rc.pid);

        rc.cart = variables.cartServices.addToCart(rc.user.id, rc.products.id, rc.products.product_price,1);

        if(rc.cart == 1)
        {
        var result = rc.products.product_name;
        variables.fw.renderData( "json", result );
        }
        else
        {
        var result = rc.products.product_name;
        variables.fw.renderData( "json", result );
        }
        }
        else{
        var result = 2;
        variables.fw.renderData( "json", result );
        }
    }

    public function order(rc)
    {
        rc.user  =session.id;
        rc.order = variables.userServices.getOrders(rc.user.id);
    }

    public function buy(rc)
    {
         if(structKeyExists( session, "id" )){
            rc.products = variables.productServices.getProductsById(rc.id);
         }
         else{
            rc.message = ["Please login to buy product"];

            variables.fw.redirect( action='main.login', preserve="message" );
         }
        
    }
    
    public function search(rc)
    {
        rc.search = variables.productServices.getSearchByProduct(rc.term);

        result = arrayNew(1);

        for(var i=1;i<=rc.search.recordCount;i++) {
        result[i] = rc.search.product_name[i];
        }

        variables.fw.renderData( "json", result);
    }

    public function buyproduct(rc)
    {
        rc.productBuy  = variables.cartServices.productBuyInd(rc.id,rc.qty);

        rc.message = ["successfully Ordered Item"];

        variables.fw.redirect( action='main.default', preserve="message" );
    }

    public function products(rc)
    {
        rc.category = variables.productServices.getCategory();
         
        rc.products = variables.productServices.getProducts();
        

    }
    public function searchproducts(rc)
    {
        
        if(rc.act == 'search')
        {
        if(structKeyExists(rc,"cat"))
        {
        rc.data = variables.productServices.getProductsByCategory(rc.cat);

        }
        else
        {
        rc.data = variables.productServices.getProducts();
        }         
        result = arrayNew(1);

        for(var i=1;i<=rc.data.recordCount;i++) {

        result[i] = '<div class="col-lg-4 col-md-6 col-sm-10 offset-md-0 offset-sm-1" style="margin-top:12px;">
                        <div class="card">
                            <div class="card-body">
                                <h6 class="font-weight-bold pt-1">#rc.data.product_name[i]#</h6>
                                <div class="text-muted description">#rc.data.product_description[i]#</div>
                                <div class="d-flex align-items-center product"> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="far fa-star"></span> </div>
                                <div class="d-flex align-items-center justify-content-between pt-3">
                                    <div class="d-flex flex-column">
                                        <div class="h6 font-weight-bold">#rc.data.product_price[i]# USD</div>
                                        
                                    </div>
                                    <div class="btn btn-primary"><a href="index.cfm?action=main.buy&id=#rc.data.id[i]#">Buy now</a></div>
                                </div>
                            </div>
                        </div>
                    </div>';
            }
        variables.fw.renderData( "json", result);
        }
         
    }
}
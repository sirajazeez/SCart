component accessors="true" displayname="Admin controller - products"{

    property productServcices;
    property categoryServcices;
    property subcategoryServcices;

    public any function init (fw) 
    {
        variables.fw = fw;

        return this;
    }

    public function add()
    {
        rc.category = variables.categoryServcices.getCategory();
    }

    public void function getsubcat()
    {

        rc.getsub = variables.subcategoryServcices.getSubCategoryByCat(rc.cid);

        var result = writeOutput("<option value=''>Select sub category</option>");

        cfloop(query=rc.getsub)
        {
        var result = writeOutput("<option value='#rc.getsub.id#'>#rc.getsub.name#</option>");
        }   
        
        variables.fw.renderData( "html", result );
        
    }
    public void function insert ( rc ) {

        rc.insert = variables.productServcices.insertProducts(rc.subId, rc.product_name, rc.product_description, rc.product_price, rc.product_quantity);
        rc.message = ["Successfully added products"];
        variables.fw.redirect(action='products.add', preserve='message');
    }

    public void function list( rc ) {
        rc.products = variables.productServcices.getProducts();
    }

    public function edit( rc )
    {
        rc.products = variables.productServcices.getProductsById(rc.id);
        rc.category = variables.categoryServcices.getCategory();
        rc.subcategory = variables.subcategoryServcices.getSubCategory();
    }
    
    public function update( rc )
    {  
        rc.update = variables.productServcices.updateProducts(rc.subId, rc.product_name, rc.product_description, rc.product_price, rc.product_quantity, rc.id);
        
        rc.message = ["Successfully updated products"];
        variables.fw.redirect(action='products.list', preserve='message');
    }
}
component displayname="Product Services" accessors="true"{

    public any function init(helperService){
        variables.hs = helperService;
    }

    public function insertProducts(numeric subId = 0, string pname = "", string pdescription = "", numeric pprice = "", numeric pqty = "")
    {
    	queryExecute("INSERT INTO products (subcategory_id, product_name, product_description, product_price, product_quantity) VALUES(:subId, :pname, :pdescription, :pprice, :pqty)",
    		{ 
                subId = { value = arguments.subId, null = hs.isEmptyString( arguments.subId ), cfsqltype = 'integer'}, 
                pname = { value = arguments.pname, null = hs.isEmptyString( arguments.pname ), cfsqltype = 'string'} ,
                pdescription = { value = arguments.pdescription, null = hs.isEmptyString( arguments.pdescription ), cfsqltype = 'string'},
                pprice = { value = arguments.pprice, null = hs.isEmptyString( arguments.pprice ), cfsqltype = 'integer'},
                pqty = { value = arguments.pqty, null = hs.isEmptyString( arguments.pqty ), cfsqltype = 'integer'}   
            }
    		);
    }

     public function updateProducts(numeric subId = 0, string pname = "", string pdescription = "", numeric pprice = "", numeric pqty = "", numeric id = 0)
    {
        queryExecute("UPDATE products SET subcategory_id = :subId, product_name = :pname, product_description = :pdescription, product_price = :pprice, product_quantity = :pqty WHERE id = :id",
            { 
                subId = { value = arguments.subId, null = hs.isEmptyString( arguments.subId ), cfsqltype = 'integer'}, 
                pname = { value = arguments.pname, null = hs.isEmptyString( arguments.pname ), cfsqltype = 'string'} ,
                pdescription = { value = arguments.pdescription, null = hs.isEmptyString( arguments.pdescription ), cfsqltype = 'string'},
                pprice = { value = arguments.pprice, null = hs.isEmptyString( arguments.pprice ), cfsqltype = 'integer'},
                pqty = { value = arguments.pqty, null = hs.isEmptyString( arguments.pqty ), cfsqltype = 'integer'},
                id = { value = arguments.id, null = hs.isEmptyString( arguments.id ), cfsqltype = 'integer'}   
            }
            );
    }

    public query function getProducts()
    {
        return queryExecute("SELECT p.*,s.*,c.*,date_format(s.created_date,'%d-%m-%Y') AS cdate,date_format(s.updated_date,'%d-%m-%Y') AS udate FROM products AS p LEFT JOIN subcategory AS s ON(p.subcategory_id = s.id) LEFT JOIN category AS c ON(s.category_id = c.id) ORDER BY p.id ASC");
    }

    public query function getProductsById(numeric id = 0)
    {   
        return queryExecute("SELECT p.*,s.*,c.*,date_format(s.created_date,'%d-%m-%Y') AS cdate,date_format(s.updated_date,'%d-%m-%Y') AS udate FROM products AS p LEFT JOIN subcategory AS s ON(p.subcategory_id = s.id) LEFT JOIN category AS c ON(s.category_id = c.id) WHERE p.id = '#id#' ORDER BY p.id ASC");
    }

}
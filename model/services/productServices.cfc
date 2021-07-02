component displayname="Product Services" accessors="true"{

	public any function init(helperService){
		variables.hs = helperService;
	}

	public query function getProducts(){
		return queryExecute("SELECT id, product_name, product_description, product_price, product_quantity, product_images FROM products");
	}

	public function getProductsById(required numeric pid){
		return queryExecute( 
           "SELECT  id, subcategory_id, product_name, product_description, product_price, product_quantity FROM products
            WHERE id = :pid",
            { pid = { value = arguments.pid, cfsqltype = 'integer' } } 
            // equivalent to <cfqueryparam>
        );
	}
	public function getProductsByName(string name = ""){
		return queryExecute( 
           "SELECT id, subcategory_id, product_name,product_price, product_quantity FROM products
            WHERE product_name = '#name#'");
	}

	public function getSearchByProduct(string searchTerm = "")
	{
		return queryExecute("SELECT product_name FROM products WHERE LOWER(product_name) LIKE '%#arguments.searchTerm#%'");
	}
    
    public query function getCategory()
    {
    	return queryExecute("SELECT id,category_name,date_format(created_date,'%d-%m-%Y') AS cdate,date_format(updated_date,'%d-%m-%Y') AS udate,status FROM category");
    }
    public function getProductsByCategory(array id = [])
    {
    	arr = id;
    	newarray = arr.toList();
    	//writeDump(newarray);abort;
    	return queryExecute("SELECT p.id, p.product_name, p.product_description, p.product_price, p.product_quantity, p.product_images FROM products AS p LEFT JOIN subcategory AS s ON(p.subcategory_id = s.id) LEFT JOIN category AS c ON(s.category_id = c.id) WHERE c.id IN (#newarray#)");
    	//writeDump(q);abort;
    }	

}
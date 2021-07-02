component displayname="Category Services" accessors="true"{

    public any function init(helperService){
        variables.hs = helperService;
    }

    public query function getCategory()
    {
    	return queryExecute("SELECT id,category_name,date_format(created_date,'%d-%m-%Y') AS cdate,date_format(updated_date,'%d-%m-%Y') AS udate,status FROM category");
    }

    public query function getCategoryById(numeric id = 0)
    {
    	return queryExecute("SELECT id,category_name,date_format(created_date,'%d-%m-%Y') AS cdate,date_format(updated_date,'%d-%m-%Y') AS udate,status FROM category WHERE id = :id",
    		{ id = { value = arguments.id, null = hs.isEmptyString( arguments.id ), cfsqltype = 'integer'} }
    		); 
    }

    public function insertCategory(string name = "")
    {
    	queryExecute("INSERT INTO category (category_name) VALUES(:name)",
    		{ name = { value = arguments.name, null = hs.isEmptyString( arguments.name ), cfsqltype = 'string'} }
    		);
    }

    public function updateCategory(numeric id = 0, string name = "")
    {	
    	queryExecute("UPDATE category SET category_name = '#arguments.name#' WHERE id = #arguments.id#");
    	
    }
}
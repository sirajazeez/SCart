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
        return queryExecute("SELECT id,category_name,date_format(created_date,'%d-%m-%Y') AS cdate,date_format(updated_date,'%d-%m-%Y') AS udate,status FROM category WHERE id = '#id#'");
    }

    public query function getSubCategoryByCat(numeric id = 0)
    {
        return queryExecute("SELECT id,category_id,name,date_format(created_date,'%d-%m-%Y') AS cdate,date_format(updated_date,'%d-%m-%Y') AS udate,status FROM subcategory WHERE category_id = :id",
            { id = { value = arguments.id, null = hs.isEmptyString( arguments.id ), cfsqltype = 'integer'} }
            ); 
    }


     public query function getSubCategory()
    {
        return queryExecute("SELECT s.*,c.*,date_format(s.created_date,'%d-%m-%Y') AS cdate,date_format(s.updated_date,'%d-%m-%Y') AS udate FROM subcategory AS s LEFT JOIN category AS c ON(s.category_id = c.id) ORDER BY c.category_name ASC");
    }

    public query function getSubCategoryById(numeric id = 0)
    {
        return queryExecute("SELECT id,category_id,name,date_format(created_date,'%d-%m-%Y') AS cdate,date_format(updated_date,'%d-%m-%Y') AS udate,status FROM subcategory WHERE id = :id",
            { id = { value = arguments.id, null = hs.isEmptyString( arguments.id ), cfsqltype = 'integer'} }
            ); 
    }

    public function insertSubCategory(numeric id = 0, string subcatName = "")
    {
    queryExecute("INSERT INTO subcategory (category_id, name) VALUES(:id, :subcatName)",
            { 
            id = { value = arguments.id, cfsqltype = 'integer'} ,
            subcatName = { value = arguments.subcatName,cfsqltype = 'string'} 
            }
            );

    }

    public function updateSubCategory(numeric catid = 0, string name = "", numeric id = 0)
    {   
        queryExecute("UPDATE subcategory SET category_id = '#arguments.catid#', name = '#arguments.name#' WHERE id = '#arguments.id#'");
        
    }
}
component accessors="true" displayname="Admin controller"{

    property categoryServcices;

    public any function init (fw) 
    {
        variables.fw = fw;

        return this;
    }
    public void function insert ( rc ) {

        rc.insert = variables.categoryServcices.insertCategory(rc.catName);
        rc.message = ["Successfully added category"];
        variables.fw.redirect(action='category.add', preserve='message');
    }

    public void function list( rc ) {
        rc.category = variables.categoryServcices.getCategory();
    }

    public function edit( rc )
    {
        rc.category = variables.categoryServcices.getCategoryById(rc.id);
    }
    
    public function update( rc )
    {  
        rc.update = variables.categoryServcices.updateCategory(rc.catId, rc.catName);
        rc.message = ["Successfully updated category"];
        variables.fw.redirect(action='category.list', preserve='message');
    }
}
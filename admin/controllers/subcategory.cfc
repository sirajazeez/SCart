component accessors="true" displayname="Admin controller - Sub category"{

    property subcategoryServcices;

    public any function init (fw) 
    {
        variables.fw = fw;

        return this;
    }

    public void function add ( rc ) {

        rc.category = variables.subcategoryServcices.getCategory();
    }

    public void function insert( rc )
    {
        rc.insert = variables.subcategoryServcices.insertSubCategory(rc.catid, rc.subcatName);
        rc.message = ["Successfully added Sub category"];
        variables.fw.redirect(action='subcategory.add', preserve='message');
    }
    
    public void function list( rc ) {
        rc.subcategory = variables.subcategoryServcices.getSubCategory();
    }

    public function edit( rc ) {

        rc.category = variables.subcategoryServcices.getCategory();
        rc.subcategory = variables.subcategoryServcices.getSubCategoryById(rc.id);
        rc.categorybyid = variables.subcategoryServcices.getCategoryById(rc.subcategory.category_id);

    }

    public function update( rc ) { 

        rc.update = variables.subcategoryServcices.updateSubCategory(rc.catId, rc.subcatName, rc.id);
        rc.message = ["Successfully updated sub category"];
        variables.fw.redirect(action='subcategory.list', preserve='message');
    }
}
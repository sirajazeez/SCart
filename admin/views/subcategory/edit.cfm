
  <!-- Container Fluid-->
  <div class="container-fluid" id="container-wrapper">
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
      <h1 class="h3 mb-0 text-gray-800">ADD SUB CATEGORY</h1>
    </div>
    <div class="row">
      <div class="col-lg-12">
        <!-- Form Basic -->
        <div class="card mb-4">
          <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
            <h6 class="m-0 font-weight-bold text-primary"></h6>
          </div>
          <div class="card-body">
            <form method="post" action="<cfoutput>#buildURL('subcategory.update')#</cfoutput>">
               <input type="hidden" name="id" value="<cfoutput>#rc.subcategory.id#</cfoutput>">
              <div class="form-group">
                <label for="exampleInputEmail1">Select Category</label>
                <select class="form-control" name="catId">
                    <option>Select category</option>
                    <cfoutput query="rc.category">
                      <cfif #rc.category.id# eq #rc.subcategory.category_id#>
                          <cfset ch="selected">
                          <cfelse>
                          <cfset ch="">
                      </cfif>
                        <option #ch# value="#rc.category.id#">#rc.category.category_name#</option>
                    </cfoutput>
                </select>
              </div>
              <div class="form-group">
                <label for="exampleInputEmail1">Sub Category Name</label>
                <input type="text" name="subcatName" class="form-control" placeholder="Enter Sub Category Name" required="" value="<cfoutput># rc.subcategory.name#</cfoutput>">
              </div>
              <button type="submit" class="btn btn-primary btn-sm" name ="update">Update</button>
              <button class="btn btn-primary btn-sm" name ="cancel" type="button" onclick="goBack()">Cancel</button>
            </form>
          </div>
        </div>
      </div>
   </div>

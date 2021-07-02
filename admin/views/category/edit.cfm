
  <div class="container-fluid" id="container-wrapper">
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
      <h1 class="h3 mb-0 text-gray-800">EDIT CATEGORY</h1>
    </div>
    <div class="row">
      <div class="col-lg-12">
        <!-- Form Basic -->
        <div class="card mb-4">
          <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
            <h6 class="m-0 font-weight-bold text-primary"></h6>
          </div>
          <div class="card-body">
            <form method="post" action="<cfoutput>#buildURL('category.update')#</cfoutput>">
              <input type="hidden" name="catId" value="<cfoutput>#rc.category.id#</cfoutput>">
              <div class="form-group">
                <label for="exampleInputEmail1">Category Name</label>
                <input type="text" name="catName" class="form-control" placeholder="Enter Category Name" required="" value="<cfoutput>#rc.category.category_name#</cfoutput>">
              </div>
              <button type="submit" class="btn btn-primary btn-sm" name ="add">UPDATE</button>
                <button class="btn btn-primary btn-sm" name ="cancel" type="button" onclick="goBack()">Cancel</button>
            </form>



            
          </div>
        </div>
      </div>
   </div>
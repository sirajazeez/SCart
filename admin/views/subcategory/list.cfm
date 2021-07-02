
<div class="content">
          <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title ">View And Edit Your Subcategory Here</h4>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table table-bordered align-items-center table-flush" id="example">
                      <thead class=" text-primary">
                        <th>Category Name</th>
                        <th>Sub Category Name</th>
                        <th>Created Date</th>
                        <th>Updated Date</th>
                        <th>Status</th>
                        <th>Action</th>
                      </thead>
                      
                      <tbody>
                              <cfoutput query="rc.subcategory">
                              <tr>
                              <td>#rc.subcategory.category_name#</td>
                               <td>#rc.subcategory.name#</td>
                              <td>#rc.subcategory.cdate#</td>
                              <td>#rc.subcategory.udate#</td>
                              <td><cfif #rc.subcategory.status# eq 0>Active<cfelse>Deactive</cfif></td>
                              <td><a href="#buildURL(action='subcategory.edit',queryString = { id = #rc.subcategory.id# } )#" class="btn btn-primary btn-sm">Edit</a></td>
                              </tr>
                              </cfoutput>
                            
                        
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
</div>

<div class="content">
          <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title ">View And Edit Your Category Here</h4>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table table-bordered align-items-center table-flush" id="example">
                      <thead class=" text-primary">
                        <th>Category Name</th>
                        <th>Created Date</th>
                        <th>Updated Date</th>
                        <th>Status</th>
                        <th>Action</th>
                      </thead>
                         
                      <tbody>
                              <cfoutput query="rc.category">
                              <tr>
                              <td>#rc.category.category_name#</td>
                              <td>#rc.category.cdate#</td>
                              <td>#rc.category.udate#</td>
                              <td><cfif #rc.category.status# eq 0><b><span style="color:green">Active</span></b><cfelse><span style="color:red">Deactive</span></cfif></td>
                              <td><a href="#buildURL(action='category.edit',queryString = { id = #rc.category.id# } )#" class="btn btn-primary btn-sm">Edit</a></td>
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
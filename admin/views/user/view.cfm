
<div class="content">
          <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title ">View Users</h4>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table table-bordered align-items-center table-flush" id="example">
                      <thead class=" text-primary">
                        <th>User Name</th>
                        <th>Email Id</th>
                        <th>Mobile</th>
                        <th>Address</th>
                        <th>Pin</th>
                      </thead>
                     
                      <tbody>
                              <cfoutput query="rc.users">
                             
                              <tr>
                              <td>#rc.users.user_name#</td>
                              <td>#rc.users.user_email#</td>
                              <td>#rc.users.user_mobile#</td>
                              <td>#rc.users.user_address#</td>
                              <td>#rc.users.user_pin#</td>
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
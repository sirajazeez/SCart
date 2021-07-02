
<div class="content">
          <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title ">View And Edit Your Products Here</h4>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table table-bordered align-items-center table-flush" id="example">
                      <thead class=" text-primary">
                        <th>Category Name</th>
                        <th>Sub Category Name</th>
                        <th>Product Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Action</th>
                      </thead>
                      
                      <tbody>
                              <cfoutput query="rc.products">
                              <tr>
                              <td>#rc.products.category_name#</td>
                              <td>#rc.products.name#</td>
                              <td>#rc.products.product_name#</td>
                              <td>#rc.products.product_price#</td>
                              <td>#rc.products.product_quantity#</td>
                              <td><a href="#buildURL(action='products.edit',queryString = { id = #rc.products.id# } )#" class="btn btn-primary btn-sm">Edit</a></td>
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

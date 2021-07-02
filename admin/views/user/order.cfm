
<div class="content">
          <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title ">View Orders</h4>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table table-bordered align-items-center table-flush" id="example">
                      <thead class=" text-primary">
                        <th>User Name</th>
                        <th>Product Name</th>
                        <th>Quantity</th>
                        <th>Total Price</th>
                        <th>Status</th>
                        <th>Action</th>
                      </thead>
                      <tbody>
                              <cfoutput query="rc.orders">
                             
                              <tr>
                              <td>#rc.orders.uname#</td>
                              <td>#rc.orders.pname#</td>
                              <td>#rc.orders.pqty#</td>
                              <td>#rc.orders.pprice#</td>
                              <td><cfif #rc.orders.ost# eq 0> <span style="color: blue" id="ordered">Ordered</span> <cfelseif #rc.orders.ost# eq 1><span style="color: darkblue">Dispatched</span><cfelseif #rc.orders.ost# eq 3><span style="color: red">Shipped</span><cfelseif #rc.orders.ost# eq 4><span style="color: green">Out for delivery</span><cfelseif #rc.orders.ost# eq 5><span style="color: darkgreen">Delivered</span></cfif>
                              <span id="stchange<cfoutput>#rc.orders.oid#</cfoutput>"></span>
                              </td>
                              <td><select class="form-control" onchange="changeStatus(this.value,#rc.orders.oid#);">
                                <option value="">Change Status</option>
                                <option value="0">Ordered</option>
                                <option value="1">Dispatched</option>
                                <option value="3">Shipped</option>
                                <option value="4">Outfordelivery</option>
                                <option value="5">Delivered</option>
                              </select></td>
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
<script>
  function changeStatus(val,oid){
    $.ajax({
          type: "POST",
          url: "index.cfm?action=user.changeorder",
          data: {'oid':oid,'status':val},
          success: function(result){
            $('#stchange'+oid).html(val);
          }
        });
  }
</script>

  <!-- Container Fluid-->
  <div class="container-fluid" id="container-wrapper">
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
      <h1 class="h3 mb-0 text-gray-800">ADD PRODUCTS</h1>
    </div>
    <div class="row">
      <div class="col-lg-12">
        <!-- Form Basic -->
        <div class="card mb-4">
          <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
            <h6 class="m-0 font-weight-bold text-primary"></h6>
          </div>
          <div class="card-body">
            <form method="post" action="<cfoutput>#buildURL('products.insert')#</cfoutput>">
              <input type="hidden" name="id" value="<cfoutput>#rc.products.id#</cfoutput>">
              <div class="form-group">
                <label for="exampleInputEmail1">Select Category</label>
                <select class="form-control" name="catId" id="catId" onchange="getSub(this.value);">
                    <option>Select category</option>
                    <cfoutput query="rc.category">
                      <option value="#rc.category.id#">#rc.category.category_name#</option>
                    </cfoutput>
                </select>
              </div>
              <div class="form-group">
                <label for="exampleInputEmail1">Sub Category Name</label>
                <select id="subId" name="subId" class="form-control">
                  <option value="">Select Subcategory</option>
                 
                </select>
              </div>
              <div class="form-group">
                <label for="exampleInputEmail1">Product Name</label>
                <input type="text" name="product_name" id="product_name" class="form-control" placeholder="Enter product name" value="">
              </div> 
              <div class="form-group">
                <label for="exampleInputEmail1">Product Description</label>
                <textarea class="form-control" name="product_description" id="product_descr"></textarea>
              </div>
              <div class="form-group">
                <label for="exampleInputEmail1">Product Price</label>
                <input type="number" name="product_price" id="product_price" class="form-control" placeholder="Enter product price" value="">
              </div>
              <div class="form-group">
                <label for="exampleInputEmail1">Product Quantity</label>
                <input type="number" name="product_quantity" id="product_quantity" class="form-control" placeholder="Enter product quantity" value="">
              </div>
             <!---  <div class="form-group">
                <label for="exampleInputEmail1">Product Image</label>
                <input type="file" name="product_image" id="product_image" class="form-control">
              </div> --->
              <button type="submit" class="btn btn-primary btn-sm" name ="submit">Submit</button>
              <button class="btn btn-primary btn-sm" name ="cancel" type="button" onclick="goBack()">Cancel</button>
            </form>
          </div>
        </div>
      </div>
   </div>
<script>
  function getSub(val){
    $.ajax({
          type: "POST",
          url: "index.cfm?action=products.getsubcat",
          data: {'cid':val},
          success: function(result){
            $('#subId').html(result);
          }
        });
  }
</script>

<section class="section-3" id="products">
 <div class="container">
    <div class="row">
      <h3 style="color:green;display: none" id="success"></h3>
      <center><h3 style="color:red;display: none" id="error">Please Login to cart a product</h3></center>
      <h1 class="text-center">Products</h1>
      <p class="text-center">Simple and affordable price for your and your product</p>
      
      <cfoutput query="#rc.products#">
      <div class="col-4" style="margin-top: 12px;">
        <div class="card">
          <div class="card-header">
          <h2 class="text-center">#product_name#</h2>
        </div>
          <div class="card-body">
            <h4 class="text-center">Rs : $ #product_price# </h4>
            
            <div class="col text-center">
            <a class="btn btn-primary" onclick="cart(#ID#);">Add to cart</a> <a class="btn btn-danger" id="buy" href="#buildURL(action='main.buy',queryString={id = id})#">Buy Now</a>
            </div>
          </div>
        </div>
      </div>
      </cfoutput> 
    </div>
  </div>
</section>
<script>
function cart(val){ 
  $.ajax({
    type: "POST",
    url: "index.cfm?action=main.addtocart",
    dataType:"json",
    data: {'pid':val},
    success: function(result){
        if(result == 2)
        {
              $('#success').hide();
              $('#error').show();
              $('#error').html();
        }
        else {
              $('#success').show();
              $('#error').hide();
              $('#success').html("Successfully carted "+result);
            }
    }
  });
}
</script>

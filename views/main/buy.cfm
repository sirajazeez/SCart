 <div class="container">
    <div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th class="text-center">Price</th>
                        <th class="text-center">Total</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="col-sm-8 col-md-6">
                        <div class="media">
                           
                            <div class="media-body">
                                <h4 class="media-heading"><a href="#"><cfoutput>#rc.products.product_name#</cfoutput></a></h4>
                                <span>Status: </span><span class="text-success"><strong>In Stock</strong></span>
                            </div>
                        </div></td>
                        <td class="col-sm-1 col-md-1" style="text-align: center">
                        <input type="number" class="form-control" id="qty" name="qty" value="1" onchange="change_quantity(this.value,<cfoutput>#rc.products.product_price#</cfoutput>)">
                        </td>
                        <td class="col-sm-1 col-md-1 text-center"><strong>$<cfoutput>#rc.products.product_price#</cfoutput></strong></td>
                        <td class="col-sm-1 col-md-1 text-center">$<span id="tot"><cfoutput>#rc.products.product_price#</cfoutput></span></td>
                        <td class="col-sm-1 col-md-1">
                       </td>
                    </tr>
                   
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><h5>Subtotal</h5></td>
                        <td class="text-right"><h5>$<span id="tot1"><cfoutput>#rc.products.product_price#</cfoutput></span></h5></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><h5>Estimated shipping</h5></td>
                        <td class="text-right"><h5><strong>$0.00</strong></h5></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><h3>Total</h3></td>
                        <td class="text-right"><h3>$<span id="tot2"><cfoutput>#rc.products.product_price#</cfoutput></span></h3></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>
                        <button type="button" class="btn btn-primary" onclick="return(history.back())">
                            <span class="glyphicon glyphicon-shopping-cart"></span> Continue Shopping
                        </button></td>
                        <td>
                        <a class="btn btn-success" href="<cfoutput>#buildURL(action='main.buyproduct', queryString={id=#id#,qty=1})#</cfoutput>">
                            Buy Now <span class="glyphicon glyphicon-play"></span>
                        </a></td>
                    </tr>
                </tbody>
            </table>
        </div>
<script type="text/javascript">
  function change_quantity(val,price){
    if(val <= 1){
      var qty = 1 * price;
      $('#tot').html(qty);
      $('#tot1').html(qty);
      $('#tot2').html(qty);
    }
    else if(val >= 10){
      
      var qty = 10 * price;
      $('#tot').html(qty);
      $('#tot1').html(qty);
      $('#tot2').html(qty);
    }
    else{

    var qty = val * price;
    
      $('#tot').html(qty);
      $('#tot1').html(qty);
      $('#tot2').html(qty);
  }
  }
</script>
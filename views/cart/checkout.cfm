
<section class="section-3" id="pricing">
 <div class="container">
    <div class="row">
      
      <h1 class="text-center">Checkout</h1>
<table class="table">
<thead>
 <tr>
   <td>Product</td>
   <td>Quantity</td>
   <td>Total</td>
 </tr>
</thead>
<tbody>
<cfoutput query="rc.product">
 <cfset tot="#rc.product.product_quantity * rc.product.product_price#">
 <tr>
   <td>#rc.product.product_name#</td>
   <td>#rc.product.product_quantity#</td>
   <td>#tot#<span id=""></span></td>
 </tr>
</cfoutput>
</tbody>
</table>
<h4 class="text-center">SUB TOTAL : $ <cfoutput >#rc.total.totsum#</cfoutput></h4>
<div class="text-center">
<a href="index.cfm?action=cart.order_now" class="btn btn-primary btn-sm text-center">Checkout Now</a>
<a class="btn btn-primary btn-sm text-center" onclick="return(history.back())">Cancel Now</a>
</div>
</div>
  </div>
</section>


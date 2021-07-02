<cfif structKeyExists( session, "id" ) && session.auth.isLoggedIn>
  <cfelse>
  <cflocation url = "http://localhost:8888/scart/" addToken = "no">
</cfif>
<section class="section-3" id="pricing">
 <div class="container">
    <div class="row">
      
      <h1 class="text-center">MY ORDERS</h1>
      <p class="text-center">Simple and affordable price for your and your product</p>
<table class="table table-dark table-striped" id="example1">
<thead>
 <tr>
   <td>Sl No</td>
   <td>Product</td>
   <td>Quantity</td>
   <td>Total</td>
   <td>Status</td>
   
 </tr>
</thead>
<tbody>
<cfoutput query="rc.order">
 <cfset cnt=1>
 <cfset tot="#rc.order.product_quantity * rc.order.product_price#">
 <tr>
   <td>#cnt++#</td>
   <td>#rc.order.product_name#</td>
   <td>#rc.order.product_quantity#</td>
   <td>#tot#</td>
   <td><cfif #rc.order.ost# eq 0> <span style="color: lightgreen" id="ordered">Ordered</span> <cfelseif #rc.order.ost# eq 1><span style="color: yellow">Dispatched</span><cfelseif #rc.order.ost# eq 3><span style="color: red">Shipped</span><cfelseif #rc.order.ost# eq 4><span style="color: green">Out for delivery</span><cfelseif #rc.order.ost# eq 5><span style="color: darkgreen">Delivered</span></cfif></td>
   
 </tr>
</cfoutput>

</tbody>
</table>

</div>
  </div>
</section>


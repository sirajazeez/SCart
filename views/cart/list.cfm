<cfif structKeyExists( session, "id" ) && session.auth.isLoggedIn>
  <cfelse>
  <cflocation url = "http://localhost:8888/scart/" addToken = "no">
</cfif>
<p class="text-center"><a href="<cfoutput>#buildURL("cart.checkout")#</cfoutput>" class="btn btn-danger btn-sm txt-right">Buy All</a></p>
<table class="table caption-top">
  <caption>List of Carts</caption>
  <thead>
    <tr>
      <th scope="col">#</th>
	  <td>Product</td>
	  <td>Quantity</td>
	  <td>Total</td>
	  <td>Action</td>
    </tr>
  </thead>
  <tbody>
    <cfset cnt="1">
    <cfoutput query="#rc.cart#">
    <cfset tot="#rc.cart.product_quantity * rc.cart.product_price#">
	 <tr>
	   <td>#cnt++#</td>
	   <td>#rc.cart.product_name#</td>
	   <td><input type="number" class="quantity" value="#rc.cart.product_quantity#" id="quantity#rc.cart.id#" min=1 max=10 onchange="change_quantity(this.value,#rc.cart.id#);"></td>
	   <td><span id="tot#id#">#tot#</span></td>
	   <td><a class="btn btn-primary btn-sm" href="#buildURL(action ='cart.buy', queryString={ id = rc.cart.id})#">Buy Now</a>&nbsp;&nbsp;<span id="delete" class="delete btn btn-danger btn-sm" data-id='#rc.cart.id#'>Remove</span></td>
	 </tr>
    </cfoutput>
  </tbody>
</table>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
  function change_quantity(val,cid){
    if(val <= 1){
      $('#quantity'+cid).val(1);
      $.ajax({
        type: "POST",
        url: "cart.cfm?action=cart.updatecart",
        data: {'cid':cid,'qty':1},
        success: function(result){
          //alert(result);
            $('#tot'+cid).html(result);
        }
    }); 

    }
    else if(val >= 10){
      $('#quantity'+cid).val(10);
      $.ajax({
        type: "POST",
        url: "cart.cfm?action=cart.updatecart",
        data: {'cid':cid,'qty':10},
        success: function(result){
          //alert(result);
            $('#tot'+cid).html(result);
        }
    }); 
    }
    else{
    $.ajax({
        type: "POST",
        url: "cart.cfm?action=cart.updatecart",
        data: {'cid':cid,'qty':val},
        success: function(result){
          //alert(result);
            $('#tot'+cid).html(result);
        }
    }); 
  }
  }

  $(document).ready(function(){
    $('.delete').click(function(){
      var cid = $(this).data('id');
      var el = this;
      $.ajax({
          type: "POST",
          url: "cart.cfm?action=cart.deletecart",
          data: {'cid':cid},
          success: function(result){
              $(el).closest('tr').css('background','tomato');
              $(el).closest('tr').fadeOut(800,function(){
              $(this).remove();
            });
          }
      }); 
    });
  });
</script>

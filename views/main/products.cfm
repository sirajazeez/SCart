<link rel="stylesheet" type="text/css" href="assets/pro.css">


<div class="wrapper">
    <div class="d-md-flex align-items-md-center">
        <div class="h3">Products</div>
        
    </div>
    <div class="filters"> <button class="btn btn-success" type="button" data-toggle="collapse" data-target="#mobile-filter" aria-expanded="true" aria-controls="mobile-filter">Filter<span class="px-1 fas fa-filter"></span></button> </div>
  
    <div class="content py-md-0 py-3">
        <section id="sidebar">
            <div class="py-3">
                <h5 class="font-weight-bold">Categories</h5>
                
                    <cfoutput query="rc.category">
                    <div class="form-group">
                    <input class="productDetail category" id="category" type="checkbox" value="#rc.category.id#"> #rc.category.category_name# </input><br>
                    </cfoutput>
                    </div>
                
            </div>
            <div class="py-3">
                <form class="brand">
                  <div class="form-inline d-flex align-items-center py-1"> <label class="tick">500-1000 <input class="price go" type="checkbox" value="['500','1000']"> <span class="check"></span> </label> </div>
                  <div class="form-inline d-flex align-items-center py-1"> <label class="tick">1000-3000<input class="price go" type="checkbox" value="[500,2000]" > <span class="check"></span> </label> </div>
                  <div class="form-inline d-flex align-items-center py-1"> <label class="tick">3000-7000 <input class="price go" type="checkbox" value="[500,3000]" > <span class="check"></span> </label> </div>
                  <div class="form-inline d-flex align-items-center py-1"> <label class="tick">7000-15000 <input class="price go" type="checkbox" value="[500,4000]"> <span class="check"></span> </label> </div>
                  <div class="form-inline d-flex align-items-center py-1"> <label class="tick">15000-above <input class="price go" type="checkbox" value="[500,50000]"> <span class="check"></span> </label> </div>
              </form>
                   
            </div>
         
        </section> <!-- Products Section -->
        <section id="products">
            <div class="container py-3">
                <div class="row searchResult">

                   
                </div>
                </div>
            </div>
        </section>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function(){
    filterSearch(); 
    $('.productDetail').click(function(){
        filterSearch();
    }); 
    $('#priceSlider').slider({      
    }).on('change', priceRange);    
});
function priceRange(e){
    $('.priceRange').html($(this).val() + " - 65000");
    $('#minPrice').val($(this).val());
    filterSearch(); 
}
function filterSearch() {
    $('.searchResult').html('<div id="loading">Loading .....</div>');
    var action = 'fetch_data';
    var minPrice = $('#minPrice').val();
    var maxPrice = $('#maxPrice').val();
    var cat = getFilterData('category');
    $.ajax({
        url:"main.cfm?action=main.searchproducts",
        method:"POST",
        dataType: "json",       
        data:{act:'search', cat:cat},
        success:function(data){
            $('.searchResult').html(data);
        }
    });
}
function getFilterData(className) {
    var filter = [];
    $('.'+className+':checked').each(function(){
        filter.push($(this).val());
    });
    return filter;
}
</script>
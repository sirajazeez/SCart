<cfparam name="rc.message" default="#arrayNew(1)#">
<!DOCTYPE html>
<html lang="en">

<head><meta charset="gb18030">
  
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link href="admin_assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="admin_assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="admin_assets/css/ruang-admin.min.css" rel="stylesheet">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
      <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
   
  <title>Shopping cart</title>
</head>
<body id="page-top">
  <div id="wrapper">
    <!-- Sidebar -->
    <ul class="navbar-nav sidebar sidebar-light accordion" id="accordionSidebar">
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.cfm">
        <div class="sidebar-brand-icon">
          <img src="">
        </div>
        <div class="sidebar-brand-text mx-3">Shopping cart</div>
      </a>
      <hr class="sidebar-divider my-0">
      <li class="nav-item active">
        <a class="nav-link" href="index.cfm">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>
      <hr class="sidebar-divider">
      <cfoutput>
        
        <cfif structKeyExists( session, "adminid" ) && session.auth.isLoggedIn>
          <cfelse>
          <cflocation url = "http://localhost:8888/scart/" addToken = "no">
        </cfif>
      </cfoutput>
  
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsetype"
          aria-expanded="true" aria-controls="collapseBootstrap">
          <i class="fa fa-book"></i>
          <span>Category</span>
        </a>
        <div id="collapsetype" class="collapse" aria-labelledby="headingBootstrap" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="<cfoutput>#buildURL('category.add')#</cfoutput>">Add category</a>
            <a class="collapse-item" href="<cfoutput>#buildURL('category.list')#</cfoutput>">Edit category</a>
            </div>
        </div>
      </li>
       <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsetype1"
          aria-expanded="true" aria-controls="collapseBootstrap">
          <i class="fa fa-book"></i>
          <span>Sub category</span>
        </a>
        <div id="collapsetype1" class="collapse" aria-labelledby="headingBootstrap" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="<cfoutput>#buildURL('subcategory.add')#</cfoutput>">Add subcategory</a>
            <a class="collapse-item" href="<cfoutput>#buildURL('subcategory.list')#</cfoutput>">Edit subcategory</a>
            </div>
        </div>
      </li>
       <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsebook"
          aria-expanded="true" aria-controls="collapseBootstrap">
           <i class="fas fa-fw fa-book"></i>
          <span>Products</span>
        </a>
        <div id="collapsebook" class="collapse" aria-labelledby="headingBootstrap" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
             <a class="collapse-item" href="<cfoutput>#buildURL('products.add')#</cfoutput>">Add Products</a>
             <a class="collapse-item" href="<cfoutput>#buildURL('products.list')#</cfoutput>">Edit Products</a>
          </div>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseebook"
          aria-expanded="true" aria-controls="collapseBootstrap">
          <i class="fa fa-user"></i>
          <span>User management</span>
        </a>
        <div id="collapseebook" class="collapse" aria-labelledby="headingBootstrap" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="<cfoutput>#buildURL('user.view')#</cfoutput>">View Users</a>
            <a class="collapse-item" href="<cfoutput>#buildURL('user.order')#</cfoutput>">Users Order</a>
          </div>
        </div>
      </li>
    
    </ul>
    <!-- Sidebar -->
    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        <!-- TopBar -->
        <nav class="navbar navbar-expand navbar-light bg-navbar topbar mb-4 static-top">

          <button id="sidebarToggleTop" class="btn btn-link rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>
          <div id="timestamp" style="color: white;font-size: 30px;"></div>
          
          <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown no-arrow mx-1">
           <a class="nav-link dropdown-toggle" href="#" id="goFS" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false" title="Click to fullscreen">
                <i class="fas fa-desktop fa-fw"></i>
                
              </a>
            </li>
            <div class="topbar-divider d-none d-sm-block"></div>
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
               
                <span class="ml-2 d-none d-lg-inline text-white small">Admin</span>
              </a>
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
              
                <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="<cfoutput>#buildURL('admin.logout')#</cfoutput>">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>
          </ul>
        </nav>
        <!-- Topbar -->

        <cfoutput>
           <!--- display any messages to the user --->
            <cfif not arrayIsEmpty(rc.message)>
              <cfloop array="#rc.message#" index="msg">
                <center><h5 style="color: green">#msg#</h5></center>
              </cfloop>
            </cfif>
            #body#
        </cfoutput>

    </div>
  </div>

  <!-- Scroll to top -->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <script src="admin_assets/vendor/jquery/jquery.min.js"></script>
  <script src="admin_assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="admin_assets/vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="admin_assets/js/ruang-admin.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
<script>
  $(document).ready(function() {
    $('#example').DataTable();
});
</script>
  <script>
function goBack() {
  window.history.back();
}
</script>
 
</body>

</html>
<cfparam name="rc.message" default="#arrayNew(1)#">
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.83.1">
    <title>SCart</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/navbar-fixed/">
    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <link href="assets/navbar-top-fixed.css" rel="stylesheet">
    <!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- jQuery UI library -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

  </head>
  <body>
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="<cfoutput>#buildURL('main')#</cfoutput>">Shopping Cart</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav me-auto mb-2 mb-md-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="<cfoutput>#buildURL('main')#</cfoutput>">Home</a>
        </li>
        
        <cfif structKeyExists( session, "id" ) && session.auth.isLoggedIn>
       
        <li class="nav-item">
          <a class="nav-link" href="<cfoutput>#buildURL('cart.list')#</cfoutput>">Cart</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<cfoutput>#buildURL('main.order')#</cfoutput>">My Order</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<cfoutput>#buildURL('main.products')#</cfoutput>"> Products</a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="<cfoutput>#buildURL('main.logout')#</cfoutput>">Logout</a>
        </li>
        <cfelse>
        <li class="nav-item">
          <a class="nav-link" href="<cfoutput>#buildURL('main.registration')#</cfoutput>">Registration</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<cfoutput>#buildURL('main.login')#</cfoutput>" tabindex="-1">Login</a>
        </li>
        </cfif>
      </ul>
      
        <div class="ui-widget">
        <form method="POST" action="<cfoutput>#buildURL(action='main.buy')#</cfoutput>">
        <input class="form-control me-2" type="text" placeholder="Search" aria-label="Search" id="rew" name="name">
      </div>&nbsp;
        <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
    </div>
  </div>
</nav>
<main class="container">
  <div class="bg-light p-5 rounded">
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
</main>

<script>
  $(function() {
      $("#rew").autocomplete({
          source: "main.cfm?action=main.search",
      });
  });
  </script>
  
  </body>
</html>

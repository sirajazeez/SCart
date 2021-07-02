<cfif structKeyExists( session, "id" ) && session.auth.isLoggedIn>
  <cflocation url = "http://localhost:8888/scart/" addToken = "no">
</cfif>
<section id="login">
  <div class="container">
    <div class="row">
      <h2 class="text-center">Login</h2>
      <cfoutput>
      <form id="login" class="form" method="post" action="#buildURL('main.userlogin')#">
      <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label">Email Id</label>
        <input type="email" class="form-control" name="email" id="email" placeholder="Enter your email id" required="">
        <small></small>
      </div>
      <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label">Password</label>
        <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required="">
        <small></small>
      </div>
       <div class="mb-3 text-center">
         <button type="submit" name="loginBtn" class="btn btn-success">Login</button>
      </div>
      </form>
    </cfoutput>
    </div>
  </div>
</section>
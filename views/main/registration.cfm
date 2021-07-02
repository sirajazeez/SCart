<cfif structKeyExists( session, "id" ) && session.auth.isLoggedIn>
  <cflocation url = "http://localhost:8888/scart/" addToken = "no">
</cfif>
<section id="registration">
  <div class="container">
    <div class="row">
      <h2 class="text-center">New User Registration</h2>
      <form method="post" action="<cfoutput>#buildURL('main.register')#</cfoutput>">
      <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label">First name</label>
        <input type="text" class="form-control" name="userName" id="userName" placeholder="Enter your first name" required="">
        <small></small>
      </div>
       <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label">Email id</label>
        <input type="email" class="form-control" id="userEmail" name="userEmail" placeholder="Enter your email id" required="">
        <small></small>
      </div>
       <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label">Mobile Number</label>
        <input type="number" class="form-control" id="userMobile" name="userMobile" placeholder="Enter your mobile number" required="">
        <small></small>
      </div>
        <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label">Address</label>
        <input type="text" class="form-control" name="userAddress" id="userAddress" placeholder="Enter your address" required="">
        <small></small>
      </div>
        <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label">PIN Code</label>
        <input type="number" class="form-control" name="userPin" id="userPin" placeholder="Enter your pin number" required="">
        <small></small>
      </div>
        <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label">Password</label>
        <input type="password" class="form-control" name="userPassword" id="userPassword" placeholder="Enter your password" required="">
        <small></small>
      </div>
       <div class="mb-3 text-center">
        <button type="submit" name="submit" class="btn btn-primary">Register</button>
      </div>
      </form>
    </div>
  </div>
</section>
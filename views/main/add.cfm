<cfoutput>
    <div class="container">
        <form class="form-horizontal" action="#buildURL( action ='main.save')#" name="userForm" method="post">
            <div class="form-group">
                <label for="Name" class="col-sm-2 control-label">Name</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="userName" name="userName" placeholder="User Name" value="" required="required">
                </div>
            </div>
             <div class="form-group">
                <label for="Name" class="col-sm-2 control-label">Email</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="User Email" value="" required="required">
                </div>
            </div>
             <div class="form-group">
                <label for="Name" class="col-sm-2 control-label">Mobile</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="userMobile" name="userMobile" placeholder="User Mobile" value="" required="required">
                </div>
            </div>
             <div class="form-group">
                <label for="Name" class="col-sm-2 control-label">Address</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="userAddress" name="userAddress" placeholder="User Address" value="" required="required">
                </div>
            </div>
             <div class="form-group">
                <label for="Name" class="col-sm-2 control-label">PIN</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="userPin" name="userPin" placeholder="User Pin" value="" required="required">
                </div>
            </div>
             <div class="form-group">
                <label for="Name" class="col-sm-2 control-label">Password</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="userPassword" name="userPassword" placeholder="User Password" value="" required="required">
                </div>
            </div><br>
            <div class="form-group">
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary" name="Submit">
                        Save
                    </button>
                    <button type="reset" class="btn btn-info" name="Reset">
                        Reset
                    </button>
                    <a href="#BuildURL( action='main.default' )#" class="btn btn-danger" role="button">
                        Cancel
                    </a>
                </div>
            </div>
        </form>
    </div>
</cfoutput>
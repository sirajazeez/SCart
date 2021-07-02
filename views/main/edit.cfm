<cfoutput>
    <div class="container">
        <form class="form-horizontal" action="#buildURL( action ='main.update')#" name="userForm" method="post">
            <input id="id" name="id" type="hidden" value="#rc.Id#">
            <div class="form-group">
                <label for="Name" class="col-sm-2 control-label">Name</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="userName" name="userName" placeholder="User Name" required="required" value="#rc.user_name#">
                </div>
            </div>
             <div class="form-group">
                <label for="Name" class="col-sm-2 control-label">Email</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="User Email" required="required" value="#rc.user_email#">
                </div>
            </div>
             <div class="form-group">
                <label for="Name" class="col-sm-2 control-label">Mobile</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="userMobile" name="userMobile" placeholder="User Mobile"  required="required" value="#rc.user_mobile#">
                </div>
            </div>
             <div class="form-group">
                <label for="Name" class="col-sm-2 control-label">Address</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="userAddress" name="userAddress" placeholder="User Address" required="required" value="#rc.user_address#">
                </div>
            </div>
             <div class="form-group">
                <label for="Name" class="col-sm-2 control-label">PIN</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="userPin" name="userPin" placeholder="User Pin" required="required" value="#rc.user_pin#">
                </div>
            </div>
            <br>
            <div class="form-group">
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary" name="Submit">
                        Update
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
component displayname="User Service" accessors="true"{

	public any function init ( helperService ) {
        variables.hs = helperService;
    }
	public query function getUsers () {

		return queryExecute("SELECT id, user_name, user_email, user_mobile, user_address, user_pin FROM users WHERE user_type = 0");

	}
    
	 public query function getUser ( required numeric id ) {
        return queryExecute( 
           "SELECT  id, user_name, user_email, user_mobile, user_address, user_pin FROM users
            WHERE id = :id",
            { id = { value = arguments.id, cfsqltype = 'integer' } } 
            // equivalent to <cfqueryparam>
        );
    }

	public function register(string userName = '', string userEmail = '', string userMobile = '', string userAddress = '', numeric userPin = 0, string userPassword = ''){
			queryExecute("INSERT INTO users
				(user_name, user_email, user_mobile, user_address, user_pin, user_password)
				VALUES(:userName, :userEmail, :userMobile, :userAddress, :userPin, :userPassword)",
				{
						userName = { value = arguments.userName, 
                        null = hs.isEmptyString( arguments.userName ), cfsqltype = 'varchar' },
                        userEmail = { value = arguments.userEmail, 
                        null = hs.isEmptyString( arguments.userEmail ), cfsqltype = 'varchar' },
                        userMobile = { value = arguments.userMobile, 
                        null = hs.isEmptyString( arguments.userMobile ), cfsqltype = 'varchar' },
                        userAddress = { value = arguments.userAddress, 
                        null = hs.isEmptyString( arguments.userAddress ), cfsqltype = 'varchar' },
                        userPin = { value = arguments.userPin, 
                        null = hs.isEmptyString( arguments.userPin ), cfsqltype = 'integer' },
                        userPassword = { value = arguments.userPassword, 
                        null = hs.isEmptyString( arguments.userPassword ), cfsqltype = 'varchar'}

				}
				);
			return 1;
	}
	public function update(numeric id = 0, string userName = '', string userEmail = '', string userMobile = '', string userAddress = '', numeric userPin = 0){
			queryExecute("UPDATE users
				SET user_name = :userName,
				user_email = :userEmail,
				user_mobile = :userMobile,
				user_address = :userAddress,
				user_pin = :userPin
				WHERE id = :id",
				{
						id = { value = arguments.id, cfsqltype = 'integer'},
						userName = { value = arguments.userName, 
                        null = hs.isEmptyString( arguments.userName ), cfsqltype = 'varchar' },
                        userEmail = { value = arguments.userEmail, 
                        null = hs.isEmptyString( arguments.userEmail ), cfsqltype = 'varchar' },
                        userMobile = { value = arguments.userMobile, 
                        null = hs.isEmptyString( arguments.userMobile ), cfsqltype = 'varchar' },
                        userAddress = { value = arguments.userAddress, 
                        null = hs.isEmptyString( arguments.userAddress ), cfsqltype = 'varchar' },
                        userPin = { value = arguments.userPin, 
                        null = hs.isEmptyString( arguments.userPin ), cfsqltype = 'integer' }
                     		

				}
				);
			return 1;
	}


	public void function delete ( required numeric id ) {
        queryExecute( 
            "DELETE FROM users WHERE id = :id",
            { id={ value=arguments.id, cfsqltype='integer' } }
        );
    }

    public query function getByUser(required String email, required String password){

         var result =  queryExecute("SELECT id,user_type FROM users WHERE user_email = :email AND user_password = :password",
            { 
                email = { value = arguments.email, cfsqltype = 'varchar' },
                password = { value = arguments.password, cfsqltype = 'varchar' }

            }
            );
         return result;
    }

    public function getUserBySession(numeric id = 0)
    {      
        //var id = session.id;
        return queryExecute( 
           "SELECT  id, user_name, user_email, user_mobile, user_address, user_pin FROM users
            WHERE id = :id",
            {
                id = { value = arguments.id, null = hs.isEmptyString( arguments.id ), cfsqltype = 'integer'} 
            }
            );
    }


    public query function getOrders(numeric id = 0)
    {
        return queryExecute("SELECT o.id,o.status as ost,o.product_price, o.product_quantity, p.product_name FROM orders AS o INNER JOIN products AS p ON(o.product_id = p.id) WHERE o.user_id = #arguments.id#  ORDER BY o.id ASC");
    }


}
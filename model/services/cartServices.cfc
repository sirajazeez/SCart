component displayname="Cart Services" accessors="true"{

    public any function init(helperService){
        variables.hs = helperService;
    }

public function getCartsById(required numeric cid){
        return queryExecute( 
           "SELECT * FROM carts
            WHERE id = :cid",
            { cid = { value = arguments.cid, cfsqltype = 'integer' } } 
            // equivalent to <cfqueryparam>
        );
    }

	public function getCarts(required numeric id = 0)
    {	

        return queryExecute( 
           "SELECT c.id,c.product_id,c.product_price, c.product_quantity, p.product_name FROM carts AS c INNER JOIN products AS p ON(c.product_id = p.id) WHERE user_id = :id",
            { id = { value = arguments.id, cfsqltype = 'integer' } }
            );
    
    }

    public function getTotalSum(numeric id = 0)
    {
        
        return queryExecute("SELECT SUM(product_price * product_quantity) AS totsum FROM carts WHERE user_id = :id",
            { id = { value = arguments.id, cfsqltype = 'integer' } }
            );
    }
    public function updateCart(numeric id = 0, numeric qty = 0)
    {
        queryExecute("UPDATE carts SET product_quantity = :qty WHERE id = :id",
        {
            qty = { value = arguments.qty, cfsqltype = 'integer'},
            id = { value = arguments.id, cfsqltype = 'integer'}
        }
        );
    }
    public function deleteCart(numeric id = 0)
    {
        queryExecute("DELETE FROM carts WHERE id = :id",
        {
            id = { value = arguments.id, cfsqltype = 'integer'}
        }
        );
       
    }
    public function addToCart(numeric id = 0, numeric pid =0, numeric pprice = 0, numeric pqty = 1)
    {

    selectCart = queryExecute("SELECT id FROM carts WHERE user_id = :id AND product_id =:pid",
        { 
        id = { value = arguments.id, null = hs.isEmptyString( arguments.id ), cfsqltype = 'integer'},
        pid = { value = arguments.pid, null = hs.isEmptyString( arguments.pid ), cfsqltype = 'integer'}
        }
        );
        if(selectCart.recordCount == 1)
        {
            var ret = 0;
            return ret;
        }
        else
        {
        var ret = 1;
        insertCart = queryExecute("INSERT INTO carts (user_id, product_id, product_price, product_quantity) VALUES(:id, :pid, :pprice, :pqty)",
        {
            id = { value = arguments.id, 
                        null = hs.isEmptyString( arguments.id ), cfsqltype = 'integer' },
            pid = { value = arguments.pid, 
                        null = hs.isEmptyString( arguments.pid ), cfsqltype = 'integer' },
            pprice = { value = arguments.pprice, 
                        null = hs.isEmptyString( arguments.pprice ), cfsqltype = 'integer' },
            pqty = { value = arguments.pqty, 
                        null = hs.isEmptyString( arguments.pqty ), cfsqltype = 'integer' }
        }
        );
        return ret;
    }
    }

    public function insertOrder(numeric id = 0, numeric pid =0, numeric pprice = 0, numeric pqty = 1)
    {   
        q = queryExecute( 
           "SELECT * FROM carts WHERE user_id = :id",
            { id = { value = arguments.id, cfsqltype = 'integer' } }
            );
        insertCart = queryExecute("INSERT INTO orders (user_id, product_id, product_quantity, product_price) VALUES(:id, :pid, :pqty, :pprice)",
        {
            id = { value = arguments.id, 
                        null = hs.isEmptyString( arguments.id ), cfsqltype = 'integer' },
            pid = { value = arguments.pid, 
                        null = hs.isEmptyString( arguments.pid ), cfsqltype = 'integer' },
            pqty = { value = arguments.pqty, 
                        null = hs.isEmptyString( arguments.pqty ), cfsqltype = 'integer' },
            pprice = { value = arguments.pprice, 
                        null = hs.isEmptyString( arguments.pprice ), cfsqltype = 'integer' }
        }
        );
        
        deleteCart = queryExecute("DELETE FROM carts WHERE user_id = '#id#'");

    }

    public void function productBuy(numeric id = 0)
    {
        q = getCartsById(arguments.id);
        
        queryExecute("INSERT INTO ORDERS (user_id, product_id, product_quantity, product_price) VALUES(:uid, :pid, :pqty, :pprice)",
            {   
            uid = { value = q.user_id, 
                        null = hs.isEmptyString( q.user_id ), cfsqltype = 'integer' },
            pid = { value = q.product_id, 
                        null = hs.isEmptyString( q.product_id ), cfsqltype = 'integer' },
            pqty = { value = q.product_quantity, 
                        null = hs.isEmptyString( q.product_quantity ), cfsqltype = 'integer' },
            pprice = { value = q.product_price, 
                        null = hs.isEmptyString( q.product_price ), cfsqltype = 'integer' }
            }
        );

        queryExecute("DELETE FROM carts WHERE id = :id",
        {
            id = { value = arguments.id, cfsqltype = 'integer'}
        }
        );
    }
    public function getProductsById(required numeric id){
        return queryExecute( 
           "SELECT  id, subcategory_id, product_name, product_description, product_price, product_quantity FROM products
            WHERE id = :id",
            { id = { value = arguments.id, cfsqltype = 'integer' } } 
            // equivalent to <cfqueryparam>
        );
    }

    public function productBuyInd(numeric id=0, numeric qty=0)
    {
        q = getProductsById(arguments.id);
        s = session.id;
        queryExecute("INSERT INTO ORDERS (user_id, product_id, product_quantity, product_price) VALUES(:uid, :pid, :pqty, :pprice)",
            {   
            uid = { value = s.id, 
                        null = hs.isEmptyString( s.id ), cfsqltype = 'integer' },
            pid = { value = q.id, 
                        null = hs.isEmptyString( q.id ), cfsqltype = 'integer' },
            pqty = { value = arguments.qty, 
                        null = hs.isEmptyString( arguments.qty ), cfsqltype = 'integer' },
            pprice = { value = q.product_price, 
                        null = hs.isEmptyString( q.product_price ), cfsqltype = 'integer' }
            }
        );
    }
}
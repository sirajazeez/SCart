component displayname="User Services" accessors="true"{

    public any function init(helperService){
        variables.hs = helperService;
    }

    
    public query function getUsers()
    {
        return queryExecute("SELECT user_name, user_email, user_mobile, user_address,user_pin FROM users WHERE user_type = '0' ORDER BY id ASC");
    }

    public query function getOrders()
    {
        return queryExecute(" SELECT o.id AS oid, o.product_quantity AS pqty,o.product_price AS pprice, o.status AS ost,u.user_name AS uname,p.product_name AS pname FROM orders AS o INNER JOIN products AS p ON(o.product_id = p.id) INNER JOIN users AS u ON(o.user_id = u.id) ORDER BY o.id ASC");
    }

    public query function getOrdersById(numeric oid = 0)
    {
        return queryExecute(" SELECT o.id AS oid, o.product_quantity AS pqty,o.product_price AS pprice, o.status AS ost,u.user_name AS uname,p.product_name AS pname FROM orders AS o INNER JOIN products AS p ON(o.product_id = p.id) INNER JOIN users AS u ON(o.user_id = u.id) WHERE o.id = '#oid#' ORDER BY o.id ASC");
    }

    public function changeOrderStatus(numeric oid = 0, string status = "")
    {
        queryExecute("UPDATE orders SET status = '#status#' WHERE id = '#oid#'");
        return getOrdersById(oid);
    }

}
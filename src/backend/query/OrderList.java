package backend.query;

/**
 * Created by LU on 15/5/14.
 */
public class OrderList extends Query{
    private static final String[] field_name = {"orderID", "date"};
    private String username;

    public OrderList(String username){
        result.setFieldsName(field_name);
        this.username = username;
        column_name = new String[]{"orderid", "order_date"};
    }

    protected boolean check(){
        return true;
    }

    protected void getSQL(){
        sql = "SELECT orderid, order_date FROM Orders WHERE username = '" + username + "'";
    }

}

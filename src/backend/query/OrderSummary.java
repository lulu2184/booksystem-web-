package backend.query;

import backend.session.Order;

import java.sql.SQLException;

/**
 * Created by LU on 15/5/19.
 */
public class OrderSummary extends Query{
    private String orderid;
    private static final String[] field_name = {"ISBN", "quantity"};

    public OrderSummary(String orderid){
        result.setFieldsName(field_name);
        this.orderid = orderid;
        column_name = new String[]{"ISBN", "num"};
    }

    protected void getSQL(){
        sql = "SELECT ISBN, num FROM InOrder WHERE orderid = " + orderid + ";";
    }

    protected boolean check()throws SQLException{
        //orderid = Order.getOrderString();
        return true;
    }
}

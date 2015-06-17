package backend.query;

/**
 * Created by LU on 15/5/14.
 */
public class UserList extends Query{
    private static final String[] field_name = {"user", "full name", "age", "address", "phone"};

    public UserList(){
        result.setFieldsName(field_name);
        column_name = new String[]{"username", "fullname", "age", "address", "phone"};
    }

    protected boolean check(){
        return true;
    }

    protected void getSQL(){
        sql = "SELECT username, fullname, age, address, phone FROM User;";
    }

}

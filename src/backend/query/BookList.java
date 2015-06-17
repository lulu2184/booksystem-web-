package backend.query;

/**
 * Created by LU on 15/5/14.
 */
public class BookList extends Query{
    private static final String[] field_name = {"ISBN", "title", "stock", "price", "format", "subject", "publish", "publish year"};

    public BookList(){
        result.setFieldsName(field_name);
        column_name = new String[]{"ISBN", "title", "inum", "price", "format", "subject", "pname", "publish_year"};
    }

    protected boolean check(){
        return true;
    }

    protected void getSQL(){
        sql = "SELECT *  FROM Book;";
    }

}

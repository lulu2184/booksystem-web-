package backend;

import javax.management.InstanceNotFoundException;
import java.sql.*;

/**
 * Created by LU on 15/5/3.
 */
public class Connector {
    private  Connection con;
    private  Statement stmt;

    private static Connector ourInstance = null;

    public static Connector getInstance() throws Exception{
        if (ourInstance == null) {
            ourInstance = new Connector();
        }
        return ourInstance;
    }

     public static void start() throws Exception{
         getInstance();
     }

    private Connector() throws SQLException, ClassNotFoundException, InstanceNotFoundException, IllegalAccessException, InstantiationException{
          //  try{
                String userName = "fudanu30";
                String password = "nrkgn719";
                String url = "jdbc:mysql://10.141.208.26/fudandbd30?useUnicode=true&characterEncoding=utf8";
                Class.forName ("com.mysql.jdbc.Driver").newInstance ();
                con = DriverManager.getConnection(url, userName, password);
                stmt = con.createStatement();
//            } catch(SQLException e) {
//                System.err.println("Unable to open mysql jdbc connection. The error is as follows,\n");
//                System.err.println(e.getMessage());
//                e.printStackTrace();
//                throw(e);
//            } catch (ClassNotFoundException e){
//                System.err.println(e.getMessage());
//            }
    }

    private ResultSet Query(String query) throws SQLException{
        ResultSet rs = stmt.executeQuery(query);
        return rs;
    }

    private void Insertion(String insertion) throws SQLException{
        stmt.executeUpdate(insertion);
    }

    public static void ExecuteInsertion(String insertion) throws SQLException{
       // stmt.executeUpdate(insertion);
        ourInstance.Insertion(insertion);
    }

    public static ResultSet ExecuteQuery(String query) throws SQLException{
        ResultSet rs = ourInstance.Query(query);
        return rs;
    }

    public static void close() throws SQLException{
        if (ourInstance == null) return;
        try{
            getInstance().stmt.close();
            getInstance().con.close();
            ourInstance = null;
   //         con = null;
   //         stmt = null;
        }catch (Exception e){

        }
    }

    public static ResultSet selectStatement(String column, String from, String where)throws SQLException{
        return ExecuteQuery("SELECT " + column + " FROM " + from + " WHERE " + where + ";");
    }

    public static void insertStatement(String table, String column, String values) throws SQLException{
        ExecuteQuery("INSERT INTO " + table + "(" + column + ") VALUES(" + values +");");
    }
}

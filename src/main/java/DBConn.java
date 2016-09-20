import java.sql.*;

/**
 * Created by Administrator on 2016/9/19.
 */
public class DBConn {
    private Connection conn;
    private Statement statement;
    public void ConnectDB()
    {
        String url;
        url = "jdbc:mysql://localhost:3306/test";
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url,"root","");
            statement = conn.createStatement();
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void InsertData(UserBean userData){
    }

    public void QueryContacts(String userName){
        String sql;
        sql = "SELECT _sender,_receiver FROM UserMsg WHERE _sender='"+userName+"' " +"OR "+"_receiver='"+userName+"';";
        System.out.println(sql);
        //sql ="SELECT * FROM UserMsg;";
        try{
            ResultSet result = statement.executeQuery(sql);

            while(result.next()){
                System.out.println(result.getString(1)+" to "+result.getString(2));

            }
            result.close();
        }catch (SQLException e){
            e.printStackTrace();
        }

    }

    public void CloseDBConn(){
        if(statement!=null){
            try{
                statement.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
        }

        if(conn!=null){
            try{
                conn.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
        }


    }
}

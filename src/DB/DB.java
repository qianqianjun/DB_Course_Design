package DB;
import java.sql.*;
public class DB {
    //初始化连接参数;
    public static String url="jdbc:mysql://localhost:3306/db?serverTimezone=UTC&useSSL=false&characterEncoding=utf8";
    public static String user="root";
    public static String password="root";
    //初始化驱动加载：
    static{
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    public static Connection getConnection()
    {
        try {
            Connection connection=DriverManager.getConnection(url,user,password);
            return connection;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static void close(Connection connection,Statement st,ResultSet rs)
    {
        try {
            connection.close();
            st.close();
            rs.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }
    public static void close(Connection connection,PreparedStatement st)
    {
        try {
            connection.close();
            st.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}

package DB;

import model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDB {
    public User login(String account,String password,String type)
    {
        Connection connection=null;
        PreparedStatement ps=null;
        ResultSet res=null;
        try{
            connection=DB.getConnection();
            String sql="select * from user where account=? and password=? and type=?";
            ps=connection.prepareStatement(sql);
            ps.setString(1,account);
            ps.setString(2,password);
            ps.setString(3,type);
            res=ps.executeQuery();
            if(res.next())
            {
                User user=new User();
                user.setAccount(res.getString("account"));
                user.setPassword(res.getString("password"));
                user.setType(res.getString("type"));
                return user;
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally {
            DB.close(connection,ps,res);
        }
        return null;
    }
    public Boolean changePassword(String account,String oldpassword,String type,String newpassword)
    {
        Connection connection=null;
        PreparedStatement ps=null;
        connection=DB.getConnection();
        String sql="update user set user.password=? where account=" +
                "(select temp.account from (select account from user where type=? and account=?)temp)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, newpassword);
            ps.setString(2, type);
            ps.setString(3, account);
            Integer result = ps.executeUpdate();
            if(result!=0)
                return true;
        }catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            DB.close(connection,ps);
        }
        return false;
    }
}

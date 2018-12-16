package DB;
import model.Message;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.ListResourceBundle;

public class MessageDB {
    public List<Message> getAllUncomplete()
    {
        Connection connection=null;
        ResultSet resultSet=null;
        PreparedStatement ps=null;
        String sql="select * from message where message.status=0";
        try {
            connection=DB.getConnection();
            ps=connection.prepareStatement(sql);
            resultSet=ps.executeQuery();
            List<Message> result=new ArrayList<Message>();
            while(resultSet.next())
            {
                Message message =new Message();
                message.setContent(resultSet.getString("content"));
                message.setId(resultSet.getInt("id"));
                message.setSendtime(resultSet.getString("sendtime"));
                message.setSno(resultSet.getString("sno"));
                message.setStatus(resultSet.getInt("status"));
                message.setTitle(resultSet.getString("title"));
                result.add(message);
            }
            return result;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DB.close(connection,ps,resultSet);
        }
        return null;
    }
    public List<Message> getAllSno(String sno)
    {
        Connection connection=null;
        ResultSet resultSet=null;
        PreparedStatement ps=null;
        String sql="select * from feedback where feedback.sno=?";
        try {
            connection=DB.getConnection();
            ps=connection.prepareStatement(sql);
            ps.setString(1,sno);
            resultSet=ps.executeQuery();
            List<Message> result= new ArrayList<Message>();
            while(resultSet.next())
            {
                Message message =new Message();
                message.setContent(resultSet.getString("content"));
                message.setId(resultSet.getInt("id"));
                message.setSendtime(resultSet.getString("sendtime"));
                message.setSno(resultSet.getString("sno"));
                message.setStatus(resultSet.getInt("status"));
                result.add(message);
            }
            return result;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DB.close(connection,ps,resultSet);
        }
        return null;
    }
    public Boolean add(String sno,String content,String title)
    {
        Connection connection=null;
        PreparedStatement ps=null;
        String sql="insert into message set message.content=?,message.sno=?,message.sendtime=NOW(),message.status=0,message.title=?";
        try {
            connection=DB.getConnection();
            ps=connection.prepareStatement(sql);
            ps.setString(1,content);
            ps.setString(2,sno);
            ps.setString(3,title);
            Integer type=ps.executeUpdate();
            if(type==0)
                return false;
            else
                return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DB.close(connection,ps);
        }
        return false;
    }
    public Boolean changeStatus(Integer id)
    {
        Connection connection=null;
        PreparedStatement ps=null;
        String sql="UPDATE message set message.status=1 where message.id=?";
        try {
            connection=DB.getConnection();
            ps=connection.prepareStatement(sql);
            ps.setInt(1,id);
            Integer type=ps.executeUpdate();
            if(type==0)
                return false;
            else
                return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DB.close(connection,ps);
        }
        return false;
    }

    public Message SelectById(Integer id) throws SQLException {
        Connection connection=null;
        PreparedStatement ps=null;
        ResultSet resultSet=null;
        String sql="select * from message where id=?";
        connection=DB.getConnection();
        ps=connection.prepareStatement(sql);
        ps.setInt(1,id);
        resultSet=ps.executeQuery();
        Message message=new Message();
        if(resultSet.next())
        {
            message.setTitle(resultSet.getString("title"));
            message.setId(resultSet.getInt("id"));
            message.setContent(resultSet.getString("content"));
            message.setSendtime(resultSet.getString("sendtime"));
            message.setSno(resultSet.getString("sno"));
            message.setStatus(resultSet.getInt("status"));
        }
        DB.close(connection,ps,resultSet);
        return message;
    }

    public List<Message> SelectByCondition(String sno, String status) throws SQLException {
        Connection connection=DB.getConnection();
        ResultSet resultSet=null;
        String sql=null;
        PreparedStatement ps=null;
        if(sno.equals(""))
        {
            if(status.equals("all"))
            {
                sql="select * from message";
                ps=connection.prepareStatement(sql);
                resultSet=ps.executeQuery();
            }
            else
            {
                sql="select * from message where status=?";
                ps=connection.prepareStatement(sql);
                ps.setInt(1,Integer.parseInt(status));
                resultSet=ps.executeQuery();
            }
        }
        else
        {
            if(status.equals("all"))
            {
                sql="select * from message where sno=?";
                ps=connection.prepareStatement(sql);
                ps.setString(1,sno);
                resultSet=ps.executeQuery();
            }
            else
            {
                sql="select * from message where sno=? and status=?";
                ps=connection.prepareStatement(sql);
                ps.setInt(2,Integer.parseInt(status));
                ps.setString(1,sno);
                resultSet=ps.executeQuery();
            }
        }
        List<Message> result=new ArrayList<Message>();
        while(resultSet.next())
        {
            Message message=new Message();
            message.setTitle(resultSet.getString("title"));
            message.setId(resultSet.getInt("id"));
            message.setContent(resultSet.getString("content"));
            message.setSendtime(resultSet.getString("sendtime"));
            message.setSno(resultSet.getString("sno"));
            message.setStatus(resultSet.getInt("status"));
            result.add(message);
        }
        DB.close(connection,ps,resultSet);
        return result;
    }
}

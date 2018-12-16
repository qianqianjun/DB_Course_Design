package DB;

import model.Notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NoticeDB {
    public List<Notice> getNotice() throws SQLException {
        Connection connection=DB.getConnection();
        String sql="select * from notice order by sendtime desc limit 10";
        PreparedStatement ps=connection.prepareStatement(sql);
        ResultSet resultSet=ps.executeQuery();
        List<Notice> res=new ArrayList<Notice>();
        while (resultSet.next())
        {
            Notice notice=new Notice();
            notice.setContent(resultSet.getString("content"));
            notice.setSendtime(resultSet.getString("sendtime"));
            notice.setId(resultSet.getInt("id"));
            notice.setTitle(resultSet.getString("title"));
            res.add(notice);
        }
        DB.close(connection,ps,resultSet);
        return res;
    }
    public List<Notice> SelectById(int id) throws SQLException {
        Connection connection=DB.getConnection();
        String sql="select * from notice where id =?";
        PreparedStatement ps=connection.prepareStatement(sql);
        ps.setInt(1,id);
        ResultSet resultSet=ps.executeQuery();
        List<Notice> res=new ArrayList<Notice>();
        if(resultSet.next())
        {
            Notice notice=new Notice();
            notice.setContent(resultSet.getString("content"));
            notice.setSendtime(resultSet.getString("sendtime"));
            notice.setId(resultSet.getInt("id"));
            notice.setTitle(resultSet.getString("title"));
            res.add(notice);
        }
        DB.close(connection,ps,resultSet);
        return res;
    }
    public Boolean add(String content,String title) throws SQLException {
        String sql="insert into notice set content=?,sendtime=NOW(),title=?";
        Connection connection=DB.getConnection();
        PreparedStatement ps=connection.prepareStatement(sql);
        ps.setString(1,content);
        ps.setString(2,title);
        Integer rows=ps.executeUpdate();
        if(rows>0)
            return true;
        return false;
    }
}

package DB;

import model.Teacher;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TeacherDB {
    public Teacher getInfo(String tno)
    {
        Connection connection=null;
        PreparedStatement ps=null;
        ResultSet res=null;
        connection=DB.getConnection();
        String sql="select * from teacher where tno=?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1,tno);
            res = ps.executeQuery();
            if(res.next())
            {
                //查到老师的相关信息：
                Teacher teacher=new Teacher();
                teacher.setTno(res.getString("tno"));
                teacher.setTname(res.getString("tname"));
                teacher.setTdept(res.getString("tdept"));
                teacher.setRank(res.getString("rank"));
                teacher.setPhone(res.getString("phone"));
                teacher.setLogo(res.getString("logo"));
                teacher.setLocation(res.getString("location"));
                teacher.setId(res.getInt("id"));
                return teacher;
            }
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        finally {
            DB.close(connection,ps,res);
        }
        return null;
    }
}

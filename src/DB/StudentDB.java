package DB;
import model.Student;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class StudentDB {
    public Student getInfo(String sno)
    {
        Connection connection=null;
        PreparedStatement ps=null;
        ResultSet res=null;
        String sql="select * from student where sno=?";
        try {
            connection = DB.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1,sno);
            res=ps.executeQuery();
            if(res.next())
            {
                Student student=new Student();
                student.setId(res.getInt("id"));
                student.setCollege(res.getString("college"));
                student.setKlass(res.getString("klass"));
                student.setMajor(res.getString("major"));
                student.setSno(res.getString("sno"));
                student.setSname(res.getString("sname"));
                student.setSex(res.getString("sex"));
                return student;
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

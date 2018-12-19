package DB;
import model.Student;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
                student.setCollege(res.getString("college"));
                student.setKlass(res.getString("klass"));
                student.setMajor(res.getString("major"));
                student.setSno(res.getString("sno"));
                student.setSname(res.getString("sname"));
                student.setSex(res.getString("sex"));
                student.setBirthday(res.getString("birthday"));
                student.setEmail(res.getString("email"));
                student.setCity(res.getString("city"));
                student.setPhone(res.getString("phone"));
                student.setForeignlanguage(res.getString("foreignlanguage"));
                student.setWechat(res.getString("wechat"));
                student.setStatus(res.getString("status"));
                student.setQq(res.getString("qq"));
                student.setPoliticalstatus(res.getString("politicalstatus"));
                student.setNation(res.getString("nation"));
                student.setProvince(res.getString("province"));
                student.setNation(res.getString("nation"));
                student.setHighschool(res.getString("highschool"));
                student.setStatus(res.getString("status"));
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

    public Boolean add(Student student) throws SQLException {
        Connection connection=null;
        PreparedStatement ps=null;
        String sql="insert into student set sno=?,sname=?,sex=?,klass=?,college=?,major=?";
        connection=DB.getConnection();
        ps=connection.prepareStatement(sql);
        ps.setString(1,student.getSno());
        ps.setString(2,student.getSname());
        ps.setString(3,student.getSex());
        ps.setString(4,student.getKlass());
        ps.setString(5,student.getCollege());
        ps.setString(6,student.getMajor());
        Integer rows=ps.executeUpdate();
        if(rows>0) {
            sql="insert into user set account=?,password=?,type=?";
            ps=connection.prepareStatement(sql);
            ps.setString(1,student.getSno());
            ps.setString(2,student.getSno());
            ps.setString(3,"student");
            rows=ps.executeUpdate();
            DB.close(connection,ps);
            if(rows>0)
                return true;
        }
        return false;
    }

    public Boolean changeInfo(String sql, String account, String kind, String value) throws SQLException {
        sql+=kind+"=? where sno=?";
        Connection connection=DB.getConnection();
        PreparedStatement ps=connection.prepareStatement(sql);
        ps.setString(1,value);
        ps.setString(2,account);
        System.out.println(ps.toString());
        Integer rows=ps.executeUpdate();
        DB.close(connection,ps);
        if(rows>0)
            return true;
        else
            return false;
    }
}

package DB;

import model.Course;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class CourseDB {
    public Boolean addCourse(Course course)
    {
        //这里操作数据库
        Connection connection=null;
        PreparedStatement ps=null;
        String sql="insert into course (cno,cname,runtime,capacity,status,dept,pcno) values (?,?,?,?,?,?,?)";
        try{
            connection=DB.getConnection();
            ps=connection.prepareStatement(sql);
            ps.setString(1,course.getCno());
            ps.setString(2,course.getCname());
            ps.setString(3,course.getRuntime());
            ps.setInt(4,course.getCapacity());
            ps.setInt(5,course.getStatus());
            ps.setString(6,course.getDept());
            ps.setString(7,course.getPcno());
            Integer status=ps.executeUpdate();
            if(status>=0)
            {
                return true;
            }
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        finally {
            DB.close(connection,ps);
        }
        return false;
    }
}

package DB;
import model.Course;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CourseDB {
    public Boolean addCourse(Course course)
    {
        //这里操作数据库
        Connection connection=null;
        PreparedStatement ps=null;
        String sql="insert into course set cno=?,cname=?,dept=?,pcno=?,introduction=?,settno=?,status=-1";
        try{
            connection=DB.getConnection();
            ps=connection.prepareStatement(sql);
            ps.setString(1,course.getCno());
            ps.setString(2,course.getCname());
            ps.setString(3,course.getDept());
            ps.setString(4,course.getPcno());
            ps.setString(5,course.getIntroduction());
            ps.setString(6,course.getSettno());
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
    public List<Course> getAllUncompleCourse()
    {
        Connection connection=null;
        PreparedStatement ps=null;
        ResultSet resultSet=null;
        String sql="select * from course where status=-1";
        try {
            connection=DB.getConnection();
            ps=connection.prepareStatement(sql);
            resultSet=ps.executeQuery();
            List<Course> result=new ArrayList<Course>();
            while (resultSet.next())
            {
                Course course=new Course();
                course.setIntroduction(resultSet.getString("introduction"));
                course.setSettno(resultSet.getString("settno"));
                course.setPcno(resultSet.getString("pcno"));
                course.setDept(resultSet.getString("dept"));
                course.setCno(resultSet.getString("cno"));
                course.setCname(resultSet.getString("cname"));
                course.setId(resultSet.getInt("id"));
                course.setStatus(resultSet.getInt("status"));
                result.add(course);
            }
            return result;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public List<Course> SelectByCondition(String tno,String college) throws SQLException {
        Connection connection=null;
        PreparedStatement ps=null;
        ResultSet resultSet=null;
        String sql=null;

        if(tno==null) {
            if(college.equals("all")){
                sql="select * from course where status=-1";
                ps=connection.prepareStatement(sql);
                resultSet=ps.executeQuery();
            }
            else
            {
                sql="select * from course where status=-1 and course.dept=?";
                ps=connection.prepareStatement(sql);
                ps.setString(1,college);
                resultSet=ps.executeQuery();
            }
        }
        else{
            if(college.equals("all")){
                sql="select * from course where status=-1 and course.setno=?";
                ps=connection.prepareStatement(sql);
                ps.setString(1,tno);
                resultSet=ps.executeQuery();
            }
            else
            {
                sql="select * from course where status=-1 and course.dept=? and course.settno=?";
                ps=connection.prepareStatement(sql);
                ps.setString(1,college);
                ps.setString(2,tno);
                resultSet=ps.executeQuery();
            }
        }
        List<Course> result=new ArrayList<Course>();
        while(resultSet.next())
        {
            Course course=new Course();
            course.setStatus(resultSet.getInt("status"));
            course.setId(resultSet.getInt("id"));
            course.setCname(resultSet.getString("cname"));
            course.setCno(resultSet.getString("cno"));
            course.setDept(resultSet.getString("dept"));
            course.setPcno(resultSet.getString("pcno"));
            course.setSettno(resultSet.getString("settno"));
            course.setIntroduction(resultSet.getString("introduction"));
            result.add(course);
        }
        return result;
    }
}

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
        connection=DB.getConnection();
        if(tno.equals("")) {
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
                sql="select * from course where status=-1 and course.settno=?";
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
            course.setCname(resultSet.getString("cname"));
            course.setCno(resultSet.getString("cno"));
            course.setDept(resultSet.getString("dept"));
            course.setPcno(resultSet.getString("pcno"));
            course.setSettno(resultSet.getString("settno"));
            course.setIntroduction(resultSet.getString("introduction"));
            result.add(course);
        }
        DB.close(connection,ps,resultSet);
        return result;
    }
    public Boolean accessCourse(String cno) throws SQLException {
        Connection connection=DB.getConnection();
        String sql="update course set course.status=0 where cno=?";
        PreparedStatement ps=connection.prepareStatement(sql);
        ps.setString(1,cno);
        Integer rows=ps.executeUpdate();
        DB.close(connection,ps);
        if(rows>0)
            return true;
        return false;
    }
    public Course SelectByCno(String cno) throws SQLException {
        Connection connection=DB.getConnection();
        String sql="select * from course where cno=?";
        PreparedStatement ps=connection.prepareStatement(sql);
        ps.setString(1,cno);
        ResultSet resultSet=ps.executeQuery();
        Course course=new Course();
        if(resultSet.next())
        {
            course.setStatus(resultSet.getInt("status"));
            course.setCname(resultSet.getString("cname"));
            course.setCno(resultSet.getString("cno"));
            course.setDept(resultSet.getString("dept"));
            course.setPcno(resultSet.getString("pcno"));
            course.setSettno(resultSet.getString("settno"));
            course.setIntroduction(resultSet.getString("introduction"));
        }
        DB.close(connection,ps,resultSet);
        return course;
    }

    public List<Course> SearchClass(String cno, String cname, String dept, String status) throws SQLException {
        Connection connection=DB.getConnection();
        PreparedStatement ps=null;
        ResultSet resultSet=null;
        List<Course> result=new ArrayList<Course>();
        String sql="";
        if(cno.equals(""))
        {
            sql="select * from course where 1 ";
            String sqlcname=" and 1 ";
            String sqldept=" and 1 ";
            String sqlstatus=" and 1 ";
            List<String> query=new ArrayList<String>();
            if(!(status.equals("")||status.equals("all"))) {
                sqlstatus = " and status=? ";
                query.add(status);
            }
            if(!cname.equals("")) {
                sqlcname = " and cname like ? ";
                query.add("%"+cname+"%");
            }
            if(!(dept.equals("")||dept.equals("all"))) {
                sqldept = " and dept=? ";
                query.add(dept);
            }
            sql+=sqlstatus+sqlcname+sqldept;
            ps=connection.prepareStatement(sql);
            for(Integer i=0;i<query.size();i++)
            {
                ps.setString(i+1,query.get(i));
            }
            resultSet=ps.executeQuery();
            while(resultSet.next())
            {
                Course course=new Course();
                course.setStatus(resultSet.getInt("status"));
                course.setCname(resultSet.getString("cname"));
                course.setCno(resultSet.getString("cno"));
                course.setDept(resultSet.getString("dept"));
                course.setPcno(resultSet.getString("pcno"));
                course.setSettno(resultSet.getString("settno"));
                course.setIntroduction(resultSet.getString("introduction"));
                result.add(course);
            }
        }
        else
        {
            sql="select * from course where cno=?";
            ps=connection.prepareStatement(sql);
            ps.setString(1,cno);
            resultSet=ps.executeQuery();
            if(resultSet.next())
            {
                Course course=new Course();
                course.setStatus(resultSet.getInt("status"));
                course.setCname(resultSet.getString("cname"));
                course.setCno(resultSet.getString("cno"));
                course.setDept(resultSet.getString("dept"));
                course.setPcno(resultSet.getString("pcno"));
                course.setSettno(resultSet.getString("settno"));
                course.setIntroduction(resultSet.getString("introduction"));
                result.add(course);
            }
            DB.close(connection,ps,resultSet);
        }
        return result;
    }
}

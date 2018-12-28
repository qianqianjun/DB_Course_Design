package DB;
import view.Course_teach;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
public class Course_teacheDB {
    public ArrayList<Course_teach> getTeachList(String semester,String tno) throws SQLException {
        Connection connection=DB.getConnection();
        String sql="SELECT course. cname,course_semester.*,course_runtime.runday,course_runtime.begintime,course_runtime.endtime from course_semester " +
                "left join course on course_semester.cno=course.cno " +
                "left join course_runtime on course_semester.cno=course_runtime.cno and course_semester.semester=course_runtime.semester" +
                " where course_semester.semester=? and course_semester.tno=?";
        PreparedStatement ps=connection.prepareStatement(sql);
        ps.setString(1,semester);
        ps.setString(2,tno);
        ResultSet resultSet=ps.executeQuery();
        ArrayList<Course_teach> result=new ArrayList<Course_teach>();
        String [] arr={"零","一","二","三","四","五","六","日"};
        while(resultSet.next()){
            Course_teach temp=new Course_teach();
            temp.setCname(resultSet.getString("cname"));
            temp.setLocation(resultSet.getString("location"));
            temp.setSemester(semester);
            temp.setWeektime(resultSet.getString("weekbegin")+"-"+resultSet.getString("weekend")+"周");
            temp.setTeachtime("周"+arr[Integer.parseInt(resultSet.getString("runday"))]+"第"+
                    resultSet.getString("begintime")+"-"+ resultSet.getString("endtime")+"节");
            result.add(temp);
        }
        DB.close(connection,ps,resultSet);
        return result;
    }

    public ArrayList<Course_teach> getTeachListMore(String tno, String semester) throws SQLException {
        ArrayList<Course_teach> result=new ArrayList<Course_teach>();
        String sql="select course.cname,course_semester.*,course_runtime.runday,course_runtime.begintime,course_runtime.endtime " +
                "from course_semester " +
                "left join course on course.cno=course_semester.cno " +
                "left join course_runtime on course_semester.cno=course_runtime.cno" +
                " where course_semester.semester=? and course_semester.tno=?";
        Connection connection=DB.getConnection();
        PreparedStatement ps=connection.prepareStatement(sql);
        ps.setString(1,semester);
        ps.setString(2,tno);
        ResultSet resultSet=ps.executeQuery();
        while(resultSet.next())
        {
            Course_teach temp=new Course_teach();
            temp.setCname(resultSet.getString("cname"));
            temp.setLocation(resultSet.getString("location"));
            temp.setSemester(semester);
            temp.setWeektime(resultSet.getString("weekbegin")+"-"+resultSet.getString("weekend")+"周");
            temp.setCno(resultSet.getString("cno"));
            temp.setCapacity(Integer.parseInt(resultSet.getString("capacity")));
            result.add(temp);
        }
        DB.close(connection,ps,resultSet);
        return result;
    }

    public ArrayList<String> getTeachTime(String semester, String cno) throws SQLException {
        Connection connection=DB.getConnection();
        String sql="select * from course_runtime where semester=? and cno=?";
        PreparedStatement ps=connection.prepareStatement(sql);
        ps.setString(1,semester);
        ps.setString(2,cno);
        ResultSet resultSet=ps.executeQuery();
        ArrayList<String> res=new ArrayList<String>();
        String [] arr={"零","一","二","三","四","五","六","日"};
        while(resultSet.next())
        {
            String temp="星期"+arr[Integer.parseInt(resultSet.getString("runday"))]+" 第 "+
                    resultSet.getString("begintime")+"-"+ resultSet.getString("endtime")+" 节";
            res.add(temp);
        }
        return res;
    }
}

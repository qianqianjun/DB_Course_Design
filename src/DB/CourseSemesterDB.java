package DB;

import model.CourseSemester;
import view.Course_select;

import java.sql.*;
import java.util.ArrayList;
public class CourseSemesterDB {
    public CourseSemester getBycno(String cno) throws SQLException {
        Connection connection=DB.getConnection();
        String sql="select * from course_semester where cno=?";
        PreparedStatement ps=connection.prepareStatement(sql);
        ps.setString(1,cno);
        ResultSet resultSet=ps.executeQuery();
        if(resultSet.next())
        {
            CourseSemester courseSemester=new CourseSemester();
            courseSemester.setCapacity(resultSet.getInt("capacity"));
            courseSemester.setCno(resultSet.getString("cno"));
            courseSemester.setLocation(resultSet.getString("location"));
            courseSemester.setSemester(resultSet.getString("semester"));
            courseSemester.setTno(resultSet.getString("tno"));
            courseSemester.setWeekbegin(resultSet.getInt("weekbegin"));
            courseSemester.setWeekend(resultSet.getInt("weekend"));
            courseSemester.setStatus(resultSet.getInt("status"));
            DB.close(connection,ps,resultSet);
            return courseSemester;
        }
        else
            DB.close(connection,ps,resultSet);
        return null;
    }
    public ArrayList<CourseSemester> getByCondition(String college,String cname) throws SQLException {
        ArrayList<CourseSemester> result=new ArrayList<CourseSemester>();
        String sql="select * from course_semester where 1 ";
        String sql1="and 1 ";
        String sql2="and 1 ";
        ArrayList<String> arr=new ArrayList<String>();
        if(!cname.equals(""))
        {
            sql1="and cname like ? ";
            arr.add("%"+cname+"%");
        }
        if(!college.equals("all"))
        {
            sql2="and college=? ";
            arr.add(college);
        }
        Connection connection=DB.getConnection();
        PreparedStatement ps=connection.prepareStatement(sql);
        for(int i=0;i<arr.size();i++)
        {
            ps.setString(i+1,arr.get(i));
        }
        ResultSet resultSet=ps.executeQuery();
        while (resultSet.next())
        {
            CourseSemester courseSemester=new CourseSemester();
            courseSemester.setCapacity(resultSet.getInt("capacity"));
            courseSemester.setCno(resultSet.getString("cno"));
            courseSemester.setLocation(resultSet.getString("location"));
            courseSemester.setSemester(resultSet.getString("semester"));
            courseSemester.setTno(resultSet.getString("tno"));
            courseSemester.setWeekbegin(resultSet.getInt("weekbegin"));
            courseSemester.setWeekend(resultSet.getInt("weekend"));
            courseSemester.setStatus(resultSet.getInt("status"));
            result.add(courseSemester);
        }
        return result;
    }

    public ArrayList<Course_select> select_course(String semester, String cnolist,String sno) throws SQLException {
        Connection connection=DB.getConnection();


        String done_sql="select cno from study_course where sno=? and semester=?";
        PreparedStatement done_ps=connection.prepareStatement(done_sql);
        done_ps.setString(1,sno);
        done_ps.setString(2,semester);
        ResultSet resultset= done_ps.executeQuery();
        ArrayList<String> cno_done_list=new ArrayList<String>();
        while(resultset.next())
            cno_done_list.add(resultset.getString("cno"));
        DB.close(resultset);


        String sql="select course_semester.*,course.cname,course.introduction,teacher.tname from course_semester " +
                "left join course on course.cno=course_semester.cno " +
                "left join teacher on course_semester.tno=teacher.tno " +
                "where course_semester.semester=? and  course_semester.cno in "+cnolist+" and course_semester.capacity>0";
        PreparedStatement ps=connection.prepareStatement(sql);
        ps.setString(1,semester);
        ResultSet resultSet=ps.executeQuery();
        ArrayList<Course_select> result=new ArrayList<Course_select>();
        while(resultSet.next())
        {
            Course_select course_select=new Course_select();
            course_select.setCno(resultSet.getString("cno"));
            course_select.setCname(resultSet.getString("cname"));
            course_select.setTno(resultSet.getString("tno"));
            course_select.setSemester(resultSet.getString("semester"));
            course_select.setTname(resultSet.getString("tname"));
            course_select.setCapacity(resultSet.getInt("capacity"));
            course_select.setLocation(resultSet.getString("location"));
            course_select.setStatus(resultSet.getString("status"));
            course_select.setWeekbegin(resultSet.getInt("weekbegin"));
            course_select.setWeekend(resultSet.getInt("weekend"));
            course_select.setIntroduction(resultSet.getString("introduction"));
            if(cno_done_list.indexOf(course_select.getCno())==-1)
                course_select.setIsselected("0");
            else
                course_select.setIsselected("1");
            result.add(course_select);
        }
        DB.close(connection,ps,resultSet);
        return result;
    }
}

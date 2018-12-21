package DB;

import model.CourseSemester;

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
}

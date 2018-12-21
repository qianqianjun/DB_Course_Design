package servlets.course;

import DB.CourseDB;
import DB.CourseSemesterDB;
import DB.DB;
import com.alibaba.fastjson.JSON;
import model.Course;
import model.CourseSemester;

import javax.print.attribute.standard.PrinterName;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/getcourseinfo")
public class getcourseinfo extends HttpServlet {
    public ArrayList<CourseSemester> getdata(String cno,String cname,String college) throws SQLException {
        String sql="SELECT course_semester.*,course.cname,course.dept FROM `course_semester` " +
                "left join course on course.cno=course_semester.cno where 1 ";
        ArrayList<CourseSemester> res=new ArrayList<CourseSemester>();
        Connection connection=DB.getConnection();
        PreparedStatement ps=null;
        ResultSet resultSet=null;
        if(cno.equals(""))
        {
            List<String> temp=new ArrayList<String>();
            String sqlcname=" and 1 ";
            String sqlcollege=" and 1 ";
            if(!cname.equals("")) {
                sqlcname = " and course.cname like ? ";
                temp.add("%"+cname+"%");
            }
            if(!college.equals("all"))
            {
                sqlcollege="and course.dept=?";
                temp.add(college);
            }
            sql+=sqlcname+sqlcollege;
            ps=connection.prepareStatement(sql);
            for(Integer i=0;i<temp.size();i++)
                ps.setString(i+1,temp.get(i));
            resultSet=ps.executeQuery();
            while(resultSet.next())
            {
                CourseSemester courseSemester=new CourseSemester();
                courseSemester.setCno(resultSet.getString("cno"));
                courseSemester.setCapacity(resultSet.getInt("capacity"));
                courseSemester.setLocation(resultSet.getString("location"));
                courseSemester.setSemester(resultSet.getString("semester"));
                courseSemester.setTno(resultSet.getString("tno"));
                courseSemester.setWeekbegin(resultSet.getInt("weekbegin"));
                courseSemester.setWeekend(resultSet.getInt("weekend"));
                courseSemester.setStatus(resultSet.getInt("status"));
                courseSemester.setCname(resultSet.getString("cname"));
                res.add(courseSemester);
            }
//            System.out.println(ps.toString());
            DB.close(connection,ps,resultSet);
            return res;
        }
        else
        {
            //直接查询课程号就好;
            sql+="and course_semester.cno=?";
            ps=connection.prepareStatement(sql);
            ps.setString(1,cno);
            resultSet=ps.executeQuery();
            if(resultSet.next())
            {
                CourseSemester courseSemester=new CourseSemester();
                courseSemester.setCno(resultSet.getString("cno"));
                courseSemester.setCapacity(resultSet.getInt("capacity"));
                courseSemester.setLocation(resultSet.getString("location"));
                courseSemester.setSemester(resultSet.getString("semester"));
                courseSemester.setTno(resultSet.getString("tno"));
                courseSemester.setWeekbegin(resultSet.getInt("weekbegin"));
                courseSemester.setWeekend(resultSet.getInt("weekend"));
                courseSemester.setStatus(resultSet.getInt("status"));
                courseSemester.setCname(resultSet.getString("cname"));
                res.add(courseSemester);
            }
            DB.close(connection,ps,resultSet);
//            System.out.println(ps.toString());
            return res;
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        String cno=request.getParameter("cno");
        String cname=request.getParameter("cname");
        String college=request.getParameter("college");
        ArrayList<CourseSemester> res=null;
        try {
            res=getdata(cno,cname,college);
            String json=JSON.toJSONString(res);
            PrintWriter printWriter=response.getWriter();
//            System.out.println(json);
            printWriter.println(json);
            printWriter.flush();
            printWriter.close();
            response.setStatus(200);
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(500);
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

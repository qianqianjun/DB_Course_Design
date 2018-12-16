package servlets.root;

import DB.DB;

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

@WebServlet("/arrangecourse")
public class arrangecourse extends HttpServlet {
    public String getSemester()
    {
        return null;
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        String cno=request.getParameter("cno");
        String tno=request.getParameter("tno");
        String capaticy=request.getParameter("capacity");
        String startweek=request.getParameter("startweek");
        String endweek=request.getParameter("endweek");
        String location=request.getParameter("location");
        String runtime=request.getParameter("runtime");

        Connection connection= DB.getConnection();
        PreparedStatement ps=null;
        PreparedStatement ps_runtime = null;
        PreparedStatement ps_semester = null;
        PreparedStatement ps_course=null;
        PreparedStatement ps_teacher=null;
        ResultSet resultSet=null;
        String semester="";
        Integer result_status=2;
        try {
            String sql="SELECT * FROM `semester` order by beginyear desc, number desc";
            ps=connection.prepareStatement(sql);
            resultSet=ps.executeQuery();
            if(resultSet.next())
            {
                semester+=resultSet.getString("beginyear")+"-";
                semester+=resultSet.getString("endyear")+"学年第";
                semester+=resultSet.getString("number")+"学期";
            }
            if(semester=="")
            {
                result_status=3;
            }
            else {
                String teachersql="select * from teacher where tno=?";
                ps_teacher=connection.prepareStatement(teachersql);
                ps_teacher.setString(1,tno);
                resultSet=ps_teacher.executeQuery();
                if(resultSet.next()) {
                    //准备插入course_runtime的数据：
                    String insert_sql = "insert into course_runtime (semester,cno,runday,begintime,endtime) values ";
                    String[] eachtime = runtime.split("%");
                    String tempsql = "('" + semester + "','" + cno + "',";
                    for (int i = 0; i < eachtime.length; i++) {
                        String[] temp = eachtime[i].split("-");
                        if (i == eachtime.length - 1)
                            insert_sql += tempsql + "'" + temp[0] + "','" + temp[1] + "','" + temp[2] + "')";
                        else
                            insert_sql += tempsql + "'" + temp[0] + "','" + temp[1] + "','" + temp[2] + "'),";
                    }
                    //准备插入course_semester的数据：
                    String course_semester_insert = "insert into course_semester (cno,semester,tno,weekbegin,weekend,capacity," +
                            "location,status) values(?,?,?,?,?,?,?,?)";
                    //准备修改课程的状态:
                    String course_sql = "update course set status=? where cno=?";
                    ps_course = connection.prepareStatement(course_sql);
                    ps_course.setInt(1, 1);
                    ps_course.setString(2, cno);
                    connection.setAutoCommit(false);
                    ps_runtime = connection.prepareStatement(insert_sql);
                    ps_semester = connection.prepareStatement(course_semester_insert);
                    ps_semester.setString(1, cno);
                    ps_semester.setString(2, semester);
                    ps_semester.setString(3, tno);
                    ps_semester.setInt(4, Integer.parseInt(startweek));
                    ps_semester.setInt(5, Integer.parseInt(endweek));
                    ps_semester.setInt(6, Integer.parseInt(capaticy));
                    ps_semester.setString(7, location);
                    ps_semester.setInt(8, 0);
                    ps_runtime.executeUpdate();
                    ps_semester.executeUpdate();
                    ps_course.executeUpdate();
                    connection.commit();
                }
                else
                {
                    result_status=4;
                }
            }
        } catch (Exception e) {
            result_status=5;
            e.printStackTrace();
            try {
                connection.rollback();
                ps_runtime.close();
                ps_semester.close();
                ps_course.close();
                ps_teacher.close();
                connection.close();
                ps.close();
                resultSet.close();
            } catch (Exception e1) {
                e1.printStackTrace();
            }
        }
        switch (result_status){
            case 2:{response.setStatus(200);break;}
            case 3:{response.setStatus(301);break;}
            case 4:{response.setStatus(404);break;}
            case 5:{response.setStatus(500);break;}
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

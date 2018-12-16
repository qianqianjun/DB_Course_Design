package servlets.course;
import DB.CourseDB;
import model.Course;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
@WebServlet("/AddCourseServlet")
public class AddCourseServlet extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        String cno=request.getParameter("cno");
        String cname=request.getParameter("cname");
        String dept=request.getParameter("dept");
        String pcno=request.getParameter("pcno");
        String settno=request.getParameter("settno");
        String introduction =request.getParameter("introduce");
        Course course=new Course();
        course.setCname(cname);
        course.setCno(cno);
        course.setDept(dept);
        course.setPcno(pcno);
        course.setSettno(settno);
        course.setIntroduction(introduction);
        System.out.println(course.getDept());
        System.out.println(course.getSettno());
        CourseDB courseDB=new CourseDB();
        Boolean result=courseDB.addCourse(course);
        PrintWriter printWriter=response.getWriter();
        if(result){
            String  content="<script type='text/javascript'>alert('添加成功，已经提交到教务处！');" +
                    "window.location.href='"+request.getContextPath()+"/app/addcourse.jsp';</script>";
            printWriter.print(content);
        }
        else
        {
            printWriter.print("<script type='text/javascript'>alert('添加失败，请联系教务处！');history.back();</script>");
        }
    }
}
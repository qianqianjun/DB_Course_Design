package servlets;

import DB.*;
import model.*;
import view.Course_select;
import view.Course_teach;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/content")
public class content extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        try {
            String type = (String) session.getAttribute("type");
            if (type.equals("root")) {
                MessageDB messageDB = new MessageDB();
                List<Message> result = messageDB.getAllUncomplete();
                CourseDB courseDB = new CourseDB();
                List<Course> courseapp = courseDB.getAllUncompleCourse();
                request.setAttribute("helpList", result);
                request.setAttribute("newcourse", courseapp);
                request.getRequestDispatcher("app/content.jsp").forward(request, response);
            } else if (type.equals("student")) {
                Student student =(Student) session.getAttribute("userinfo");
                String sno=student.getSno();
                String semester=(String) session.getAttribute("semester");
                if(semester==null) {
                    response.setStatus(500);
                    PrintWriter printWriter =response.getWriter();
                    printWriter.print("<script>alert('学期表出现错误！请联系管理员！');window.location.href='"+request.getContextPath()+"/index.jsp';</script>");
                    printWriter.flush();
                    printWriter.close();
                }
                NoticeDB noticeDB = new NoticeDB();
                StudyCourseDB studyCourseDB=new StudyCourseDB();
                try {
                    List<Notice> result = noticeDB.getNotice();
                    List<Course_select> course_table=studyCourseDB.getCourseTableList(sno,semester);
                    List<StudyCourse> gradelist=studyCourseDB.getGradeList(sno,semester);
                    request.setAttribute("noticelist", result);
                    request.setAttribute("course_table_list",course_table);
                    request.setAttribute("grade_list",gradelist);
                    request.getRequestDispatcher("app/content.jsp").forward(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            } else if (type.equals("teacher")) {
                String semester=(String) session.getAttribute("semester");
                Teacher teacher=(Teacher) session.getAttribute("userinfo");
                String tno=teacher.getTno();
                NoticeDB noticeDB = new NoticeDB();
                Course_teacheDB db=new Course_teacheDB();
                ArrayList<Course_teach> teach_list=db.getTeachList(semester,tno);
                List<Notice> result = noticeDB.getNotice();
                request.setAttribute("noticelist", result);
                request.setAttribute("teachlist",teach_list);
                request.getRequestDispatcher("app/content.jsp").forward(request, response);
            }
        }
        catch (Exception e)
        {
            PrintWriter printWriter=response.getWriter();
            printWriter.println("<script>window.location.href='"+request.getContextPath()+"'</script>");
            printWriter.flush();
            printWriter.close();
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

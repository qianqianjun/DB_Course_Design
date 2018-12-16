package servlets;

import DB.CourseDB;
import DB.MessageDB;
import DB.NoticeDB;
import model.Course;
import model.Message;
import model.Notice;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
                NoticeDB noticeDB = new NoticeDB();
                try {
                    List<Notice> result = noticeDB.getNotice();
                    request.setAttribute("noticelist", result);
                    request.getRequestDispatcher("app/content.jsp").forward(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            } else if (type.equals("teacher")) {

            }
        }
        catch (Exception e)
        {
            PrintWriter printWriter=response.getWriter();
            printWriter.println("<script>window.location.href='"+request.getContextPath()+"'</script>");
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

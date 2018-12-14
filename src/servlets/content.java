package servlets;

import DB.CourseDB;
import DB.MessageDB;
import model.Course;
import model.Message;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/content")
public class content extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        if(session==null)
        {
            //登录已经过期：
            request.getRequestDispatcher(request.getContextPath()+"index.jsp").forward(request,response);
        }
        else {
            String type = (String) session.getAttribute("type");
            if (type.equals("root")) {
                MessageDB messageDB = new MessageDB();
                List<Message> result = messageDB.getAllUncomplete();
                CourseDB courseDB=new CourseDB();
                List<Course> courseapp=courseDB.getAllUncompleCourse();
                request.setAttribute("helpList", result);
                request.setAttribute("newcourse",courseapp);
                request.getRequestDispatcher("app/content.jsp").forward(request, response);
            }
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

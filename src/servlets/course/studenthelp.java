package servlets.course;
import DB.CourseDB;
import DB.MessageDB;
import model.Course;
import model.Message;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/studenthelp")
public class studenthelp extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MessageDB messageDB=new MessageDB();
        List<Message> result=messageDB.getAllUncomplete();
        request.setAttribute("helplist",result);
        request.getRequestDispatcher("app/root/studenthelp.jsp").forward(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

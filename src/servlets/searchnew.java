package servlets;

import DB.CourseDB;
import model.Course;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/searchnew")
public class searchnew extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tno=request.getParameter("tno");
        String college=request.getParameter("college");
        CourseDB courseDB=new CourseDB();
        try {
            List<Course> courselist=courseDB.SelectByCondition(tno,college);
            request.setAttribute("courselist",courselist);
            request.getRequestDispatcher("app/root/newcourse.jsp").forward(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

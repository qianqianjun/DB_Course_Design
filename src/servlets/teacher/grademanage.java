package servlets.teacher;

import DB.CourseSemesterDB;
import model.CourseSemester;
import model.Teacher;

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

@WebServlet("/grademanage")
public class grademanage extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        HttpSession session=request.getSession();
        Teacher teacher=(Teacher) session.getAttribute("userinfo");
        if(teacher==null)
        {
            response.setStatus(302);
            response.sendRedirect(request.getContextPath());
        }
        String semester=(String) session.getAttribute("semester");
        String tno=teacher.getTno();
        CourseSemesterDB db=new CourseSemesterDB();
        Integer status=0;
        ArrayList<CourseSemester> arr= null;
        try {
            arr = db.getTeachlist(tno,semester,status);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("gradelist",arr);
        request.getRequestDispatcher("app/teacher/gradecourse.jsp").forward(request,response);
    }
}

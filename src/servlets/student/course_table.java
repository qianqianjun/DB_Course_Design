package servlets.student;

import DB.CourseSemesterDB;
import DB.SemesterDB;
import model.CourseSemester;
import model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/course_table")
public class course_table extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        if(session==null)
        {
            request.getRequestDispatcher(request.getContextPath()).forward(request,response);
        }
        String semester=(String) session.getAttribute("semester");
        Student student=(Student) session.getAttribute("userinfo");
        String sno=student.getSno();
        CourseSemesterDB db=new CourseSemesterDB();
//        ArrayList<CourseSemester> res=db.getCourseTable(semester,sno);
//        request.setAttribute("courselist",res);
//        request.getRequestDispatcher("app/student/course_table.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        if(session==null)
        {
            request.getRequestDispatcher(request.getContextPath()).forward(request,response);
        }
        SemesterDB semesterDB=new SemesterDB();
        ArrayList<String> semesterlist=null;
        try {
            semesterlist=semesterDB.getSemesterList();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("semesterlist",semesterlist);
        request.getRequestDispatcher("app/student/course_table.jsp").forward(request,response);
    }
}

package servlets.student;

import DB.CourseSemesterDB;
import DB.SemesterDB;
import DB.StudyCourseDB;
import com.alibaba.fastjson.JSON;
import model.CourseSemester;
import model.Student;
import model.StudyCourse;
import view.CourseTable;

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

@WebServlet("/course_table")
public class course_table extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        HttpSession session=request.getSession();
        if(session==null)
        {
            request.getRequestDispatcher(request.getContextPath()).forward(request,response);
        }
        String semester=request.getParameter("semester");
        String sno=request.getParameter("sno");
        StudyCourseDB db=new StudyCourseDB();
        ArrayList<CourseTable> res= null;
        try {
            res = db.getCourseTable(semester,sno);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String json= JSON.toJSONString(res);
        PrintWriter printWriter=response.getWriter();
        printWriter.print(json);
        printWriter.flush();
        printWriter.close();
        response.setStatus(200);
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

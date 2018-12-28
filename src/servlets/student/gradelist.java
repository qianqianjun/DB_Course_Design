package servlets.student;

import DB.SemesterDB;
import DB.StudyCourseDB;
import com.alibaba.fastjson.JSON;
import model.StudyCourse;
import model.User;

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

@WebServlet("/gradelist")
public class gradelist extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        String cno=request.getParameter("cno");
        String cname=request.getParameter("cname");
        String semester=request.getParameter("semester");
        StudyCourseDB db=new StudyCourseDB();
        ArrayList<StudyCourse> courselist= null;
        try {
            courselist = db.searchGrade(cno,cname,semester);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String json= JSON.toJSONString(courselist);
        PrintWriter p=response.getWriter();
        p.print(json);
        p.flush();
        p.close();
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
        request.getRequestDispatcher("app/student/gradelist.jsp").forward(request,response);
    }
}

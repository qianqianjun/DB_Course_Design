package servlets.publicfun;

import DB.StudentDB;
import DB.TeacherDB;
import com.sun.org.apache.xpath.internal.operations.Bool;
import model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/changeinfo")
public class changeinfo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        String identity = request.getParameter("identity");
        String kind = request.getParameter("kind");
        String value = request.getParameter("value");
        String account = request.getParameter("account");
        if (identity.equals("teacher")) {
            String sql = "update teacher set ";
            TeacherDB teacherDB = new TeacherDB();
            Boolean ok = null;
            try {
                ok = teacherDB.changeInfo(sql,account, kind, value);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            if (ok) {
                response.setStatus(200);
            } else {
                response.setStatus(404);
            }
        } else {
            String sql = "update student set ";
            StudentDB studentDB = new StudentDB();
            Boolean ok = null;
            try {
                ok = studentDB.changeInfo(sql,account, kind, value);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            if (ok) {
                response.setStatus(200);
            } else {
                response.setStatus(404);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

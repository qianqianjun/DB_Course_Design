package servlets.root;

import DB.SelectListDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/managerun")
public class managerun extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        String type=request.getParameter("type");
        String semester=request.getParameter("semester");
        String major=request.getParameter("major");
        SelectListDB selectListDB=new SelectListDB();
        Boolean ok= null;
        try {
            ok = selectListDB.changeStatus(type,semester,major);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(ok)
            response.setStatus(200);
        else{
            response.setStatus(501);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

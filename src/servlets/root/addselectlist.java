package servlets.root;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addselectlist")
public class addselectlist extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String semester=request.getParameter("semester");
        String major=request.getParameter("major");
        String cnoset=request.getParameter("cno");
        System.out.println(major);
        System.out.println(semester);
        String cno="("+cnoset.substring(1,cnoset.length()-1)+")";
        System.out.println(cno);
        response.setStatus(200);

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

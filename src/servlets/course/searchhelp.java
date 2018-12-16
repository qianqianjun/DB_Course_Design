package servlets.course;

import DB.MessageDB;
import model.Message;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/searchhelp")
public class searchhelp extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sno=request.getParameter("sno");
        String status=request.getParameter("status");
        MessageDB messageDB=new MessageDB();
        List<Message> helplist= null;
        try {
            helplist = messageDB.SelectByCondition(sno,status);
            request.setAttribute("helplist",helplist);
            request.getRequestDispatcher("app/root/studenthelp.jsp").forward(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
            PrintWriter printWriter=response.getWriter();
            printWriter.println("<script>alert('失败');history.back();</script>");
            printWriter.flush();
            printWriter.close();
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");
        MessageDB messageDB=new MessageDB();
        List<Message> helplist=new ArrayList<Message>();
        try {
            Message message=messageDB.SelectById(Integer.parseInt(id));
            helplist.add(message);
            request.setAttribute("helplist",helplist);
            request.getRequestDispatcher("app/root/studenthelp.jsp").forward(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
            PrintWriter printWriter=response.getWriter();
            printWriter.println("<script>alert('失败');history.back();</script>");
            printWriter.flush();
            printWriter.close();
        }
    }
}

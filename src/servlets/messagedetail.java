package servlets;

import DB.MessageDB;
import model.Message;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/messagedetail")
public class messagedetail extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");
        MessageDB messageDB=new MessageDB();
        Message message=messageDB.getMessageById(id);
        request.setAttribute("message",message);
        request.getRequestDispatcher("app/root/helpdetail.jsp").forward(request,response);
    }
}

package servlets.student;

import DB.MessageDB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
@WebServlet("/sendMessageServlet")
public class sendMessageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        String sno=request.getParameter("sno");
        String title=request.getParameter("title");
        String content=request.getParameter("content");
        MessageDB messageDB=new MessageDB();
        Boolean result=messageDB.add(sno,content,title);
        PrintWriter printWriter=response.getWriter();
        if(result)
        {
            printWriter.print("<script type='text/javascript'>alert('提交成功！');window.location.href='"+request.getContextPath()+"/app/student/sendmessage.jsp';</script>");
            printWriter.flush();
        }
        else
        {
            printWriter.print("<script type='text/javascript'>alert('提交失败！');history.back();</script>");
            printWriter.flush();
        }
        printWriter.close();
    }
}

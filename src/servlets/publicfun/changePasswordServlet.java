package servlets.publicfun;
import DB.UserDB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
@WebServlet("/changePasswordServlet")
public class changePasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        String account=request.getParameter("account");
        String type=request.getParameter("type");
        String oldpassword=request.getParameter("oldpassword");
        String newpassword=request.getParameter("newpassword");
        UserDB userDB=new UserDB();
        Boolean res=userDB.changePassword(account,oldpassword,type,newpassword);
        PrintWriter printWriter=response.getWriter();
        if(res)
            printWriter.print("<script type='text/javascript'>alert('修改成功！');window.location.href='"+request.getContextPath()+"/app/content.jsp'</script>);");
        else
            printWriter.print("<script type='text/javascript'>alert('修改失败，密码不正确');history.back();</script>");
        printWriter.flush();
        printWriter.close();
    }
}

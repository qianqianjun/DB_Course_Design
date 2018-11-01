package servlets;

import DB.StudentDB;
import DB.UserDB;
import model.Student;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account=request.getParameter("yhm");
        String password=request.getParameter("mm");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        //response.setStatus(302);
        //如果用户名和密码是空的：
        if(account==""||password=="")
        {
            PrintWriter printWriter=response.getWriter();
            printWriter.println("您的用户名或者密码为空，请重新登陆");
            printWriter.flush();
            printWriter.close();
        }
        else
        {
            //查询用户表中是否存在信息：
            UserDB userDB=new UserDB();
            User user=userDB.login(account,password);
            if(user==null) {
                System.out.println("账号名或者密码不正确！");
                PrintWriter printWriter=response.getWriter();
                printWriter.print("<script type='text/javascript'>alert('用户名或者密码错误！');window.location.href='"+request.getContextPath()+"/index.jsp'</script>");
                printWriter.flush();
                printWriter.close();
            }
            else
            {
                //查询学生表详细信息，并设置session
                StudentDB studentDB=new StudentDB();
                Student student=studentDB.getInfo(user.getAccount());
                HttpSession session=request.getSession();
                session.setAttribute("userinfo",student);
                //跳转到content页面：
                response.setStatus(302);
                response.sendRedirect(request.getContextPath()+"/app/content.jsp");
            }
        }
    }
}

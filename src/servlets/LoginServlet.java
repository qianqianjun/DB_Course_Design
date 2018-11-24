package servlets;
import DB.StudentDB;
import DB.TeacherDB;
import DB.UserDB;
import model.Student;
import model.Teacher;
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
        String account=request.getParameter("account");
        String password=request.getParameter("password");
        String type=request.getParameter("type");
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
            UserDB userDB=new UserDB();
            User user=userDB.login(account,password,type);
            if(user==null) {
                PrintWriter printWriter=response.getWriter();
                printWriter.print("<script type='text/javascript'>alert('用户名或者密码错误！');window.location.href='"+request.getContextPath()+"/index.jsp'</script>");
                printWriter.flush();
                printWriter.close();
            }
            if(type.equals("student".toString()))
            {
                //查询学生表详细信息，并设置session
                StudentDB studentDB=new StudentDB();
                Student student=studentDB.getInfo(user.getAccount());
                if(student==null)
                {
                    PrintWriter printWriter=response.getWriter();
                    printWriter.print("<script type='text/javascript'>alert('没有您的登录信息，请联系管理员！');window.location.href='"+request.getContextPath()+"/index.jsp'</script>");
                    printWriter.flush();
                    printWriter.close();
                }
                else {
                    HttpSession session = request.getSession();
                    session.setAttribute("userinfo", student);
                    //跳转到content页面：
                    response.setStatus(302);
                    response.sendRedirect(request.getContextPath() + "/app/content.jsp");
                }
            }
            else if(type.equals("teacher"))
            {
                //查询教师表详细信息，并设置session
                TeacherDB teacherDB=new TeacherDB();
                Teacher teacher=teacherDB.getInfo(user.getAccount());
                if(teacher==null)
                {
                    PrintWriter printWriter=response.getWriter();
                    printWriter.print("<script type='text/javascript'>alert('没有您的登录信息，请联系管理员！');window.location.href='"+request.getContextPath()+"/index.jsp'</script>");
                    printWriter.flush();
                    printWriter.close();
                }
                else {
                    HttpSession session = request.getSession();
                    session.setAttribute("userinfo", teacher);
                    //跳转到content页面：
                    response.setStatus(302);
                    response.sendRedirect(request.getContextPath() + "/app/content.jsp");
                }
            }
            else if(type.equals("root")) {
                TeacherDB teacherDB = new TeacherDB();
                Teacher teacher = teacherDB.getInfo(user.getAccount());
                if (teacher == null) {
                    PrintWriter printWriter = response.getWriter();
                    printWriter.print("<script type='text/javascript'>alert('没有您的登录信息，请联系管理员！');window.location.href='" + request.getContextPath() + "/index.jsp'</script>");
                    printWriter.flush();
                    printWriter.close();
                } else {
                    teacher.setType("root");
                    HttpSession session = request.getSession();
                    session.setAttribute("userinfo", teacher);
                    //跳转到content页面：
                    response.setStatus(302);
                    response.sendRedirect(request.getContextPath() + "/app/content.jsp");
                }
            }
        }
    }
}

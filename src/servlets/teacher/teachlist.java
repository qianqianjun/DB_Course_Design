package servlets.teacher;

import DB.Course_teacheDB;
import com.alibaba.fastjson.JSON;
import model.Teacher;
import view.Course_teach;

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

@WebServlet("/teachlist")
public class teachlist extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        String semester=request.getParameter("semester");
        String cno=request.getParameter("cno");
        Course_teacheDB db=new Course_teacheDB();
        ArrayList<String> result= null;
        try {
            result = db.getTeachTime(semester,cno);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String json= JSON.toJSONString(result);
        PrintWriter printWriter=response.getWriter();
        printWriter.print(json);
        printWriter.flush();
        printWriter.close();
        response.setStatus(200);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        Teacher teacher=(Teacher) session.getAttribute("userinfo");
        if(teacher==null)
        {
            PrintWriter printWriter=response.getWriter();
            printWriter.print("<script>alert('登录信息已过期！');" +
                    "window.location.href='"+request.getContextPath()+"/index.jsp';</script>");
            printWriter.flush();
            printWriter.close();
        }
        else{
            String semester=(String) session.getAttribute("semester");
            String tno=teacher.getTno();
            Course_teacheDB db=new Course_teacheDB();
            ArrayList<Course_teach> courselist= null;
            try {
                courselist = db.getTeachListMore(tno,semester);
            } catch (SQLException e) {
                e.printStackTrace();
                PrintWriter printWriter=response.getWriter();
                printWriter.print("fail to get the list!");
                printWriter.flush();
                printWriter.close();
            }
            request.setAttribute("courselist",courselist);
            request.getRequestDispatcher("app/teacher/teachlist.jsp").forward(request,response);

        }
    }
}

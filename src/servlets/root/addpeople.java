package servlets.root;

import DB.StudentDB;
import DB.TeacherDB;
import model.Student;
import model.Teacher;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/addpeople")
public class addpeople extends HttpServlet {
    private static void tips(Boolean ok,HttpServletResponse response,HttpServletRequest request) throws IOException {
        if(ok)
        {
            response.setStatus(200);
            PrintWriter printWriter=response.getWriter();
            printWriter.println("<script>alert('添加成功');window.location.href='"+request.getContextPath()+"/app/root/addnewpeople.jsp';</script>");
            printWriter.flush();
            printWriter.close();
        }
        else
        {
            response.setStatus(500);
            PrintWriter printWriter=response.getWriter();
            printWriter.println("<script>alert('添加失败');history.back();</script>");
            printWriter.flush();
            printWriter.close();
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        String type=request.getParameter("type");
        if(type.equals("student"))
        {
            String sno=request.getParameter("sno");
            String sname=request.getParameter("sname");
            String sex=request.getParameter("sex");
            String klass=request.getParameter("klass");
            String college=request.getParameter("college");
            String major=request.getParameter("major");
            Student student=new Student();
            student.setSex(sex);
            student.setSname(sname);
            student.setSno(sno);
            student.setMajor(major);
            student.setCollege(college);
            student.setKlass(klass);
            StudentDB studentDB=new StudentDB();
            Boolean ok= null;
            try {
                ok = studentDB.add(student);
            } catch (SQLException e) {
                e.printStackTrace();
                PrintWriter printWriter=response.getWriter();
                printWriter.println("<script>alert('服务器异常');history.back();</script>");
                printWriter.flush();
                printWriter.close();
            }
            tips(ok,response,request);
        }
        else if(type.equals("teacher"))
        {
            String tno=request.getParameter("tno");
            String tname=request.getParameter("tname");
            String sex=request.getParameter("sex");
            String rank=request.getParameter("rank");
            String tdept=request.getParameter("tdept");
            String location1=request.getParameter("location1");
            String location2=request.getParameter("location2");
            String phone=request.getParameter("phone");
            Teacher teacher=new Teacher();
            teacher.setLocation(location1+location2);
            teacher.setSex(sex);
            teacher.setTdept(tdept);
            teacher.setTname(tname);
            teacher.setRank(rank);
            teacher.setPhone(phone);
            teacher.setTno(tno);
            TeacherDB teacherDB=new TeacherDB();
            Boolean ok= null;
            try {
                ok = teacherDB.add(teacher);
            } catch (SQLException e) {
                e.printStackTrace();
                PrintWriter printWriter=response.getWriter();
                printWriter.println("<script>alert('服务器异常');history.back();</script>");
                printWriter.flush();
                printWriter.close();
            }
            tips(ok,response,request);
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

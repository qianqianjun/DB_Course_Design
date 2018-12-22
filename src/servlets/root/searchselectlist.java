package servlets.root;

import DB.SelectListDB;
import com.alibaba.fastjson.JSON;
import model.SelectList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/searchselectlist")
public class searchselectlist extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        String semester=request.getParameter("semester");
        String major=request.getParameter("major");
        String status=request.getParameter("status");
        SelectListDB selectListDB=new SelectListDB();
        ArrayList<SelectList> result=new ArrayList<SelectList>();
        try {
            result=selectListDB.getinfoByCondition(major,semester,status);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String jsonString= JSON.toJSONString(result);
        PrintWriter printWriter=response.getWriter();
        printWriter.println(jsonString);
        printWriter.flush();
        printWriter.close();
        response.setStatus(200);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

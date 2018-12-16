package servlets.root;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
@WebServlet("/runinfo")
public class runinfo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        String cno=request.getParameter("cno");
        Object[] res=new Object[2];
        String [] row=new String[3];
        row[0]="高谦";
        row[1]="2016014302";
        row[2]="1-17周";
        res[0]=row;
        String[] row2=new String[3];
        row2[0]="周一";
        row2[1]="3-5节";
        row2[2]="B阶-104";
        res[1]=row2;
        Object Infotemp= JSONObject.toJSON(res);
        Object returnvalue= JSONArray.toJSON(Infotemp);
        PrintWriter printWriter=response.getWriter();
        printWriter.println(returnvalue);
        response.setStatus(200);
        printWriter.flush();
        printWriter.close();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

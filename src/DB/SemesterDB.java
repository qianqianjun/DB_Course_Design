package DB;

import javax.xml.transform.Result;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SemesterDB {
    public String getCurrentSemester() throws SQLException {
        Connection connection=DB.getConnection();
        String sql="SELECT * FROM `semester` order by beginyear desc,endyear desc,number desc LIMIT 1";
        PreparedStatement ps=connection.prepareStatement(sql);
        ResultSet resultSet=ps.executeQuery();
        String result="";
        if(resultSet.next())
        {
            result+=resultSet.getString("beginyear")+"-";
            result+=resultSet.getString("endyear")+"学年第";
            result+=resultSet.getString("number")+"学期";
        }
        DB.close(connection,ps);
        return result;
    }
    public ArrayList<String> getSemesterList() throws SQLException{
        ArrayList<String> result=new ArrayList<String>();
        String sql="SELECT * FROM `semester` order by beginyear desc,endyear desc,number desc";
        Connection connection=DB.getConnection();
        PreparedStatement ps=connection.prepareStatement(sql);
        ResultSet resultSet=ps.executeQuery();
        while(resultSet.next())
        {
            String temp="";
            temp+=resultSet.getString("beginyear")+"-";
            temp+=resultSet.getString("endyear")+"学年第";
            temp+=resultSet.getString("number")+"学期";
            result.add(temp);
        }
        DB.close(connection,ps,resultSet);
        return result;
    }
}

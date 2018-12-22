package DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StudyCourseDB {
    public String getCnoSet(String sno,String semester) throws SQLException {
        Connection connection=DB.getConnection();
        String sql="select cno from study_course where sno=? and semester=?";
        PreparedStatement ps=connection.prepareStatement(sql);
        ps.setString(1,sno);
        ps.setString(2,semester);
        ResultSet resultSet=ps.executeQuery();
        String result="(";
        while(resultSet.next())
        {
            result+="'"+resultSet.getString("cno")+"',";
        }
        result=result.substring(0,result.length()-1)+")";
        return result;
    }
}

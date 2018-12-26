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

    public Boolean Select_Course(String sno, String semester, String cno) throws SQLException {
        Connection connection=DB.getConnection();
        String check="select capacity from course_semester where cno=? and semester=?";
        PreparedStatement ps_check=connection.prepareStatement(check);
        ps_check.setString(1,cno);
        ps_check.setString(2,semester);
        ResultSet resultSet=ps_check.executeQuery();
        Integer capacity=0;
        if(resultSet.next())
        {
            capacity=Integer.parseInt(resultSet.getString("capacity"));
        }
        DB.close(resultSet);
        if(capacity<=0) {
            DB.close(connection,ps_check);
            return false;
        }
        String sql="insert into study_course set sno=?,semester=?,cno=?";
        PreparedStatement ps=connection.prepareStatement(sql);
        ps.setString(1,sno);
        ps.setString(2,semester);
        ps.setString(3,cno);
        String sql_update="update course_semester set capacity=? where cno=? and semester=?";
        PreparedStatement ps_update=connection.prepareStatement(sql_update);
        ps_update.setInt(1,capacity-1);
        ps_update.setString(2,cno);
        ps_update.setString(3,semester);
        connection.setAutoCommit(false);
        try{
            Integer rows=ps.executeUpdate();
            Integer rows2=ps_update.executeUpdate();
            connection.commit();
            if(rows*rows2==0)
            {
                throw new RuntimeException("事务不完整");
            }
            return true;
        }catch (Exception e)
        {
            e.printStackTrace();
            connection.rollback();
            return false;
        }
    }
    public Boolean Cancle_Course(String sno, String semester, String cno) throws SQLException {
        Connection connection=DB.getConnection();
        String check="select capacity from course_semester where cno=? and semester=?";
        PreparedStatement ps_check=connection.prepareStatement(check);
        ps_check.setString(1,cno);
        ps_check.setString(2,semester);
        ResultSet resultSet=ps_check.executeQuery();
        Integer capacity=0;
        if(resultSet.next())
        {
            capacity=Integer.parseInt(resultSet.getString("capacity"));
        }
        DB.close(resultSet);
        String sql="delete from study_course where sno=? and semester=? and cno=?";
        PreparedStatement ps=connection.prepareStatement(sql);
        ps.setString(1,sno);
        ps.setString(2,semester);
        ps.setString(3,cno);
        String sql_update="update course_semester set capacity=? where cno=? and semester=?";
        PreparedStatement ps_update=connection.prepareStatement(sql_update);
        ps_update.setInt(1,capacity+1);
        ps_update.setString(2,cno);
        ps_update.setString(3,semester);
        connection.setAutoCommit(false);
        try{
            Integer row=ps_update.executeUpdate();
            Integer row2=ps.executeUpdate();
            connection.commit();
            if(row*row2==0)
                throw new RuntimeException("事务不完整");
            return true;
        }catch (Exception e)
        {
            e.printStackTrace();
            connection.rollback();
            return false;
        }
    }
}

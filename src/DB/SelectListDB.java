package DB;

import model.SelectList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SelectListDB {
    public ArrayList<SelectList> getinfoByCondition(String major, String semester,String status) throws SQLException {
        ArrayList<SelectList> result=new ArrayList<SelectList>();
        String sql="select * from select_list where 1 ";
        String sql1="and 1 ";
        String sql2="and 1 ";
        String sql3="and 1 ";
        List<String> par=new ArrayList<String>();
        if(!major.equals("all"))
        {
            sql1="and major = ? ";
            par.add(major);
        }
        if(!semester.equals("all"))
        {
            sql2=" and semester = ? ";
            par.add(semester);
        }
        if(!status.equals("all"))
        {
            sql3="and status=? ";
            par.add(status);
        }
        sql+=sql1+sql2+sql3;
        Connection connection=DB.getConnection();
        PreparedStatement ps=connection.prepareStatement(sql);
        for(Integer i=0;i<par.size();i++)
            ps.setString(i+1,par.get(i));
        ResultSet resultSet=ps.executeQuery();
        while(resultSet.next())
        {
            SelectList selectList=new SelectList();
            selectList.setCno(resultSet.getString("cno"));
            selectList.setMajor(resultSet.getString("major"));
            selectList.setSemester(resultSet.getString("semester"));
            selectList.setStatus(resultSet.getString("status"));
            result.add(selectList);
        }
        DB.close(connection,ps,resultSet);
        return result;
    }
    public Boolean add(String semester, String major, String cno) throws SQLException {
        Connection connection=DB.getConnection();
        String sql="insert into select_list (major,semester,cno,status) values(?,?,?,'0')";
        PreparedStatement ps=connection.prepareStatement(sql);
        ps.setString(1,major);
        ps.setString(2,semester);
        ps.setString(3,cno);
        Integer row=ps.executeUpdate();
        DB.close(connection,ps);
        if(row>0)
            return true;
        return false;
    }
    public Boolean del(String semester,String major,String cno) throws SQLException {
        String sql="delete from select_list where semester=? and major=? and cno=?";
        Connection connection=DB.getConnection();
        PreparedStatement ps=null;
        ps=connection.prepareStatement(sql);
        Integer rows=ps.executeUpdate();
        if(rows>0)
            return true;
        return false;
    }

    public Boolean changeStatus(String type, String semester, String major) throws SQLException {
        Connection connection=DB.getConnection();
        String sql="update select_list set status=? where semester=? and major=?";
        PreparedStatement ps=connection.prepareStatement(sql);
        if(type.equals("stop"))
            ps.setString(1,"0");
        else
            ps.setString(1,"1");
        ps.setString(2,semester);
        ps.setString(3,major);
        Integer rows=ps.executeUpdate();
        DB.close(connection,ps);
        if(rows>0)
            return true;
        return false;
    }
}

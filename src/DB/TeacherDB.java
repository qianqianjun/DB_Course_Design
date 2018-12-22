package DB;

import model.Teacher;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TeacherDB {
    public Teacher getInfo(String tno)
    {
        Connection connection=null;
        PreparedStatement ps=null;
        ResultSet res=null;
        connection=DB.getConnection();
        String sql="select * from teacher where tno=?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1,tno);
            res = ps.executeQuery();
            if(res.next())
            {
                //查到老师的相关信息：
                Teacher teacher=new Teacher();
                teacher.setTno(res.getString("tno"));
                teacher.setTname(res.getString("tname"));
                teacher.setTdept(res.getString("tdept"));
                teacher.setRank(res.getString("rank"));
                teacher.setPhone(res.getString("phone"));
                teacher.setSex(res.getString("sex"));
                teacher.setLocation(res.getString("location"));

                teacher.setWechat(res.getString("wechat"));
                teacher.setQq(res.getString("qq"));
                teacher.setProvince(res.getString("province"));
                teacher.setGraduateschool(res.getString("graduateschool"));
                teacher.setEmail(res.getString("email"));
                teacher.setDegree(res.getString("degree"));
                teacher.setComeyear(res.getString("comeyear"));
                teacher.setCity(res.getString("city"));
                teacher.setDirecition(res.getString("direction"));
                return teacher;
            }
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        finally {
            DB.close(connection,ps,res);
        }
        return null;
    }

    public Boolean add(Teacher teacher) throws SQLException {
        Connection connection=DB.getConnection();
        String sql="insert into teacher set tno=?,tname=?,tdept=?,rank=?,phone=?,location=?,sex=?";
        PreparedStatement ps=connection.prepareStatement(sql);
        ps.setString(1,teacher.getTno());
        ps.setString(2,teacher.getTname());
        ps.setString(3,teacher.getTdept());
        ps.setString(4,teacher.getRank());
        ps.setString(5,teacher.getPhone());
        ps.setString(6,teacher.getLocation());
        ps.setString(7,teacher.getSex());
        Integer rows=ps.executeUpdate();
        if(rows>0)
        {
            sql="insert into user set account=?,password=?,type=?";
            ps=connection.prepareStatement(sql);
            ps.setString(1,teacher.getTno());
            ps.setString(2,teacher.getTno());
            ps.setString(3,"teacher");
            rows=ps.executeUpdate();
            DB.close(connection,ps);
            if(rows>0)
                return true;
        }
        return false;
    }

    public Boolean changeInfo(String sql,String account, String kind, String value) throws SQLException {
        Connection connection=DB.getConnection();
        sql+=kind+"=? where tno=?";
        PreparedStatement ps=connection.prepareStatement(sql);
        ps.setString(1,value);
        ps.setString(2,account);
        Integer rows=ps.executeUpdate();
        DB.close(connection,ps);
        if(rows>0)
            return true;
        else
            return false;
    }
}













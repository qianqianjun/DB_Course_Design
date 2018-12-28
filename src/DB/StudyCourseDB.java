package DB;

import model.Course;
import model.CourseSemester;
import model.StudyCourse;
import view.CourseTable;
import view.Course_select;
import view.StudentInfo;

import javax.xml.transform.Result;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
        DB.close(connection,ps,resultSet);
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

    public List<Course_select> getCourseTableList(String sno, String semester) throws SQLException {
        ArrayList<Course_select> result=new ArrayList<Course_select>();
        Connection connection=DB.getConnection();
        String sql="select course.cname,course_semester.location from study_course " +
                "left join course on study_course.cno=course.cno " +
                "left join course_semester on study_course.cno=course_semester.cno and study_course.semester=course_semester.semester " +
                "where study_course.sno=? and study_course.semester=?";
        PreparedStatement ps=connection.prepareStatement(sql);
        ps.setString(1,sno);
        ps.setString(2,semester);
        ResultSet resultSet=ps.executeQuery();
        while(resultSet.next())
        {
            Course_select temp=new Course_select();
            temp.setCname(resultSet.getString("cname"));
            temp.setLocation(resultSet.getString("location"));
            result.add(temp);
        }
        DB.close(connection,ps,resultSet);
        return  result;
    }

    public ArrayList<StudyCourse> getStudents(String cno, String semester) throws SQLException {
        String sql="select student.sname,study_course.* from study_course " +
                "left join student on study_course.sno=student.sno where study_course.semester=? and study_course.cno=?";
        Connection con=DB.getConnection();
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setString(1,semester);
        ps.setString(2,cno);
        ResultSet set=ps.executeQuery();
        ArrayList<StudyCourse> res=new ArrayList<StudyCourse>();
        while(set.next())
        {
            StudyCourse temp=new StudyCourse();
            temp.setSno(set.getString("sno"));
            temp.setSemester(set.getString("semester"));
            temp.setCno(set.getString("cno"));
            temp.setSname(set.getString("sname"));
            temp.setGrade(set.getString("grade"));
            res.add(temp);
        }
        DB.close(con,ps,set);
        return res;
    }

    public Boolean changeGrade(String sno, String semester, String cno, Integer grade) throws SQLException {
        Connection connection=DB.getConnection();
        String sql="update study_course set grade=? where sno=? and cno=? and semester=?";
        PreparedStatement ps=connection.prepareStatement(sql);
        ps.setInt(1,grade);
        ps.setString(2,sno);
        ps.setString(3,cno);
        ps.setString(4,semester);
        Integer rows=ps.executeUpdate();
        DB.close(connection,ps);
        if(rows>0)
            return true;
        return false;
    }

    public List<StudyCourse> getGradeList(String sno, String semester) throws SQLException {
        List<StudyCourse> res=new ArrayList<StudyCourse>();
        Connection connection=DB.getConnection();
        String sql="select course.cname,study_course.* from study_course left join course on study_course.cno=course.cno " +
                "where study_course.sno=? and study_course.semester=? and study_course.grade is not null";
        PreparedStatement ps=connection.prepareStatement(sql);
        ps.setString(1,sno);
        ps.setString(2,semester);
        ResultSet set=ps.executeQuery();
        while(set.next())
        {
            StudyCourse temp=new StudyCourse();
            temp.setGrade(set.getString("grade"));
            temp.setCno(set.getString("cno"));
            temp.setSemester(set.getString("semester"));
            temp.setSno(sno);
            temp.setCname(set.getString("cname"));
            res.add(temp);
        }
        DB.close(connection,ps,set);
        return res;
    }

    public ArrayList<StudentInfo> getStudentList(String sno, String cno, String semester,String cname) throws SQLException {
        String sql="select student.sname,student.sex,student.college,student.major,student.klass,student.sno from study_course " +
                "left join student on study_course.sno=student.sno " +
                "where study_course.cno=? and study_course.semester=? ";
        String sqlsno=" and 1 ";
        List<String> par=new ArrayList<String>();
        par.add(cno);
        par.add(semester);
        if(!sno.equals(""))
        {
            par.add(sno);
            sqlsno=" and student.sno=? ";
        }
        sql+=sqlsno;
        Connection connection=DB.getConnection();
        PreparedStatement ps=connection.prepareStatement(sql);
        for(int i=0;i<par.size();i++)
            ps.setString(i+1,par.get(i));
        ResultSet set=ps.executeQuery();
        ArrayList<StudentInfo> res=new ArrayList<StudentInfo>();
        while(set.next())
        {
            StudentInfo temp=new StudentInfo();
            temp.setCname(cname);
            temp.setCollege(set.getString("college"));
            temp.setKlass(set.getString("klass"));
            temp.setMajor(set.getString("major"));
            temp.setSex(set.getString("sex"));
            temp.setSname(set.getString("sname"));
            temp.setSno(set.getString("sno"));
            res.add(temp);
        }
        DB.close(connection,ps,set);
        return res;
    }

    public ArrayList<StudyCourse> searchGrade(String cno, String cname, String semester) throws SQLException {
        String sql="select course.cname,study_course.* from study_course left join course on study_course.cno=course.cno " +
                "where study_course.semester=? and study_course.grade is not null ";
        String cnamesql=" and 1 ";
        String cnosql=" and 1 ";
        ArrayList<String> par=new ArrayList<String>();
        par.add(semester);
        if(!cno.equals(""))
        {
            cnosql=" and course.cno = ? ";
            par.add(cno);
        }
        if(!cname.equals(""))
        {
            cnamesql=" and course.cname like ? ";
            par.add("%"+cname+"%");
        }
        sql+=cnosql+cnamesql;
        Connection connection=DB.getConnection();
        PreparedStatement ps=connection.prepareStatement(sql);
        for(int i=0;i<par.size();i++)
            ps.setString(i+1,par.get(i));
        ResultSet set=ps.executeQuery();
        ArrayList<StudyCourse> res=new ArrayList<StudyCourse>();
        while(set.next())
        {
            StudyCourse temp=new StudyCourse();
            temp.setGrade(set.getString("grade"));
            temp.setCno(set.getString("cno"));
            temp.setSemester(set.getString("semester"));
            temp.setCname(set.getString("cname"));
            res.add(temp);
        }
        DB.close(connection,ps,set);
        return res;
    }

    public ArrayList<CourseTable> getCourseTable(String semester, String sno) throws SQLException {
        ArrayList<CourseTable> res=new ArrayList<CourseTable>();
        Connection connection=DB.getConnection();
        String sql="select course.cname,teacher.tname,course_semester.*,course_runtime.runday,course_runtime.begintime,course_runtime.endtime from study_course\n" +
                "left join course_semester on study_course.cno=course_semester.cno\n" +
                "left join teacher on course_semester.tno=teacher.tno\n" +
                "left join course on study_course.cno=course.cno\n" +
                "left join course_runtime on course_semester.cno=course_runtime.cno and course_semester.semester=course_runtime.semester\n" +
                "where study_course.sno=? and study_course.semester=?";
        PreparedStatement ps=connection.prepareStatement(sql);
        ps.setString(1,sno);
        ps.setString(2,semester);
        ResultSet set=ps.executeQuery();
        while(set.next())
        {
            CourseTable temp=new CourseTable();
            temp.setCname(set.getString("cname"));
            temp.setTname(set.getString("tname"));
            temp.setLocation(set.getString("location"));
            temp.setWeekbegin(set.getInt("weekbegin"));
            temp.setWeekend(set.getInt("weekend"));
            temp.setSemester(set.getString("semester"));
            temp.setCno(set.getString("cno"));
            temp.setRunday(set.getInt("runday"));
            temp.setBegintime(set.getInt("begintime"));
            temp.setEndtime(set.getInt("endtime"));
            res.add(temp);
        }
        DB.close(connection,ps,set);
        return res;
    }
}
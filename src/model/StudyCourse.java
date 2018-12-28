package model;

public class StudyCourse {
    private String sno;
    private String semester;
    private String cno;
    private String grade;

    //下面的是view 属性
    private String sname;
    private String cname;
    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getSemester() {
        return semester;
    }

    public String getCno() {
        return cno;
    }

    public String getSno() {
        return sno;
    }

    public String getGrade() {
        return grade;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public void setCno(String cno) {
        this.cno = cno;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }
}

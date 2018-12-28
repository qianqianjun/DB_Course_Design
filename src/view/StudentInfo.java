package view;
public class StudentInfo {
    private String sno;
    private String sname;
    private String college;
    private String sex;
    private String major;
    private String klass;
    private String cname;

    public String getCname() {
        return cname;
    }

    public String getSno() {
        return sno;
    }

    public String getMajor() {
        return major;
    }

    public String getSex() {
        return sex;
    }

    public String getSname() {
        return sname;
    }

    public String getKlass() {
        return klass;
    }

    public String getCollege() {
        return college;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public void setKlass(String klass) {
        this.klass = klass;
    }

    public void setCollege(String college) {
        this.college = college;
    }
}

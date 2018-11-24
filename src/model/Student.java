package model;
/*insert into student
        (sno,sname,collage,sex,major,klass)
        values
        ("2016014302","高谦","信息科学与技术学院","男","计算机科学与技术","计科1601")*/
public class Student {
    private Integer id;
    private String sno;
    private String sname;
    private String college;
    private String sex;
    private String major;
    private String klass;
    private String type="student";

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getId() {
        return id;
    }

    public String getCollege() {
        return college;
    }

    public String getKlass() {
        return klass;
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

    public String getSno() {
        return sno;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public void setKlass(String klass) {
        this.klass = klass;
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

    public void setSno(String sno) {
        this.sno = sno;
    }
}

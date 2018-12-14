package model;

public class Course {
    private Integer id;
    private String cno;
    private String cname;
    private String dept;
    private String pcno;
    private Integer status;
    private String settno;
    private String introduction;

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getIntroduction() {
        return introduction;
    }

    public String getSettno() {
        return settno;
    }

    public void setSettno(String settno) {
        this.settno = settno;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPcno() {
        return pcno;
    }

    public void setPcno(String pcno) {
        this.pcno = pcno;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    public String getCno() {
        return cno;
    }

    public void setCno(String cno) {
        this.cno = cno;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }
}

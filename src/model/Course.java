package model;

public class Course {
    private Integer id;
    private String cno;
    private String cname;
    private String runtime;
    private Integer capacity;
    private Integer status;
    private String dept;
    private String pcno;
    private String tno;
    private String introduce;
    private String weektime;

    public String getWeektime() {
        return weektime;
    }

    public String getIntroduce() {
        return introduce;
    }

    public String getTno() {
        return tno;
    }

    public Integer getId() {
        return id;
    }

    public Integer getCapacity() {
        return capacity;
    }

    public Integer getStatus() {
        return status;
    }

    public String getCname() {
        return cname;
    }

    public String getCno() {
        return cno;
    }

    public String getDept() {
        return dept;
    }

    public String getPcno() {
        return pcno;
    }

    public String getRuntime() {
        return runtime;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setCapacity(Integer capacity) {
        this.capacity = capacity;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public void setCno(String cno) {
        this.cno = cno;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    public void setPcno(String pcno) {
        this.pcno = pcno;
    }

    public void setRuntime(String runtime) {
        this.runtime = runtime;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public void setTno(String tno) {
        this.tno = tno;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public void setWeektime(String weektime) {
        this.weektime = weektime;
    }
}

package model;

public class CourseSemester {
    private String cno;
    private String semester;
    private String tno;
    private Integer weekbegin;
    private Integer weekend;
    private Integer capacity;
    private String location;
    private Integer status;

    //以下是视图属性
    private String cname;

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCname() {
        return cname;
    }

    public String getCno() {
        return cno;
    }

    public Integer getStatus() {
        return status;
    }

    public String getTno() {
        return tno;
    }

    public Integer getCapacity() {
        return capacity;
    }

    public String getLocation() {
        return location;
    }

    public Integer getWeekbegin() {
        return weekbegin;
    }

    public Integer getWeekend() {
        return weekend;
    }

    public String getSemester() {
        return semester;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public void setCno(String cno) {
        this.cno = cno;
    }

    public void setTno(String tno) {
        this.tno = tno;
    }

    public void setCapacity(Integer capacity) {
        this.capacity = capacity;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public void setWeekbegin(Integer weekbegin) {
        this.weekbegin = weekbegin;
    }

    public void setWeekend(Integer weekend) {
        this.weekend = weekend;
    }
}

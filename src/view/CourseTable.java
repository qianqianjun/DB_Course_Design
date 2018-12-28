package view;

public class CourseTable {
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
    private String tname;
    private Integer runday;
    private Integer begintime;
    private Integer endtime;

    public Integer getRunday() {
        return runday;
    }

    public Integer getEndtime() {
        return endtime;
    }

    public Integer getBegintime() {
        return begintime;
    }

    public String getTname() {
        return tname;
    }

    public String getCname() {
        return cname;
    }

    public String getCno() {
        return cno;
    }

    public Integer getCapacity() {
        return capacity;
    }

    public String getLocation() {
        return location;
    }

    public String getSemester() {
        return semester;
    }

    public String getTno() {
        return tno;
    }

    public Integer getWeekend() {
        return weekend;
    }

    public Integer getWeekbegin() {
        return weekbegin;
    }

    public Integer getStatus() {
        return status;
    }

    public void setRunday(Integer runday) {
        this.runday = runday;
    }

    public void setEndtime(Integer endtime) {
        this.endtime = endtime;
    }

    public void setBegintime(Integer begintime) {
        this.begintime = begintime;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public void setCno(String cno) {
        this.cno = cno;
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

    public void setStatus(Integer status) {
        this.status = status;
    }

    public void setTno(String tno) {
        this.tno = tno;
    }

    public void setWeekend(Integer weekend) {
        this.weekend = weekend;
    }

    public void setWeekbegin(Integer weekbegin) {
        this.weekbegin = weekbegin;
    }
}

package view;
public class Course_select {
    private String cno;
    private String semester;
    private String tno;
    private Integer weekbegin;
    private Integer weekend;
    private Integer capacity;
    private String location;
    private String status;
    private String cname;
    private String tname;
    private String isselected;
    private String Introduction;

    public String getIntroduction() {
        return Introduction;
    }
    public void setIntroduction(String introduction) {
        Introduction = introduction;
    }
    public String getCno() {
        return cno;
    }

    public String getSemester() {
        return semester;
    }

    public String getCname() {
        return cname;
    }

    public Integer getWeekend() {
        return weekend;
    }

    public String getLocation() {
        return location;
    }

    public Integer getCapacity() {
        return capacity;
    }

    public String getTno() {
        return tno;
    }

    public String getStatus() {
        return status;
    }

    public String getTname() {
        return tname;
    }

    public Integer getWeekbegin() {
        return weekbegin;
    }

    public void setCno(String cno) {
        this.cno = cno;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public void setWeekend(Integer weekend) {
        this.weekend = weekend;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public void setCapacity(Integer capacity) {
        this.capacity = capacity;
    }

    public void setTno(String tno) {
        this.tno = tno;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public void setWeekbegin(Integer weekbwgin) {
        this.weekbegin = weekbwgin;
    }

    public String getIsselected() {
        return isselected;
    }

    public void setIsselected(String isselected) {
        this.isselected = isselected;
    }
}

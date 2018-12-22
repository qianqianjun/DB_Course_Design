package model;

public class SelectList {
    public String semester;
    public String cno;
    public String major;
    private String status;

    public String getSemester() {
        return semester;
    }

    public String getCno() {
        return cno;
    }

    public String getMajor() {
        return major;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public void setCno(String cno) {
        this.cno = cno;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public void setStatus(String status) {
        this.status=status;
    }
    public String getStatus()
    {
        return this.status;
    }
}

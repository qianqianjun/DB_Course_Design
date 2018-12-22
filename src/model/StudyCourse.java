package model;

public class StudyCourse {
    private String sno;
    private String semester;
    private String cno;
    private String grade;

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

package model;
public class Student {
    private Integer id;
    private String sno;
    private String sname;
    private String college;
    private String sex;
    private String major;
    private String klass;
    private String type="student";


    private String province;
    private String city;
    private String birthday;
    private String phone;
    private String qq;
    private String wechat;
    private String email;
    private String politicalstatus;
    private String nation;
    private String highschool;
    private String foreignlanguage;
    private String status;

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

    public String getBirthday() {
        return birthday;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCity() {
        return city;
    }

    public String getEmail() {
        return email;
    }

    public String getNation() {
        return nation;
    }

    public String getForeignlanguage() {
        return foreignlanguage;
    }

    public String getHighschool() {
        return highschool;
    }

    public String getPhone() {
        return phone;
    }

    public String getPoliticalstatus() {
        return politicalstatus;
    }

    public String getProvince() {
        return province;
    }

    public String getQq() {
        return qq;
    }

    public String getWechat() {
        return wechat;
    }

    public String getStatus() {
        return status;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setHighschool(String highschool) {
        this.highschool = highschool;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public void setForeignlanguage(String foreignlanguage) {
        this.foreignlanguage = foreignlanguage;
    }

    public void setPoliticalstatus(String politicalstatus) {
        this.politicalstatus = politicalstatus;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public void setWechat(String wechat) {
        this.wechat = wechat;
    }
}

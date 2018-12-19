package model;
public class Teacher {
    private Integer id;
    private String tno;
    private String tname;
    private String tdept;
    private String rank;
    private String phone;
    private String location;
    private String sex;
    private String type="teacher";

    private String province;
    private String city;
    private String comeyear;
    private String qq;
    private String wechat;
    private String email;
    private String graduateschool;
    private String degree;
    private String direction;

    public String getWechat() {
        return wechat;
    }

    public String getQq() {
        return qq;
    }

    public String getProvince() {
        return province;
    }

    public String getEmail() {
        return email;
    }

    public String getCity() {
        return city;
    }

    public String getComeyear() {
        return comeyear;
    }

    public String getDegree() {
        return degree;
    }

    public String getGraduateschool() {
        return graduateschool;
    }

    public void setWechat(String wechat) {
        this.wechat = wechat;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setComeyear(String comeyear) {
        this.comeyear = comeyear;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public void setGraduateschool(String graduaeschool) {
        this.graduateschool = graduaeschool;
    }

    public Integer getId() {
        return id;
    }

    public String getPhone() {
        return phone;
    }

    public String getLocation() {
        return location;
    }

    public String getRank() {
        return rank;
    }

    public String getTdept() {
        return tdept;
    }

    public String getTname() {
        return tname;
    }

    public String getTno() {
        return tno;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }

    public void setTdept(String tdept) {
        this.tdept = tdept;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public void setTno(String tno) {
        this.tno = tno;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public void setDirecition(String direction) {
        this.direction=direction;
    }
    public String getDirection()
    {
        return this.direction;
    }
}

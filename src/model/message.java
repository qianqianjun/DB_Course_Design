package model;

public class Message {
    private Integer id;
    private String sno;
    private String content;
    private String sendtime;
    private Integer status;
    private String title;
    public Integer getId() {
        return id;
    }
    public String getSno() {
        return sno;
    }
    public String getContent() {
        return content;
    }

    public String getSendtime() {
        return sendtime;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setSendtime(String sendtime) {
        this.sendtime = sendtime;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }

    public void setContent(String content) {
        this.content = content;
    }


    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getStatus() {
        return status;
    }
}

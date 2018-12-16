package model;

public class Notice {
    private Integer id;
    private String content;
    private String sendtime;
    private String title;

    public String getSendtime() {
        return sendtime;
    }

    public Integer getId() {
        return id;
    }

    public String getContent() {
        return content;
    }

    public void setSendtime(String sendtime) {
        this.sendtime = sendtime;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setTitle(String title) {
        this.title=title;
    }

    public String getTitle() {
        return title;
    }
}

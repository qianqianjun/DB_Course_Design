package model;

public class User {
    private Integer id;
    private String account;
    private String password;
    private Integer type;

    public Integer getId() {
        return id;
    }

    public Integer getType() {
        return type;
    }

    public String getAccount() {
        return account;
    }

    public String getPassword() {
        return password;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}

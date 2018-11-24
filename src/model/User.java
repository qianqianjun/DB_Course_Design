package model;

public class User {
    private Integer id;
    private String account;
    private String password;
    private String type;

    public Integer getId() {
        return id;
    }

    public String getType() {
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

    public void setType(String type) {
        this.type = type;
    }
}

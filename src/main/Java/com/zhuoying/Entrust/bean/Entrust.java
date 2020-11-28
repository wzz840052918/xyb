package com.zhuoying.Entrust.bean;

public class Entrust {
    private Integer enid;//委托id  主键
    private Integer uid;
    private String photo;
    private String nickname;
    private String title;
    private String content;
    private Integer level;
    private Double price;
    private String datetime;
    private Integer eid;
    private Integer state;

    public Integer getEnid() {

        return enid;
    }

    public void setEnid(Integer enid) {
        this.enid = enid;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public Integer getEid() {
        return eid;
    }

    public void setEid(Integer eid) {
        this.eid = eid;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "Entrust{" +
                "enid=" + enid +
                ", uid=" + uid +
                ", nickname='" + nickname + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", level=" + level +
                ", price=" + price +
                ", datetime='" + datetime + '\'' +
                ", eid=" + eid +
                ", state=" + state +
                '}';
    }
}

package com.gesoft.model;

/**
 * 
 * @author Jadic
 * @created 2015年5月27日
 */
public class NewsModel extends BaseModel {

    private static final long serialVersionUID = 6734344663031831695L;

    private int id;
    private String title;
    private String icon;
    private String createTime;
    private String content;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

}

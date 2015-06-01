package com.gesoft.model;

/**
 * 
 * @author Jadic
 * @created 2015年5月23日
 */
public class CircleModuleModel extends BaseModel {

    private static final long serialVersionUID = 4543494261229344845L;

    private int id;
    private String name;
    private String content;
    private int topicCount;
    private String icon;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getTopicCount() {
        return topicCount;
    }

    public void setTopicCount(int topicCount) {
        this.topicCount = topicCount;
    }

}

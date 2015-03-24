/**
 * 文件名称：TreeNodeModel.java
 * 版权所有：Copyright njty
 * 创建时间：2015年3月24日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.model;

import java.util.List;

/**
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
public class TreeNodeModel extends BaseModel
{

	private static final long serialVersionUID = -2774772719071611409L;

	private long id;
	private String text;
	private String iconCls;
	private int state;
	private boolean checked;
	private List<TreeNodeModel> children;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getIconCls() {
		return iconCls;
	}
	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	public List<TreeNodeModel> getChildren() {
		return children;
	}
	public void setChildren(List<TreeNodeModel> children) {
		this.children = children;
	}

}

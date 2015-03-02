 
 /**
 * 文件名称：Constants.java
 * 版权所有：Copyright gesoft
 * 创建时间：2012-11-07 09:47:35
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.util;


/**
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
public interface Constants
{
 
	/**MsgModel**/
	public static final Boolean GLOBAL_MSG_BOOL_FAIL = false;
	public static final Boolean GLOBAL_MSG_BOOL_SUCCESS = true;
	public static final String GLOBAL_MSG_FAIL = "操作失败！";
	public static final String GLOBAL_MSG_SUCCESS = "操作成功！";
	
	public static final Integer GLOBAL_SERVICE_SUCCESS = 0;
	public static final Integer GLOBAL_SERVICE_FAIL = 1;
	
	
	/**
	 * session 所有标志位key
	 * 
	 */
	public static final String SESSION_KEY_TYPE_USER = "isuser";
	public static final String SESSION_KEY_ISLOGIN = "islogin";
	public static final String SESSION_KEY_UID = "uid";
	public static final String SESSION_KEY_LOGINNAME = "loginname";
	public static final String SESSION_KEY_FULLNAME = "fullname";
	
	public static final String SESSION_KEY_NEW_TYPE = "newtype";
	public static final String SESSION_KEY_CUSTOM_ID = "customid";
	
	
	
	public static final String GLOBAL_YES = "Y";
	public static final String GLOBAL_NO = "N";
	
	
	public static final Byte GLOBAL_PIV_ROOT_NODE = 0;//根节点
	public static final Byte GLOBAL_PIV_LEAF_NODE = 1;//叶子节点
	
	public static final String GLOBAL_SORE_ORDER = "ACS";
	/**
     * 默认分页;
     */
    public static final int DEFAULT_PAGE_SIZE = 10;
    
    
    
	
}

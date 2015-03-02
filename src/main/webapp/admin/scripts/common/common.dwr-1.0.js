/**
 * 创建时间：2015-01-28
 * @author WCL
 */
var ComDwr =
{
	
	/**
	 * 描述信息：加载定制类型
	 * 修改时间：2015-01-28
	 * @author WCL
	 * @param {} _param：id
	 * @param {} flag：标志
	 * @param {} msgVal：默认值
	 */
	loadCustom : function(_param, flag, msgVal)
	{
		loadDwr.loadCustom({"callback":function(data)
		{
			DWRUtil.removeAllOptions(_param);
			if(flag)
			{
				DWRUtil.addOptions(_param, {"-1":"请选择"});
			}
			DWRUtil.addOptions(_param, data);
			DWRUtil.setValue(_param, msgVal); 
		}}); 
	},
	/**
	 * 描述信息：加载新闻类型
	 * 修改时间：2015-01-28
	 * @author WCL
	 * @param {} _param：id
	 * @param {} flag：标志
	 * @param {} msgVal：默认值
	 */
	loadNewType : function(_param, flag, msgVal, customId)
	{
		loadDwr.loadNewType(customId, {"callback":function(data)
		{
			DWRUtil.removeAllOptions(_param);
			if(flag)
			{
				DWRUtil.addOptions(_param, {"-1":"请选择"});
			}
			DWRUtil.addOptions(_param, data);
			DWRUtil.setValue(_param, msgVal); 
		}}); 
	},
	/**
	 * 描述信息：加载经典案例类型
	 * 修改时间：2015-02-05
	 * @author WCL
	 * @param {} _param：id
	 * @param {} flag：标志
	 * @param {} msgVal：默认值
	 */
	loadCaseType : function(_param, flag, msgVal, customId)
	{
		loadDwr.loadCaseType(customId, {"callback":function(data)
		{
			DWRUtil.removeAllOptions(_param);
			if(flag)
			{
				DWRUtil.addOptions(_param, {"-1":"请选择"});
			}
			DWRUtil.addOptions(_param, data);
			DWRUtil.setValue(_param, msgVal); 
		}}); 
	},
	/**
	 * 描述信息：加载产品中心类型
	 * 修改时间：2015-02-05
	 * @author WCL
	 * @param {} _param：id
	 * @param {} flag：标志
	 * @param {} msgVal：默认值
	 */
	loadProduceType : function(_param, flag, msgVal, customId)
	{
		loadDwr.loadProduceType(customId, {"callback":function(data)
		{
			DWRUtil.removeAllOptions(_param);
			if(flag)
			{
				DWRUtil.addOptions(_param, {"-1":"请选择"});
			}
			DWRUtil.addOptions(_param, data);
			DWRUtil.setValue(_param, msgVal); 
		}}); 
	}
	
};
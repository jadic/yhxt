/**
 * 创建时间：2015-03-02
 * @author WCL
 */
var ComDwr =
{
	
	/**
	 * 描述信息：加载设备类型
	 * 修改时间：2015-03-02
	 * @author WCL
	 * @param {} _param：id
	 * @param {} flag：标志
	 * @param {} msgVal：默认值
	 */
	loadDevType: function(_param, flag, msgVal)
	{
		loadDwr.loadDevType({"callback":function(data)
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
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
	},
	
	/**
	 * 描述信息：加载设备类型
	 * 修改时间：2015-03-08
	 * @author WCL
	 * @param {} _param：id
	 * @param {} flag：标志
	 * @param {} msgVal：默认值
	 * @param {} type：{1:'证件类型', 2:'民族', 3:'婚姻状态', 4:'户籍类型', 5:'学历', 6:'政治面貌', 7:'工作年限', 8:'薪资范围'}
	 */
	loadDevType: function(_param, flag, msgVal, type)
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
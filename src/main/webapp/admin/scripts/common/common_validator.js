	
	/**
	 * 描述信息：判断是否为空
	 * 修改时间：2011-12-10
	 * @author wangcl
	 * @param {} _param
	 * @param {} _val
	 * @return {Boolean}
	 */
	function funIsNull(_param, _val)
	{
		if($(_param).val() == "")
		{
			$.messager.alert('信息提示', _val+'不能为空！','error');
			return true;
		}
		
		//判断长度
		funMaxLen();
		
		return false;
	}
	
	
	/**
	 * 描述信息：判断是否为空
	 * 修改时间：2011-12-10
	 * @author wangcl
	 * @param {} _param
	 * @param {} _val
	 * @return {Boolean}
	 */
	function funIsSelect(_param, _val)
	{
		
		if($(_param).val() == "" || $(_param).val() == "-1")
		{
			$.messager.alert('信息提示', _val+'不能为空！','error');
			return true;
		}
		
		return false;
	}
	
	/**
	 * 描述信息：判断长度
	 * 修改时间：2011-12-12
	 * @author wangcl
	 * @param {} _param
	 * @param {} _val
	 * @return {Boolean}
	 */
	function funMaxLen(_param, _val)
	{
		if($(_param).attr("maxlength"))
		{
			if($(_param).val().length > $(_param).attr("maxlength"))
			{
				$.messager.alert('信息提示', _val+'的长度不能大于'+$(_param).attr("maxlength")+'位！','error');
				return true;
			}
		}
	}
	
	
	/**
	 * 描述信息：判断是否为正数
	 * 修改时间：2011-12-12
	 * @author wangcl
	 * @param {} _param
	 * @param {} _val
	 */
	function funIsInt(_param, _val)
	{
		var reg = /^[1-9]d*$/g;
		if(!reg.test($(_param).val()))
		{
			$.messager.alert('信息提示', _val+'不为正数数值！','error');
			return true;
		}
		return false;
	}
	
	
	/**
	 * 描述信息：判断是否为正数(如果不为空)
	 * 修改时间：2011-12-12
	 * @author wangcl
	 * @param {} _param
	 * @param {} _val
	 */
	function funIsIntOrNull(_param, _val)
	{
		var reg = /^[0-9]*$/g;
		if(!reg.test($(_param).val()) && $(_param).val() != "")
		{
			$.messager.alert('信息提示', _val+'不为数值！','error');
			return true;
		}
		return false;
	}
	
	
	/**
	 * 描述信息：判断是否为手机号码
	 * 修改时间：2011-12-12
	 * @author wangcl
	 * @param {} _param
	 * @param {} _val
	 * @return {Boolean}
	 */
	function funIsIphone(_param, _val)
	{
		var reg = /^[1][0-9]{10}$/;
		if(!reg.test($(_param).val()))
		{
			$.messager.alert('信息提示', _val+'不符合手机号码格式！','error');
			return true;
		}
		return false;
	}
	
	
	/**
	 * 描述信息：判断是否除数字与字母
	 * 修改时间：2011-12-13
	 * @author wangcl
	 * @param {} _param
	 * @param {} _val
	 * @return {Boolean}
	 */
	function funIsEng(_param, _val)
	{
		var reg = /^[A-Za-z0-9]+$/;
		if(!reg.test($(_param).val()))
		{
			$.messager.alert('信息提示', _val+'含有非字母与数字！','error');
			return true;
		}
		return false;
		
	}
	
	/**
	 * 描述信息：验证GPS设备号
	 * 修改时间：2011-12-12
	 * @author wangcl
	 * @param {} _param
	 * @param {} _val
	 * @return {Boolean}
	 */
	function funIsGpsDev(_param, _val)
	{
		var reg = /^[0-9]{12}$/;
		if(!reg.test($(_param).val()))
		{
			$.messager.alert('信息提示', _val+'只能为12位的数字！','error');
			return true;
		}
		return false;
	}
	
		
	/**
	 * 描述信息：验证GPS设备号
	 * 修改时间：2011-12-12
	 * @author wangcl
	 * @param {} _param
	 * @param {} _val
	 * @return {Boolean}
	 */
	function funIsGpsGroup(_param, _val)
	{
		var reg = /^[0-9]{9}$/;
		if(!reg.test($(_param).val()))
		{
			$.messager.alert('信息提示', _val+'只能为9位的数字！','error');
			return true;
		}
		return false;
	}
	
	
	/**
	 * 描述信息：密码的验证
	 * 创建时间：2012-03-06
	 * @author wangcl
	 * @param {} _param
	 * @param {} _val
	 * @return {Boolean}
	 */
	function funUserPwdVaildator(_param, _val)
	{
		
		if($(_param).val().length <6 || $(_param).val().length > 16)
		{
			$.messager.alert('信息提示', _val+'长度必须大于6位小于16位的数字与字母组合！','error');
			return true;
		}
		
		var reg = /(?=(?:.*?\d){1})/g; //两个数字
		if(!reg.test($(_param).val()))
		{
			$.messager.alert('信息提示', _val+'中必须包含数字','error');
			return true;
		}
		
		reg = /(?=(?:.*?[!@#$%*()_+^&}{:;?.]){1})/g;//两个特殊字符
		if(!reg.test($(_param).val()))
		{
			$.messager.alert('信息提示', _val+'中必须包含特殊字符','error');
			return true;
		}
		
		/*
		reg = /(?=.*[a-z])/g;//两个小写字母
		if(!reg.test($(_param).val()))
		{
			$.messager.alert('信息提示', _val+'中必须包含2个小写字母','error');
			return true;
		}
		*/
		
		reg = /(?=(?:.*?[A-Za-z]){1})/g;//两个字母
		if(!reg.test($(_param).val()))
		{
			$.messager.alert('信息提示', _val+'中必须包含字母','error');
			return true;
		}
		return false;		
	}
	
	
	/**
	 * 描述信息：两次输入的密码是否一至
	 * 创建时间：2012-03-06
	 * @author wangcl
	 * @param {} _param1
	 * @param {} _param2
	 */
	function funDUserPwdInfo(_param1, _param2)
	{
		if ($(_param1).val() != $(_param2).val())
		{
			$.messager.alert('信息提示', '两次输入的密码不一致！','error');
			return true;
		}
		return false;
	}
	
	
	/**
	 * 描述信息：验证登录用户名的长度
	 * 创建时间：2012-03-06
	 * @author wangcl
	 * @param {} _param
	 * @param {} _val
	 */
	function funUserLoginInfo(_param, _val)
	{
		if($(_param).val().length < 6)
		{
			$.messager.alert('信息提示', '用户名长度不能小于6位！','error');
			return true;
		}
		return false;
	}
	
	/**
	 * 描述信息：判断日期是否跨天
	 * 创建时间：2012-12-03
	 * @author hy
	 * @param {} _param1， _param2
	 * @param {} _val
	 */
	function funIsCrossDays(_param1, _param2)
	{
		var strSDate = $(_param1).val().substring(0,10);
		var strEDate = $(_param2).val().substring(0,10);
		    
        if (strSDate != strEDate)
    	{
        	$.messager.alert('信息提示', '请勿跨天选择！','error');
			return true;
    	}
        return false;
	}

	/**
	 * 描述信息：验证IP
	 * 创建时间：2012-03-20
	 * @author wangcl
	 * @param {} _param
	 * @param {} _val
	 */
	function funIpValidator(_param, _val)
	{
		var reg = /^(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])$/;
		if(!reg.test($(_param).val()))
		{
			$.messager.alert('信息提示', _val+'不符合规格！','error');
			return true;
		}
		return false;
	}
	
	/**
	 * 描述信息：验证IP（如果不为空）
	 * 创建时间：2012-03-20
	 * @author wangcl
	 * @param {} _param
	 * @param {} _val
	 */
	function funIpValidatorOrNull(_param, _val)
	{
		var reg = /^(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])$/;
		if(!reg.test($(_param).val()) && $(_param).val() != "")
		{
			$.messager.alert('信息提示', _val+'不符合规格！','error');
			return true;
		}
		return false;
	}
	
	/**
	 * 描述信息：判断是否大于0
	 * 修改时间：2012-04-09
	 * @author wangcl
	 * @param {} _param
	 * @param {} _val
	 * @return {Boolean}
	 */
	function funIsInteger(_param, _val)
	{
		var tmp = 0;
		try
		{
			tmp = parseInt($(_param).val());
		}
		catch(e){}
		if(tmp <= 0)
		{
			$.messager.alert('信息提示', _val+'必须大于0！','error');
			return true;
		}
		return false;
	}
	
	
	/**
	 * 描述信息：判断是否为空
	 * 修改时间：2013-03-04
	 * @author wangcl
	 * @param {} _param
	 * @param {} _val
	 * @return {Boolean}
	 */
	function funIsNullVal(_param, _val)
	{
		if(_param == "")
		{
			$.messager.alert('信息提示', _val+'不能为空！','error');
			return true;
		}
		return false;
	}
	
	/**
	 * 描述信息：判断是否为正整数
	 * 修改时间：2013-03-04
	 * @author wangcl
	 * @param {} _param
	 * @param {} _val
	 * @return {Boolean}
	 */
	function funIsIntVal(_param, _val)
	{
		//var reg = /^[0-9]*[1-9][0-9]*$/g;
		var reg = /^[0-9]*$/g;
		if(!reg.test(_param))
		{
			$.messager.alert('信息提示', _val+'不为正数数值！','error');
			return true;
		}
		return false;
	}
	
	/**
	 * 描述信息：判断是否为数字
	 * 修改时间：2013-03-04
	 * @author wangcl
	 * @param {} _param
	 * @param {} _val
	 * @return {Boolean}
	 */
	function funIsIntOrZeroVal(_param, _val)
	{
		var reg = /^[0-9]*$/g;
		if(!reg.test(_param))
		{
			$.messager.alert('信息提示', _val+'不为数字！','error');
			return true;
		}
		return false;
	}

	
	function funIsFloat(_param, _val)
	{
		var reg = /^[0-9]*$/g;
		if(!reg.test($(_param).val()) && $(_param).val() != "")
		{
			reg = /^(-|\+)?\d+\.\d*$/;
			if(!reg.test($(_param).val()))
			{
				$.messager.alert('信息提示', _val+'不为数字！','error');
				return true;
			}
		}
		return false;
		
	}

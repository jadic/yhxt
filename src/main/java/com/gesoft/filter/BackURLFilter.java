package com.gesoft.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.druid.util.StringUtils;
import com.gesoft.util.Constants;
import com.gesoft.util.SystemUtils;

/**
 * @author WCL
 * @version v1.001
 * @since v1.001
 */
public class BackURLFilter implements Filter, Constants
{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException
	{

	}

	@Override
	public void doFilter(ServletRequest servletRequest,
			ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException
	{
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		
		SystemUtils.isMobile(request);
		
		String backURL = request.getParameter("BackURL");
		if (StringUtils.isEmpty(backURL))
		{
			backURL = request.getHeader("Referer");
		}
		request.setAttribute("ctx", request.getContextPath());
		
		request.setAttribute("BackURL", backURL);
		request.setAttribute("mBackURL", getMBackURL(request, response));
		HttpSession session = request.getSession();
		
		System.out.println("==========>>"+request.getRequestURI());

		if (session.getAttribute(SESSION_KEY_ISLOGIN) == null)
		{
			if (request.getRequestURI().indexOf("admin/main.html") > 0
					|| request.getRequestURI().indexOf("admin/redirect.html") > 0
			){
				//response.sendRedirect(request.getContextPath() + "/index.html");
				//return ;
			}
		}
		
		if (request.getRequestURI().indexOf("/n/") > 0)
		{
			if (session.getAttribute(SESSION_KEY_NISLOGIN) == null)
			{
				if (request.getRequestURI().indexOf("/n/index.do") > 0
						|| request.getRequestURI().indexOf("/n/img.do") > 0
						|| request.getRequestURI().indexOf("/n/search/login.do") > 0
						|| request.getRequestURI().indexOf("/n/search/logout.do") > 0
				){
					
				}
				else 
				{
					response.sendRedirect(request.getContextPath() + "/n/index.do");
				}
			}
		}
		else if (request.getRequestURI().indexOf("/p/") > 0)
		{

			if (session.getAttribute(SESSION_KEY_PISLOGIN) == null)
			{
				if (request.getRequestURI().indexOf("/p/index.do") > 0
						|| request.getRequestURI().indexOf("/p/img.do") > 0
						|| request.getRequestURI().indexOf("/p/mobile.do") > 0
						|| request.getRequestURI().indexOf("/p/toReg.do") > 0
						|| request.getRequestURI().indexOf("/p/query/goReg.do") > 0
						|| request.getRequestURI().indexOf("/p/query/getSmsVal.do") > 0
						|| request.getRequestURI().indexOf("/p/query/login.do") > 0
						|| request.getRequestURI().indexOf("/p/query/logout.do") > 0
						|| request.getRequestURI().indexOf("/p/query/goForgetPwd.do") > 0
						|| request.getRequestURI().indexOf("/p/forgetPwd.do") > 0
				){
					
				}
				else 
				{
					response.sendRedirect(request.getContextPath() + "/p/index.do");
				}
			}
		
		}
		else if (request.getRequestURI().indexOf("/a/") > 0)
		{
			
			if (session.getAttribute(SESSION_KEY_ISLOGIN) == null)
			{
				if (request.getRequestURI().indexOf("/a/index.do") > 0
						|| request.getRequestURI().indexOf("/a/img.do") > 0
						|| request.getRequestURI().indexOf("/a/login.do") > 0
						|| request.getRequestURI().indexOf("/a/logout.do") > 0
						){
					
				}
				else 
				{
					response.sendRedirect(request.getContextPath() + "/a/index.do");
				}
			}
			
		}
		
		filterChain.doFilter(request, response);
	}

	public static String getMBackURL(HttpServletRequest request,
			HttpServletResponse response)
	{
		String basePath = request.getScheme() + "://" + request.getServerName();
		if (request.getServerPort() != 80)
		{
			basePath += ":" + request.getServerPort();
		}
		String requestURI = request.getRequestURI();
		String queryString = request.getQueryString();

		String backURL = basePath
				+ requestURI
				+ (queryString == null || queryString.length() == 0 ? "" : "?"
						+ queryString);

		/*
		 * try { backURL = response.encodeURL(backURL); backURL =
		 * URLEncoder.encode(backURL, "UTF-8"); } catch
		 * (UnsupportedEncodingException e) { e.printStackTrace(); }
		 * System.out.println("backURL=========>>"+backURL);
		 */
		return backURL;
	}

	@Override
	public void destroy()
	{

	}
}

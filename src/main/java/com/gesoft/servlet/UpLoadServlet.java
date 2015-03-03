package com.gesoft.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import com.gesoft.util.FileUtil;
import com.gesoft.util.SystemUtils;

/**
 * 文件上传，不用SpringMvc的，如果用SPRING的，则DWR则用不起来
 * @author  WCL
 * @version v1.001
 * @since   v1.001
 */
public class UpLoadServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public UpLoadServlet()
	{
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request, response);
	}

	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("utf-8");	//设置编码
		response.setContentType("text/html; charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		String strRet = "{\"err\":\"失败\"}";
		DiskFileItemFactory factory = new DiskFileItemFactory();
		String path = request.getSession().getServletContext().getRealPath("/upload");
		factory.setRepository(new File(path));
		factory.setSizeThreshold(1024*1024) ;
		ServletFileUpload upload = new ServletFileUpload(factory);
		try {
			//可以上传多个文件
			List<FileItem> list = (List<FileItem>)upload.parseRequest(request);
			for(FileItem item : list)
			{
				if(!item.isFormField())
				{	
					String filedataFileName = SystemUtils.getCurrentSystemTime("yyyyMMddHHmmssSSS") + "_" + item.getName();
					String basePath = "/upload/" + FileUtil.createFoldersByType(2);
					//String realpath = request.getSession().getServletContext().getRealPath("/") + "//" + basePath;
					String realpath = 	"/Volumes/MacintoshHD2/Project/java/yhxt/src/main/webapp"+ "//" + basePath;
					InputStream filedata = item.getInputStream() ;
					if (filedata != null)
					{
						File savefile = new File(new File(realpath), filedataFileName);
						if (!savefile.getParentFile().exists())
						{
							savefile.getParentFile().mkdirs();
						}
						IOUtils.copy(filedata, new FileOutputStream(savefile));
						strRet = "{\"err\":\"\",\"msg\":\"" + request.getContextPath() + "/"+basePath + "/" + filedataFileName + "\"}";
					}
				}
			}
		}	
		catch (Exception e) 
		{
			
		}
		try
		{
			PrintWriter out = response.getWriter();
			out.write(strRet);
		}
		catch (IOException e)
		{
			
		}
	}
}

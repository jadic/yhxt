package com.gesoft.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 文件系统工具类，提供对文件的拷贝、转移、删除操作和对文件夹的创建、删除操作
 * 
 */
public class FileUtil
{
    private static final int NUMBER_1024 = 1024;
    
    private static final int NUMBER_2 = 2;
    
    /**
     * 描述信息：//0:不建目录, 1:按天存入目录, 2:按月存入目录
     * 创建时间：2013-06-27 10:54:23
     * @author WCL （ln_admin@yeah.net）
     * @return
     */
    public static String createFoldersByType(int type)
	{
    	String fileFolder = "";
		if (type == 1)
		{
			fileFolder = new SimpleDateFormat("yyyyMMdd").format(new Date());
		}
		else if(type == 2)
		{
			fileFolder = new SimpleDateFormat("yyyyMM").format(new Date());
		}
		return fileFolder;
	}
    
    
    /**
     * 拷贝文件到新地方
     * 
     * @param sourFileName 源文件路径，如：F:/TestFolder/f4/1.txt
     * @param destFileName 目标文件路径，如 F:/TestFolder/f5/2.txt。 自动创建目标路径中的文件夹和文件。
     * @return 是否成功;
     */
    public static boolean copyFile(String sourFileName, String destFileName)
    {
        int bytesum = 0;
        int byteread = 0;
        try
        {
            createFolders(destFileName, true);
            
            InputStream in = new FileInputStream(sourFileName);
            FileOutputStream out = new FileOutputStream(destFileName);
            byte[] buffer = new byte[NUMBER_1024];
            while ((byteread = in.read(buffer)) != -1)
            {
                bytesum += byteread;
                out.write(buffer, 0, byteread);
            }
            in.close();
            out.close();
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }
    
    /**
     * 转移文件，删除原文件
     * 
     * @param sourFileName eg. F:/TestFolder/f4/1.txt
     * @param destFileName eg. F:/TestFolder/f3/2.txt
     * @return 是否成功;
     */
    public static boolean moveFile(String sourFileName, String destFileName)
    {
        boolean b = copyFile(sourFileName, destFileName);
        if (b)
        {
            File f = new File(sourFileName);
            boolean r = f.delete();
        }
        return b;
    }
    
    /**
     * 删除一个文件
     * 
     * @param fileName eg. F:/TestFolder/f4/1.txt
     */
    public static void deleteFile(String fileName)
    {
        File f = new File(fileName);
        boolean r = f.delete();
    }
    
    /**
     * 创建 path 所包含的所有文件夹
     * 
     * @param path 路径;
     * @return 返回是否有文件夹被创建
     */
    public static boolean createFolders(String path)
    {
        return createFolders(path, false);
    }
    
    /**
     * 创建 path 所包含的所有文件夹
     * 
     * @param path 路径字符串，如：F:\\TestFolder\\f4\\ , F:/TestFolder/f4/1.txt
     * @param excludeFileName 是否排除路径中包含的文件名称（依靠最后的点号来判断文件名）。
     *  如果为 true，则路径 F:/TestFolder/f4/1.txt 将会创建 TestFolder 和 f4
     *  两个文件夹（排除 1.txt），否则将会创建包括 1.txt 在内的三个文件夹； 
     *  此参数对诸如 F:/TestFolder/f5/ 等不含文件名称的路径不会产生影响。
     * @return 返回是否有文件夹被创建
     */
    public static boolean createFolders(String path, boolean excludeFileName)
    {
        if (StringUtil.isNullOrEmpty(path))
        {
            return false;
        }
        
        if (excludeFileName)
        {
            int dot = path.lastIndexOf(".");
            int slash = path.lastIndexOf("/");
            int slashRev = path.lastIndexOf("\\");
            
            // 最后的一个点号必须在斜杠之后，才能被视为是文件名的扩展名部分
            if (dot > slash && dot > slashRev)
            {
                path = path.substring(0, Math.max(slash, slashRev));
            }
        }
        
        File f = new File(path);
        if (!f.exists())
        {
            boolean r = f.mkdirs();
            return true;
        }
        else
        {
            return false;
        }
    }
    
    /**
     * 删除 path 对应的文件夹
     * 
     * @param path eg. F:/TestFolder/folder1
     */
    public static void deleteFolder(String path)
    {
        File file = new File(path);
        if (!file.exists())
        {
            return;
        }
        else if (file.isFile())
        {
            boolean r = file.delete();
            
        }
        else if (file.isDirectory())
        {
            for (File f : file.listFiles())
            {
                deleteFolder(f.getPath());
            }
            boolean r = file.delete();
        }
    }
    
    /**
     * 获取父目录的路径
     * 
     * @param path 路径
     * @return 父目录
     */
    public static String parentFolderPath(String path)
    {
        if (path.charAt(path.length() - 1) == '\\')
        {
            path = path.substring(0, path.length() - NUMBER_2);
        }
        
        String parentPath = path.substring(0, path.lastIndexOf('\\'));
        return parentPath;
    }
    
    /**
     * 判断指定的路径是否存在
     * 
     * @param path 路径
     * @return 结果
     */
    public static boolean exist(String path)
    {
        File file = new File(path);
        return file.exists();
    }
    
    /**
     * 获取文件名上的扩展名;
     * 
     * @param fileName 文件
     * @return [参数说明]
     * 
     * @see [类、类#方法、类#成员]
     */
    public static String getFileExt(String fileName)
    {
        String ext = null;
        if (fileName.lastIndexOf(".") != -1)
        {
            ext = fileName.substring(fileName.lastIndexOf("."));
        }
        return ext;
    }
    
}

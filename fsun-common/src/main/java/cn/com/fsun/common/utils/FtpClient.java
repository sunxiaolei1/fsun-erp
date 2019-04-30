/**
 * 
 */
package cn.com.fsun.common.utils;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPFileFilter;
import org.apache.commons.net.ftp.FTPReply;
import org.apache.log4j.Logger;

import cn.com.fsun.common.dao.File;
import cn.com.fsun.common.dao.FtpInfo;



/**
 * @author ming
 *
 */
public class FtpClient {
	private Logger log = Logger.getLogger(FtpClient.class);
	public FTPClient ftpClient = new FTPClient();
	private FtpClient () {
		 //设置将过程中使用到的命令输出到控制台      
        //this.ftpClient.addProtocolCommandListener(new PrintCommandListener(new PrintWriter(System.out)));     
	}
	private FtpClient (FtpInfo ftpInfo) {
		 //设置将过程中使用到的命令输出到控制台      
       //this.ftpClient.addProtocolCommandListener(new PrintCommandListener(new PrintWriter(System.out)));     
		this.connect(ftpInfo);
	}
	/**
	 * 连接到ftp server
	 * @throws IOException
	 */
	public boolean connect(FtpInfo ftpInfo) {
		log.info("start to login ftp server!");
		log.info("login ftp server!");
  	    log.info("ip=" + ftpInfo.getIp());
  	    log.info("port=" + ftpInfo.getPort());
  	    log.info("username=" + ftpInfo.getUsername());
  	    log.info("password=" + ftpInfo.getPassword());
		try {
			ftpClient.connect(ftpInfo.getIp(), ftpInfo.getPort());
			 ftpClient.setControlEncoding("GBK");//编码
			    ftpClient.setFileType(FTP.BINARY_FILE_TYPE);// 二进制文件支持
			    if(FTPReply.isPositiveCompletion(ftpClient.getReplyCode())){
			        if(ftpClient.login(ftpInfo.getUsername(), ftpInfo.getPassword())){
			          log.info("login ftp server success!");
			          return true;      
			        }
			    }
		} catch (SocketException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	    log.error("login ftp server failed!");
	    disconnect();      
        return false;  
	}
	   /** *//**   
     * 断开与远程服务器的连接   
     * @throws IOException   
     */    
    public void disconnect() {
        if(ftpClient.isConnected()){
            try {
            	ftpClient.logout();
				ftpClient.disconnect();
				log.info("exit ftp server success!"); 
			} catch (IOException e) {
				log.info("exit ftp server error!"); 
			}
        }
    }  
	/**
	 * 根据目录获得该文件夹下所有文件夹名称
	 * @author ming
	 * @throws IOException 
	 * */
	public List<File> listDictPath (String dictPath) throws IOException {
		FTPFile[] fileArr = ftpClient.listDirectories(dictPath);
		List<File> list = new ArrayList<File>();
		for (FTPFile file : fileArr) {
			list.add(new File(file.getName(), dictPath, dictPath + "/" + file.getName()));
		}
		return list;
	}
	/**
	 * 根据目录路径获得该文件夹下所有文件名称
	 * @author ming
	 * @throws IOException 
	 * */
	public List<File> listFilePath (String dictPath, List<String> filterDict, List<String> acceptSuffix) throws IOException {
		if (dictPath == null || "/".equals(dictPath)) {
			dictPath ="";
		}
		FileFilter fileFilter = new FileFilter(filterDict, acceptSuffix);
		FTPFile[] fileArr = ftpClient.listFiles(dictPath, fileFilter);
		List<File> list = new ArrayList<File>();
		for (FTPFile file : fileArr) {
			if (file.isFile()) {
				list.add(new File(file.getName(), dictPath, dictPath + "/" + file.getName()));
			}
		}
		return list;
	}
	/**
	 * 递归获得目录下所有文件路径名称,并过滤目录和文件，过滤掉在filterDict中的目录，文件后缀存在于acceptSuffix中
	 * @author ming
	 * */
	public List<File> listAllFilePath (String dictPath, List<String> filterDict, List<String> acceptSuffix) throws IOException {
		if (dictPath == null || "/".equals(dictPath)) {
			dictPath ="";
		}
		List<File> list = new ArrayList<File>();
		FileFilter fileFilter = new FileFilter(filterDict, acceptSuffix);
		this.recursionFilePath(dictPath, list, fileFilter);
		return list;
	}
	/**
	 * 递归获得子目录文件
	 * @author ming
	 * @throws IOException 
	 * */
	private List<File> recursionFilePath (String dictPath, List<File> list, FileFilter fileFilter) throws IOException {
		FTPFile[] fileArr = ftpClient.listFiles(dictPath, fileFilter);
		for (FTPFile file : fileArr) {
			if (file.isDirectory()) {
				recursionFilePath(dictPath + "/" + file.getName(), list, fileFilter );
			} else {
				list.add(new File(file.getName(), dictPath, dictPath + "/" + file.getName()));
			}
		}
		return list;
	}
	class FileFilter implements FTPFileFilter {
		List<String> filterDict;        //过滤的文件及目录
		List<String> acceptSuffix;		//接受的文件后缀
		public FileFilter(List<String> filterDict, List<String> acceptSuffix) {
			this.filterDict = filterDict;
			this.acceptSuffix = acceptSuffix;
		}
		@Override
		public boolean accept(FTPFile file) {
			//目录过滤
			if (filterDict != null) {
				if (file.isDirectory() && filterDict.contains(file.getName())) {
					return false;
				}
			}
			//文件后缀名过滤
			if (acceptSuffix != null) {
				if (file.isFile()) {
					for (String suffix : acceptSuffix) {
						if (file.getName().endsWith(suffix)) {
							return true;
						} else {
							return false;
						}
					}
				} 
			}
			return true;
		}
	}
	/**
	 * 根据文件路径删除文件
	 * @author ming
	 * @throws IOException 
	 * */
	public boolean deleteFile (String pathname) {
		boolean isSuccess;
		try {
			isSuccess = ftpClient.deleteFile(pathname);
		} catch (IOException e) {
			isSuccess = false;
			log.error("delete file error! the file path is " + pathname, e); 
		}
		if (!isSuccess) {
			log.error("delete file failed! the file path is " + pathname); 
		}
		return isSuccess;
	}
	/**
	 * 根据文件路径删除文件
	 * @author ming
	 * @throws IOException 
	 * */
	public boolean deleteFile (File file) {
		boolean isSuccess;
		try {
			isSuccess = ftpClient.deleteFile(file.getPath());
		} catch (IOException e) {
			isSuccess = false;
			log.error("delete file error! the file path is " + file.getPath(), e); 
		}
		if (!isSuccess) {
			log.error("delete file failed! the file path is " + file.getPath()); 
		}
		return isSuccess;
	}
	/**
	 * 移动文件
	 * @author ming
	 * @throws IOException 
	 * */
	public boolean moveFile (String from, String to) {
		boolean isSuccess;
		try {
			isSuccess = ftpClient.rename(from, to);
		} catch (IOException e) {
			isSuccess = false;
			log.error("move file error! the from path is " + from + "; the to path is " + to); 
		}
		return isSuccess;
	}
	/**
	 * 从本地输入流上传文件到FTP服务器
	 * @author ming
	 * @throws IOException 
	 * */
	public boolean uploadFile (String remote, InputStream local) throws IOException {
		return ftpClient.appendFile(remote, local);
	}
	/**
	 * 从本地上传文件到FTP服务器
	 * @author ming
	 * @throws IOException 
	 * */
	public boolean uploadFile (String local, String remote) {
		InputStream in = null;
		boolean b = false;
		try {
			in = new FileInputStream(local);
			b = this.uploadFile(remote, in);
		} catch (FileNotFoundException e) {
			log.error("error of local is not found!", e);
		} catch (IOException e) {
			log.error("upload file error!", e);
		} finally{
			try {
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
			} 
		}
		return b;
	}
	/**
	 * 将buffer中的字节添加到指定目录
	 * @author ming
	 * @throws IOException 
	 * */
	public boolean uploadFile (String remote, byte[] buffer) {
		boolean flag = true;
		OutputStream out = null;
		try {
			out = this.getOutputStream(remote);
			out.write(buffer);
		} catch (IOException e) {
			flag = false;
			log.error("upload file by BINARY error! the file path is " + remote, e);
		} finally {
			try {
				if (out != null) {
					this.closeOutputStream(out);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}
	/**
	 * 将buffer中的字节添加到指定目录,如果指定目录不存在，则创建此目录
	 * @author ming
	 * @throws IOException 
	 * */
	public boolean uploadFile (File remote, byte[] buffer) {
		return	this.uploadFile(remote.getPath(), buffer);
	}
	/**
	 * 根据文件地址获得文件输出流
	 * @author ming
	 * @throws IOException 
	 * */
	public OutputStream getOutputStream (String remote) throws IOException {
		return ftpClient.appendFileStream(remote);
	}
	/**
	 * 关闭文件输出流
	 * @author ming
	 * @throws IOException 
	 * */
	public void closeOutputStream (OutputStream outputStream) throws IOException {
		if (outputStream != null) {
			outputStream.close();
			outputStream = null;
			ftpClient.completePendingCommand();
		}
	}
	/**
	 * 根据文件地址获得文件输入流
	 * @author ming
	 * @throws IOException 
	 * */
	public InputStream getInputStream (String remote) throws IOException {
		return ftpClient.retrieveFileStream(remote);
	}
	/**
	 * 关闭文件输入流
	 * @author ming
	 * @throws IOException 
	 * */
	public void closeInputStream (InputStream inputStream) throws IOException {
		if (inputStream != null) {
			inputStream.close();
			inputStream = null;
			ftpClient.completePendingCommand();
		}
	}
	/**
	 * 根据文件地址获得文件byte[]数组
	 * @author ming
	 * */
	public byte[] getByteArray  (String remote) {
		InputStream in = null;
		ByteArrayOutputStream outputStream = null;
		try {
			in = ftpClient.retrieveFileStream(remote);
			outputStream = new ByteArrayOutputStream();
			byte[] buffer = new byte[1024 * 5];
			int n = 0;
			while (-1 != (n = in.read(buffer))) {
			    outputStream.write(buffer, 0, n);
			}
		} catch (IOException e1) {
			log.error("get byte array error! the file path is " + remote, e1);
		} finally {
			try {
				if (in != null) {
					this.closeInputStream(in);
					outputStream.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return outputStream.toByteArray();
	}
	/**
	 * 根据文件地址获得文件byte[]数组,如果指定目录不存在，则返回null
	 * @author ming
	 * */
	public byte[] getByteArray  (File remote) {
		return this.getByteArray(remote.getPath());
	}
	/**
	 * 复制文件
	 * */
	public boolean copyFile (String remoteFrom, String remoteTo) {
		byte[] b = this.getByteArray(remoteFrom);
		this.uploadFile(remoteTo, b);
		return true;
	}
	/**
	 * 复制文件
	 * */
	public boolean copyFile (File remoteFrom, File remoteTo) {
		byte[] b = this.getByteArray(remoteFrom);
		this.uploadFile(remoteTo, b);
		return true;
	}
	/**
	 * 判断目录是否存在
	 * */
	public boolean isExistFile (String remote) throws IOException {
		FTPFile[] ftpFiles = ftpClient.listDirectories(remote.substring(0, remote.lastIndexOf("/")));
		return ftpFiles.length > 0 ? true : false;
	}
	/**
	 * 创建目录
	 * @throws IOException 
	 * */
	public boolean createDirectory (String dictPath) throws IOException {
		return ftpClient.makeDirectory(dictPath);
	}
	public static FtpClient newInstance () {
		return new FtpClient();
	}
	public static FtpClient newInstance (FtpInfo ftpInfo) {
		return new FtpClient(ftpInfo);
	}
}

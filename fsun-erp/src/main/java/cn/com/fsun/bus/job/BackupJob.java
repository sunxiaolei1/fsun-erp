package cn.com.fsun.bus.job;

import java.io.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.Properties;

import cn.com.fsun.common.utils.FileNameSelector;
import cn.com.fsun.common.utils.PropertiesUtil;
import cn.com.fsun.common.utils.StreamGobbler;



/**
 * 数据库工具类
 * 
 * @author Administrator
 * 
 */
public class BackupJob {
     
	private static String message = null;
	
	public void sayHello(){
	//	 String aaa = ResourceUtil.getSysPath() + "//doc";
	//	 System.out.println(ResourceUtil.getSysPath());
	//	 System.out.println(ResourceUtil.getClassPath());
		Properties prop = System.getProperties();
		String os = prop.getProperty("os.name");
		System.out.println(os);
	}
	
	private static BackupJob backupJob = null;
	
	public static BackupJob getInstance(){
		if(backupJob!=null){
			return backupJob;
		}else{
			return new BackupJob();
		}
	}
	
	/** 
     * 备份数据库
     *  
     * @param rootPath 
     *  备份文件的工程路径 
     */  
	public String exportDataBase(String rootPath) {
		String operation = getOperation(rootPath);
		try{
			Properties prop = System.getProperties();
			String os = prop.getProperty("os.name");  //获取操作系统类型
	        if(os.startsWith("win") || os.startsWith("Win") ){   //判断操作系统是否为windows
	        	    bkForWindows(operation);
				}
		    if(os.startsWith("lin") || os.startsWith("Lin") ){   //判断操作系统是否为linux
			        bkForLinux(operation);
			    }
		    deleteFile(rootPath);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return operation.substring(operation.lastIndexOf("=")+1, operation.length());
   }	
	
	public void bkForWindows(String operation) {
		try {    		    			
			Process process = Runtime.getRuntime().exec("cmd /c " + operation);
			StreamGobbler errorGobbler = new StreamGobbler(process.getErrorStream(),"ERROR");
			errorGobbler.start();
			StreamGobbler outGobbler = new StreamGobbler(process.getInputStream(),"STDOUT");
			outGobbler.start();
			process.waitFor();
			System.out.println(operation);
			message = "数据库备份成功" ;
			System.out.println(message);
		}
		catch (Exception e) {
			    message = "数据库备份失败" ;
			    System.out.println(message);
	    }finally{
		}
	}
	
	
	public void bkForLinux(String operation) {
	    //  operation = operation.replaceAll("/ ", "\\");
	    operation = operation.replaceAll(">", ">/"); //linux下的路径和windows下不一样，重新拼装 
	    try {
	    	String[] cmd = new String[]{"/bin/bash", "-c", operation};
	    	Process ps = Runtime.getRuntime().exec(cmd);

	    	BufferedReader br = new BufferedReader(new InputStreamReader(ps.getInputStream()));
	    	StringBuffer sb = new StringBuffer();
	    	String line;
	    	while ((line = br.readLine()) != null) {
	    		sb.append(line).append("\n");
	    	}
	    	String result = sb.toString();
	    	System.out.println(result);
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } 
	}

		
	public void deleteFile(String rootPath){
		  String folderpath = "/" +  rootPath + "databk/" ;
		  /*备份文件至多只能保存五分 */
		  File file = new File(folderpath);
		  //过滤出所有的sql扩展名的文件
		  File files[] = file.listFiles(new FileNameSelector("sql"));
		  if(files.length>=5){      //文件数不得超过5个
			  int number = 0;
	      //    String filePath = files[0].getAbsolutePath().toLowerCase();  //记录文件路径
	          long time = files[0].lastModified();//返回文件最后修改时间，是以个long型毫秒数
	          String createTime = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date(time));
	      //    String createTime = getCreateTime(filePath);
				for(int i=1;i<files.length;i++){
					if(files[i].getName().endsWith(".sql")){
						long time1 = files[i].lastModified();//返回文件最后修改时间，是以个long型毫秒数
			            String createTime1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date(time1));
		                if(createTime.compareTo(createTime1) > 0  ){
		                	 createTime = createTime1 ;
		                	 number = i ;
		                }
					}
					
				}
				String deletePath = files[number].getAbsolutePath().toLowerCase();
				File deleteFile = new File(deletePath);  
			    // 路径为文件且不为空则进行删除  
			    if (deleteFile.isFile() && deleteFile.exists()) {  
			    	deleteFile.delete();
			   }
			}
	}
	
	public String getdbName() {
			Date now = new Date();
			DateFormat df = DateFormat.getDateTimeInstance();
			String dbName = df.format(now) + ".sql";
			dbName = dbName.replaceAll(":", "_");
			dbName = dbName.replaceAll(" ", "_");
			dbName = dbName.toLowerCase() ;
			return dbName ;
	}
	
	public String getOperation(String rootPath) {
		String dbName = getdbName();
		PropertiesUtil pr = new PropertiesUtil("backup.properties");
		String user = pr.readProperty("jdbc.username");
		String password = pr.readProperty("jdbc.password");
		String database = pr.readProperty("jdbc.database");
		String filepath = rootPath + "databk\\" + dbName;
		String operation = "mysqldump -u"+user+" -p"+password+" "+database+" "+"--result-file="+filepath ;
		return operation ;
    }
	
	public String getOperation(String rootPath,String dbName) {
		PropertiesUtil pr = new PropertiesUtil("backup.properties");
		String user = pr.readProperty("jdbc.username");
		String password = pr.readProperty("jdbc.password");
		String database = pr.readProperty("jdbc.database");
		String filepath = rootPath + "databk/" + dbName;
		String operation = "mysqldump -u"+user+" -p"+password+" "+database+" "+"--result-file="+filepath ;
		return operation ;
    }
	
    
    /** 
     * 恢复数据库 
     *  
     * @param rootPath 
     *     恢复文件的工程路径
     * @param dbname 
     *     sql文件名
     */  
    public Boolean restore(String rootPath, String dbname){ 
    	try{
    		Properties prop = System.getProperties();
    		String os = prop.getProperty("os.name");  //获取操作系统类型
    		if(os.startsWith("win") || os.startsWith("Win") ){   //判断操作系统是否为windows
    			restoreForWindows(getOperation(rootPath,dbname));
    		}
    		if(os.startsWith("lin") || os.startsWith("Lin") ){   //判断操作系统是否为linux
    			restoreForLinux(getOperation(rootPath,dbname));
    		}  
    	}catch(Exception e){
    		e.printStackTrace();
    		return false;
    	}
    	return true;
    }
    
    public void restoreForWindows(String operation) throws IOException {			    
		Runtime.getRuntime().exec("cmd /c" + operation);
		System.out.println(operation);		
	}
    
    public void restoreForLinux(String operation) throws IOException {  	
 		//  operation = operation.replaceAll("/ ", "\\");
	    operation = operation.replaceAll(">", ">/"); //linux下的路径和windows下不一样，重新拼装 	   
    	String[] cmd = new String[]{"/bin/bash", "-c", operation};
    	Process ps = Runtime.getRuntime().exec(cmd);

    	BufferedReader br = new BufferedReader(new InputStreamReader(ps.getInputStream()));
    	StringBuffer sb = new StringBuffer();
    	String line;
    	while ((line = br.readLine()) != null) {
    		sb.append(line).append("\n");
    	}
    	System.out.println(sb.toString());
	    
	}
}
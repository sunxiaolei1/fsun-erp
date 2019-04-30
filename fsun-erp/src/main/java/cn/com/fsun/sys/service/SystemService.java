package cn.com.fsun.sys.service;

import java.io.File;

import org.springframework.stereotype.Service;

import cn.com.fsun.bus.job.BackupJob;
import cn.com.fsun.common.service.BaseService;
import cn.com.fsun.common.utils.ZipCompressorByAnt;

@Service
public class SystemService extends BaseService{

	public String dataBackup(String rootPath) {
		BackupJob backupJob = BackupJob.getInstance();		
		return backupJob.exportDataBase(rootPath);
	}
	
	/**
	 * 
	 * @param zipFilePath 压缩后的文件
	 * @param srcPathName 被压缩的文件
	 * @return
	 */
	public File fileBackup(String zipFilePath,String srcPathName) {	
		ZipCompressorByAnt zca = new ZipCompressorByAnt(zipFilePath);  
		return zca.compressExe(srcPathName);
	}
	

}

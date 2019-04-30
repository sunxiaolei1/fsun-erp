package cn.com.fsun.common.utils;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.Random;

import org.springframework.web.multipart.MultipartFile;

/**
 * @author Felenwe Lee
 * @version create time：2013-1-22 下午2:32:16
 */

public class UploadUtil {

	public static String buildFile(MultipartFile mpf,String basePath) {
		Calendar calendar = Calendar.getInstance();
		int y = calendar.get(Calendar.YEAR);
		int m = calendar.get(Calendar.MONTH) + 1;
		int d = calendar.get(Calendar.DAY_OF_MONTH);
		String result = "/" + y;
		File file = new File(basePath+result);
		if (!file.exists()) {
			file.mkdir();
			System.out.println("7869");
		}

		result += "/" + m;
		file = new File(basePath+result);
		if (!file.exists()) {
			file.mkdir();
		}

		result += "/" + d;
		file = new File(basePath+result);
		if (!file.exists()) {
			file.mkdir();
		}
		Random random = new Random();
		result += "/"+calendar.getTimeInMillis();
		String originalFilename = mpf.getOriginalFilename();
		if(null != originalFilename){
			String fileType = originalFilename.substring(originalFilename.lastIndexOf("."));
			
			while(Boolean.TRUE){
				String temp = null;
				if(fileType!= null)
//					result = result + random.nextInt(4)+fileType;
					temp = result + random.nextInt(4) + fileType;
				else
					temp = result + random.nextInt(4);
				
				file = new File(basePath + temp);
				if(file.exists())
					continue;
				else {
					result = temp;
					break;
				}
			}
		}
		try {
			mpf.transferTo(file);
			return result;
		} catch (IllegalStateException e) {
			e.printStackTrace();
			return null;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}

	}
}

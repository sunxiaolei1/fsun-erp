package cn.com.fsun.common.test;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import sun.misc.BASE64Encoder;

public class ImageTest {

	public static void main(String[] args) {
		
		String url = "C:\\Users\\sunxiaolei\\Desktop\\DSC00094.JPG";
		BASE64Encoder encoder = new BASE64Encoder();
		String str = encoder.encode(ImageTest.File2byte(url));
		System.out.println(str.length());
		System.out.println(str);
	}
	
	
	public static byte[] File2byte(String filePath)
    {
        byte[] buffer = null;
        try
        {
            File file = new File(filePath);
            FileInputStream fis = new FileInputStream(file);
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            byte[] b = new byte[1024];
            int n;
            while ((n = fis.read(b)) != -1)
            {
                bos.write(b, 0, n);
            }
            fis.close();
            bos.close();
            buffer = bos.toByteArray();
        }
        catch (FileNotFoundException e)
        {
            e.printStackTrace();
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        return buffer;
    }

}

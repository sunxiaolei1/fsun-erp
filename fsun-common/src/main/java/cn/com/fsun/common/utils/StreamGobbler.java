package cn.com.fsun.common.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;

public class StreamGobbler extends Thread{

	InputStream is;
	String type;
	OutputStream os;
	
	public StreamGobbler(InputStream is, String type) {
		super();
		this.is = is;
		this.type = type;
	}

	public StreamGobbler(InputStream is, String type, OutputStream os) {
		super();
		this.is = is;
		this.type = type;
		this.os = os;
	}
	
	public void run(){
		InputStreamReader isr = null;
		BufferedReader br = null;
		PrintWriter pw = null;
		try{
			if(os!=null){
				pw = new PrintWriter(os);
			}
			isr = new InputStreamReader(is);
		    br = new BufferedReader(isr);
		    String line = null;
		    while((line = br.readLine()) != null){
		    	if(pw!=null){
		    		pw.println(line);		    		
		    	}
		    	System.out.println(type+ ">" +line);
		    }
		    if(pw!=null){
		    	pw.flush();
		    }
		}catch (IOException ioe) {
			ioe.printStackTrace();
		}finally{
			if(pw!=null){
				pw.close();
			}
			if(br!=null){
				try {
					br.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(isr!=null){
				try {
					isr.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}	
		}
	}
	
}

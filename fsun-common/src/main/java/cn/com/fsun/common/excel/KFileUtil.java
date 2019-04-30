package cn.com.fsun.common.excel;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;

import org.apache.commons.io.FileUtils;

public class KFileUtil extends FileUtils {
	public static List listFile( String path ) throws IOException {
		return listFile( path, null );
	}

	public static boolean exists(String path){
		return new File(path).exists();
	}
	public static boolean exists(List<String> paths){
		for(String path : paths){
			if(!exists(path)){
				return false;
			}
		}
		return true;
	}
	public static List listFile( String path, String prefix ) throws IOException {
		Collection list = listFiles( new File( path ), null, false );
		if ( list == null )
			return null;
		List res = new LinkedList();
		for ( Object file : list ) {
			File f = (File) file;
			if ( f.getName().startsWith( prefix == null ? "" : prefix ) ){
				res.add( f.getAbsolutePath() );
			}
		}
		return res;
	}
	public static List listFileName( String path ) throws IOException {
		return listFile( path, null );
	}

	public static List listFileName( String path, String prefix ) throws IOException {
		Collection list = listFiles( new File( path ), null, false );
		if ( list == null )
			return null;
		List res = new LinkedList();
		for ( Object file : list ) {
			File f = (File) file;
			if ( f.getName().startsWith( prefix == null ? "" : prefix ) ){
				res.add( f.getName() );
			}
		}
		return res;
	}

	public static String getExcelFile(String prefix) {
		String random = String.valueOf(new Random().nextInt(1000));
		return KStringUtil.null2Empty(prefix)+getFormatedFileName()+"_"+random+".xlsx";
	}
	public static String getFormatedFileName() {
		Calendar time = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat( "yyyyMMddHHmmss" );
		return sdf.format( time.getTime() );
		/*
		String fileName = String.valueOf(time.get(Calendar.YEAR))

		+ String.valueOf(time.get(Calendar.MONTH))

		+ String.valueOf(time.get(Calendar.DAY_OF_MONTH) + 1)

		+ String.valueOf(time.get(Calendar.HOUR_OF_DAY))

		+ String.valueOf(time.get(Calendar.MINUTE))

		+ String.valueOf(time.get(Calendar.SECOND));

		return fileName;
		*/
	}
}
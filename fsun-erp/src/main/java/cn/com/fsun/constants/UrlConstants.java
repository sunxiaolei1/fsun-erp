package cn.com.fsun.constants;

public class UrlConstants {

	public static class Module{	
		public static final String STORE = "/bus/store";
		public static final String SETTING = "/sys/setting";		
	}
	
	public static class Method{
		public static final String VERSION = "/version";
		public static final String MANAGE = "/manage";
	}
	
	public static class Path{	
		public static final String STORE_MANAGE = Module.STORE + Method.MANAGE;
		public static final String SETTING_MANAGE = Module.SETTING + Method.MANAGE;
	}
	
	public static class Var{
		public static final String STORE_ID = "storeId";
	}
}

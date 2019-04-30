package cn.com.fsun.constants;

import cn.com.fsun.common.utils.PropertiesUtil;

public class RESTConstants {
	
	//REST SYSTEM PATH
	public static String SYSTEM_PATH = null;
	
	static {  
		PropertiesUtil p = new PropertiesUtil("rest.properties");
		SYSTEM_PATH = p.readProperty("rest.url");
    }  
	

	//REST Resource Paths
	public static final String RESOURCE_PATH_DATACENTER="/datacenter";
	public static final String RESOURCE_PATH_CLUSTER="/cluster";
	public static final String RESOURCE_PATH_HOST="/host";
	public static final String RESOURCE_PATH_NETWORK="/network";
	public static final String RESOURCE_PATH_VM="/vm";
	public static final String RESOURCE_PATH_STORAGE="/storage";
	public static final String RESOURCE_PATH_STRATEGY="/strategy";
	public static final String RESOURCE_PATH_TEMPLATE="/template";
	public static final String RESOURCE_PATH_VMPOOL="/vmpool";
	public static final String RESOURCE_PATH_VMUSER="/user";
	public static final String RESOURCE_PATH_AUTH="/auth";
	public static final String RESOURCE_PATH_VMDEVICE_DISK="/vm/dev/disk";
	public static final String RESOURCE_PATH_VMDEVICE_GRAPH="/vm/dev/graph";
	public static final String RESOURCE_PATH_VMDEVICE_SOUND="/vm/dev/sound";
	public static final String RESOURCE_PATH_VMDEVICE_VIDEO="/vm/dev/video";
	public static final String RESOURCE_PATH_VMDEVICE_NET="/vm/dev/net";
	public static final String RESOURCE_PATH_RIGHT="/right";
	

	//REST PATH METHOD
	public static final String PATH_METHOD_INFO="/info";
	public static final String PATH_METHOD_BASEINFO="/base_info";
	public static final String PATH_METHOD_CREATE="/create";
	public static final String PATH_METHOD_ADD="/add";
	public static final String PATH_METHOD_NEW="/new";
	public static final String PATH_METHOD_UPDATE="/edit";
	public static final String PATH_METHOD_DELETE="/del";
	
	public static final String PATH_METHOD_HOSTINFO="/host_info";
	public static final String PATH_METHOD_HOSTSTATUS="/host_status";
	public static final String PATH_METHOD_VMINFO="/vm_info";
	public static final String PATH_METHOD_USERINFO="/user_info";
	public static final String PATH_METHOD_RIGHTiNFO="/user_info";
	
	public static final String PATH_METHOD_START = "/start";
	public static final String PATH_METHOD_REBOOT = "/reboot";
	public static final String PATH_METHOD_SHUTDOWN = "/shutdown";
	public static final String PATH_METHOD_FORCEOFF = "/forceoff";
	public static final String PATH_METHOD_PAUSE = "/pause";
	public static final String PATH_METHOD_RUN = "/run";
	public static final String PATH_METHOD_MIGRATE= "/migrate";
	public static final String PATH_METHOD_CLONE= "/clone";
	
	//授权
	public static final String PATH_METHOD_HOSTTOCLUSTER = "/auth/hostToCluster";
	public static final String PATH_METHOD_VMTOHOST = "/auth/vmToHost";
	public static final String PATH_METHOD_VMTOUSER = "/auth/vmToUser";
	
	//注册
	public static final String PATH_METHOD_INSTALL = "/reg/install";
	public static final String PATH_METHOD_STATUS = "/reg/status";
	
	//母盘
	public static final String PATH_METHOD_MASTER_DISK_CREATE="/master_disc/create";
	public static final String PATH_METHOD_MASTER_DISK_GENERATE="/master_disc/generate";
	public static final String PATH_METHOD_MASTER_DISK_INFO="/master_disc/info";
	public static final String PATH_METHOD_MASTER_DISK_EDIT="/master_disc/edit";
	public static final String PATH_METHOD_MASTER_DISK_DEL="/master_disc/del";
	
	//快照
	public static final String PATH_METHOD_IMG_CREATE = "/img/create";
	public static final String PATH_METHOD_IMG_GENERATE = "/img/generate";
	public static final String PATH_METHOD_IMG_INFO = "/img/info";
	public static final String PATH_METHOD_IMG_EDIT = "/img/edit";
	public static final String PATH_METHOD_IMG_DEL = "/img/del";

	public static boolean isTest = false;
	
}

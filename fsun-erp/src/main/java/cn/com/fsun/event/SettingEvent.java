package cn.com.fsun.event;

import java.util.List;

import org.springframework.context.ApplicationEvent;

import cn.com.fsun.sys.domain.Settings;

/**
 * 
 * @author lee
 *
 */
public class SettingEvent extends ApplicationEvent {
	
	private List<Settings> settingsList;

	public SettingEvent(Object source){
		super(source);
	}
	
	public SettingEvent(List<Settings> settingsList){
		super("改变系统设置");
		this.settingsList = settingsList;
	}

	public List<Settings> getSettingsList() {
		return settingsList;
	}

	public void setSettingsList(List<Settings> settingsList) {
		this.settingsList = settingsList;
	}
	
	
}

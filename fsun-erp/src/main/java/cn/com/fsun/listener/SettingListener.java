package cn.com.fsun.listener;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

import cn.com.fsun.event.SettingEvent;
import cn.com.fsun.sys.domain.Settings;

/**
 * 
 * @author lee
 *
 */
@Component
public class SettingListener implements ApplicationListener<SettingEvent> {

	@Autowired
	private ServletContext servletContext;
	
	public void onApplicationEvent(SettingEvent event) {
		List<Settings> settingsList = event.getSettingsList();
		for(Settings settings:settingsList){
			servletContext.setAttribute(settings.getCode(), settings.getValue());
		}
	}

}

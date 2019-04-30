package cn.com.fsun.sys.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import cn.com.fsun.common.service.BaseService;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.common.utils.ResultUtil;
import cn.com.fsun.constants.SettingsConstants;
import cn.com.fsun.event.SettingEvent;
import cn.com.fsun.init.SettingsServletContextListener;
import cn.com.fsun.sys.dao.SettingsDAO;
import cn.com.fsun.sys.domain.Settings;
import cn.com.fsun.sys.dto.SettingsDto;

/**
 * 
 * @author felenwe
 * 
 * @date 2012-5-18
 */
@Service
public class SettingsService extends BaseService {

	private static final String ONLINE_COUNT_TIMES = "online_count_times";
	
	@Autowired
	private SettingsDAO settingsDAO;
	
	@Autowired
	private ApplicationContext applicationContext;
	
	@Autowired
	private ServletContext servletContext;

	public void save(SettingsDto settings) {
		List<Settings> settingsList = new ArrayList<Settings>();
		if (null != settings.getId()) {
			Settings s = settingsDAO.load(settings.getId());
			if (null != s) {
				s.setValue(settings.getValue());
			}
			settingsDAO.save(s);
			settingsList.add(s);			
		} else {
			Settings p = dtoToDomain(settings);
			settingsDAO.save(p);
			settingsList.add(p);
		}
		if(settingsList.get(0)!=null && SettingsConstants.REGISTER_KEY.equals(settingsList.get(0).getCode())){
			SettingsServletContextListener.setRegisterKey(settingsList.get(0).getValue());
		}
		SettingEvent settingEvent = new SettingEvent(settingsList);
		applicationContext.publishEvent(settingEvent);
	}

	public void saveAll(List<SettingsDto> list) {
		if (null != list) {
			List<Settings> settingss = new ArrayList<Settings>();
			for (SettingsDto settings : list) {
				Settings s = null;
				if (null != settings.getId()) {
					s = settingsDAO.load(settings.getId());
					if (null != s) {
						s.setValue(settings.getValue());
					} else {
						continue;
					}
				} else {
					s = dtoToDomain(settings);
				}
				if(s.getCode() == ONLINE_COUNT_TIMES){
					//在线用户数量统计 时间间隔
					//在这里更新cronTrigger的时间间隔，或者改成simpleTrigger也行……………………
				}
				settingss.add(s);
			}
			settingsDAO.saveAll(settingss);
			
			
			SettingEvent settingEvent = new SettingEvent(settingss);
			applicationContext.publishEvent(settingEvent);
		}
	}

	public void delete(String id) {
		try {
			settingsDAO.delete(settingsDAO.load(id));
		} catch (Exception e) {
		}
	}

	public List<SettingsDto> list() {
		List<Settings> settingss = settingsDAO.list();
		List<SettingsDto> settingsModels = new ArrayList<SettingsDto>();
		for (Settings p : settingss) {
			if(!"register_key".equals(p.getCode())){
				settingsModels.add(domainToDto(p));
			}			
		}
		return settingsModels;
	}

	public SettingsDto load(String id) {
		SettingsDto model = domainToDto(settingsDAO.load(id));
		return model;
	}

	public static SettingsDto domainToDto(Settings domain) {
		if (null == domain)
			return null;
		SettingsDto model = new SettingsDto();
		model.setId(domain.getId());
		model.setCode(domain.getCode());
		model.setName(domain.getName());
		model.setValue(domain.getValue());
		model.setGroup(domain.getGroup());
		model.setEditor(domain.getEditor());
		return model;
	}

	public ModelMap search(SettingsDto settingsModel) {
		PageInfo pageInfo = null;
		if (null != settingsModel.getRows() && null != settingsModel.getPage())
			pageInfo = new PageInfo(settingsModel.getRows(),
					settingsModel.getPage());

		Settings settings = dtoToDomain(settingsModel);
		int count = settingsDAO.searchCount(settings, pageInfo);
		pageInfo.setTotalRecords(count);

		if (count <= 0)
			return ResultUtil.searchNull();

		List<Settings> settingss = settingsDAO.search(settings, pageInfo);
		List<SettingsDto> settingsModels = new ArrayList<SettingsDto>();
		for (Settings domain : settingss) {
			settingsModels.add(domainToDto(domain));
		}
		return ResultUtil.search(settingsModels, count);
	}

	public static Settings dtoToDomain(SettingsDto model) {
		if (null == model)
			return null;
		Settings domain = new Settings();
		domain.setId(model.getId());
		domain.setCode(model.getCode());
		domain.setName(model.getName());
		domain.setValue(model.getValue());
		domain.setGroup(model.getGroup());
		domain.setEditor(model.getEditor());
		return domain;
	}

	public SettingsDto loadByCode(String code) {
		Settings settings = settingsDAO.loadByCode(code);
		return domainToDto(settings);
	}

	public boolean startup(String id) {
		return settingsDAO.startup(id);
	}

	public boolean forbid(String id) {
		return settingsDAO.forbid(id);
	}

	public void deleteByIds(String[] ids) {
		settingsDAO.deleteByIds(ids);
	}

	public List<SettingsDto> listByIds(String[] ids) {
		List<Settings> settingss = settingsDAO.listByIds(ids);
		List<SettingsDto> settingsModels = new ArrayList<SettingsDto>();
		for (Settings settings : settingss) {
			SettingsDto settingsModel = domainToDto(settings);
			settingsModels.add(settingsModel);
		}
		return settingsModels;
	}
	
	public String getValueByCode(String code){
		return settingsDAO.getValueByCode(code);
	}
	
}

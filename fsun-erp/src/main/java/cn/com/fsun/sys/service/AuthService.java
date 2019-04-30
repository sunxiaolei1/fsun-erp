package cn.com.fsun.sys.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.stereotype.Service;

import cn.com.fsun.common.service.BaseService;
import cn.com.fsun.common.utils.DateUtil;
import cn.com.fsun.common.utils.EncryptionDecryption;
import cn.com.fsun.constants.SettingsConstants;
import cn.com.fsun.sys.dao.SettingsDAO;
import cn.com.fsun.sys.domain.Settings;
import cn.com.fsun.sys.dto.AuthDto;

@Service
public class AuthService extends BaseService{
	
	@Autowired
	private SettingsDAO settingsDao;

	
	public int register(AuthDto authDto) throws Exception {
		try{
			if(authDto!=null && authDto.getRegisterKey()!=null && !"".equals(authDto.getRegisterKey())){
				Settings settings = settingsDao.loadByCode(SettingsConstants.REGISTER_KEY);
				EncryptionDecryption des = new EncryptionDecryption("tourhb");
				String newKey = des.decrypt(authDto.getRegisterKey());
				if(newKey!=null && !"".equals(newKey)){
					Long currTime = (new Date()).getTime();					    
					Long startTime = DateUtil.parse(newKey.split(",")[0], "yyyy-MM-dd HH:mm:ss").getTime();
					Long endTime = DateUtil.parse(newKey.split(",")[1], "yyyy-MM-dd HH:mm:ss").getTime();
					if(currTime<=endTime&& currTime>=startTime){
						settings.setValue(authDto.getRegisterKey());
						settingsDao.save(settings);
					}else{
						throw new AuthenticationServiceException("用户未注册成功,请联系管理员！");
					}
					return new Long((endTime-startTime)/(1000*60*60*24)).intValue();
				}else{
					throw new AuthenticationServiceException("用户未注册成功,请注册或联系管理员！");
				}
			}else{
				throw new AuthenticationServiceException("用户未注册成功,请注册或联系管理员！");
			}
		}catch (Exception e) {
			throw new AuthenticationServiceException("用户未注册成功,请注册或联系管理员！");
		}
	}

}

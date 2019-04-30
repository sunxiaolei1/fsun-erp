package cn.com.fsun.client.rpc.configure;

import javax.naming.InitialContext;
import javax.naming.NamingException;

import org.apache.activemq.ActiveMQConnectionFactory;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.support.converter.MappingJackson2MessageConverter;

import cn.com.fsun.common.rpc.constants.RpcConstants;


/**
 * activemq 配置
 * @author sun
 *
 */
@Configuration
public class ActiveMqConfigure {
	
	private static Logger logger = Logger.getLogger(ActiveMqConfigure.class);  
	
	@Autowired
	private InitialContext jndiContext;
	
	private ActiveMQConnectionFactory connectionFactory;

    /** 
     * jsonMessageConverter
     * @return
     */
    @Bean(name="jsonMessageConverter")
    public MappingJackson2MessageConverter jsonMessageConverter() {
    	MappingJackson2MessageConverter messageConverter = new MappingJackson2MessageConverter();
    	messageConverter.setTypeIdMappings(RpcConstants.CLIENT_CLASSMAP);
        return messageConverter;
    }
    
    /**
     * 连接工厂
     * @return
     */
    @Bean
    public ActiveMQConnectionFactory activemqConnectionFactory(){
    	try {
    		if(connectionFactory!=null){
    			return connectionFactory;
    		}
			connectionFactory = (ActiveMQConnectionFactory) jndiContext.lookup("java:comp/env/myJMS/ConnectionFactory");
    	} catch (NamingException e) {
			logger.error("Could not create JNDI API context: " + e.toString());
		}
    	return connectionFactory;
    }
    
    /**
     * 
     * @return
     */
    @Bean
    public JmsTemplate jmsTemplate(){
    	JmsTemplate jmsTemplate = new JmsTemplate();
    	jmsTemplate.setConnectionFactory(activemqConnectionFactory());
    	jmsTemplate.setMessageConverter(jsonMessageConverter());
    	return jmsTemplate;
    }
    
 
    
}

package cn.com.fsun.bus.service;

import javax.jms.ConnectionFactory;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;
import javax.jms.TextMessage;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Service;

@Service
public class MessageService {
	
	private static final Logger LOG = Logger.getLogger(MessageService.class); 
	
	@Autowired
    private JmsTemplate jmsTemplate;  
      
    public void sendMessage(final String message) {  
        LOG.info("Send message: " + message);
        ConnectionFactory factory = jmsTemplate.getConnectionFactory();
        jmsTemplate.send("MyMessageQueue",new MessageCreator() {  
  
            public Message createMessage(Session session) throws JMSException {  
                TextMessage textMessage = session.createTextMessage(message);  
                return textMessage;  
            }  
              
        });  
    }  
}

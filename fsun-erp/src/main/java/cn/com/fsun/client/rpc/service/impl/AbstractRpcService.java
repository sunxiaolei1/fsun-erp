package cn.com.fsun.client.rpc.service.impl;

import java.util.Date;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;

import org.apache.activemq.command.ActiveMQBytesMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.jms.support.converter.MappingJackson2MessageConverter;
import org.springframework.jms.support.converter.MessageConversionException;

import cn.com.fsun.common.rpc.model.AbstractModel;

public abstract class AbstractRpcService {

	@Autowired
	private JmsTemplate jmsTemplate;
	
	/**
	 * 发送消息并且返回执行结果
	 * @param cmdmodel
	 * @return
	 * @throws JMSException 
	 * @throws MessageConversionException 
	 */
	protected Object sendAndReceive(String destinationName, final AbstractModel model) throws MessageConversionException, JMSException{
		model.setTime(new Date());
		final MappingJackson2MessageConverter messageConverter = (MappingJackson2MessageConverter) jmsTemplate.getMessageConverter();
		messageConverter.setTypeIdPropertyName(destinationName);
		Message message =  jmsTemplate.sendAndReceive(destinationName, new MessageCreator() {
			@Override
			public Message createMessage(Session session) throws JMSException {
				return messageConverter.toMessage(model, session);
			}
		});
		return messageConverter.fromMessage(message);
	}
	
	/**
	 * 发送消息，但不返回结果
	 * @param cmdmodel
	 */
	protected void send(String destinationName, AbstractModel model){
		model.setTime(new Date());
		MappingJackson2MessageConverter messageConverter = (MappingJackson2MessageConverter) jmsTemplate.getMessageConverter();
		messageConverter.setTypeIdPropertyName(destinationName);
		jmsTemplate.convertAndSend(destinationName, model);
	}
	
	/**
	 * 发送消息并且返回执行结果
	 * @param cmdmodel
	 * @return
	 * @throws JMSException 
	 * @throws MessageConversionException 
	 */
	protected Object sendAndReceive(final AbstractModel model) throws MessageConversionException, JMSException{
		model.setTime(new Date());
		final MappingJackson2MessageConverter messageConverter = (MappingJackson2MessageConverter) jmsTemplate.getMessageConverter();
		messageConverter.setTypeIdPropertyName(model.getDestinationName());
		Message message =  jmsTemplate.sendAndReceive(model.getDestinationName(), new MessageCreator() {
			@Override
			public Message createMessage(Session session) throws JMSException {
				return messageConverter.toMessage(model, session);
			}
		});
		return messageConverter.fromMessage(message);
	}
	
	/**
	 * 发送消息，但不返回结果(routingkey和cmd一致)
	 * @param cmdmodel
	 */
	protected void send(AbstractModel model){
		model.setTime(new Date());
		MappingJackson2MessageConverter messageConverter = (MappingJackson2MessageConverter) jmsTemplate.getMessageConverter();
		messageConverter.setTypeIdPropertyName(model.getDestinationName());
		jmsTemplate.convertAndSend(model.getDestinationName(), model);
	}
}

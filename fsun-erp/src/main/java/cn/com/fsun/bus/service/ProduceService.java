package cn.com.fsun.bus.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fsun.bus.dao.AfterProcessDao;
import cn.com.fsun.bus.dao.CustomerDao;
import cn.com.fsun.bus.dao.OrderDao;
import cn.com.fsun.bus.dao.OrderDetailDao;
import cn.com.fsun.bus.dao.ProductDao;
import cn.com.fsun.bus.domain.BusCustomerInfo;
import cn.com.fsun.bus.domain.BusOrderDetail;
import cn.com.fsun.bus.domain.BusOrderInfo;
import cn.com.fsun.bus.domain.BusProductInfo;
import cn.com.fsun.bus.dto.OrderDetailDto;
import cn.com.fsun.bus.dto.OrderDto;
import cn.com.fsun.bus.dto.ProductDto;
import cn.com.fsun.bus.dto.OrderProductDto;
import cn.com.fsun.bus.dto.ProduceDto;
import cn.com.fsun.common.service.BaseService;
import cn.com.fsun.common.utils.DateUtil;
import cn.com.fsun.common.utils.PageInfo;

@Service
public class ProduceService extends BaseService{

	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private CustomerDao customerDao;
	
	@Autowired
	private OrderDetailDao orderDetailDao;
	
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private AfterProcessDao afterProcessDao;
	
	/**
	 * 过滤出未下单的订单
	 * @param orderDto
	 * @param pageInfo
	 * @param isPage
	 * @return
	 */
	public List<OrderDto> getOrderList(OrderDto orderDto,PageInfo pageInfo,boolean isPage){
		String hql = getHql(orderDto,pageInfo); 
		List<BusOrderInfo> orderInfos = null;
		if(isPage){
			orderInfos = orderDao.findOrderForPage(hql, pageInfo);
		}else{
			orderInfos = orderDao.findOrder(hql);
		}
		List<OrderDto> orderDtos = OrderService.DomainstoDtos(orderInfos);
		return orderDtos;
	}
	
	private String getHql(OrderDto orderDto,PageInfo pageInfo){
		String hql = "from BusOrderInfo orderInfo ";
		String where = "where 1=1 and orderInfo.status != '制单中' ";
		if(orderDto.getStatus()!=null && !"".equals(orderDto.getStatus())){
			where += " and orderInfo.status = '"+ orderDto.getStatus() +"' ";
		}
		if(orderDto.getCustomerName()!=null && !"".equals(orderDto.getCustomerName())){
			where += " and orderInfo.customerName like '%"+ orderDto.getCustomerName() +"%' ";
		}
		if(orderDto.getOrderType()!=null && !"".equals(orderDto.getOrderType())){
			where += " and orderInfo.orderType = '"+ orderDto.getOrderType() +"' ";
		}
		if(orderDto.getCode()!=null && !"".equals(orderDto.getCode())){
			where += " and orderInfo.code = '"+ orderDto.getCode() +"' ";
		}
		if (pageInfo.getStartDate()!=null && !"".equals(pageInfo.getStartDate())){
			where += " and orderInfo.receiveTime >= '"+ pageInfo.getStartDate() +"' ";
		}
		if(pageInfo.getEndDate()!=null && !"".equals(pageInfo.getEndDate())){
			where += " and orderInfo.receiveTime <= '"+ pageInfo.getEndDate() +"' ";
		}
		String orderBy = "order by ";
		if(null != pageInfo.getSortColumn() && !"".equals(pageInfo.getSortColumn())){
			if("DESC".equals(pageInfo.getSortType().toUpperCase())){
				orderBy += "orderInfo."+ pageInfo.getSortColumn() +" desc ";
			}else{
				orderBy += "orderInfo."+ pageInfo.getSortColumn() +" asc ";
			}			
		}else{
			orderBy += "orderInfo.code desc ";
		}
		
		return (hql + where + orderBy);
	}
	
	public int getOrderCount(OrderDto orderDto,PageInfo pageInfo){	
		String hql = getOrderCountHql(orderDto,pageInfo);			
		return orderDao.getCountForInfo(hql);					
	}
	
	private String getOrderCountHql(OrderDto orderDto,PageInfo pageInfo){		
		String hql = "select count(orderInfo.id) from BusOrderInfo orderInfo ";
		String where = "where 1=1 and orderInfo.status != '制单中' ";
		if(orderDto.getStatus()!=null && !"".equals(orderDto.getStatus())){
			where += " and orderInfo.status = '"+ orderDto.getStatus() +"' ";
		}
		if(orderDto.getCustomerName()!=null && !"".equals(orderDto.getCustomerName())){
			where += " and orderInfo.customerName like '%"+ orderDto.getCustomerName() +"%' ";
		}
		if(orderDto.getOrderType()!=null && !"".equals(orderDto.getOrderType())){
			where += " and orderInfo.orderType = '"+ orderDto.getOrderType() +"' ";
		}
		if(orderDto.getCode()!=null && !"".equals(orderDto.getCode())){
			where += " and orderInfo.code = '"+ orderDto.getCode() +"' ";
		}
		if (pageInfo.getStartDate()!=null && !"".equals(pageInfo.getStartDate())){
			where += " and orderInfo.receiveTime >= '"+ pageInfo.getStartDate() +"' ";
		}
		if(pageInfo.getEndDate()!=null && !"".equals(pageInfo.getEndDate())){
			where += " and orderInfo.receiveTime <= '"+ pageInfo.getEndDate() +"' ";
		}	
		return (hql + where);	
	}

	public List<ProduceDto> getDeliverInfo(String ids,String productIds,boolean hasShowPrice) {
		if(ids==null||"".equals(ids)){
			return new ArrayList<ProduceDto>();
		}
		List<ProduceDto> produceDtoList = new ArrayList<ProduceDto>();
		String[] idList = ids.split(",");
		for (int i = 0; i < idList.length; i++) {
			ProduceDto produceDto = new ProduceDto();
			BusOrderInfo orderInfo = orderDao.load(idList[i]);
			orderInfo.setCreateTime(DateUtil.parse(DateUtil.formateDate(orderInfo.getCreateTime(), "yyyy-MM-dd"), "yyyy-MM-dd"));
			BusCustomerInfo customer = customerDao.loadByCode(orderInfo.getCustomerCode());
			String hql = "";
			String where = " where orderId = '"+ idList[i] +"'";
			if(productIds!=null && !"".equals(productIds)){
				String[] idsArray = productIds.split(",");
				String idsStr = "";
				for (int j = 0; j < idsArray.length; j++) {
					idsStr+="'" + idsArray[j] + "',";
				}
				idsStr = idsStr.substring(0,idsStr.length()-1);
				where +=" and id in("+ idsStr +")";
			}
			if(hasShowPrice){
				hql = "from BusOrderDetail " + where;
			}else{
				hql = "select new cn.com.fsun.bus.domain.BusOrderDetail" +
						"(id,orderId,productName,productCode,number,realNumber,spec,unit,description,enabled,style,papers,prints)" +
						" from BusOrderDetail " + where;
			}
						
			List<OrderProductDto> orderProductDtoList = new ArrayList<OrderProductDto>();
			List<BusOrderDetail> orderDetailList = orderDetailDao.find(hql);
			for (BusOrderDetail busOrderDetail : orderDetailList) {
				OrderProductDto orderProductDto = new OrderProductDto();
				orderProductDto.setOrderDetail(busOrderDetail);
				orderProductDtoList.add(orderProductDto);
			}			
			produceDto.setOrderInfo(orderInfo);
			produceDto.setCustomer(customer);
			produceDto.setOrderProductDtoList(orderProductDtoList);
			produceDtoList.add(produceDto);
		}
		return produceDtoList;
	}
	
	
	//获取生产单及相关信息
	public List<ProduceDto> getProduceInfo(String ids) {
		if(ids==null||"".equals(ids)){
			return new ArrayList<ProduceDto>();
		}
		List<ProduceDto> produceDtoList = new ArrayList<ProduceDto>();
		String[] idList = ids.split(",");
		for (int i = 0; i < idList.length; i++) {
			ProduceDto produceDto = new ProduceDto();
			BusOrderInfo orderInfo = orderDao.load(idList[i]);
			orderInfo.setCreateTime(DateUtil.parse(DateUtil.formateDate(orderInfo.getCreateTime(), "yyyy-MM-dd"), "yyyy-MM-dd"));
			String hql = "";
			
			hql = "select new cn.com.fsun.bus.domain.BusOrderDetail" +
				"(id,orderId,productName,productCode,number,realNumber,spec,unit,description,enabled,style,papers,prints)" +
				" from BusOrderDetail where orderId = '"+ idList[i] +"'"+
				" group by productCode ";			
						
			List<OrderProductDto> orderProductDtoList = new ArrayList<OrderProductDto>();
			List<BusOrderDetail> orderDetailList = orderDetailDao.find(hql);
			for (BusOrderDetail orderDetail : orderDetailList) {
				OrderProductDto orderProductDto = new OrderProductDto();
				orderProductDto.setOrderDetailList(this.getOrderDetailsByOrderIdAndProductCode(orderDetail.getOrderId(),orderDetail.getProductCode()));
				BusProductInfo productInfo = productDao.loadByCode(orderDetail.getProductCode());
				orderProductDto.setProductInfo(productInfo);
				orderProductDto.setAfterProcess(afterProcessDao.getProcessByProductId(productInfo.getId()));
				orderProductDtoList.add(orderProductDto);
			}			
			produceDto.setOrderInfo(orderInfo);
			produceDto.setOrderProductDtoList(orderProductDtoList);
			produceDtoList.add(produceDto);
		}
		return produceDtoList;
	}
	
	/**
	 * 通过订单ID和产品编号获取订单明细列表
	 * @param orderId
	 * @param productCode
	 * @return
	 */
	public List<BusOrderDetail> getOrderDetailsByOrderIdAndProductCode(String orderId,String productCode){
		String hql = "select new cn.com.fsun.bus.domain.BusOrderDetail" +
			"(id,orderId,productName,productCode,number,realNumber,spec,unit,description,enabled,style,papers,prints)" +
			" from BusOrderDetail where orderId = '"+ orderId +"' "+
		    " and productCode = '"+ productCode +"'";
		List<BusOrderDetail> list = orderDetailDao.find(hql);
		return list;
	}

	public void orderUpdate(OrderDto orderDto) {
		BusOrderInfo orderInfo = orderDao.load(orderDto.getId());
		orderInfo.setExpress(orderDto.getExpress());		
		orderInfo.setUpdateManId(super.getCurrentUserID());
		orderInfo.setUpdateTime(new Date());
		
		orderDao.save(orderInfo);
	}

}

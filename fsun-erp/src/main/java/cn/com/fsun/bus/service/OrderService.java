package cn.com.fsun.bus.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fsun.bus.dao.AfterProcessDao;
import cn.com.fsun.bus.dao.CustomerDao;
import cn.com.fsun.bus.dao.DeliveryDetailDao;
import cn.com.fsun.bus.dao.MadePackageDao;
import cn.com.fsun.bus.dao.OrderDao;
import cn.com.fsun.bus.dao.OrderDetailDao;
import cn.com.fsun.bus.dao.ProductDao;
import cn.com.fsun.bus.domain.BusAfterProcess;
import cn.com.fsun.bus.domain.BusCustomerInfo;
import cn.com.fsun.bus.domain.BusOrderDetail;
import cn.com.fsun.bus.domain.BusOrderInfo;
import cn.com.fsun.bus.domain.BusProductInfo;
import cn.com.fsun.bus.dto.AfterProcessDto;
import cn.com.fsun.bus.dto.OrderDetailDto;
import cn.com.fsun.bus.dto.OrderDto;
import cn.com.fsun.bus.dto.OrderTackDto;
import cn.com.fsun.bus.dto.ProductDto;
import cn.com.fsun.bus.dto.ReorderDto;
import cn.com.fsun.bus.enums.OrderSourceEnum;
import cn.com.fsun.bus.enums.OrderStatusEnum;
import cn.com.fsun.bus.exception.UnEnoughOrderCodeException;
import cn.com.fsun.common.dto.CommonDto;
import cn.com.fsun.common.service.BaseService;
import cn.com.fsun.common.utils.DateUtil;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.init.SettingsServletContextListener;


@Service
public class OrderService extends BaseService{

	@Autowired
	private OrderDao orderDao;
	

	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private OrderDetailDao orderDetailDao;	
	
	@Autowired
	private AfterProcessDao afterProcessDao;
	
	@Autowired
	private CustomerDao customerDao;	
	
	@Autowired
	private ProductService productService;
		
	/**
	 * @description 显示列表（无查询条件）
	 * @return List<BusOrderInfo>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<OrderDto> list() {

		List<BusOrderInfo> orderInfo = orderDao.list();
		List<OrderDto> orderDtos = DomainstoDtos(orderInfo);
		return orderDtos;
	}
	
	@Autowired
	private MadePackageDao madePackageDao;
		
	@Autowired
	private DeliveryDetailDao deliveryDetailDao;
	
	/**
	 * @description 显示列表（有查询条件）
	 * @return List<BusOrderInfo>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<OrderDto> search(OrderDto orderDto,PageInfo pageInfo,boolean isPage){
		
		BusOrderInfo orderInfo = DtotoDomain(orderDto);
		String productCode = orderDto.getProductCode(); 
		if(productCode!=null && !"".equals(productCode)){
			List<String> orderIds = orderDetailDao.getOrderIdsByProductCode(productCode);
			orderInfo.setOrderIds(orderIds);
		}
		
		String madeCode = orderDto.getMadeCode();
		String deliveryCode = orderDto.getDeliveryCode();
		if(madeCode!=null && !"".equals(madeCode)){
			List<String> orderIds = madePackageDao.getOrderIdsByMadeCode(madeCode);
			orderInfo.setOrderIds(orderIds);
		}
		if(deliveryCode!=null && !"".equals(deliveryCode)){
			List<String> orderIds = deliveryDetailDao.getOrderIdsByDeliveryCode(deliveryCode);
			orderInfo.setOrderIds(orderIds);
		}
		
		List<BusOrderInfo> orderInfos = orderDao.search(orderInfo, pageInfo,isPage);
		List<OrderDto> orderDtos = DomainstoDtos(orderInfos);
		return orderDtos;
	}
 
	/**
	 * @description 增加或者修改
	 * @return OrderDto
	 * @param orderDto
	 * @return
	 * @throws UnEnoughOrderCodeException 
	 * @update 2013-2-21
	 */
	public OrderDto save(OrderDto orderDto) throws UnEnoughOrderCodeException{
		BusOrderInfo orderInfo = null;
		if(StringUtils.isNotEmpty(orderDto.getId())){
			orderInfo = orderDao.load(orderDto.getId());
			orderInfo.setOrderType(orderDto.getOrderType());
		
			orderInfo.setSetWay(orderDto.getSetWay());
			orderInfo.setIsGet(orderDto.getIsGet());
			orderInfo.setExpress(orderDto.getExpress());
			orderInfo.setContract(orderDto.getContract());
			if(orderDto.getReceiveTime()!=null && !"".equals(orderDto.getReceiveTime())){			
				orderInfo.setReceiveTime(DateUtil.parse(orderDto.getReceiveTime(), "yyyy-MM-dd"));
			}			
			orderInfo.setDescription(orderDto.getDescription());	
			orderInfo.setUpdateManId(super.getCurrentUserID());
			orderInfo.setUpdateTime(new Date());
			orderInfo.setCustomerCode(orderDto.getCustomerCode());
			orderInfo.setCustomerName(orderDto.getCustomerName());
		}else{
			orderInfo = DtotoDomain(orderDto);
			orderInfo.setStatus(OrderStatusEnum.ORDER_CREATING.getCode());
			orderInfo.setPrintStatus(false);
			orderInfo.setProducePrintStatus(false);
			orderInfo.setCode(this.initOrderCode());
			orderInfo.setCreateTime(new Date());
			orderInfo.setCreateManId(super.getCurrentUserID());
			orderInfo.setCreateManName(super.getCurrentUserRealName());
		}		
		/*BusCustomerInfo customerInfo = customerDao.loadByCode(orderDto.getCustomerCode());
		if(customerInfo!=null){
			orderInfo.setCustomerName(customerInfo.getName());
		}else{
			orderInfo.setCustomerName("");
		}*/
		orderDao.save(orderInfo);
		return DomaintoDto(orderInfo);
		
	}
	
	
	/**
	 * @description 增加或者修改
	 * @return OrderDto
	 * @param orderDto
	 * @return
	 * @throws UnEnoughOrderCodeException 
	 * @update 2013-2-21
	 */
	public OrderDto create(OrderDto orderDto){
		
		BusOrderInfo orderInfo = DtotoDomain(orderDto);
		orderInfo.setStatus(OrderStatusEnum.ORDER_CREATED.getCode());
		orderInfo.setPrintStatus(false);
		orderInfo.setProducePrintStatus(false);
		orderInfo.setCode(orderDto.getCode());
		orderInfo.setCreateTime(new Date());
		orderInfo.setCreateManId(super.getCurrentUserID());
		orderInfo.setCreateManName(super.getCurrentUserRealName());		
		orderDao.save(orderInfo);
		return DomaintoDto(orderInfo);
		
	}
	
	/**
	 * 获取初始化订单号
	 * @return
	 * @throws UnEnoughOrderCodeException
	 */
	public String initOrderCode() throws UnEnoughOrderCodeException{	
		String sign = new SimpleDateFormat("yyyyMMdd").format(new Date())+OrderSourceEnum.SALE_ORDER.getValue();
		System.out.println(sign);
		Long initCode = orderDao.getInitCode(sign);
		if(initCode%100000==99999){
			throw new UnEnoughOrderCodeException();
		}
		return initCode+"";
	}
	
	
	/**
	 * @description 删除一个菜单节点
	 * @return void
	 * @param id
	 * @update 2012-8-13 上午9:37:49
	 */
	public void delete(String id){
		try{
			orderDao.delete(orderDao.load(id));
		}catch (Exception e) {
//			System.out.println(e.getMessage());
		}
	}
	
	/**
	 * 删除订单信息及订单下相关的信息
	 * @param ids
	 * @param property
	 */
	public void delete(String[] ids,String property){
		
		if(property!=null && !"".equals(property) && ids!=null && ids.length>0){
			String hql_order ="delete BusOrderInfo a where a.id in (:"+property+")";
			String hql_buy = "delete BusOrderDetail a where a.orderId in (:"+property+")";		
			try {
				orderDao.excuteHQLForSet(hql_order, property, ids);
				orderDetailDao.excuteHQLForSet(hql_buy,property,ids);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException();
			}
		}
	}
	
	
	/**
	 * @description 加载一个菜单节点
	 * @return OrderDto
	 * @param id
	 * @update 2012-8-13 上午9:38:10
	 */
	public OrderDto load(String id){
		OrderDto orderDto = DomaintoDto(orderDao.load(id));
		BusCustomerInfo customer = customerDao.loadByCode(orderDto.getCustomerCode());
		orderDto.setAddress(customer.getAddress());
		orderDto.setContacts(customer.getContacts());
		orderDto.setTel(customer.getTel());
		return orderDto;
	}

	/**
	 * @description 获取查询结果数量
	 * @return int
	 * @param orderDto
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public int getSearchCount(OrderDto orderDto,PageInfo pageInfo){	
		String hql = "select count(a.id) from BusOrderInfo a where 1=1 ";			
		hql = addWhere(orderDto,pageInfo,hql);		
		return orderDao.getCountForInfo(hql);	
	}
	
	
	/**
	 * @description Domian转Dto
	 * @return orderInfo
	 * @param orderDto
	 */
	public BusOrderInfo DtotoDomain(OrderDto orderDto){
		if(null==orderDto){
			return null;
		}
		BusOrderInfo orderInfo = new BusOrderInfo();
		orderInfo.setId(orderDto.getId());
		orderInfo.setCode(orderDto.getCode());
		orderInfo.setOrderType(orderDto.getOrderType());
		orderInfo.setCustomerName(orderDto.getCustomerName());
		orderInfo.setCustomerCode(orderDto.getCustomerCode());
		if(orderDto.getReceiveTime()!=null && !"".equals(orderDto.getReceiveTime())){			
			orderInfo.setReceiveTime(DateUtil.parse(orderDto.getReceiveTime(), "yyyy-MM-dd"));
		}
		orderInfo.setExpress(orderDto.getExpress());
		orderInfo.setContract(orderDto.getContract());
		orderInfo.setSetWay(orderDto.getSetWay());
		orderInfo.setAllPrice(orderDto.getAllPrice()==null ? 0:orderDto.getAllPrice());
		orderInfo.setIsGet(orderDto.getIsGet());
		orderInfo.setStatus(orderDto.getStatus());	
		orderInfo.setPrintStatus(orderDto.getPrintStatus());
		orderInfo.setProducePrintStatus(orderDto.getProducePrintStatus());
		orderInfo.setStrip(orderDto.getStrip()==null ? 0:orderDto.getStrip());
		orderInfo.setNumber(orderDto.getNumber()==null ? 0:orderDto.getNumber());
		orderInfo.setDescription(orderDto.getDescription());
		
		orderInfo.setEnabled(orderDto.getEnabled());
		orderInfo.setPriority(orderDto.getPriority());
		orderInfo.setCreateManId(orderDto.getCreateManId());
		orderInfo.setCreateManName(orderDto.getCreateManName());
		if(orderDto.getCreateTime()!=null && !"".equals(orderDto.getCreateTime())){			
			orderInfo.setCreateTime(DateUtil.parse(orderDto.getCreateTime(), "yyyy-MM-dd HH:mm:ss"));
		}	
		orderInfo.setUpdateManId(orderDto.getUpdateManId());
		orderInfo.setUpdateTime(orderDto.getUpdateTime());
		orderInfo.setMerchandiserId(orderDto.getMerchandiserId());
		if(orderDto.getMerchandTime()!=null && !"".equals(orderDto.getMerchandTime())){			
			orderInfo.setMerchandTime(DateUtil.parse(orderDto.getMerchandTime(), "yyyy-MM-dd HH:mm:ss"));
		}
		
		return orderInfo;
	}
	
	/**
	 * @description Dto转Domian
	 * @return OrderDto
	 * @param orderInfo
	 */
	public static OrderDto DomaintoDto(BusOrderInfo orderInfo){
		if(null==orderInfo){
			return null;
		}
		OrderDto orderDto = new OrderDto();
		orderDto.setId(orderInfo.getId());
		orderDto.setCode(orderInfo.getCode());
		orderDto.setOrderType(orderInfo.getOrderType());
		orderDto.setCustomerCode(orderInfo.getCustomerCode());
		orderDto.setCustomerName(orderInfo.getCustomerName());
		if(orderInfo.getReceiveTime() != null){			
			orderDto.setReceiveTime(DateUtil.formateDate(orderInfo.getReceiveTime(), "yyyy-MM-dd"));
		}
		orderDto.setExpress(orderInfo.getExpress());
		orderDto.setContract(orderInfo.getContract());
		orderDto.setSetWay(orderInfo.getSetWay());
		orderDto.setAllPrice(orderInfo.getAllPrice());
		orderDto.setIsGet(orderInfo.getIsGet());
		orderDto.setHasGet(orderInfo.getIsGet()?"是":"否");
		orderDto.setStatus(orderInfo.getStatus());
		orderDto.setPrintStatus(orderInfo.getPrintStatus());
		orderDto.setHasPrintStatus(orderInfo.getPrintStatus()?"已打印":"未打印");
		orderDto.setProducePrintStatus(orderInfo.getProducePrintStatus());
		orderDto.setHasProducePrintStatus(orderInfo.getProducePrintStatus()?"已打印":"未打印");
		orderDto.setStrip(orderInfo.getStrip());
		orderDto.setNumber(orderInfo.getNumber());
		orderDto.setDescription(orderInfo.getDescription());
		
		orderDto.setEnabled(orderInfo.getEnabled());
		orderDto.setPriority(orderInfo.getPriority());
		orderDto.setCreateManId(orderInfo.getCreateManId());
		orderDto.setCreateManName(orderInfo.getCreateManName());
		if(orderInfo.getCreateTime() != null){			
			orderDto.setCreateTime(DateUtil.formateDate(orderInfo.getCreateTime(), "yyyy-MM-dd"));
		}		
		orderDto.setUpdateManId(orderInfo.getUpdateManId());
		orderDto.setUpdateTime(orderInfo.getUpdateTime());	
		orderDto.setMerchandiserId(orderInfo.getMerchandiserId());
		if(orderInfo.getMerchandTime() != null){			
			orderDto.setMerchandTime(DateUtil.formateDate(orderInfo.getMerchandTime(), "yyyy-MM-dd"));
		}	
		return orderDto;
	}
	
	/**
	 * @description domians转dtos
	 * @return List<OrderDto>
	 * @param orderInfos
	 * @return
	 */
	public static List<OrderDto> DomainstoDtos(List<BusOrderInfo> orderInfos){
		List<OrderDto> orderDtos = new ArrayList<OrderDto>();

		if (null != orderInfos && orderInfos.size() > 0) {
			for (BusOrderInfo orderInfo : orderInfos) {
				OrderDto orderDto = DomaintoDto(orderInfo);
				if (null != orderDto) {
					orderDtos.add(orderDto);
				}
			}
		}
		return orderDtos;
	}


	public void hasGoodForOrder(String string, String string2) {
		// TODO Auto-generated method stub
		
	}


	public boolean changeStatus(OrderDto orderDto) {
		BusOrderInfo orderInfo = orderDao.load(orderDto.getId());
		if(OrderStatusEnum.ORDER_CREATING.getCode().equals(orderDto.getStatus())){
			
			orderInfo.setMerchandiserId(super.getCurrentUserID());
			orderInfo.setMerchandTime(new Date());
			orderInfo.setStatus(OrderStatusEnum.ORDER_CREATED.getCode());
		}else if(OrderStatusEnum.ORDER_CREATED.getCode().equals(orderDto.getStatus())){
			//orderDto.setStatus("跟单中");
			
		//}else if("跟单中".equals(orderDto.getStatus())){
			orderInfo.setStatus(OrderStatusEnum.ORDER_END.getCode());
		}
		//orderDto.setUpdateManId(super.getCurrentUserID());
		//orderDto.setUpdateTime(new Date());		
		orderDao.save(orderInfo);
		return true;
	}


	/**
	 * 有没操作权限
	 * @param orderDto
	 * @return
	 */
	public Boolean operatePower(OrderDto orderDto) {
		if(orderDto!=null && OrderStatusEnum.ORDER_END.getCode().equals(orderDto.getStatus())){
			return false;
		}else{
			return true;
		}		
	}


	public List<OrderDto> getDataForExcelExport(OrderDto orderDto) {
		BusOrderInfo orderInfo = DtotoDomain(orderDto);
	    PageInfo pageInfo = new PageInfo();
		if(null!=orderInfo){
			if(StringUtils.isNotEmpty(orderDto.getSort())){
				pageInfo.setSortColumn(orderDto.getSort());
			}
			if(StringUtils.isNotEmpty(orderDto.getOrder())){
				pageInfo.setSortType(orderDto.getOrder());
			}
			if(orderDto.getStartDate() !=null &&!"".equals(orderDto.getStartDate())){
				pageInfo.setStartDate(orderDto.getStartDate()+" 00:00:00");
			}
			if(orderDto.getEndDate() !=null &&!"".equals(orderDto.getEndDate())){
				pageInfo.setEndDate(orderDto.getEndDate()+" 23:59:59");
			}
		}
		List<BusOrderInfo> orderInfos = orderDao.getSearchCount(orderInfo,pageInfo);	
		return DomainstoDtos(orderInfos);
	}


	public Boolean changeProducePrintStatus(String id, boolean status) {
		String[] ids = id.split(",");
		try {
			for (int i = 0; i < ids.length; i++) {
				BusOrderInfo orderInfo = orderDao.load(ids[i]);
				orderInfo.setProducePrintStatus(status);
				orderDao.save(orderInfo);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}		
		return true;		
	}


	public Boolean changePrintStatus(String id, boolean status) {
		String[] ids = id.split(",");
		try {
			for (int i = 0; i < ids.length; i++) {
				BusOrderInfo orderInfo = orderDao.load(ids[i]);
				orderInfo.setPrintStatus(status);
				orderDao.save(orderInfo);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}		
		return true;		
	}

	/**
	 * @description 显示列表（有查询条件）
	 * @return List<OrderDto>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<OrderDto> orderSummary(OrderDto orderDto, PageInfo pageInfo,boolean hasPage) {
				
		String hql = " from BusOrderInfo a where 1=1 ";	
		
		String selectStr = "select new cn.com.fsun.bus.dto.OrderDto(a.code, a.orderType,a.customerName, a.receiveTime," +
				"a.express, a.contract, a.allPrice, a.isGet,a.status, a.strip, a.description, a.createManName, a.createTime,a.merchandTime) ";
		if(orderDto==null){
			return null;	
		}		
		hql = addWhere(orderDto,pageInfo,hql);
		if(orderDto.getGroupBy()!=null && !"".equals(orderDto.getGroupBy())){
			hql = addGroupBy(orderDto.getGroupBy(),hql,selectStr);
		}else{
			hql = selectStr + hql; 
		}	
		hql = addOrderBy(pageInfo,hql);
		if(hasPage){
			return orderDao.findOrderForPage(hql,pageInfo);
		}else{
			return orderDao.findOrder(hql);
		}
	}
	
	public int orderSummaryCount(OrderDto orderDto, PageInfo pageInfo) {
		try{
			String hql = "select a.code from BusOrderInfo a where 1=1 ";			
			hql = addWhere(orderDto,pageInfo,hql);
			if(orderDto.getGroupBy()!=null && !"".equals(orderDto.getGroupBy())){
				hql += addGroupBy(orderDto.getGroupBy());
			}	
			List list = orderDao.find(hql);
			return list.size();		
		}catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
       
	}
	

	private String addWhere(OrderDto orderDto,PageInfo pageInfo,String hql){
		if(orderDto ==null){
		    return hql;
		}
		if(null!= orderDto.getCustomerName() && !"".equals(orderDto.getCustomerName())){
			hql += " and a.customerName = '"+ orderDto.getCustomerName() +"' ";
		}
		if(null!= orderDto.getOrderType() && !"".equals(orderDto.getOrderType())){
			hql += " and a.orderType = '"+ orderDto.getOrderType() +"' ";
		}
		if(null!= orderDto.getStatus() && !"".equals(orderDto.getStatus())){
			hql += " and a.status = '"+ orderDto.getStatus() +"' ";
		}
		if(null!= orderDto.getIsGet() && !"".equals(orderDto.getIsGet())){
			hql += " and a.isGet = "+ orderDto.getIsGet() +" ";
		}
		if (pageInfo.getStartDate()!=null){
			hql += " and a.receiveTime >= '"+ pageInfo.getStartDate() +"' ";
		}
		if(pageInfo.getEndDate()!=null){
			hql += " and a.receiveTime <= '"+ pageInfo.getEndDate() +"' ";
		}
		return hql;
	}
	
	private String addGroupBy(String groupStr){
		String [] groupList = groupStr.split(",");
		if(groupList.length > 0){
			String group =" group by ";
			for (int i = 0; i < groupList.length; i++) {
				group += " a."+groupList[i]+",";
			}
			group =  group.substring(0, group.length()-1);
			return group;
		}		
		return "";
	}
	
	private String addGroupBy(String groupStr,String hql,String selectStr){
		
		String [] groupList = groupStr.split(",");
		if(groupList.length > 0){
			String group =" group by ";
			for (int i = 0; i < groupList.length; i++) {
				group += " a."+groupList[i]+",";
			}
			hql += group.substring(0, group.length()-1);
			String selectValue = "a.customerName,a.orderType,a.status,a.isGet,sum(a.allPrice),a.receiveTime,max(a.receiveTime)";
			if(selectValue!=null && !"".equals(selectValue)){
				selectStr = "select new cn.com.fsun.bus.dto.OrderDto(" + selectValue + ") ";
			}
		}		
		return selectStr + hql;
	}
	
	private String addOrderBy(PageInfo pageInfo,String hql){
		String order =" order by a.receiveTime desc ";		
		if(null != pageInfo.getSortColumn() && !"".equals(pageInfo.getSortColumn())){
			String sortColumn = pageInfo.getSortColumn();
			if("hasGet".equals(sortColumn)){
				sortColumn = "isGet";
			}
			
			if("DESC".equals(pageInfo.getSortType().toUpperCase())){
				order = " order by a."+sortColumn+" desc ";
			}else{
				order = " order by a."+sortColumn+" asc ";
			}
		}	
		return hql+order;
	}


	/**
	 * 获取键值对code
	 * @return
	 */
	public List<CommonDto> getCodes() {
		String hql = "select new cn.com.fsun.common.dto.CommonDto(a.code) from BusOrderInfo a ";
		List<CommonDto> list = orderDao.findOrder(hql);
		return list;
	}
	
	/**
	 * @author Felenwe Lee
	 * @param objs
	 *            数组
	 * @param splitStr
	 *            分隔符
	 * @return 结果字符串
	 */
	 private String arrayToString(Object[] objs, String splitStr) {
		StringBuffer result = new StringBuffer("");
		if (null != objs && objs.length > 0) {
			result.append(objs[0].toString());
			for (int i = 1; i < objs.length; i++) {
				result.append(splitStr).append(objs[i].toString());
			}
		}

		return result.toString();
	}
	

	public void saveProduct(List<OrderDetailDto> orderDetailDtos,ProductDto productDto,List<AfterProcessDto> afterProcessDtos, String orderId) throws Exception {
		
		Double allPrice = 0D;
		BusProductInfo productInfo = ProductService.DtotoDomain(productDto); 						
		String code = super.formatFormIntToString(SettingsServletContextListener.getMaxProductNumber(),10000); 
		productInfo.setCode(code);	
		
		Set<String> styleSet = new HashSet<String>();
		List<BusOrderDetail> orderDetails = new ArrayList<BusOrderDetail>();
		for (OrderDetailDto orderDetailDto : orderDetailDtos) {
			orderDetailDto.setOrderId(orderId);
			orderDetailDto.setProductName(productDto.getName());
			orderDetailDto.setProductCode(code);
			orderDetailDto.setEnabled(true);
			orderDetails.add(OrderDetailService.DtotoDomain(orderDetailDto));
			if(orderDetailDto.getAllPrice()!=null){
				allPrice += orderDetailDto.getAllPrice();
			}
			
			if(orderDetailDto.getStyle()!=null && !"".equals(orderDetailDto.getStyle())){
				styleSet.add(orderDetailDto.getStyle());
			}			
		}	
		productInfo.setStyle(this.arrayToString(styleSet.toArray(),","));	
		String sql = "update bus_order_info set all_price = (all_price+"+ allPrice +") , strip = (strip+"+ orderDetails.size() +") where id = '"+ orderId +"'";	
		
		productDao.save(productInfo);
		orderDetailDao.saveAll(orderDetails);
		orderDao.excuteSQL(sql);
		
		List<BusAfterProcess> list = new ArrayList<BusAfterProcess>();		
		for (AfterProcessDto afterProcessDto : afterProcessDtos) {
			afterProcessDto.setId(null);
			afterProcessDto.setProductId(productInfo.getId());
			list.add(AfterProcessService.DtotoDomain(afterProcessDto));	
		}
		afterProcessDao.saveAll(list);
	}


	/**
	 * 根据订单获取返单信息
	 * @param orderId
	 * @return
	 */
	public ReorderDto getReorderInfo(String orderId) {
		try{
			OrderDto orderDto = this.load(orderId);
			String hql = "select new cn.com.fsun.bus.dto.OrderDetailDto(id,orderId,productName,productCode,number,realNumber," +
				"spec,unit,onePrice,allPrice,description,enabled,style,papers,prints) from BusOrderDetail where orderId = '"+ orderId +"'";
			List<OrderDetailDto> orderDetailDtos  = orderDetailDao.findOrderDetail(hql);
			return new ReorderDto(orderDto,orderDetailDtos);
		}catch (Exception e) {
			e.printStackTrace();
			return new ReorderDto();
		}
		
	}


	public String saveReorder(List<OrderDetailDto> orderDetailDtos,OrderDto orderDto) throws UnEnoughOrderCodeException {
		
		BusOrderInfo orderInfo = DtotoDomain(orderDto);
		orderInfo.setStatus(OrderStatusEnum.ORDER_CREATED.getCode());
		orderInfo.setPrintStatus(false);
		orderInfo.setProducePrintStatus(false);
		orderInfo.setCode(this.initOrderCode());
		orderInfo.setCreateTime(new Date());
		orderInfo.setCreateManId(super.getCurrentUserID());
		orderInfo.setCreateManName(super.getCurrentUserRealName());	
		orderInfo.setMerchandiserId(super.getCurrentUserID());
		orderInfo.setMerchandTime(new Date());
		
		Double allPrice = 0D;
		List<BusOrderDetail> orderDetails = new ArrayList<BusOrderDetail>();
		for (OrderDetailDto orderDetailDto : orderDetailDtos) {			
			if(!orderDetailDto.getProductCode().equals(orderDetailDto.getProductName())){
				BusProductInfo productInfo = productDao.loadByCode(orderDetailDto.getProductCode());
				if(productInfo==null || !productInfo.getName().equals(orderDetailDto.getProductName())){
					return "产品不存在";
				}
				
			}else{
				BusProductInfo productInfo = productDao.loadByCode(orderDetailDto.getProductName());
				if(productInfo==null|| productInfo.getName()==null || "".equals(productInfo.getName())){
					return "产品不存在";
				}else{
					orderDetailDto.setProductName(productInfo.getName());
				}
			}
			orderDetailDto.setId(null);
			orderDetailDto.setEnabled(true);
			orderDetails.add(OrderDetailService.DtotoDomain(orderDetailDto));
			if(orderDetailDto.getAllPrice()!=null){
				allPrice += orderDetailDto.getAllPrice();
			}			
		}
		orderInfo.setAllPrice(allPrice);
		orderInfo.setStrip(orderDetailDtos.size());					
		orderDao.save(orderInfo);
		
		for (BusOrderDetail busOrderDetail : orderDetails) {
			busOrderDetail.setOrderId(orderInfo.getId());
		}
		orderDetailDao.saveAll(orderDetails);
		
		return null;
	}


	public Boolean existOrderCode(String orderCode) {
		String hql = "select id from BusOrderInfo where code = '"+ orderCode +"'";
		List list = orderDao.find(hql);
	    if(list!=null && list.size()>0){
	    	return true;
	    }
		return false;
	}


	public List<OrderDto> getOrders(OrderDto orderDto, PageInfo pageInfo,int limit) {
		List<OrderDto> orderDtos = new ArrayList<OrderDto>();
		if(orderDto.getStatus()!=null && !"".equals(orderDto.getStatus())){
			String hql  = "from BusOrderInfo where status = '"+orderDto.getStatus()+"' order by code asc ";
			List<BusOrderInfo> list = orderDao.findOrder(hql,limit);
			orderDtos = DomainstoDtos(list);
		}				
		return orderDtos;
	}


	public boolean existOrderByCustomerCode(String customerCodes) {
		return orderDao.existOrderByCustomerCode(customerCodes);
	}


	/**
	 * 追加单保存
	 * TODO
	 * @Title tack   
	 * @param orderTackDto
	 * @return List<BusOrderDetail>
	 * @throws UnEnoughOrderCodeException 
	 */
	public List<BusOrderDetail> tack(OrderTackDto orderTackDto) throws UnEnoughOrderCodeException {
		if(orderTackDto!=null ){
			OrderDto orderDto = orderTackDto.getOrderDto();
			List<OrderDetailDto> orderDetailDtos = orderTackDto.getOrderDetailDtos();
			if(orderDto!=null && orderDetailDtos!=null && orderDetailDtos.size()>0){
				BusOrderInfo orderInfo = DtotoDomain(orderDto);
				orderInfo.setPrintStatus(false);
				orderInfo.setProducePrintStatus(false);
				orderInfo.setCode(this.initOrderCode());
				orderInfo.setCreateTime(new Date());
				orderInfo.setCreateManId(super.getCurrentUserID());
				orderInfo.setCreateManName(super.getCurrentUserRealName());	
				orderInfo.setMerchandiserId(super.getCurrentUserID());
				orderInfo.setMerchandTime(new Date());
				orderDao.save(orderInfo);
				
				List<BusOrderDetail> orderDetails = new ArrayList<>();
				double allPrice = 0;
				int strip = 0;
				for (OrderDetailDto orderDetailDto : orderDetailDtos) {
					BusOrderDetail orderDetail = OrderDetailService.DtotoDomain(orderDetailDto);
					orderDetail.setOrderId(orderInfo.getId());
					orderDetail.setOrderCode(orderInfo.getCode());
					//补救code码缺失问题
					BusProductInfo productInfo = productService.initProductForNoCode(orderDetailDto);
					orderDetail.setProductCode(productInfo.getCode());
					orderDetail.setProductName(productInfo.getName());
					orderDetails.add(orderDetail);
					if(orderDetail.getAllPrice()!=null){
						allPrice += orderDetail.getAllPrice();  
					}	
					strip ++;
				}
				orderDetailDao.saveAll(orderDetails);
				
				orderInfo.setAllPrice(allPrice);
				orderInfo.setStrip(strip);
				orderDao.update(orderInfo);
				return orderDetails;
			}  
		}
		return null;
	}

}

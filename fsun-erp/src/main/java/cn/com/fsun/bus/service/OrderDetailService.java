package cn.com.fsun.bus.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fsun.bus.dao.OrderDao;
import cn.com.fsun.bus.dao.OrderDetailDao;
import cn.com.fsun.bus.domain.BusOrderDetail;
import cn.com.fsun.bus.domain.BusOrderInfo;
import cn.com.fsun.bus.domain.BusProductInfo;
import cn.com.fsun.bus.dto.OrderDetailDto;
import cn.com.fsun.bus.dto.OrderDetailDtoList;
import cn.com.fsun.bus.dto.OrderDto;
import cn.com.fsun.common.service.BaseService;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.common.utils.StringUtils;

@Service
public class OrderDetailService extends BaseService {

	@Autowired
	private OrderDetailDao orderDetailDao;	
	
	@Autowired
	private OrderDao orderDao;	
	
	@Autowired
	private ProductService productService;
	
	/**
	 * @description 显示列表（有查询条件）
	 * @return List<OrderDetailDto>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<OrderDetailDto> search(OrderDetailDto orderDetailDto,PageInfo pageInfo,boolean isPage){
		
		//HashMap<String, String> orderCodeMap = new HashMap<String, String>();
		BusOrderDetail orderDetail = DtotoDomain(orderDetailDto);
		List<BusOrderDetail> orderDetails = orderDetailDao.search(orderDetail, pageInfo,isPage);
		List<OrderDetailDto> orderDetailDtos = DomainstoDtos(orderDetails);
		/*for (OrderDetailDto orderDetailDto0 : orderDetailDtos) {
			String orderCode = orderCodeMap.get(orderDetailDto0.getOrderId());
			if(orderCode!=null && !"".equals(orderCode)){
				orderDetailDto0.setOrderCode(orderCode);
			}else{
				BusOrderInfo orderInfo = orderDao.load(orderDetailDto0.getOrderId());
				orderDetailDto0.setOrderCode(orderInfo.getCode());
				orderCodeMap.put(orderInfo.getId(), orderInfo.getCode());
			}	
		}*/
		return orderDetailDtos;
	}
	
	/**
	 * 通过ids获取明细列表(用于生产单制作)
	 * TODO
	 * @Title getDetailsByIds   
	 * @param detailIds
	 * @return List<OrderDetailDto>
	 */
	public List<OrderDetailDto> getDetailsByIds(String detailIds) {		
		String hql = "select new cn.com.fsun.bus.dto.OrderDetailDto("
			+ " d.id, d.orderId, d.productName, d.productCode, d.number, d.realNumber, " 
			+ " d.spec, d.unit, d.description, d.enabled, d.style, d.papers, d.prints, o.code) "
			+ " from BusOrderDetail d, BusOrderInfo o "
			+ " where o.id = d.orderId and d.id in (" + StringUtils.getStringToString(detailIds) + ")";
		return orderDetailDao.findOrderDetail(hql);
	}
	
	/**
	 * @description 获取查询结果数量
	 * @return int
	 * @param orderDetailDto
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public int getSearchCount(OrderDetailDto orderDetailDto,PageInfo pageInfo){
		String hql = "select count(a.id) from BusOrderDetail a where 1=1 ";			
		hql = this.addWhere(orderDetailDto,pageInfo,hql);		
		return orderDao.getCountForInfo(hql);
	}
	
	private String addWhere(OrderDetailDto orderDetailDto,PageInfo pageInfo,String hql){
		if(orderDetailDto ==null){
		    return hql;
		}
		if(null!=orderDetailDto.getOrderId() && !"".equals(orderDetailDto.getOrderId())){
			hql += " and a.orderId = '"+ orderDetailDto.getOrderId() +"' ";
		}
		return hql;
	}
	
	/**
	 * @description 增加或者修改(弃用)
	 * @return OrderDetailDto
	 * @param orderDetailDto
	 * @return
	 * @update 2013-2-21
	 */
	public OrderDetailDto save(OrderDetailDto orderDetailDto){
		BusOrderDetail orderDetail = null;
		String price = "SELECT case when sum(all_price) is null then 0 else sum(all_price) end FROM bus_order_detail where order_id = '"+ orderDetailDto.getOrderId() +"' ";
		String sql = "";

		if(StringUtils.isNotEmpty(orderDetailDto.getId())){
			price +="and id!= '"+ orderDetailDto.getId() +"' "; 
			orderDetail = orderDetailDao.load(orderDetailDto.getId());					
			orderDetail.setNumber(orderDetailDto.getNumber()!=null?orderDetailDto.getNumber():0);
			orderDetail.setRealNumber(orderDetailDto.getRealNumber()!=null?orderDetailDto.getRealNumber():0);
			orderDetail.setSpec(orderDetailDto.getSpec());
			orderDetail.setUnit(orderDetailDto.getUnit());
			orderDetail.setOnePrice(orderDetailDto.getOnePrice()!=null?orderDetailDto.getOnePrice():0D);
			orderDetail.setStyle(orderDetailDto.getStyle());
			orderDetail.setPapers(orderDetailDto.getPapers()!=null?orderDetailDto.getPapers():0);
			orderDetail.setPrints(orderDetailDto.getPrints()!=null?orderDetailDto.getPrints():0);
			if(orderDetailDto.getAllPrice()!=null){
				orderDetail.setAllPrice(Math.round(orderDetailDto.getAllPrice()*10)/10D);
			}else{
				if(orderDetailDto.getOnePrice()!=null && orderDetailDto.getNumber()!=null){
					orderDetail.setAllPrice(Math.round(orderDetailDto.getOnePrice() * orderDetailDto.getNumber()*10)/10D);
				}else{
					orderDetail.setAllPrice(0D);
				}	
			}	
			orderDetail.setDescription(orderDetailDto.getDescription()!=null?orderDetailDto.getDescription():"");
			orderDetail.setProductName(orderDetailDto.getProductName());
			//补救code码缺失问题
			BusProductInfo productInfo = productService.initProductForNoCode(orderDetailDto);
			orderDetail.setProductCode(productInfo.getCode());
			orderDetail.setProductName(productInfo.getName());
			sql = "update bus_order_info set all_price = (("+ price + ") + "+ orderDetail.getAllPrice() +") where id = '"+ orderDetailDto.getOrderId() +"'";
		}else{
			orderDetail = DtotoDomain(orderDetailDto);
			//补救code码缺失问题
			//补救code码缺失问题
			BusProductInfo productInfo = productService.initProductForNoCode(orderDetailDto);
			orderDetail.setProductCode(productInfo.getCode());
			orderDetail.setProductName(productInfo.getName());
			sql = "update bus_order_info set all_price = (("+ price + ") + "+ orderDetail.getAllPrice() +") , strip = (strip+1) where id = '"+ orderDetailDto.getOrderId() +"'";
		}
		
		/*orderDetail.setProductCode(orderDetailDto.getProductCode());
		BusProductInfo productInfo = productDao.loadByCode(orderDetailDto.getProductCode());
		if(productInfo!=null){
			orderDetail.setProductName(productInfo.getName());
		}else{
			orderDetail.setProductName("");
		}
		*/
				
		try{
			orderDetailDao.save(orderDetail);
			orderDao.excuteSQL(sql);
		}catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}	
		
		return DomaintoDto(orderDetail);
		
	}
	
	/**
	 * 明细批量更新
	 * TODO
	 * @Title batchSave   
	 * @param orderDetailDtos
	 * @return OrderDto
	 * @throws Exception 
	 */
	public OrderDto batchSave(OrderDetailDtoList orderDetailDtoList) throws Exception {
		  
		BusOrderInfo orderInfo = orderDao.loadByCode(orderDetailDtoList.getOrderCode());
		orderDetailDao.deleteByOrderCode(orderDetailDtoList.getOrderCode());
		
		List<OrderDetailDto> orderDetailDtos =  orderDetailDtoList.getOrderDetailDtos();
		double allPrice = 0D;
		for (OrderDetailDto orderDetailDto : orderDetailDtos) {
			BusOrderDetail orderDetail = DtotoDomain(orderDetailDto);
			orderDetailDao.save(orderDetail);
			allPrice += orderDetail.getAllPrice();
		}
		orderInfo.setAllPrice(allPrice);
		orderInfo.setStrip(orderDetailDtos.size());
		orderDao.update(orderInfo);
		return OrderService.DomaintoDto(orderInfo);
	}
	
	
	/**
	 * @description 删除一个菜单节点
	 * @return void
	 * @param id
	 * @update 2012-8-13 上午9:37:49
	 */
	public void delete(String id,String orderId){
		try{
			String price = "SELECT case when sum(all_price) is null then 0 else sum(all_price) end FROM bus_order_detail where order_id = '"+ orderId +"' and id!= '"+ id +"' "; 
			String sql = "update bus_order_info set all_price = ("+ price + ") , strip = (strip-1) where id = '"+ orderId +"'";			
			orderDetailDao.delete(orderDetailDao.load(id));
			orderDao.excuteSQL(sql);			
		}catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}
	
	/**
	 * @description 删除一个菜单节点
	 * @return void
	 * @param id
	 * @update 2012-8-13 上午9:37:49
	 */
	public void delete(String id){
		try{
			orderDetailDao.delete(orderDetailDao.load(id));
		}catch (Exception e) {
//			System.out.println(e.getMessage());
		}
	}
	
	
	/**
	 * @description 加载一个菜单节点
	 * @return OrderDetailDto
	 * @param id
	 * @update 2012-8-13 上午9:38:10
	 */
	public OrderDetailDto load(String id){
		return DomaintoDto(orderDetailDao.load(id));
	}

	public void update(OrderDetailDto orderDetailDto) {
		BusOrderDetail orderDetail = orderDetailDao.load(orderDetailDto.getId());
		orderDetail.setRealNumber(orderDetailDto.getRealNumber());
		orderDetailDao.update(orderDetail);
	}

	/**
	 * 通过产品编号判别
	 * 该产品是否已经用在订单中
	 * @param productCodes
	 * @return
	 */
	public boolean existDetailByProductCode(String productCodes) {
		return orderDetailDao.existDetailByProductCode(productCodes);
	}

	/**
	 * 通过订单明细id获取对应的订单中的客户编号
	 * TODO
	 * @Title getCustomerCodeByOrderDetailId   
	 * @param detailId
	 * @return String
	 */
	public String getCustomerCodeByOrderDetailId(String detailId) {
		  
		BusOrderDetail orderDetail = orderDetailDao.load(detailId);
		BusOrderInfo busOrderInfo = orderDao.load(orderDetail.getOrderId());
		if(busOrderInfo!=null){
			return busOrderInfo.getCustomerCode();
		}
		return null;
	}
	
	/*******************************************************    公用方法     *****************************************************/

	/**
	 * @description Domian转Dto
	 * @return BusOrderDetail
	 * @param orderDetailDto
	 */
	public static BusOrderDetail DtotoDomain(OrderDetailDto orderDetailDto){
		if(null==orderDetailDto){
			return null;
		}		
		BusOrderDetail orderDetail = new BusOrderDetail();
		orderDetail.setId(orderDetailDto.getId());
		orderDetail.setOrderId(orderDetailDto.getOrderId());
		orderDetail.setProductName(orderDetailDto.getProductName());
		orderDetail.setProductCode(orderDetailDto.getProductCode());
		orderDetail.setStyle(orderDetailDto.getStyle());
		orderDetail.setNumber(orderDetailDto.getNumber()!=null?orderDetailDto.getNumber():0);
		orderDetail.setRealNumber(orderDetailDto.getRealNumber()!=null?orderDetailDto.getRealNumber():0);
		orderDetail.setSpec(orderDetailDto.getSpec());
		orderDetail.setUnit(orderDetailDto.getUnit());
		orderDetail.setOnePrice(orderDetailDto.getOnePrice()!=null?orderDetailDto.getOnePrice():0D);
		if(orderDetailDto.getAllPrice()!=null){
			orderDetail.setAllPrice(orderDetailDto.getAllPrice());
		}else{
			if(orderDetailDto.getOnePrice()!=null && orderDetailDto.getNumber()!=null){
				orderDetail.setAllPrice(Math.round(orderDetailDto.getOnePrice() * orderDetailDto.getNumber()*10)/10D);
			}else{
				orderDetail.setAllPrice(0D);
			}					
		}

		orderDetail.setDescription(orderDetailDto.getDescription()!=null?orderDetailDto.getDescription():"");			
		orderDetail.setEnabled(orderDetailDto.getEnabled());
		orderDetail.setPapers(orderDetailDto.getPapers()!=null?orderDetailDto.getPapers():0);
		orderDetail.setPrints(orderDetailDto.getPrints()!=null?orderDetailDto.getPrints():0);
		orderDetail.setOrderCode(orderDetailDto.getOrderCode());
		return orderDetail;
	}
	
	/**
	 * @description Dto转Domian
	 * @return orderDetailDto
	 * @param BusOrderDetail
	 */
	public OrderDetailDto DomaintoDto(BusOrderDetail orderDetail){
		if(null==orderDetail){
			return null;
		}
		OrderDetailDto orderDetailDto = new OrderDetailDto();
		orderDetailDto.setId(orderDetail.getId());
		orderDetailDto.setOrderId(orderDetail.getOrderId());
		orderDetailDto.setProductName(orderDetail.getProductName());
		orderDetailDto.setProductCode(orderDetail.getProductCode());
		orderDetailDto.setStyle(orderDetail.getStyle());
		orderDetailDto.setNumber(orderDetail.getNumber());
		orderDetailDto.setRealNumber(orderDetail.getRealNumber());
		orderDetailDto.setSpec(orderDetail.getSpec());
		orderDetailDto.setUnit(orderDetail.getUnit());
		orderDetailDto.setOnePrice(orderDetail.getOnePrice());
		orderDetailDto.setAllPrice(orderDetail.getAllPrice());
		orderDetailDto.setDescription(orderDetail.getDescription());			
		orderDetailDto.setEnabled(orderDetail.getEnabled());
		orderDetailDto.setPapers(orderDetail.getPapers());
		orderDetailDto.setPrints(orderDetail.getPrints());
		orderDetailDto.setOrderCode(orderDetail.getOrderCode());
		return orderDetailDto;
	}
	
	/**
	 * @description domians转dtos
	 * @return List<OrderDetailDto>
	 * @param orderDetails
	 * @return
	 */
	public List<OrderDetailDto> DomainstoDtos(List<BusOrderDetail> orderDetails){
		
		List<OrderDetailDto> orderDetailDtos = new ArrayList<OrderDetailDto>();
		if (null != orderDetails && orderDetails.size() > 0) {
			for (BusOrderDetail orderDetail : orderDetails) {
				OrderDetailDto orderDetailDto = DomaintoDto(orderDetail);
				if (null != orderDetailDto) {
					orderDetailDtos.add(orderDetailDto);
				}
			}
		}
		return orderDetailDtos;
	}
	
}

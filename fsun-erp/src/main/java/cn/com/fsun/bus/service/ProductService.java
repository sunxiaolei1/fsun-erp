package cn.com.fsun.bus.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fsun.bus.dao.AfterProcessDao;
import cn.com.fsun.bus.dao.ProductDao;
import cn.com.fsun.bus.domain.BusAfterProcess;
import cn.com.fsun.bus.domain.BusProductInfo;
import cn.com.fsun.bus.dto.AfterProcessDto;
import cn.com.fsun.bus.dto.OrderDetailDto;
import cn.com.fsun.bus.dto.ProductDetailDto;
import cn.com.fsun.bus.dto.ProductDto;
import cn.com.fsun.bus.dto.TransactionDto;
import cn.com.fsun.common.dto.CommonDto;
import cn.com.fsun.common.service.BaseService;
import cn.com.fsun.common.utils.PageInfo;
import cn.com.fsun.common.utils.StringUtil;
import cn.com.fsun.constants.CommonConstant;
import cn.com.fsun.init.SettingsServletContextListener;

@Service
public class ProductService extends BaseService{

	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private AfterProcessDao afterProcessDao;
	
	/**
	 * @description 显示列表（无查询条件）
	 * @return List<ProductDto>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<ProductDto> list() {

		List<BusProductInfo> productInfo = productDao.list();
		List<ProductDto> productTypeDtos = DomainstoDtos(productInfo);
		return productTypeDtos;
	}
	
	
	/**
	 * @description 显示列表（有查询条件）
	 * @return List<ProductDto>
	 * @update 2012-8-13 上午9:36:48
	 */
	public List<ProductDto> search(ProductDto productDto,PageInfo pageInfo){
		
		BusProductInfo productInfo = DtotoDomain(productDto);
		List<BusProductInfo> productInfos = productDao.search(productInfo, pageInfo);
		List<ProductDto> productDtos = DomainstoDtos(productInfos);
		return productDtos;
	}

	/**
	 * @description 增加或者修改
	 * @return ProductDto
	 * @param productDto
	 * @throws Exception 
	 * @update 2013-2-21
	 */
	public ProductDto save(ProductDto productDto,List<AfterProcessDto> afterProcessDtos,HttpServletRequest request){
		BusProductInfo productInfo = null;
		if(!StringUtil.isNotEmpty(productDto.getId())){
			productInfo = DtotoDomain(productDto); 
			int code = SettingsServletContextListener.getMaxProductNumber(); 
			productInfo.setCode(super.formatFormIntToString(code,10000));
		}else{
			productInfo = productDao.load(productDto.getId());
			if(productInfo.getIcon()!=null 
				  && !"".equals(productInfo.getIcon())
					 &&!productInfo.getIcon().equals(productDto.getIcon())){
				File f = new File(request.getSession().getServletContext().getRealPath("/") + CommonConstant.UPLOAD_BASE_PATH + "/product"+productInfo.getIcon());
			    f.delete();
			}
			productInfo.setName(productDto.getName());			
			productInfo.setPrice(productDto.getPrice());
			productInfo.setIcon(productDto.getIcon());
			productInfo.setFilm(productDto.getFilm());
			productInfo.setScotch(productDto.getScotch());
			productInfo.setMaterial(productDto.getMaterial());
			productInfo.setOpenNum(productDto.getOpenNum());			
			productInfo.setOpenSize(productDto.getOpenSize());
			productInfo.setOpenMethod(productDto.getOpenMethod());
			productInfo.setLayout(productDto.getLayout());
			productInfo.setModel(productDto.getModel());
			productInfo.setOutsourc(productDto.getOutsourc());
			productInfo.setProcess(productDto.getProcess());
			productInfo.setDescription(productDto.getDescription());
			productInfo.setStyle(productDto.getStyle());			
			productInfo.setColors(productDto.getColors());
			productInfo.setImpos(productDto.getImpos());
			productInfo.setSpec(productDto.getSpec());
			try {
				afterProcessDao.excuteHQL("delete from BusAfterProcess where productId = '"+ productDto.getId() +"'");
			} catch (Exception e) {			
				e.printStackTrace();
				throw new RuntimeException();
			}
		}
		productDao.save(productInfo);
		
		List<BusAfterProcess> list = new ArrayList<BusAfterProcess>();		
		for (AfterProcessDto afterProcessDto : afterProcessDtos) {
			afterProcessDto.setId(null);
			afterProcessDto.setProductId(productInfo.getId());
			list.add(AfterProcessService.DtotoDomain(afterProcessDto));	
		}
		afterProcessDao.saveAll(list);
		return DomaintoDto(productInfo);
	}
	
	/**
	 * 创建产品
	 * @param productDetailDto
	 * @return
	 */
	public ProductDto create(ProductDetailDto productDetailDto){
		
		BusProductInfo productInfo = productDetailDto.getProductInfo(); 
		productInfo.setEnabled(true);
		productInfo.setCode(super.formatFormIntToString(SettingsServletContextListener.getMaxProductNumber(),10000));
		productDao.save(productInfo);
		
		List<BusAfterProcess> list = new ArrayList<BusAfterProcess>();	
		
		String afterProcessNames = productDetailDto.getAfterProcess();
		if(StringUtil.isNotEmpty(afterProcessNames)){
			for (String name : afterProcessNames.split(",")) {
				BusAfterProcess busAfterProcess = new BusAfterProcess();				
				busAfterProcess.setName(name);
				busAfterProcess.setProductId(productInfo.getId());
				list.add(busAfterProcess);	
			}
		}
		afterProcessDao.saveAll(list);
		ProductDto productDto = DomaintoDto(productInfo);
		productDto.setAfterProcess(AfterProcessService.DomainstoDtos(list));
		return productDto;
	}
	
	
	/**
	 * @description 删除一个菜单节点
	 * @return void
	 * @param id
	 * @throws Exception 
	 * @update 2012-8-13 上午9:37:49
	 */
	public void delete(String id) throws Exception{		
		productDao.delete(productDao.load(id));
		String hql = "delete from BusAfterProcess where productId ='"+ id +"'";
		afterProcessDao.excuteHQL(hql);
	}
	
	/**
	 * @description 加载一个菜单节点
	 * @return ProductTypeDto
	 * @param id
	 * @update 2012-8-13 上午9:38:10
	 */
	public ProductDto load(String id){
		ProductDto productDto = DomaintoDto(productDao.load(id));		
		return productDto;
	}

	/**
	 * @description 获取查询结果数量
	 * @return int
	 * @param productDto
	 * @param pageInfo
	 * @return
	 * @update 2013-3-11
	 */
	public int getSearchCount(ProductDto productDto,PageInfo pageInfo){
		BusProductInfo productInfo = DtotoDomain(productDto);
		List<BusProductInfo> productInfos = productDao.getSearchCount(productInfo, pageInfo);
		if(null!=productInfos && productInfos.size()>0){
			return productInfos.size();
		}else{
			return new Integer(0);
		}
	}
	
	
	/**
	 * @description Domian转Dto
	 * @return BusProductInfo
	 * @param productDto
	 */
	public static BusProductInfo DtotoDomain(ProductDto productDto){
		if(null==productDto){
			return null;
		}		
		BusProductInfo productInfo = new BusProductInfo();
		productInfo.setId(!"".equals(productDto.getId())?productDto.getId():null);
		productInfo.setCode(productDto.getCode());
		productInfo.setName(productDto.getName());			
		productInfo.setPrice(productDto.getPrice());
		productInfo.setIcon(productDto.getIcon());
		productInfo.setFilm(productDto.getFilm());
		productInfo.setScotch(productDto.getScotch());
		productInfo.setMaterial(productDto.getMaterial());
		productInfo.setOpenNum(productDto.getOpenNum());
		productInfo.setOpenSize(productDto.getOpenSize());
		productInfo.setOpenMethod(productDto.getOpenMethod());
		productInfo.setLayout(productDto.getLayout());
		productInfo.setModel(productDto.getModel());
		productInfo.setOutsourc(productDto.getOutsourc());
		productInfo.setProcess(productDto.getProcess());
		productInfo.setDescription(productDto.getDescription());
		productInfo.setEnabled(productDto.getEnabled());
		productInfo.setStyle(productDto.getStyle());

		
		productInfo.setColors(productDto.getColors());
		productInfo.setImpos(productDto.getImpos());
		productInfo.setSpec(productDto.getSpec());
		
		productInfo.setQ(productDto.getQ());
		
		return productInfo;
	}
	
	/**
	 * @description Dto转Domian
	 * @return ProductDto
	 * @param productInfo
	 */
	public static ProductDto DomaintoDto(BusProductInfo productInfo){
		if(null==productInfo){
			return null;
		}
		ProductDto productDto = new ProductDto();
		productDto.setId(productInfo.getId());
		productDto.setCode(productInfo.getCode());
		productDto.setName(productInfo.getName());			
		productDto.setPrice(productInfo.getPrice());
		productDto.setIcon(productInfo.getIcon());		
		productDto.setFilm(productInfo.getFilm());
		productDto.setScotch(productInfo.getScotch());		
		productDto.setMaterial(productInfo.getMaterial());
		productDto.setOpenNum(productInfo.getOpenNum());
		productDto.setOpenSize(productInfo.getOpenSize());
		productDto.setOpenMethod(productInfo.getOpenMethod());
		productDto.setLayout(productInfo.getLayout());
		productDto.setModel(productInfo.getModel());
		productDto.setOutsourc(productInfo.getOutsourc());
		productDto.setProcess(productInfo.getProcess());
		productDto.setDescription(productInfo.getDescription());
		productDto.setEnabled(productInfo.getEnabled());
		productDto.setStyle(productInfo.getStyle());
		if(productInfo.getFilm()!=null){
			productDto.setIsFilm(productInfo.getFilm()?"是":"否");
		}
		if(productInfo.getScotch()!=null){
			productDto.setIsScotch(productInfo.getScotch()?"是":"否");
		}
		if(productInfo.getOutsourc()!=null){
			productDto.setIsOutsourc(productInfo.getOutsourc()?"是":"否");
		}
		
		productDto.setColors(productInfo.getColors());
		productDto.setImpos(productInfo.getImpos());
		productDto.setSpec(productInfo.getSpec());
		
		return productDto;
	}
	
	/**
	 * @description domians转dtos
	 * @return List<ProductDto>
	 * @param productInfos
	 * @return
	 */
	public List<ProductDto> DomainstoDtos(List<BusProductInfo> productInfos){
		
		List<ProductDto> productDtos = new ArrayList<ProductDto>();
		if (null != productInfos && productInfos.size() > 0) {
			for (BusProductInfo productInfo : productInfos) {
				ProductDto productDto = DomaintoDto(productInfo);
				if (null != productDto) {
					productDtos.add(productDto);
				}
			}
		}
		return productDtos;
	}

	/**
	 * 产品禁用
	 * @param productId
	 * @return
	 */
	public Boolean disable(String productId) {
		try{
			String hql = "update BusProductInfo set enabled = false where id = '"+ productId+"' ";
			productDao.excuteHQL(hql);
		}catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	/**
	 * 产品启用
	 * @param productId
	 * @return
	 */
	public Boolean enable(String productId) {
		try{
			String hql = "update BusProductInfo set enabled = true where id = '"+ productId+"' ";
			productDao.excuteHQL(hql);
		}catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}

	/**
	 * 获取被禁用在产品
	 * @return
	 */
	public List<ProductDto> getDisableProduct() {
		String hql = "select new cn.com.fsun.bus.dto.ProductDto(id, code, name, price, icon, description) " +
				"from BusProductInfo where enabled = false ";		
		return productDao.find(hql);
	}
	
	/**
	 * 获取被启用在产品
	 * @return
	 */
	public List<ProductDto> getEnableList() {
		String hql = "from BusProductInfo where enabled = true ";		
		return productDao.find(hql);
	}


	public boolean uniqueProductName(String name, String productId) {
		String hql = "select count(*) from BusProductInfo  ";
		String where = "where 1=1 ";
		if(productId!=null && !"".equals(productId)){
			
			where += "and name = '"+ name +"' and id != '"+ productId +"' ";
		}else{
			where += "and name = '"+ name +"' ";
		}
		return productDao.getCountForInfo(hql+where)==0;
	}


	public List<CommonDto> getNames() {
		String hql ="select distinct(name) from BusProductInfo where enabled = true ";
		List<String> list = productDao.find(hql);
		List<CommonDto> cList= new ArrayList<CommonDto>();
		for (int i = 0; i < list.size(); i++) {
			cList.add(new CommonDto("",list.get(i)));
		}
		return cList;
	}


	public ProductDto loadByCode(String productCode) {
		return DomaintoDto(productDao.loadByCode(productCode));
	}
	
	
	/**
	 * 通过编号获取交易记录
	 * @param productCode
	 * @return
	 */
	public List<TransactionDto> getTransactionsByCode(String productCode) {
		
		String hql = "select new cn.com.fsun.bus.dto.TransactionDto(c.productName,c.style,a.code,a.orderType,a.customerName,a.receiveTime,c.number,c.unit) " +
				" from BusOrderInfo a,BusOrderDetail c ";
		String where =" where c.orderId = a.id " +
				" and c.productCode = '"+ productCode +"' ";
				//+" and a.id in (select distinct b.orderId from BusOrderDetail b where b.productCode = '" +productCode + "')";
		hql += where;
		return productDao.find(hql);
	}
	
	
	/**
	 * 初始化产品（前提是没有Code码）
	 * @param orderDetailDto
	 * @return
	 */
	public BusProductInfo initProductForNoCode(OrderDetailDto orderDetailDto){
		BusProductInfo productInfo = productDao.loadByCode(orderDetailDto.getProductCode());
		if(productInfo==null){
			
			String name = orderDetailDto.getProductCode();
			productInfo = productDao.loadByAttribute("name", name);
			if(productInfo!=null){
				this.isUpdateDetail(productInfo, orderDetailDto.getStyle());
			}else{
				productInfo = new BusProductInfo();							
				int code = SettingsServletContextListener.getMaxProductNumber(); 
				productInfo.setCode(super.formatFormIntToString(code,10000));
				productInfo.setName(name);	
				productInfo.setStyle(orderDetailDto.getStyle());
				productInfo.setPrice(orderDetailDto.getOnePrice()!=null?orderDetailDto.getOnePrice():0D);	
				productInfo.setFilm(true);
				productInfo.setScotch(false);		
				productInfo.setOutsourc(true);
				productInfo.setEnabled(true);	
				productDao.create(productInfo);
			}
		}else{
			this.isUpdateDetail(productInfo, orderDetailDto.getStyle());			
		}
		return productInfo;
	}
	
	/**
	 * 更新明细
	 * @param productInfo
	 * @param style
	 */
	private void isUpdateDetail(BusProductInfo productInfo, String style){
		//是否已被禁用
		boolean isUpdate0 = false;
		if(productInfo.getEnabled()==false){
			productInfo.setEnabled(true);
			isUpdate0 = true;
		}
		
		//是否已存在该款号
		boolean isUpdate1 = true;
		String styles = productInfo.getStyle();
		if(style!=null && !"".equals(style)){			
			if(styles!=null && !"".equals(styles)){
				String[] styleArr = styles.split(",");				
				for (String style1 : styleArr) {
					if(style.equals(style1)){
						isUpdate1 = false;
						break;
					}
				}
				if(isUpdate1){
					productInfo.setStyle(productInfo.getStyle()+","+style);						
				}
			}else{
				productInfo.setStyle(style);				
			}					
		}
		
		if(isUpdate0 || isUpdate1){
			productDao.update(productInfo);
		}	
	}
	
}

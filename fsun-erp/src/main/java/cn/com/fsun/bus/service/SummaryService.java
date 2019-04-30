package cn.com.fsun.bus.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.fsun.bus.dao.SummaryDao;
import cn.com.fsun.bus.dto.BuyInfoDto;
import cn.com.fsun.bus.dto.ProductSalesDto;
import cn.com.fsun.common.service.BaseService;

@Service
public class SummaryService extends BaseService{

	@Autowired
	private SummaryDao summaryDao;

	/**
	 * 获取销量汇总信息
	 * @return
	 * @throws ParseException 
	 * @throws NumberFormatException 
	 */
	public List<ProductSalesDto> productSales(ProductSalesDto productSalesDto) throws NumberFormatException, ParseException {
		/*String hql = "select new cn.com.fsun.bus.dto.ProductSalesDto(a.name, a.productTypeName, a.number,a.unit, a.allPrice, a.endTime) ";
	    String from = "from (select saleInfo.name, sum(saleInfo.number) as number, sum(saleInfo.allPrice) as allPrice, max(saleInfo.updateTime) as endTime," +
			   					"(select productType.unit from BusProductTypeInfo productType where saleInfo.goodTypeId = productType.id) as unit, " +
			   					"(select productType.typeName from BusProductTypeInfo productType where saleInfo.goodTypeId = productType.id) as productTypeName " +
			   				"from BusSaleInfo saleInfo where saleInfo.enabled = false group by saleInfo.name) "+
		              "as a ";
        String orderBy = "order by a.price desc ";
        hql = hql + from + orderBy;*/
		
		String sql = "select a.name, a.productTypeName, a.number, a.unit, a.allPrice, a.endTime ";
		String from = "from (select saleInfo.name, sum(saleInfo.number) as number, sum(saleInfo.all_price) as allPrice, max(saleInfo.update_time) as endTime," +
								"(select productType.unit from bus_product_type_info productType where saleInfo.good_type_id = productType.id) as unit, " +
								"(select productType.type_name from bus_product_type_info productType where saleInfo.good_type_id = productType.id) as productTypeName " +
							"from bus_sale_info saleInfo where saleInfo.enabled = false group by saleInfo.name) "+
					"as a ";
		String orderBy = "order by a.allPrice desc ";
		sql = sql + from + orderBy;
		List list = summaryDao.getSummaryListBySQL(sql);
		if(list==null){
			return new ArrayList<ProductSalesDto>();
		}
		List<ProductSalesDto> dtos = new ArrayList<ProductSalesDto>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		for (int i = 0; i < list.size(); i++) {
			Object[] obj = (Object[]) list.get(i);
			dtos.add(new ProductSalesDto(
											obj[0].toString(),
											obj[1].toString(),
											Integer.valueOf(obj[2].toString()),
											obj[3].toString(),
											Double.valueOf(obj[4].toString()),
											(Date)obj[5]
											//sdf.parse(obj[5].toString())
									   )
				    );
		}
		
		return dtos;
	}
	
}

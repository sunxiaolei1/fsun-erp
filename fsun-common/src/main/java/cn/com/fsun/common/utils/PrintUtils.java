package cn.com.fsun.common.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.print.PageFormat;
import java.awt.print.Printable;
import java.awt.print.PrinterException;
import java.util.ArrayList;
import java.util.List;

import javax.print.Doc;
import javax.print.DocFlavor;
import javax.print.DocPrintJob;
import javax.print.PrintException;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.SimpleDoc;
import javax.print.attribute.DocAttributeSet;
import javax.print.attribute.HashDocAttributeSet;
import javax.print.attribute.HashPrintRequestAttributeSet;
import javax.print.attribute.PrintRequestAttributeSet;
import javax.print.attribute.standard.MediaSizeName;

public class PrintUtils implements Printable{

	@Override
	public int print(Graphics graphics, PageFormat pageFormat, int pageIndex)
			throws PrinterException {
		/*Graphics2D g2 = (Graphics2D) gp;
		g2.setPaint(Color.black); // 设置打印颜色为黑色
		if (page >= PAGES) // 当打印页号大于需要打印的总页数时，打印工作结束
		return Printable.NO_SUCH_PAGE;
		g2.translate(pf.getImageableX(), pf.getImageableY());// 转换坐标，确定打印边界
		Font font = new Font("宋体", Font.PLAIN, 12);// 创建字体
		g2.setFont(font);
	
		// 打印当前页文本
		// int printFontCount = printStr.length();// 打印字数
		// int printFontSize = font.getSize();// Font 的磅值大小
		// float printX = 595 / 2; // 给定字符点阵，X页面正中
		// float printY = 842 / 2; // 给定字符点阵，Y页面正中
		float oneMM = (float) (72 / 25.4); // 毫米转化为点
		float xChaoChu = -(3 * oneMM - (float) pf.getImageableX());// 测试的时候用的是A4纸。所以要减去边距
		float yChaoChu = -(34 * oneMM - (float) pf.getImageableY());
		g2.drawString(jiJianRenName, 35 * oneMM - (float) pf.getImageableX()+ xChaoChu, 58 * oneMM - (float) pf.getImageableY() + yChaoChu);
		g2.drawString(shiFaDi, 69 * oneMM - (float) pf.getImageableX()+ xChaoChu, 58 * oneMM - (float) pf.getImageableY() + yChaoChu);
		g2.drawString(companyName, 33 * oneMM - (float) pf.getImageableX()+ xChaoChu, 68 * oneMM - (float) pf.getImageableY() + yChaoChu);
		g2.drawString(sendProvinceAddress, 33 * oneMM - (float) pf.getImageableX() + xChaoChu, 75 * oneMM - (float) pf.getImageableY() + yChaoChu);
		g2.drawString(sendCityAddress, 59 * oneMM - (float) pf.getImageableX() + xChaoChu, 75 * oneMM - (float) pf.getImageableY() + yChaoChu);
		g2.drawString(sendAreaAddress, 82 * oneMM - (float) pf.getImageableX() + xChaoChu, 75 * oneMM - (float) pf.getImageableY() + yChaoChu);
		g2.drawString(sendSpecificAddress, 35 * oneMM - (float) pf.getImageableX() + xChaoChu, 86 * oneMM - (float) pf.getImageableY() + yChaoChu);
		g2.drawString(sendMobile, 42 * oneMM - (float) pf.getImageableX() + xChaoChu, 93 * oneMM - (float) pf.getImageableY() + yChaoChu);
		g2.drawString(goodsNames, 22 * oneMM - (float) pf.getImageableX()+ xChaoChu, 110 * oneMM - (float) pf.getImageableY()+ yChaoChu);
		g2.drawString(goodsCount, 80 * oneMM - (float) pf.getImageableX()+ xChaoChu, 110 * oneMM - (float) pf.getImageableY()+ yChaoChu);
		// g2.drawString(jiJianRenName,
		// 30*oneMM-(float)pf.getImageableX(),135*oneMM-(float)pf.getImageableY());//寄件人签名
		g2.drawString(receiveName, 130 * oneMM - (float) pf.getImageableX()+ xChaoChu, 64 * oneMM - (float) pf.getImageableY() + yChaoChu);
		g2.drawString(receiveCity, 170 * oneMM - (float) pf.getImageableX()+ xChaoChu, 64 * oneMM - (float) pf.getImageableY() + yChaoChu);
		g2.drawString(receiveCompanyName, 130 * oneMM - (float) pf.getImageableX() + xChaoChu, 71 * oneMM - (float) pf.getImageableY() + yChaoChu);
		g2.drawString(receiveProvinceAddress, 130 * oneMM - (float) pf.getImageableX() + xChaoChu, 79 * oneMM - (float) pf.getImageableY() + yChaoChu);
		g2.drawString(receiveCityAddress, 160 * oneMM - (float) pf.getImageableX() + xChaoChu, 79 * oneMM - (float) pf.getImageableY() + yChaoChu);
		g2.drawString(receiveAreaAddress, 185 * oneMM - (float) pf.getImageableX() + xChaoChu, 79 * oneMM - (float) pf.getImageableY() + yChaoChu);
		g2.drawString(receiveSpecificAddress, 130 * oneMM - (float) pf.getImageableX() + xChaoChu, 87 * oneMM - (float) pf.getImageableY() + yChaoChu);
		g2.drawString(receiveMobile, 138 * oneMM - (float) pf.getImageableX() + xChaoChu, 93 * oneMM - (float) pf.getImageableY() + yChaoChu);
		g2.drawString("*"+String.valueOf(logisticsNo)+"*", 123 * oneMM - (float) pf.getImageableX() + xChaoChu, 54 * oneMM - (float) pf.getImageableY() + yChaoChu);
		// g2.drawString(receiveName, 130*oneMM-(float)pf.getImageableX(),125*oneMM-(float)pf.getImageableY());//收件人签名
*/		return Printable.PAGE_EXISTS; // 存在打印页时，继续打印工作
	}

	/**
	* 需配送的订单的物流单据打印
	* 
	* @throws Exception
	*//*
	public String goodsPrint() throws Exception {
		initAtx();
		String logisticsNofrom = RequestUtil.getParam(request,"logisticsNofrom");// 第一个物流单号
		String logisticsNoto = RequestUtil.getParam(request, "logisticsNoto");// 最后张物流单号
		int orderId = RequestUtil.getIntParameter(request, "orderId", 0);
		long from = 0;
		long printCount = 0;
		long to = 0;
		Admin admin = (Admin) request.getSession().getAttribute("Admin");// 在线管理员
		int f = 2;// 能看到所有仓库
		if (admin.getLcId() != null) {
			LogisticsCompany logisticsCompany = logisticsCompanyDao.getBean(admin.getLcId());
			if (logisticsCompany.getSameCityPeisong()) {
				f = 0;// 同城
			}
			if (logisticsCompany.getOtherCityPeisong()) {
				f = 1;// 非同城
			}
			if (logisticsCompany.getOtherCityPeisong() && logisticsCompany.getSameCityPeisong()) {
				f = 2;// 同城非同城都能看到
			}
		}
		if (orderId == 0) {// 批量打印
			try {
				from = Long.parseLong(logisticsNofrom);
				if ("".equals(logisticsNoto)) {
					printCount = 1;
				}else {
					to = Long.parseLong(logisticsNoto);
					printCount = to - from + 1;// 打印的张数
				}		
			} catch (Exception e) {
				return sendMessage("请检查物流单输入格式是否正确","javascript:history.go(-1)", 0);
			}
	
		}
		List<Order> orderList = new ArrayList<Order>();
		if (orderId != 0) {// 单个打印
			orderList.add(orderDao.getBean(orderId));
		} else {
			boolean flagfor=false;
			List<Order> flagList = orderDao.getListbyDistribution(f, -1, -1);
	
			for (int i = 0; i < flagList.size(); i++) {
				if (flagList.get(i).getLogisticsNo() == null || "".equals(flagList.get(i).getLogisticsNo())) {//物流单号未存在
					orderList.add(flagList.get(i));
					flagfor=true;
				}
			}
			if(flagfor==false){
				return sendMessage("批量打印只能对未分配物流单号的订单使用，请单个打印！","javascript:history.go(-1)", 0);
			}
		}
	
		long pCount = printCount < orderList.size() ? printCount : orderList.size();// 要打印的订单数比总订单数的比较
		if(orderId != 0){//单个打印
			pCount=1;
		}
		if (orderList != null) {
			for (int j = 0; j < (int) pCount; j++) {
		
				jiJianRenName = "";// 寄件人姓名
				shiFaDi = "宁波江东";// 始发地
				companyName = "宁波天阳科技有限公司";// 单位名称
				sendProvinceAddress = "浙江"; // 省
				sendCityAddress = "宁波";// 市
				sendAreaAddress = "江东";
				sendSpecificAddress = "国家高新区扬帆路999弄3号楼1002室";
				sendMobile = "";// 寄件人电话
				goodsNames = "";
				goodsCount = "";
			
				if (orderId != 0) {// 单个打印
					logisticsNo = Long.parseLong(orderList.get(j).getLogisticsNo());
				} else {// 批量打印则存如物流号
					try {
						logisticsNo = from + j;// 物流号
						orderList.get(j).setLogisticsNo(String.valueOf(logisticsNo));
						orderDao.saveOrUpdate(orderList.get(j));
					} catch (Exception e) {		
						return sendMessage("物流单号保存失败","javascript:history.go(-1)", 0);
					}
				}
				int flagCount = 0;
				List<OrderDetail> odList = orderDetailDao.getListbyOrderId(orderList.get(j).getOrderId());
				for (int i = 0; i < odList.size(); i++) {
					goodsNames += odList.get(i).getGoods().getGoodsName() + " ";// 内件品名
					flagCount += odList.get(i).getGoodsNum();// 数量
				}
				goodsCount = String.valueOf(flagCount);
				receiveName = orderList.get(j).getPeisong().getGetUserAddress().getUserName();// 收件人姓名
				receiveCity = "";// 城市
				receiveCompanyName = "";// 收件人单位
				receiveProvinceAddress = orderList.get(j).getPeisong().getGetUserAddress().getUserProvince(); // 省
				receiveCityAddress = orderList.get(j).getPeisong().getGetUserAddress().getUserCity();// 市
				receiveAreaAddress = orderList.get(j).getPeisong().getGetUserAddress().getUserArea();// 区
				receiveSpecificAddress = orderList.get(j).getPeisong().getGetUserAddress().getUserAddress();// 具体地址
				receiveMobile = orderList.get(j).getPeisong().getGetUserAddress().getUserMobile();// 联系电话
			
				PAGES = 1; // 获取打印总页数
				// 指定打印输出格式
				DocFlavor flavor = DocFlavor.SERVICE_FORMATTED.PRINTABLE;
				// 定位默认的打印服务
				PrintService printService = PrintServiceLookup.lookupDefaultPrintService();
				// 创建打印作业
				DocPrintJob job = printService.createPrintJob();
				// 设置打印属性
				PrintRequestAttributeSet pras = new HashPrintRequestAttributeSet();
				// 设置纸张大小,也可以新建MediaSize类来自定义大小
				// float oneMM=(float)(72/25.4); //毫米转化为点
				// MediaSize ms=new MediaSize(128*oneMM,233*oneMM,1);//单子的大小
				// pras.add(ms);
				pras.add(MediaSizeName.ISO_A4);
				pras.add(javax.print.attribute.standard.OrientationRequested.LANDSCAPE);
				DocAttributeSet das = new HashDocAttributeSet();
				// 指定打印内容
				Doc doc = new SimpleDoc(this, flavor, das);
				// 不显示打印对话框，直接进行打印工作
				try {
					job.print(doc, pras); // 进行每一页的具体打印操作
				} catch (PrintException pe) {
					pe.printStackTrace();
					return sendMessage("打印失败", "javascript:history.go(-1)", 0);
				}
		
			}
		}
		return sendMessage("操作成功", "distribution!showOrders.do", 1);
	}

	*/
}

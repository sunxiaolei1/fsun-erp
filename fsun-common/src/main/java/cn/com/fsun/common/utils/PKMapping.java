package cn.com.fsun.common.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

/**
 * @ClassName: PKMapping
 * @Description:
 * @Author:Golden Zhang
 * @Date:2017-2-10
 * @Version:1.0.0
 */
public class PKMapping {

  /**
   * 活动 -------------------100
   */

  public static int act_activity = 101;
  public static int act_activity_log = 102;
  public static int act_coupon = 103;
  public static int act_coupon_definition = 104;
  public static int act_shop = 105;
  public static int act_sku = 106;
  public static int act_subtract_definition = 107;

  public static int sys_activity_info = 110;
  public static int sys_activity_detail = 111;
  public static int sys_activity_region = 112;
  public static int sys_activity_sales = 113;
  /**
   * 部门组织 --------------200
   */

  public static int sys_dept = 201;
  public static int sys_platform = 202;
  public static int sys_route = 203;
  public static int sys_route_rule = 204;
  public static int sys_shop = 205;
  public static int sys_user = 206;
  public static int sys_spare_amount = 207;
  public static int sys_login_log = 208;
  public static int sys_pos = 209;
  public static int sys_sku = 210;

  /**
   * 商品 -------------------=300
   */
  public static int bas_attribute = 301;
  public static int bas_brand = 302;
  public static int bas_category = 303;
  public static int bas_codes = 304;
  public static int bas_image = 305;
  public static int bas_materiel = 306;
  public static int bas_region = 307;
  public static int bas_shop_category = 308;
  public static int bas_shop_category_temp = 309;
  public static int bas_shop_price = 310;
  public static int bas_sku = 311;
  public static int bas_sku_category = 312;
  public static int bas_sku_category_temp = 313;
  public static int assist_category = 314;

  // 要货模板
  public static int bas_goods_temp = 317;
  // 要货模板应用店铺
  public static int bas_temp_rule = 315;
  // 要货模板商品
  public static int bas_goods = 316;
  // 强制报货模板
  public static int bas_push_temp = 317;
  // 强制报货商品
  public static int bas_push_goods = 318;
  // 门店自定义分类模板
  public static int bas_shop_template = 319;
  //微商城 sku浏览记录
  public static int wsc_visit = 350;
  //微商城 sku热销排行榜
  public static int wsc_hot_sku = 351;


  /**
   * 价格策略 -----------------400
   */

  public static int rul_price = 401;
  public static int rul_shop = 402;
  public static int rul_sku = 403;

  /**
   * 单据 -------------------500
   */

  public static int doc_asn_details = 501;
  public static int doc_asn_header = 502;
  public static int doc_goods = 503;
  public static int doc_order = 504;
  public static int doc_order_details = 505;
  public static int doc_order_header = 506;
  public static int doc_po_details = 507;
  public static int doc_po_header = 508;
  public static int doc_refund = 509;
  public static int doc_refund_goods = 510;
  public static int pay_account = 511;
  public static int wsc_cart = 532;
  public static int wsc_goods = 533;
  public static int wsc_settlement = 534;
  public static int wsc_order = 535;
  public static int wsc_pay = 536;
  public static int wsc_address = 537;
  public static int pm_relation = 538;
  
  public static int bus_order = 550;
  public static int bus_made_order = 551;
  public static int bus_made_order_details = 552;
  public static int bus_made_order_details_process = 553;

  /**
   * 会员 -------------------600
   */

  public static int vip_card = 601;
  public static int vip_customer = 602;
  public static int vip_info = 603;
  public static int vip_point = 604;
  public static int vip_point_shop = 605;
  public static int vip_rechange = 606;
  public static int vip_rechange_shop = 607;
  public static int vip_unpaid = 608;
  public static int vip_unpay_shop = 609;
  public static int sys_user_account = 610;
  public static int sys_user_common_address = 611;
  public static int sys_user_common_shop = 612;
  public static int sys_user_collection = 612;
  public static int sys_user_info = 613;
  public static int wsc_goods_history = 614;
  public static int wsc_recommend_category = 615;
  /**
   * 库存 -------------------700
   */

  public static int inv_lot = 701;
  public static int inv_sku = 702;
  public static int inv_transaction_Log = 703;

  /**
   * 权限管理 -------------------800
   */
  public static int sys_user_role = 801;
  public static int sys_role = 802;
  public static int sys_role_resource = 803;
  public static int sys_resource = 804;

  /**
   * 支付模块--------------------900
   */
  public static int sys_payment_info = 901;
  public static int sys_access_log = 902;
  public static int pay_weixin_bill = 903;


  /**
   * 私人定制模块--------------------1000
   */
  public static int mod_customize_order = 1001;

  /**
   * 新优惠券
   */
  public static int sys_coupon_usage = 1101;

  /**
   * 系统业务日志 --------------------1200
   */
  public static int sys_log_setting = 1201;
  public static int sys_log_operation = 1202;

  /**
   * 应用版本
   */
  public static int sys_version = 1301;
  /**
   *
   */
  static SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmssSSS");
  static Random r = new Random();
  final static String ZERO = "000000";


  /**
   * @param code
   * @return
   * @throws
   * @Title: GUUID
   * @Description: 生成表的PK
   */

  public static String GUUID(int code) {
    if (code < 1) {
      return null;
    }
    Date d = new Date();
    String s = sdf.format(d);
    String str = ZERO + r.nextInt(1000000);
    str = str.substring(str.length() - 6, str.length());
    return s + code + str;
  }

  public static String PRICEUID(int code, int num) {
    if (code < 1) {
      return null;
    }
    Date d = new Date();
    String s = sdf.format(d);
    String str = String.format("%06d", num);
    return s + code + str;
  }

  /*
      public static String GUUID(int code) {
          if (code < 1) {
              return null;
          }
          Date d = new Date();
          String s = sdf.format(d);
          int t=r.nextInt();
          while(t<1000000){
              t=r.nextInt();
          }
          String str="";
          str=String.valueOf(t).substring(0, 6);
          return s + code + str;
      }

      */
  public static String GUUID(Class<?> clazz) {
    if (clazz == null) {
      return null;
    }
    int code = mapClass.get(clazz);
    return GUUID(code);

  }

  public static String GUUID(String srcOrderId, String prefix) {
    if (srcOrderId != null) {

    }
    return null;

  }

  public static Map<Class<?>, Integer> mapClass = new HashMap<Class<?>, Integer>();

 /* static {
    mapClass.put(com.wfz.platforms.ecerp.bean.models.PayAccount.class,
      pay_account);

    mapClass.put(com.wfz.platforms.ecerp.bean.models.DocGoods.class,
      doc_goods);

  }*/

}


#' 查询手工调整单
#'
#' @param token

#' @return 无返回值
#' @export
#'
#' @examples
#' sal_outStock_Adj_select()
sal_outStock_Adj_select<- function(token) {

  sql=paste0("select FArraiveGoodsDate as 到货日期,a.FSaleOrgName as 销售组织,a.FSaleGroupName as 销售组,a.FSaleManName as 销售员,
a.FCustomerNumber as 客户编码,a.FCustomerName as 客户,a.FSettleCurrencyName as 结算币别,a.FExchangeRate as 汇率 ,FMaterialNumber as 物料编码 ,
a.FMaterialName as 物料名称,a.FIndustryName as 行业,a.FBillNo as 单据编号,a.FBillStatus as 单据状态,a.FBillType as 单据类型 ,
a.FStockUnitName as 库存单位,a.FRealQty as 实发数量,a.Fprice as 单价,a.FTaxPrice as 含税单价 ,a.FTaxAmount as 税额,a.Famount as 金额,
a.FAllAmount as 价税合计,a.Famount_LC as 金额_本位币,a.FAllAmount_LC as 价税合计_本位币 ,a.FIsFree as 是否赠品,
a.FIsRebate as 是否返利 from rds_dms_t_sal_outStock_Adj a ")

  res=tsda::sql_select2(token = token,sql = sql)
  return(res)
}


#' 清空手工调整单
#'
#' @param token

#' @return 无返回值
#' @export
#'
#' @examples
#' sal_outStock_Adj_delete()
sal_outStock_Adj_delete<- function(token) {

  sql=paste0("
TRUNCATE TABLE rds_dms_t_sal_outStock_Adj ")

  res=tsda::sql_delete2(token = token,sql_str = sql )
  return(res)
}



#' 查询手工调整单
#'
#' @param token

#' @return 无返回值
#' @export
#'
#' @examples
#' sal_returnStock_select()
sal_returnStock_select<- function(token) {

  sql=paste0("select FArraiveGoodsDate as 日期,
FSaleOrgName as 销售组织,
FSaleGroupName as 销售组,
FSaleManName as 销售员,
FCustomerNumber as 客户编码,
FCustomerName as 退货客户,
FSettleCurrencyName as 结算币别,
FExchangeRate as 汇率,
FMaterialNumber as 物料编码,
FMaterialName as 物料名称,
FIndustryName as 行业,
FBillNo as 单据编号,
FBillStatus as 单据状态,
FBillType as 单据类型,
FStockUnitName as 库存单位,
FRealQty as 实退数量,
Fprice as 单价,
FTaxPrice as 含税单价,
FTaxAmount as 税额,
Famount as 金额,
FAllAmount as 价税合计,
Famount_LC as 金额_本位币,
FAllAmount_LC as 价税合计_本位币,
FIsFree as 是否赠品,
FIsRebate as 是否返利
 from rds_dms_t_sal_returnStock ")

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
#' sal_returnStock_delete()
sal_returnStock_delete<- function(token) {

  sql=paste0("
TRUNCATE TABLE rds_dms_t_sal_returnStock ")

  res=tsda::sql_delete2(token = token,sql_str = sql )
  return(res)
}


#' 销售退货--财务口径
#'
#' @param erptoken
#' @param year
#' @param MONTH
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' returnscock_jherp_selectBydata()
returnscock_jherp_selectBydata<- function(erptoken,year,MONTH) {
  sql=paste0("select * from rds_vw_sale_returnscock_CN
  where year(FDATE)='",year,"' and MONTH(FDATE)='",MONTH,"'
")

  res=tsda::sql_select2(token = erptoken,sql = sql)
  return(res)
}

#' 销售退货按月删除--财务口径DMS
#'
#' @param dmstoken
#' @param year
#' @param MONTH
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' returnStock_deleteBydata()
returnStock_deleteBydata<- function(dmstoken,year,MONTH) {
  sql=paste0("delete  from rds_dms_t_sal_returnStock
  where year(FArraiveGoodsDate)='",year,"' and MONTH(FArraiveGoodsDate)='",MONTH,"'
")

  res=tsda::sql_delete2(token = dmstoken,sql_str = sql )
  return(res)
}

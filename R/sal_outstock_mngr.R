#' 销售出库--管理口径
#'
#' @param erptoken
#' @param year
#' @param MONTH
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' outstock_mngr_jherp_selectBydata()
outstock_mngr_jherp_selectBydata<- function(erptoken,year,MONTH) {
  sql=paste0("select * from rds_vw_sale_outstock_CN_M
  where year(FDATE)='",year,"' and MONTH(FDATE)='",MONTH,"'
")

  res=tsda::sql_select2(token = erptoken,sql = sql)
  return(res)
}
#' 查询销售出库管理口径
#'
#' @param token

#' @return 无返回值
#' @export
#'
#' @examples
#' sal_outstock_mngr_select()
sal_outstock_mngr_select<- function(token) {

  sql=paste0("select FDate as 出库日期,a.FSaleOrgName as 销售组织,a.FSaleGroupName as 销售组,a.FSaleManName as 销售员,
a.FCustomerNumber as 客户编码,a.FCustomerName as 客户,a.FSettleCurrencyName as 结算币别,a.FExchangeRate as 汇率 ,FMaterialNumber as 物料编码 ,
a.FMaterialName as 物料名称,a.FIndustryName as 行业,a.FBillNo as 单据编号,a.FBillStatus as 单据状态,a.FBillType as 单据类型 ,
a.FStockUnitName as 库存单位,a.FRealQty as 实发数量,a.Fprice as 单价,a.FTaxPrice as 含税单价 ,a.FTaxAmount as 税额,a.Famount as 金额,
a.FAllAmount as 价税合计,a.Famount_LC as 金额_本位币,a.FAllAmount_LC as 价税合计_本位币 ,a.FIsFree as 是否赠品,
a.FIsRebate as 是否返利 from rds_dms_t_sal_outStock_mngr a
")

  res=tsda::sql_select2(token = token,sql = sql)
  return(res)
}


#' 清空销售出库管理口径
#'
#' @param token

#' @return 无返回值
#' @export
#'
#' @examples
#' sal_outstock_mngr_delete()
sal_outstock_mngr_delete<- function(token) {

  sql=paste0("
TRUNCATE TABLE rds_dms_t_sal_outStock_mngr ")

  res=tsda::sql_delete2(token = token,sql_str = sql )
  return(res)
}

#' 销售出库按月删除--财务口径DMS
#'
#' @param dmstoken
#' @param year
#' @param MONTH
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' outstock_mngr_deleteBydata()
outstock_mngr_deleteBydata<- function(dmstoken,year,MONTH) {
  sql=paste0("delete  from rds_dms_t_sal_outStock_mngr
  where year(FDate)='",year,"' and MONTH(FDate)='",MONTH,"'")

  res=tsda::sql_delete2(token = dmstoken,sql_str = sql )
  return(res)
}


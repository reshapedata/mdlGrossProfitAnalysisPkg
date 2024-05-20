
#' 查询佣金表
#'
#' @param dmstoken
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' commision_actual_select()
commision_actual_select<- function(dmstoken) {

  sql=paste0("select a.FArraiveGoodsDate as 到货日期,
a.FSaleOrgName as 销售组织,
a.FSaleGroupName as 销售组,
a.FSaleManName as 销售员,
a.FCustomerNumber as 客户编码,
a.FCustomerName as 客户,
a.FSettleCurrencyName as 结算币别,
a.FExchangeRate as 汇率,
a.FMaterialNumber as 物料编码,
a.FMaterialName as 物料名称,
a.FIndustryName as 行业,
a.FBillNo as 单据编号,
a.FCustMtrlName as 客户物料名称,
a.FBillStatus as 单据状态,
a.FBillType as 单据类型,
a.FStockUnitName as 库存单位,
a.FRealQty as 实发数量,
a.Fprice as 单价,
a.FTaxPrice as 含税单价,
a.FTaxAmount as 税额,
a.Famount as 金额,
a.FAllAmount as 价税合计,
a.Famount_LC as 金额_本位币,
a.FAllAmount_LC as 价税合计_本位币,
a.FIsFree as 是否赠品,
a.FIsRebate as 是否返利,
a.FIsCommision as 佣金客户名称,
a.FCountMethod as 计量方式,
a.FCountStandard as 计提依据,
a.FCountRate as 佣金比例,
a.FCommisionAmount as 佣金金额,
a.FSumCountStandard as 汇总计题依据,
a.FSumFiscalFee as 汇总打款手续费,
a.FSplitFiscalFee as 分摊打款手续费,
a.FTotalCommisionAmt as 总计佣金金额,
a.FCommisionRateUsd as 佣金汇率_美元,
a.FCommisionAmountUsd as 总计佣金金额_美元
 from rds_t_commision_res_fiscal a")
  res=tsda::sql_select2(token = dmstoken,sql = sql)
  return(res)
}



#' 按月插入佣金数据数据
#'
#' @param dmstoken
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' commision_actual_insert()
commision_actual_insert<- function(dmstoken,year,MONTH) {

  sql=paste0("insert into rds_t_commision_res_fiscal
select * from rds_vw_commision_fiscal_sum a
where year(FArraiveGoodsDate)='",year,"' and MONTH(FArraiveGoodsDate)='",MONTH,"'")
  res=tsda::sql_update2(token = dmstoken,sql_str  = sql)
  return(res)
}



#' 清空佣金数据数据
#'
#' @param dmstoken
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' commision_actual_delete()
commision_actual_delete<- function(dmstoken) {

  sql=paste0("
TRUNCATE TABLE rds_t_commision_res_fiscal")
  res=tsda::sql_delete2(token = dmstoken,sql_str  = sql)
  return(res)
}


#' 按月查询佣金表
#'
#' @param dmstoken
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' commision_actual_selectBydata()
commision_actual_selectBydata<- function(dmstoken,year,MONTH) {

  sql=paste0("select a.FArraiveGoodsDate as 到货日期,
a.FSaleOrgName as 销售组织,
a.FSaleGroupName as 销售组,
a.FSaleManName as 销售员,
a.FCustomerNumber as 客户编码,
a.FCustomerName as 客户,
a.FSettleCurrencyName as 结算币别,
a.FExchangeRate as 汇率,
a.FMaterialNumber as 物料编码,
a.FMaterialName as 物料名称,
a.FIndustryName as 行业,
a.FBillNo as 单据编号,
a.FCustMtrlName as 客户物料名称,
a.FBillStatus as 单据状态,
a.FBillType as 单据类型,
a.FStockUnitName as 库存单位,
a.FRealQty as 实发数量,
a.Fprice as 单价,
a.FTaxPrice as 含税单价,
a.FTaxAmount as 税额,
a.Famount as 金额,
a.FAllAmount as 价税合计,
a.Famount_LC as 金额_本位币,
a.FAllAmount_LC as 价税合计_本位币,
a.FIsFree as 是否赠品,
a.FIsRebate as 是否返利,
a.FIsCommision as 佣金客户名称,
a.FCountMethod as 计量方式,
a.FCountStandard as 计提依据,
a.FCountRate as 佣金比例,
a.FCommisionAmount as 佣金金额,
a.FSumCountStandard as 汇总计题依据,
a.FSumFiscalFee as 汇总打款手续费,
a.FSplitFiscalFee as 分摊打款手续费,
a.FTotalCommisionAmt as 总计佣金金额,
a.FCommisionRateUsd as 佣金汇率_美元,
a.FCommisionAmountUsd as 总计佣金金额_美元
 from rds_t_commision_res_fiscal a
             where year(a.FArraiveGoodsDate)='",year,"' and MONTH(a.FArraiveGoodsDate)='",MONTH,"'")
  res=tsda::sql_select2(token = dmstoken,sql = sql)
  return(res)
}

#' 按月删除佣金数据数据
#'
#' @param dmstoken
#' @param year
#' @param MONTH
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' commision_actual_deleteBydate()
commision_actual_deleteBydate<- function(dmstoken,year,MONTH) {

  sql=paste0("delete from rds_t_commision_res_fiscal
             where year(FArraiveGoodsDate)='",year,"' and MONTH(FArraiveGoodsDate)='",MONTH,"'")
  res=tsda::sql_delete2(token = dmstoken,sql_str  = sql)
  return(res)
}






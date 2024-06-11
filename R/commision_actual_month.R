
#' 查询佣金月度汇总表——财务口径
#'
#' @param dmstoken
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' commision_actual_month_select()
commision_actual_month_select<- function(dmstoken) {

  sql=paste0("select
a.Fyear as 年份,
a.Fmonth as 月份,
a.FSaleOrgName as 组织,
a.FSaleMan as 销售员,
a.Fcountry as 国家,
a.FContidtionName as 佣金条款,
a.FCommisionStandard as 计提方式,
a.FCustomerName as 客户,
a.FCountRate as 佣金比例,
a.Fcurrency as 币别,
a.FBegAmt as 期初结存金额USD,
a.FRealQty as 实发数量,
a.FCurremtRebateAmount as 本期计提金额USD,
a.FPaymentAmount as 本期支付金额USD,
a.FEndAmount as 期末结存金额USD
from rds_dms_t_res_commision_sum a")
  res=tsda::sql_select2(token = dmstoken,sql = sql)
  return(res)
}




#' 清空佣金月度汇总表——财务口径
#'
#' @param dmstoken
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' commision_actual_month_delete()
commision_actual_month_delete<- function(dmstoken) {

  sql=paste0("
TRUNCATE TABLE rds_dms_t_res_commision_sum")
  res=tsda::sql_delete2(token = dmstoken,sql_str  = sql)
  return(res)
}


#' 按月计算佣金月度汇总表财务口径
#'
#' @param dmstoken
#' @param year
#' @param month
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' commision_actual_month_selectBydata()
commision_actual_month_selectBydata<- function(dmstoken,year,month) {

  sql=paste0("
  exec rds_dms_proc_commision_Sum '",year,"','",month,"'
  ")
  res=tsda::sql_select2(token = dmstoken,sql = sql)
  return(res)
}



#' 清空返利金额数据数据
#'
#' @param dmstoken
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' rebate_detailAmt_actual_deleteByyear()
rebate_detailAmt_actual_deleteByyear<- function(dmstoken) {

  sql=paste0("
TRUNCATE TABLE rds_dms_t_res_rebate_amount_sum_year")
  res=tsda::sql_delete2(token = dmstoken,sql_str  = sql)
  return(res)
}


#' 查询返利金额年度汇总表
#'
#' @param dmstoken
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' rebate_detailAmt_actual_selectByyear()
rebate_detailAmt_actual_selectByyear<- function(dmstoken) {

  sql=paste0(" select
FCustomerName as  客户名称,
FSaleOrgName as  组织,
FRebateMethod as  返利方式,
Findustry as  行业,
FProductName as  型号,
Fyear as  年份,
FBegQty as  期初结余未返量,
FBegAmt as  期初结余未返金额,
FSaleOutStockQty as  发货量_KG,
FRebateDebitQty as  应返量_KG,
FRebateCreditQty as  已返量_KG ,
FEndQty as  结余未返量_KG,
FSalePrice as  销售单价,
FRebateDebitAmount as  应返金额,
FRebateCreditAmount as  已返金额,
FEndAmount as  结余未返金额,
Fdiff as  计提
from rds_dms_t_res_rebate_amount_sum_year")
  res=tsda::sql_select2(token = dmstoken,sql = sql)
  return(res)
}


#' 按年计算返利金额年度汇总表
#'
#' @param dmstoken
#' @param year
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' rebate_detailAmt_actual_Byyear()
rebate_detailAmt_actual_Byyear<- function(dmstoken,year) {

  sql=paste0("exec rds_dms_proc_rebate_amtYearSum '",year,"'

             ")
  res=tsda::sql_select2(token = dmstoken,sql = sql)
  return(res)
}



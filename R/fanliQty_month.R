#' 清空返利数量数据数据
#'
#' @param dmstoken
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' rebate_detailQty_actual_deleteBymonth()
rebate_detailQty_actual_deleteBymonth<- function(dmstoken) {

  sql=paste0("
TRUNCATE TABLE rds_dms_t_res_rebate_qtySum")
  res=tsda::sql_delete2(token = dmstoken,sql_str  = sql)
  return(res)
}


#' 查询返利数量月度汇总表
#'
#' @param dmstoken
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' rebate_detailQty_actual_selectBymonth()
rebate_detailQty_actual_selectBymonth<- function(dmstoken) {

  sql=paste0("select
FCustomerName as  客户名称,
FSaleOrgName as  组织,
FRebateMethod as  返利方式,
Findustry as  行业,
FProductName as  型号,
Fyear as  年份,
Fmonth as  月份,
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
from rds_dms_t_res_rebate_qtySum

             ")
  res=tsda::sql_select2(token = dmstoken,sql = sql)
  return(res)
}


#' 按月计算返利数量月度汇总表
#'
#' @param dmstoken
#' @param year
#' @param MONTH
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' rebate_detailQty_actual_Bymonth()
rebate_detailQty_actual_Bymonth<- function(dmstoken,year,MONTH) {

  sql=paste0("exec rds_dms_proc_rebate_qtySum '",year,"','",MONTH,"'

             ")
  res=tsda::sql_select2(token = dmstoken,sql = sql)
  return(res)
}



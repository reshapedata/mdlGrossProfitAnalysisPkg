#' 查询USD金额表
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' rule_payment_month_view()
rule_payment_month_view<- function(token) {

  sql=paste0("select FContractNumber as 合同协议号,
FSaleOrgName as 组织,
FCustomerName AS 客户名称,
Fyear as 年份,
Fmonth as 月份,
FPaymentAmount as 支付金额
from Rds_t_rule_payment_USD
")

  res=tsda::sql_select2(token = token,sql = sql)
  return(res)
}




#' Title 增加支付金额
#'
#' @param FContractNumber
#' @param FCustomerName
#' @param Fyear
#' @param Fmonth
#' @param FPaymentAmount
#' @param token
#' @param FSaleOrgName
#'
#' @return
#' @export
#'
#' @examples
#' rule_payment_month_add()
rule_payment_month_add<- function(token,FContractNumber,FSaleOrgName,FCustomerName,Fyear,Fmonth,FPaymentAmount) {

  sql=paste0("
  insert into Rds_t_rule_payment_USD values('",FContractNumber,"','",FSaleOrgName,"',N'",FCustomerName,"','",Fyear,"','",Fmonth,"','",FPaymentAmount,"')
       ")

  res=tsda::sql_update2(token = token,sql_str = sql)
  return(res)
}



#' Title 数据中台支付金额删除
#'
#' @param FContractNumber
#' @param token
#'
#' @return
#' @export
#'
#' @examples rule_payment_month_delete()
rule_payment_month_delete<- function(token,FContractNumber) {

  sql=paste0("delete Rds_t_rule_payment_USD where FContractNumber='",FContractNumber,"'
             "  )

  res=tsda::sql_delete2(token = token,sql_str = sql)
  return(res)
}



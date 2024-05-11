#' 查询返利规则表
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' rule_fanLiAmount_view()
rule_fanLiAmount_view<- function(token) {

  sql=paste0("select
FBillNo  as 编号,
FCustomerName as 客户,
FIndexType	as 指标类型,
FStartRealAmount as 实发数量_大于等于,
FEndRealAmount	as 实发数量_到,
FUnit as 计量单位,
FRebateRate	as 返利_百分比,
FEffectDate	as 生效日期,
FExpireDate	as 失效日期
from rds_t_rule_fanLiAmount")

  res=tsda::sql_select2(token = token,sql = sql)
  return(res)
}



#' 添加返利规则表
#'
#' @param token
#' @param FBillNo
#' @param FCustomerName
#' @param FIndexType
#' @param FStartRealAmount
#' @param FEndRealAmount
#' @param FUnit
#' @param FRebateRate
#' @param FEffectDate
#' @param FExpireDate
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' rule_fanLiAmount_add()
rule_fanLiAmount_add<- function(token,FBillNo,FCustomerName,FIndexType,FStartRealAmount,FEndRealAmount,FUnit,FRebateRate,FEffectDate,FExpireDate) {

  sql=paste0("insert into rds_t_rule_fanLiAmount values('",FBillNo,"','",FCustomerName,"','",FIndexType,"','",FStartRealAmount,"','",FEndRealAmount,"','",FUnit,"','",FRebateRate,"','",FEffectDate,"','",FExpireDate,"')")

  res=tsda::sql_update2(token = token,sql_str = sql)
  return(res)
}



#' Title
#'
#' @param token
#' @param FBillNo
#'
#' @return
#' @export
#'
#' @examples rule_fanLiAmount_delete()
rule_fanLiAmount_delete<- function(token,FBillNo) {

  sql=paste0("delete rds_t_rule_fanLiAmount where FBillNo='",FBillNo,"'")

  res=tsda::sql_delete2(token = token,sql_str = sql)
  return(res)
}



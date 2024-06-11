#' 查询返利规则表
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' rule_fanLiQty_view()
rule_fanLiQty_view<- function(token) {

  sql=paste0("select
FBillNo  as 编号,
FCustomerName as 客户,
FIndexType	as 指标类型,
FIndexCustomerName as 计量客户,
FStartRealQty as 实发数量_大于等于,
FEndRealQty	as 实发数量_到,
FUnit as 计量单位,
FRebateProduct as 返利产品,
FRebateType as 返利类型 ,
FRebateRate	as 返利_百分比,
FEffectDate	as 生效日期,
FExpireDate	as 失效日期
from rds_t_rule_fanLiQty")

  res=tsda::sql_select2(token = token,sql = sql)
  return(res)
}



#' 添加返利规则表
#'
#' @param token
#' @param FBillNo
#' @param FCustomerName
#' @param FIndexType
#' @param FStartRealQty
#' @param FEndRealQty
#' @param FUnit
#' @param FRebateRate
#' @param FEffectDate
#' @param FExpireDate
#' @param FRebateProduct
#' @param FIndexCustomerName
#' @param FRebateType
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' rule_fanLiQty_add()
#'
rule_fanLiQty_add<- function(token,FBillNo,FCustomerName,FIndexType,FIndexCustomerName,FStartRealQty,FEndRealQty,FUnit,FRebateProduct,FRebateType,FRebateRate,FEffectDate,FExpireDate) {

  sql=paste0("insert into rds_t_rule_fanLiQty values('",FBillNo,"','",FCustomerName,"','",FIndexType,"','",FIndexCustomerName,"','",FStartRealQty,"','",FEndRealQty,"','",FUnit,"','",FRebateProduct,"','",FRebateType,"','",FRebateRate,"','",FEffectDate,"','",FExpireDate,"')

")

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
#' @examples rule_fanLiQty_delete()
rule_fanLiQty_delete<- function(token,FBillNo) {

  sql=paste0("delete rds_t_rule_fanLiQty where FBillNo='",FBillNo,"'")

  res=tsda::sql_delete2(token = token,sql_str = sql)
  return(res)
}



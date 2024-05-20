
#' 查询返利金额表
#'
#' @param dmstoken
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' rebate_detailAmt_actual_select()
rebate_detailAmt_actual_select<- function(dmstoken) {

  sql=paste0("select Fdate as 业务日期,
FSaleOrgName as 销售组织,
FSaleGroupName as 销售组,
FSaleManName as 销售员,
FCustomerNumber as 往来单位编码,
FCustomerName as 往来单位,
FSettleCurrencyName as 结算币别,
FBillNo as 单据编号,
FExchangeRate as 结算汇率,
FBillTypeName as 单据类型,
FArAmount as 应收金额,
FBillStatus as 单据状态,
FReceiveAmount as 实收金额,
FArAmount_LC as 应收金额本位币,
FReceiveAmount_LC as 实收金额本位币,
FRebateRate as 返利_百分比,
FRebateAmount as 返利金额
 from rds_dms_t_res_rebate_amt")
  res=tsda::sql_select2(token = dmstoken,sql = sql)
  return(res)
}



#' 按月插入返利金额数据数据
#'
#' @param dmstoken
#' @param year
#' @param MONTH
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' rebate_detailAmt_actual_insert()
rebate_detailAmt_actual_insert<- function(dmstoken,year,MONTH) {

  sql=paste0("insert into rds_dms_t_res_rebate_amt
select
a.Fdate as Fdate,
a.FSaleOrgName as FSaleOrgName,
a.FSaleGroupName as FSaleGroupName,
a.FSaleManName as FSaleManName,
a.FCustomerNumber as FCustomerNumber,
a.FCustomerName as FCustomerName,
a.FSettleCurrencyName as FSettleCurrencyName,
a.FBillNo as FBillNo,
a.FExchangeRate as FExchangeRate,
a.FBillTypeName as FBillTypeName,
a.FArAmount as FArAmount,
a.FBillStatus as FBillStatus,
a.FReceiveAmount as FReceiveAmount,
a.FArAmount_LC as FArAmount_LC,
a.FReceiveAmount_LC as FReceiveAmount_LC,
b.FRebateRate as FRebateRate,
(b.FRebateRate/100)*a.FReceiveAmount_LC as FRebateAmount
 from rds_dms_vw_ca_receive a
 right join rds_t_rule_fanLiAmount b
 on b.FCustomerName = a.FCustomerName
 and abs(a.FReceiveAmount_LC/10000)>=b.FStartRealAmount
and abs(a.FReceiveAmount_LC/10000 )< b.FEndRealAmount
and a.Fdate >= b.FEffectDate
and  a.Fdate <= b.FExpireDate
and year(Fdate)='",year,"' and MONTH(Fdate)='",MONTH,"'
where b.FCustomerName = a.FCustomerName
 and abs(a.FReceiveAmount_LC/10000)>=b.FStartRealAmount
and abs(a.FReceiveAmount_LC/10000 )< b.FEndRealAmount
and a.Fdate >= b.FEffectDate
and  a.Fdate <= b.FExpireDate
             ")
  res=tsda::sql_update2(token = dmstoken,sql_str  = sql)
  return(res)
}



#' 清空返利金额数据数据
#'
#' @param dmstoken
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' rebate_detailAmt_actual_delete()
rebate_detailAmt_actual_delete<- function(dmstoken) {

  sql=paste0("
TRUNCATE TABLE rds_dms_t_res_rebate_amt")
  res=tsda::sql_delete2(token = dmstoken,sql_str  = sql)
  return(res)
}


#' 查询返利金额表按日期
#'
#' @param dmstoken
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' rebate_detailAmt_actual_selectBydata()
rebate_detailAmt_actual_selectBydata<- function(dmstoken,year,MONTH) {

  sql=paste0("select Fdate as 业务日期,
FSaleOrgName as 销售组织,
FSaleGroupName as 销售组,
FSaleManName as 销售员,
FCustomerNumber as 往来单位编码,
FCustomerName as 往来单位,
FSettleCurrencyName as 结算币别,
FBillNo as 单据编号,
FExchangeRate as 结算汇率,
FBillTypeName as 单据类型,
FArAmount as 应收金额,
FBillStatus as 单据状态,
FReceiveAmount as 实收金额,
FArAmount_LC as 应收金额本位币,
FReceiveAmount_LC as 实收金额本位币,
FRebateRate as 返利_百分比,
FRebateAmount as 返利金额
from rds_dms_t_res_rebate_amt
             where year(Fdate)='",year,"' and MONTH(Fdate)='",MONTH,"'")
  res=tsda::sql_select2(token = dmstoken,sql = sql)
  return(res)
}

#' 按月删除返利金额数据数据
#'
#' @param dmstoken
#' @param year
#' @param MONTH
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' rebate_detailAmt_actual_deleteBydate()
rebate_detailAmt_actual_deleteBydate<- function(dmstoken,year,MONTH) {
  sql=paste0("delete from rds_dms_t_res_rebate_amt
where year(Fdate)='",year,"' and MONTH(Fdate)='",MONTH,"'")
  res=tsda::sql_delete2(token = dmstoken,sql_str  = sql)
  return(res)
}





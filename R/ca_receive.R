


#' 查询手工调整单
#'
#' @param token

#' @return 无返回值
#' @export
#'
#' @examples
#' ca_receive_select()
ca_receive_select<- function(token) {

  sql=paste0("
select Fdate as 业务日期,
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
FReceiveAmount_LC as 实收金额本位币
from rds_dms_t_ca_receive ")

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
#' ca_receive_delete()
ca_receive_delete<- function(token) {

  sql=paste0("
TRUNCATE TABLE rds_dms_t_ca_receive ")

  res=tsda::sql_delete2(token = token,sql_str = sql )
  return(res)
}

#' 收款
#'
#' @param erptoken
#' @param year
#' @param MONTH
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' RECEIVEBILL_jherp_selectBydata()
RECEIVEBILL_jherp_selectBydata<- function(erptoken,year,MONTH) {
  sql=paste0("select  FDATE , FSALEORGID ,FSALESGROUPID ,
        FSALEERID ,F_nlj_CustomerNumber ,FCONTACTUNIT ,
        FSETTLECUR ,FBILLNO , FSETTLERATE ,
        FBillTypeID ,FRECEIVEAMOUNTFOR ,FDOCUMENTSTATUS ,FREALRECAMOUNTFOR ,
        FRECEIVEAMOUNT ,FREALRECAMOUNT
 from rds_vw_AR_RECEIVEBILL_CN
  where year(FDATE)='",year,"' and MONTH(FDATE)='",MONTH,"'
")

  res=tsda::sql_select2(token = erptoken,sql = sql)
  return(res)
}


#' 收款单按月删除--财务口径DMS
#'
#' @param dmstoken
#' @param year
#' @param MONTH
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' ca_receive_deleteBydata()
ca_receive_deleteBydata<- function(dmstoken,year,MONTH) {
  sql=paste0("delete  from rds_dms_t_ca_receive
  where year(Fdate)='",year,"' and MONTH(Fdate)='",MONTH,"'
")

  res=tsda::sql_delete2(token = dmstoken,sql_str = sql )
  return(res)
}

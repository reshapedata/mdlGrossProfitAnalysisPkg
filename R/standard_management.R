#' 标准成本分许更新--删除客户行业表
#'
#' @param dms_token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' standard_management_delete()
standard_management_delete<- function(dms_token) {

  sql=paste0("TRUNCATE TABLE rds_t_customerByindustry")
 res = tsda::sql_delete2(token = dms_token,sql_str = sql )

  return(res)
}
#' 标准成本分许更新--插入最新客户行业
#'
#' @param erptoken
#' @param dms_token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' standard_management_jherp_insert()
standard_management_jherp_insert<- function(erptoken,dms_token) {


  sql=paste0("select FNUMBER as fcustomernumber,F_Txt_industry as industry from T_BD_CUSTOMER")

  data=tsda::sql_select2(token = erptoken,sql = sql)
  res=tsda::db_writeTable2(token = dms_token,table_name = 'rds_t_customerByindustry',r_object = data,append = TRUE)


  return(res)
}

#' 标准成本分许更新--更新最新客户行业
#'
#' @param dms_token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' standard_management_update()
standard_management_update<- function(dms_token) {


  sql=paste0("update a
set a.行业=b.FIndustryName
from rds_standardCost_rpt_Amt_management a
left join rds_t_customerByindustry b on a.客户编码=b.FCustomerNumber
where a.客户编码=b.FCustomerNumber")
  res=tsda::sql_update2(token =dms_token,sql_str = sql )



  return(res)
}


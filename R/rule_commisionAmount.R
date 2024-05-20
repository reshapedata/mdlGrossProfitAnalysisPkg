#' 查询佣金规则表
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' rule_commisionAmount_view()
rule_commisionAmount_view<- function(token) {

  sql=paste0("select
Fbillno as 编号,
FSaleOrgName as 组织,
FSaleMan as 业务员,
Fcountry as 国家,
FStartDate as 开始日期,
FEndDate as 结束日期,
FCustomerName as 客户,
FContidtionName as 佣金条款,
FCustMtrlName as 客户物料名称,
FCommisionBy as 计提依据,
FCommisionStandard as 计提标准,
Fcurrency as 币种,
FFiscalFee as 打款手续费
 from rds_t_commision_rule_Amount
")

  res=tsda::sql_select2(token = token,sql = sql)
  return(res)
}




#' 数据中台插入佣金规则
#'
#' @param token
#' @param Fbillno
#' @param FSaleOrgName
#' @param FSaleMan
#' @param Fcountry
#' @param FStartDate
#' @param FEndDate
#' @param FCustomerName
#' @param FContidtionName
#' @param FCustMtrlName
#' @param FCommisionBy
#' @param FCommisionStandard
#' @param Fcurrency
#' @param FFiscalFee
#'
#' @return
#' @export
#'
#' @examples
#' rule_commisionAmount_add()
rule_commisionAmount_add<- function(token,Fbillno, FSaleOrgName,  FSaleMan,  Fcountry,
 FStartDate,FEndDate, FCustomerName,FContidtionName, FCustMtrlName,FCommisionBy,
  FCommisionStandard,Fcurrency,FFiscalFee) {

  sql=paste0(" insert into rds_t_commision_rule_Amount values('",Fbillno,"','",FSaleOrgName,"','",FSaleMan,"',
  '",Fcountry,"','",FStartDate,"','",FEndDate,"','",FCustomerName,"','",FContidtionName,"','",FCustMtrlName,"',
  '",FCommisionBy,"', '",FCommisionStandard,"'
  ,'",Fcurrency,"','",FFiscalFee,"')
")

  res=tsda::sql_update2(token = token,sql_str = sql)
  return(res)
}



#' Title 数据中台佣金规则表删除
#'
#' @param token
#' @param FBillNo
#'
#' @return
#' @export
#'
#' @examples rule_commisionAmount_delete()
rule_commisionAmount_delete<- function(token,FBillNo) {

  sql=paste0("delete rds_t_commision_rule_Amount where FBillNo='",FBillNo,"'")

  res=tsda::sql_delete2(token = token,sql_str = sql)
  return(res)
}



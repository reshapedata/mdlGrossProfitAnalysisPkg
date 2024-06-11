#' 查询FOB金额表
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' rule_rebateFobamount_view()
rule_rebateFobamount_view<- function(token) {

  sql=paste0("select
Fbillno as 单据编号,
FMaterialNumber as 物料编码,
FCountStandard as 计提依据
 from Rds_t_rebate_rule_fobamount

")

  res=tsda::sql_select2(token = token,sql = sql)
  return(res)
}




#' Title 增加计提依据
#'
#' @param token
#' @param FBillNo
#' @param  FCountStandard
#' @param FMaterialNumber
#'
#' @return
#' @export
#'
#' @examples
#' rule_rebateFobamount_add()
rule_rebateFobamount_add<- function(token,FBillNo,FMaterialNumber,FCountStandard) {

  sql=paste0("
  insert into Rds_t_rebate_rule_fobamount values('",FBillNo,"','",FMaterialNumber,"','",FCountStandard,"' )
             ")

  res=tsda::sql_update2(token = token,sql_str = sql)
  return(res)
}



#' Title 数据中台计提依据删除
#'
#' @param token
#' @param FBillNo
#' @param FMaterialNumber
#'
#' @return
#' @export
#'
#' @examples rule_rebateFobamount_delete()
rule_rebateFobamount_delete<- function(token,FBillNo,FMaterialNumber) {

  sql=paste0("delete Rds_t_rebate_rule_fobamount where FBillNo='",FBillNo,"'
  and FMaterialNumber='",FMaterialNumber,"'
             "  )

  res=tsda::sql_delete2(token = token,sql_str = sql)
  return(res)
}



#' 返利数量明细表--财务口径
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' rebate_actual()
rebate_actual<- function(token) {


  sql=paste0("select * from rds_t_rebate_rpt_detailQty_actual")

  res=tsda::sql_select2(token = token,sql = sql)
  return(res)
}



#' 返利金额明细表--财务口径
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' rebate_detailAmt_actual()
rebate_detailAmt_actual<- function(token) {

  sql=paste0("select * from rds_t_rebate_rpt_detailAmt_actual")

  res=tsda::sql_select2(token = token,sql = sql)
  return(res)
}




#' 返利金额明细表--管理口径
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' rebate_management()
rebate_management<- function(token) {

  sql=paste0("select * from rds_t_rebate_rpt_detailAmt_management")

  res=tsda::sql_select2(token = token,sql = sql)
  return(res)
}



#' 佣金金额明细表--财务口径
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' commision_actual()
commision_actual<- function(token) {

  sql=paste0("select * from rds_t_commision_rpt_detailAmt_actual")

  res=tsda::sql_select2(token = token,sql = sql)
  return(res)
}




#' 佣金金额明细表--管理口径
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' commision_management()
commision_management<- function(token) {

  sql=paste0("select * from rds_t_commision_rpt_detailAmt_management")

  res=tsda::sql_select2(token = token,sql = sql)
  return(res)
}



#' 运费明细表-财务口径
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' transportFee_actual()
transportFee_actual<- function(token) {

  sql=paste0("select * from rds_t_transportFee_rpt_detailAmt_actual")

  res=tsda::sql_select2(token = token,sql = sql)
  return(res)
}




#' 运费明细表-管理口径
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' transportFee_management()
transportFee_management<- function(token) {

  sql=paste0("select * from rds_t_transportFee_rpt_detailAmt_management")

  res=tsda::sql_select2(token = token,sql = sql)
  return(res)
}

#' 标准成本明细表
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' standardCost_management()
standardCost_management<- function(token) {

  sql=paste0("select * from rds_standardCost_rpt_Amt_management")

  res=tsda::sql_select2(token = token,sql = sql)
  return(res)
}


#' 集团毛利表-管理口径
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' grossProfit_management()
grossProfit_management<- function(token) {

  sql=paste0("select * from rds_grossProfit_rpt_detailAmt_management")

  res=tsda::sql_select2(token = token,sql = sql)
  return(res)
}


















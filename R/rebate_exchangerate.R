#' 嘉好汇率体表按月查询径
#'
#' @param erptoken
#' @param year
#' @param MONTH
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' exchangerate_jherp_selectBydata()
exchangerate_jherp_selectBydata<- function(erptoken,year,MONTH) {
  sql=paste0("
  select 生效日期,失效日期,目标币,原币,间接汇率 as 汇率 from rds_vw_md_currency_cn  where    目标币 = '人民币' and 原币='美元' and

year(生效日期 )='",year,"' and year(失效日期)='",year,"' and

month(生效日期 )='",MONTH,"' and month(失效日期)='",MONTH,"'

union all

select 生效日期,失效日期,原币,目标币,直接汇率 as 汇率 from rds_vw_md_currency_cn  where    目标币 = '美元' and 原币='欧元' and

year(生效日期 )='",year,"' and year(失效日期)='",year,"' and

month(生效日期 )='",MONTH,"' and month(失效日期)='",MONTH,"'
")

  res=tsda::sql_select2(token = erptoken,sql = sql)
  return(res)
}
#' 数据中台查询汇率体系表
#'
#' @param token

#' @return 无返回值
#' @export
#'
#' @examples
#' rebate_exchangerate_select()
rebate_exchangerate_select<- function(token) {

  sql=paste0("SELECT
FStartDate as  开始日期,
FEndDate as  结束日期,
FBillCurrencyName as  单据币别,
FCommisionCurrencyName as  佣金币别,
Frate as  汇率
FROM rds_t_rebate_exchangerate



")

  res=tsda::sql_select2(token = token,sql = sql)
  return(res)
}


#' 清空数据中台汇率体系表
#'
#' @param token

#' @return 无返回值
#' @export
#'
#' @examples
#' rebate_exchangerate_delete()
rebate_exchangerate_delete<- function(token) {

  sql=paste0("
TRUNCATE TABLE rds_t_rebate_exchangerate ")

  res=tsda::sql_delete2(token = token,sql_str = sql )
  return(res)
}

#' 数据中台汇率体系表按月删除
#'
#' @param dmstoken
#' @param year
#' @param MONTH
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' exchangerate_deleteBydata()
exchangerate_deleteBydata<- function(dmstoken,year,MONTH) {
  sql=paste0("delete  from rds_t_rebate_exchangerate
  where year(FStartDate)='",year,"' and MONTH(FStartDate)='",MONTH,"'
       and      year(FEndDate)='",year,"' and MONTH(FEndDate)='",MONTH,"'
             ")

  res=tsda::sql_delete2(token = dmstoken,sql_str = sql )
  return(res)
}



#' 查询返利数量表_管理口径
#'
#' @param dmstoken
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' fanliQty_mngr_select()
fanliQty_mngr_select<- function(dmstoken) {

  sql=paste0("
select
FDate as 日期,
FSaleOrgName as 销售组织,
FSaleGroupName as 销售组,
FSaleManName as 销售员,
FCustomerNumber as 客户编码,
FCustomerName as 客户,
FSettleCurrencyName as 结算币别,
FExchangeRate as 汇率,
FMaterialNumber as 物料编码,
FMaterialName as 物料名称,
FIndustryName as 行业,
FBillNo as 单据编号,
FBillStatus as 单据状态,
FBillType as 单据类型,
FStockUnitName as 库存单位,
FRealQty as 实发数量,
Fprice as 单价,
FTaxPrice as 含税单价,
FTaxAmount as 税额,
Famount as 金额,
FAllAmount as 价税合计,
Famount_LC as 金额_本位币,
FAllAmount_LC as 价税合计_本位币,
FIsFree as 是否赠品,
FIsRebate as 是否返利,
FRebateRate as 利率_百分比,
FRebateQty as 返利数量,
Fprice_LC as 单价_本位币,
FRebateAmount as 返利金额
from rds_dms_t_res_rebate_qty_mngr")
  res=tsda::sql_select2(token = dmstoken,sql = sql)
  return(res)
}



#' 按月插入返利数量数据数据_管理口径
#'
#' @param dmstoken
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' fanliQty_mngr_insert()
fanliQty_mngr_insert<- function(dmstoken,year,MONTH) {

  sql=paste0("
insert into  rds_dms_t_res_rebate_qty_mngr
select a.FDate as FDate,
a.FSaleOrgName as FSaleOrgName,
a.FSaleGroupName as FSaleGroupName,
a.FSaleManName as FSaleManName,
a.FCustomerNumber as FCustomerNumber,
a.FCustomerName as FCustomerName,
a.FSettleCurrencyName as FSettleCurrencyName,
a.FExchangeRate as FExchangeRate ,
a.FMaterialNumber as FMaterialNumber ,
a.FMaterialName as FMaterialName,
a.FIndustryName as FIndustryName,
a.FBillNo as FBillNo,
a.FBillStatus as FBillStatus,
a.FBillType as FBillType ,
a.FStockUnitName as FStockUnitName,
a.FRealQty as FRealQty,
a.Fprice as Fprice,
a.FTaxPrice as FTaxPrice ,
a.FTaxAmount as FTaxAmount,
a.Famount as Famount,
a.FAllAmount as FAllAmount,
a.Famount_LC as Famount_LC,
a.FAllAmount_LC as FAllAmount_LC ,
a.FIsFree as FIsFree,
a.FIsRebate as FIsRebate,
b.FRebateRate as FRebateRate,
(a.FRealQty)*(b.FRebateRate/100) as FRebateQty,
a.Famount_LC/a.FRealQty as Fprice_LC,
a.Famount_LC*(b.FRebateRate/100) as FRebateAmount
 from rds_dms_vw_sal_outStock_all_mngr a
right join rds_t_rule_fanLiQty  b
on b.FCustomerName=a.FCustomerName
and abs(a.FsumRealQty)/1000>=b.FStartRealQty
and abs(a.FsumRealQty)/1000 < b.FEndRealQty
and a.FDate >= b.FEffectDate
and a.FDate <= b.FExpireDate
and(b.FIndexType='所有产品' or b.FIndexType =a.FMaterialName)
where   a.FIsFree = '否'and a.FIsRebate='否'
and year(FDate)='",year,"' and MONTH(FDate)='",MONTH,"'")
  res=tsda::sql_update2(token = dmstoken,sql_str  = sql)
  return(res)
}



#' 清空返利数量数据数据_管理口径
#'
#' @param dmstoken
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' fanliQty_mngr_delete()
fanliQty_mngr_delete<- function(dmstoken) {

  sql=paste0("
TRUNCATE TABLE rds_dms_t_res_rebate_qty_mngr")
  res=tsda::sql_delete2(token = dmstoken,sql_str  = sql)
  return(res)
}


#' 按月查询计算返利数量表_管理口径
#'
#' @param dmstoken
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' fanliQty_mngr_selectBydata()
fanliQty_mngr_selectBydata<- function(dmstoken,year,MONTH) {

  sql=paste0("
select
FDate as 日期,
FSaleOrgName as 销售组织,
FSaleGroupName as 销售组,
FSaleManName as 销售员,
FCustomerNumber as 客户编码,
FCustomerName as 客户,
FSettleCurrencyName as 结算币别,
FExchangeRate as 汇率,
FMaterialNumber as 物料编码,
FMaterialName as 物料名称,
FIndustryName as 行业,
FBillNo as 单据编号,
FBillStatus as 单据状态,
FBillType as 单据类型,
FStockUnitName as 库存单位,
FRealQty as 实发数量,
Fprice as 单价,
FTaxPrice as 含税单价,
FTaxAmount as 税额,
Famount as 金额,
FAllAmount as 价税合计,
Famount_LC as 金额_本位币,
FAllAmount_LC as 价税合计_本位币,
FIsFree as 是否赠品,
FIsRebate as 是否返利,
FRebateRate as 利率_百分比,
FRebateQty as 返利数量,
Fprice_LC as 单价_本位币,
FRebateAmount as 返利金额
from rds_dms_t_res_rebate_qty_mngr
             where year(FDate)='",year,"' and MONTH(FDate)='",MONTH,"'")
  res=tsda::sql_select2(token = dmstoken,sql = sql)
  return(res)
}

#' 按月删除返利数量数据数据_管理口径
#'
#' @param dmstoken
#' @param year
#' @param MONTH
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' fanliQty_mngr_deleteBydate()
fanliQty_mngr_deleteBydate<- function(dmstoken,year,MONTH) {

  sql=paste0("delete from rds_dms_t_res_rebate_qty_mngr
             where year(FDate)='",year,"' and MONTH(FDate)='",MONTH,"'")
  res=tsda::sql_delete2(token = dmstoken,sql_str  = sql)
  return(res)
}






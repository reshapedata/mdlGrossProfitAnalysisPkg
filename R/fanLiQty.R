
#' 查询返利数量表
#'
#' @param dmstoken
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' rebate_detailQty_actual_select()
rebate_detailQty_actual_select<- function(dmstoken) {

  sql=paste0("
select
FArraiveGoodsDate as 到货日期,
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
from rds_dms_t_res_rebate_qty")
  res=tsda::sql_select2(token = dmstoken,sql = sql)
  return(res)
}



#' 按月插入返利数量数据数据
#'
#' @param dmstoken
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' rebate_detailQty_actual_insert()
rebate_detailQty_actual_insert<- function(dmstoken,year,MONTH) {

  sql=paste0("insert into  rds_dms_t_res_rebate_qty
select a.FArraiveGoodsDate as FArraiveGoodsDate,
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
 from rds_dms_vw_sal_outStock_all a
left join rds_t_rule_fanLiQty  b
on b.FCustomerName=a.FCustomerName
where   a.FIsFree = '否'and a.FIsRebate='否'
and abs(a.FsumRealQty)/1000>=b.FStartRealQty
and abs(a.FsumRealQty)/1000 < b.FEndRealQty
and a.FArraiveGoodsDate >= b.FEffectDate
and a.FArraiveGoodsDate <= b.FExpireDate
and(b.FIndexType='所有产品' or b.FIndexType =a.FMaterialName)
and year(FArraiveGoodsDate)='",year,"' and MONTH(FArraiveGoodsDate)='",MONTH,"'")
  res=tsda::sql_update2(token = dmstoken,sql_str  = sql)
  return(res)
}



#' 清空返利数量数据数据
#'
#' @param dmstoken
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' rebate_detailQty_actual_delete()
rebate_detailQty_actual_delete<- function(dmstoken) {

  sql=paste0("
TRUNCATE TABLE rds_dms_t_res_rebate_qty")
  res=tsda::sql_delete2(token = dmstoken,sql_str  = sql)
  return(res)
}


#' 按月查询返利数量表
#'
#' @param dmstoken
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' rebate_detailQty_actual_selectBydata()
rebate_detailQty_actual_selectBydata<- function(dmstoken,year,MONTH) {

  sql=paste0("
select
FArraiveGoodsDate as 到货日期,
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
from rds_dms_t_res_rebate_qty
             where year(FArraiveGoodsDate)='",year,"' and MONTH(FArraiveGoodsDate)='",MONTH,"'")
  res=tsda::sql_select2(token = dmstoken,sql = sql)
  return(res)
}

#' 按月删除返利数量数据数据
#'
#' @param dmstoken
#' @param year
#' @param MONTH
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' rebate_detailQty_actual_deleteBydate()
rebate_detailQty_actual_deleteBydate<- function(dmstoken,year,MONTH) {

  sql=paste0("delete from rds_dms_t_res_rebate_qty
             where year(FArraiveGoodsDate)='",year,"' and MONTH(FArraiveGoodsDate)='",MONTH,"'")
  res=tsda::sql_delete2(token = dmstoken,sql_str  = sql)
  return(res)
}






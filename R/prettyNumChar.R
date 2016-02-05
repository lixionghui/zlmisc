

# 将数值输出为格式化的字符串
# 三个功能：
# 小于 1，用百分符号表示，先乘以 100 ，再保留小数点后两位有效数字
# 大于 1，用千分位符号表示
# NA 用空字符串表示

# 应用场景
# 输出格式化的文本阅读或者程序调用
# 用在 ddplyr::mutate_each 可以批量处理多列数据

prettyNumChar <- function(x) {
  
  pct_index <- which(x < 1) # 小于1的数值转为百分数，先找到元素所在的位置（索引）
  na_index <- which(is.na(x)) # NA转化为空字符串，先找到元素所在的位置（索引）
  
  x[pct_index] <- x[pct_index] * 100
  
  x <- round(x, digits = 2)
  x <- prettyNum(x, big.mark = ",") # 数值转化为千分位符号
  x[na_index] <- ""
  x[pct_index] <- paste0(x[pct_index],"%")
  return(x)
  
}
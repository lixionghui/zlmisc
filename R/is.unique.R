#### 判断一个数据框是否有重复记录（是否唯一） ####

# 如果只是针对数据框中的某几列是否唯一，可以先使用 dplyr::select 来筛选列


is.unique <- function(x) {
  return(nrow(unique(x)) == nrow(x))
}

# 应用场景

## tiydr::spread 要求非 value 的剩余列，其值要唯一，否则返回错误
#### Error: Duplicate identifiers for rows (x, y)
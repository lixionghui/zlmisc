#### 函数：提取床型大小数值  ####

# 从去哪儿网爬到的床型数据是文本，提取其中的床型长度

  # x <- "1张大床1.8m和1张单人床1m和1.4米和m及米"
  # x <- "大床"
  # x <- ""

fethc_bed_size <- function(x) {
 
  
  result <- x %>% 
    str_extract_all("\\d+(m|米)|\\d+\\.\\d+(m|米)") %>%
    unlist() %>%
    str_replace_all("m|米", "") %>% 
    as.numeric() %>% 
    format(nsmall = 2) %>%
    str_c(collapse = ",")
  
  return(ifelse(length(result) != 0, result, NA)) #结果为空的情况返回NA，也可以替换为""
  
}
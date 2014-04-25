source("../run_analysis.R")
setwd("../")
context("MergeSets")

test_that("MergeSets returns the merged test and train data frames", {
    test <- GetData("test")
    train <- GetData("train")
    data <- MergeSets(test,train)
    
    expect_is(data,"data.frame")
    expect_equal(dim(data),c(2947+7352,561))
})
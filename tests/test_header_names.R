source("../run_analysis.R")
setwd("../")

context("HeaderNames")

test_that("HeaderNames returns the expected character vector", {
    test <- GetData("test")
    train <- GetData("train")
    data <- MergeSets(test,train)
    filtered.data <- FilterData(data)
    h <- HeaderNames(names(filtered.data))
    expect_is(h,"character")
    expect_equal(length(h),66)
})

context("TidyName")

test_that("TidyName returns expected string", {
    expect_equal(TidyName("fBodyAcc-mean()-X"),"fbodyaccmeanx")
    expect_equal(TidyName("tBodyAccJerkMag-std()"),"tbodyaccjerkmagstd")
})

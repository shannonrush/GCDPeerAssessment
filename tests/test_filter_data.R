source("../run_analysis.R")
setwd("../")

context("FilterData")

test_that("FilterData returns the expected data frame", {
    test <- GetData("test")
    train <- GetData("train")
    data <- MergeSets(test,train)
    filtered.data <- FilterData(data)
    expect_is(filtered.data,"data.frame")
    expect_equal(dim(filtered.data),c(10299,66))
})

context("CheckFeature")

test_that("CheckFeature returns TRUE if the feature contains substring '-mean()' in middle of string", {
    feature <- c("","tBodyAcc-mean()-X")
    expect_true(CheckFeature(feature))
})

test_that("CheckFeature returns TRUE if the feature contains substring '-std()' in middle of string", {
    feature <- c("","tBodyAcc-std()-X")
    expect_true(CheckFeature(feature))
})

test_that("CheckFeature returns TRUE if the feature contains substring '-mean()' at end of string", {
    feature <- c("","tBodyAcc-mean()")
    expect_true(CheckFeature(feature))
})

test_that("CheckFeature returns TRUE if the feature contains substring '-std()' at end of string", {
    feature <- c("","tBodyAcc-std()")
    expect_true(CheckFeature(feature))
})

test_that("CheckFeature returns FALSE if the feature does not contain substring '-mean()' or -std()", {
    feature <- c("","tBodyAcc-sum()-X")
    expect_false(CheckFeature(feature))
})

test_that("CheckFeature returns FALSE if not exact substring match", {
    feature <- c("","fBodyBodyGyroJerkMag-meanFreq()")
    expect_false(CheckFeature(feature))
})

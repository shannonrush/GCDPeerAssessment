source("../run_analysis.R")
setwd("../")
context("GetData")

test_that("GetData returns NULL and produces warning if inappropriate string passed in", {
    expect_equal(GetData("wrong"),NULL)
    expect_warning(GetData("wrong"),"GetData accepts only 'test' or 'train'")
})

test_that("GetData returns expected data frame for 'test'", {
    test <- GetData("test")
    expect_is(test,"data.frame")
    expect_equal(dim(test),c(2947,561))
})

test_that("GetData returns expected data frame for 'train'", {
    train <- GetData("train")
    expect_is(train,"data.frame")
    expect_equal(dim(train),c(7352,561))
})

test_that("GetData returns NULL and produces warning if file not found", {
    setwd("tests")
    expect_equal(GetData("test"),NULL)
    expect_warning(GetData("test"),"File not found. Please ensure UCI HAR Dataset is in working directory.")
})
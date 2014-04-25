source("../run_analysis.R")
setwd("../")

context("GetActivity")

test_that("GetActivity returns the expected data frame", {
    a <- GetActivity()
    expect_is(a,"data.frame")
    expect_equal(dim(a),c(10299,1))
    expect_equal(names(a),"activity")
})

context("UpdateValue")

test_that("UpdateValue returns the expected string value", {
    expect_equal(UpdateValue(1),"walking")
    expect_equal(UpdateValue(2),"walking upstairs")
    expect_equal(UpdateValue(3),"walking downstairs")
    expect_equal(UpdateValue(4),"sitting")
    expect_equal(UpdateValue(5),"standing")
    expect_equal(UpdateValue(6),"laying")
})
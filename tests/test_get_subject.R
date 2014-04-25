source("../run_analysis.R")
setwd("../")

context("GetSubject")

test_that("GetSubject returns the expected data frame", {
    s <- GetSubject()
    expect_is(s,"data.frame")
    expect_equal(dim(s),c(10299,1))
    expect_equal(names(s),"subject")
})
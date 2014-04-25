source("../run_analysis.R")
setwd("../")

context("RunAnalysis")

test_that("RunAnalysis returns the expected txt file", {
    RunAnalysis()
    expect_true(file.exists("averaged_data.txt"))
    data <- read.table("averaged_data.txt")
    expect_is(data,"data.frame")
    expect_equal(dim(data),c(180,68))
})
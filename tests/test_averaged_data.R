source("../run_analysis.R")
setwd("../")

context("AveragedData")

test_that("AveragedData returns the expected data frame", {
    test <- GetData("test")
    train <- GetData("train")
    merged <- MergeSets(test,train)
    filtered.data <- FilterData(merged)
    names(filtered.data) <- HeaderNames(names(filtered.data))
    with.activity <- cbind(GetActivity(),filtered.data)
    with.subject <- cbind(GetSubject(),with.activity)
    averaged.data <- AveragedData(with.subject)
    expect_is(averaged.data,"data.frame")
    expect_equal(dim(averaged.data),c(180,68))
    test_case <- subset(with.subject,activity=="laying" & subject==1)$tbodyaccmeanx
    expect_equal(mean(test_case),subset(averaged.data,activity=="laying" & subject==1)$tbodyaccmeanx)
})
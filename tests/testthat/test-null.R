context("Testing null results")

test_that("No results throws error", {
  expect_error(find_location("asdfasdfasdfasdfasdfasdfasdf"))
})

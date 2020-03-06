data("my_iris")
data("my_gapminder")
test_that("my_rf_cv works properly", {
  expect_is(my_rf_cv(k = 5), "numeric")
  expect_is(my_rf_cv(k = 2), "numeric")
})

test_that("my_rf_cv breaks", {
  expect_error(my_rf_cv())
  expect_error(my_rf_cv(my_iris))
})


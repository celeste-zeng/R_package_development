# within test-my_t_test.R
test_that("my_t_test outputs a list", {
  expect_is(my_t_test(c(1, 2, 3, 4, 5), mu = 3, alternative = "greater"), "list")
})

test_that("my_t_test outputs a list", {
  expect_is(my_t_test(c(1, 2, 3, 4, 5), mu = 3, alternative = "less"), "list")
})

test_that("my_t_test outputs a list", {
  expect_is(my_t_test(c(1, 2, 3, 4, 5), mu = 3, alternative = "two.sided"), "list")
})

test_that("the alternative is one of greater, less, and two.sided", {
  expect_error(my_t_test(c(1, 2, 3, 4, 5), mu = 3, alternative = "test"))
})

# within test-my_lm.R
data("my_gapminder")
test_that("my_lm outputs a table", {
  expect_is(my_lm(my_fml = pop ~ gdpPercap, my_data = my_gapminder), "table")
})
test_that("my_fml should be a formula class object", {
  expect_error(my_lm(1, my_data = my_gapminder))
})

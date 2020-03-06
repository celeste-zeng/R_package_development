data("my_iris")
data("my_gapminder")
test_that("my_knn_cv works properly", {
  expect_is(my_knn_cv(train = my_iris[, -5], cl = my_iris$Species, k_nn = 5, k_cv = 5), "list")
  expect_is(my_knn_cv(train = my_gapminder[, 3 : 4], cl = my_gapminder$continent, k_nn = 5, k_cv = 5), "list")
})

test_that("my_knn_cv breaks", {
  expect_error(my_knn_cv(train = my_gapminder$continent, k_nn = 5, k_cv = 5))
  expect_error(my_knn_cv(my_iris))
})

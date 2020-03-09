#' Random Forest Cross-Validation Function
#'
#' This function performs a Random Forest Cross-Validation in R
#'
#' @param k number of folds
#'
#' @keywords inference
#'
#' @return a numeric with the cross-validation error;
#'
#' @examples
#' my_rf_cv(k = 5)
#'
#' @import randomForest
#'
#' @export
my_rf_cv <- function(k) {
  train <- my_gapminder
  folds <- sample(rep(1:k, length = nrow(train)))
  MSE <- rep(NA, k)
  for (i in 1:k) {
    # define training data as all the data not in the ith fold
    data_train <- train[folds != i, ]
    data_test <- train[folds == i, ]
    # train a random forest model with 100 trees
    my_model <- randomForest(lifeExp ~ gdpPercap, data = data_train, ntree = 50)
    # Record predictions
    prediction <- predict(my_model, data_test[, -1])
    # calculate the MSE
    MSE[i] <- mean((data_test$lifeExp - prediction)^2)
  }
  # Compute average MSE to get CV error
  cv_err <- mean(MSE)
  return(cv_err)
}

#' K-Nearest Neighbors Cross-Validation Function
#'
#'  This function performs a k-Nearest Neighbors Cross-Validation in R
#'
#'  @param train Input data frame to be validated
#'  @param cl true class value of the training data
#'  @param k_nn integer representing the number of neighbors
#'  @param k_cv integer representing the number of folds
#'
#'  @return a list with objects, which has class: a vector of the predicted class Y_i for all observations,
#'  and cv_err: a numeric with the cross-validation misclassification error;
#'
#'  @examples
#'  my_knn_cv(train = my_iris[, -5], cl = my_iris$Species, k_nn = 5, k_cv = 5)
#'
#'  @import class
#'
#'  @export


my_knn_cv <- function(train, cl, k_nn, k_cv) {
  folds <- sample(rep(1 : k_cv, length = nrow(train)))
  err <- c()
  for (i in 1 : k_cv) {
    data_train <- train[folds != i, ] #X_i
    data_test <-  train[folds == i, ] #X_i*
    cl_train <- cl[folds != i] #Y_idebug
    cl_test <-  cl[folds == i] #Y_i*
    knn_output <- knn(train = data_train, cl = cl_train, test  = data_test, k = k_nn) #Y_i*^
    err[i] <- sum(knn_output != cl_test) / length(cl_test)
  }
  my_class <- knn(train = train, cl = cl, test  = train, k = k_nn)
  cv_err <- mean(err)
  output <- list("class" = my_class, "cv_err" = cv_err)
  return(output)
}


#' Linear model function
#'
#' This function fits a linear model.
#'
#' @param my_fml 'formula' class object.
#' @param my_data Input data frame.
#'
#' @keywords prediction
#'
#' @return A table of coeffiencts for the linear regression, which contains `Estimate`, `Std. Error`, `t value`, and `Pr(>|t|)`.
#'
#' @examples
#' data(my_gapminder)
#' my_lm(my_fml = pop ~ gdpPercap, my_data = my_gapminder)
#'
#' @import stats
#'
#' @export
my_lm <- function(my_fml, my_data) {
  # extracts the model matrix x
  x <- model.matrix(my_fml, my_data)

  # extract a model form object
  my_frame <- model.frame(my_fml, my_data)

  # extract the model response y
  y <- model.response(my_frame)

  # solves for linear regression coefficients
  my_coef <- solve(t(x) %*% x) %*% t(x) %*% y

  # calculates the degrees of freedom
  df2 <- nrow(x) - ncol(x)

  #  estimates the $\sigma^2$
  my_var <- sum((y - x %*% my_coef) ^ 2 / df2)

  # estimates the standard error for coefficients
  my_se <- sqrt(diag(my_var * solve(t(x) %*% x)))

  # calulates the t value using the coefficients, mu = 0, and standard error
  t_val <- my_coef / my_se

  # gets the area under the curve for a t-distribution.
  # multiplies the value by 2 to get the two-sided test output
  p_val <- pt(abs(t_val), df2, lower.tail = FALSE) * 2

  # organize the results in a table
  result <- cbind(my_coef, my_se, t_val, p_val)
  colnames(result) <- c("Estimate", "Std. Error", "t value", "Pr(>|t|)")
  return(as.table(result))
}

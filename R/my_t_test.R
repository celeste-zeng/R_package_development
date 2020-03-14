#' t-test function
#'
#' This function performs a one sample t-test.
#'
#' @param x Numeric vector of data to be tested.
#' @param alternative Charater string specifying the alternative hypothesis. It is one of "two.sided", "less", or "greater".
#' @param mu Numeric input indicating the null hypothesis value of the mean.
#' @keywords Inferential Statistic
#'
#' @return A List of test_stat (the numeric test statistic), df (degrees of freedom),  p_value (the numeric p-value),  and alternative (the value of the parameter alternative).
#'
#' @examples
#' my_t_test(rnorm(100, mean = 0, sd = 1), mu = 0, alternative = "less")
#' my_t_test(c(1, 2, 3, 4, 5), mu = 3, alternative = "greater")
#'
#' @import stats
#'
#' @export
my_t_test <- function(x, alternative, mu) {

  # checks if alternative hypothesis is one of "two.sided", "less", or "greater"
  if (!alternative %in% c("two.sided", "less", "greater")) {
    stop("The alternative must be two.sided, less, or greater")
  } else {
    size <- length(x)

    # gets the standard error in a one sample t-test
    se <- sd(x) / sqrt(size)

    # calculates the mean, test statistics and degrees of freedom
    my_mean <- mean(x)
    test_stat <- (my_mean - mu) / se
    df <- size - 1

    # gets the area under the curve for a t-distribution
    my_p <- pt(abs(test_stat), df, lower.tail = FALSE)
    if (alternative == "greater") {
      p_val <- 1 - my_p
    } else if (alternative == "less") {
      p_val <- my_p
    } else {
      p_val <- my_p * 2
    }
    output <- list("test_stat" = test_stat,
                   "df" = df,
                   "p_value" = p_val,
                   "alternative" = alternative)
    return(output)
  }
}

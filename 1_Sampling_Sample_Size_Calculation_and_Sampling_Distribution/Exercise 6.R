## Confidence interval method: One-sample proportion
# Suppose we want to estimate the proportion of recipes in a new cookbook that do not include any animal products.
# Write a function in R to calculate the SRS sample size required to attain a desired margin of error at a required
# confidence level for any population size. The function must give the calculated sample size when we ignore the
# finite population correction and when we incorporate the finite population correction. Use the function to
# determine the two different sample sizes for an SRS from the N = 1251 recipes such that the margin of error is
# 0.03 with 95% confidence.
srs_sample_size <- function (p, error_margin, alpha, N, FPC) {
  n_0 <- p*(1-p)*(qnorm(1-alpha/2)/error_margin)^2

  if (FPC==TRUE) {
    n <- ceiling(n_0/(1+(n_0/N)))
    FPC_Comment <- "With FPC"
  } else {
    n <- ceiling(n_0)
    FPC_Comment <- "Without FPC"
  }

  print.noquote(c(FPC_Comment, n)) # print the output without quotes
}

srs_sample_size(p=0.5,alpha=0.05,error_margin=0.03,N=1251,FPC=FALSE)
srs_sample_size(p=0.5,alpha=0.05,error_margin=0.03,N=1251,FPC=TRUE)




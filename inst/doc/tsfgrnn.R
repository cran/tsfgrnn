## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(tsfgrnn)
pred <- grnn_forecasting(UKgas, h = 4)
pred$prediction

## ---- fig.width=6--------------------------------------------------------
plot(pred)

## ---- fig.width=6--------------------------------------------------------
library(ggplot2)
autoplot(pred)

## ------------------------------------------------------------------------
pred <- grnn_forecasting(timeS = 1:10, h = 2, lags = c(1, 3), msas = "MIMO", scale = FALSE)
grnn_examples(pred)

## ------------------------------------------------------------------------
grnn_weights(pred)

## ------------------------------------------------------------------------
summary(pred)

## ---- fig.width=6--------------------------------------------------------
library(ggplot2)
plot_example(pred, 1)

## ---- fig.width=6--------------------------------------------------------
plot_example(pred, 4)

## ---- fig.width=6--------------------------------------------------------
predr <- grnn_forecasting(1:10, h = 2, lags = c(1, 3), msas = "recursive", scale = FALSE)
predr$prediction
plot(predr)


## ------------------------------------------------------------------------
grnn_examples(predr)

## ---- fig.width=6--------------------------------------------------------

## ---- fig.width=6--------------------------------------------------------
plot_example(predr, position = 1, h = 1)

## ------------------------------------------------------------------------
grnn_weights(predr)[[1]]

## ---- fig.width=6--------------------------------------------------------
plot_example(predr, position = 1, h = 2)

## ------------------------------------------------------------------------
grnn_weights(predr)[[2]]

## ------------------------------------------------------------------------
pred <- grnn_forecasting(ts(1:20), h = 4, lags = 1:2)
ro <- rolling_origin(pred, h = 4)

## ------------------------------------------------------------------------
print(ro$test_sets)

## ------------------------------------------------------------------------
print(ro$predictions)

## ------------------------------------------------------------------------
print(ro$errors)

## ------------------------------------------------------------------------
ro$global_accu

## ------------------------------------------------------------------------
ro$h_accu

## ---- fig.width=6--------------------------------------------------------
plot(ro, h = 4)

## ------------------------------------------------------------------------
ro <- rolling_origin(pred, h = 4, rolling = FALSE)
print(ro$test_sets)
print(ro$predictions)

## ---- fig.width=6--------------------------------------------------------
pred <- grnn_forecasting(USAccDeaths, h = 12, lags = 1:12, sigma = 100)
plot(pred)

## ---- fig.width=6--------------------------------------------------------
pred <- grnn_forecasting(USAccDeaths, h = 12, lags = 1:12, sigma = 0.05)
plot(pred)

## ------------------------------------------------------------------------
set.seed(5)
timeS <- ts(1:10 + rnorm(10, 0, .2))
prep_timeS <- diff(timeS)
pred <- grnn_forecasting(prep_timeS, h = 3)
prediction <- ts(cumsum(c(tail(timeS, 1), pred$prediction)), 
                 start = start(pred$prediction))
plot(c(timeS, prediction), type = "n")
lines(timeS, type = "o", pch = 20, col = "black")
lines(prediction, type = "o", pch = 20, col = "red")


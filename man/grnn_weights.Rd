% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/forecasting.R
\name{grnn_weights}
\alias{grnn_weights}
\title{Training examples and their corresponding weights used in a prediction}
\usage{
grnn_weights(forecast)
}
\arguments{
\item{forecast}{A \code{grnnForecast} object.}
}
\value{
A list including the input vectors used in GRNN regression and the
training examples, with their weights, used in the prediction.
}
\description{
It shows the input vector and the weights of the training examples used in a
prediction associated with a "grnnForecast" object.
}
\examples{
pred <- grnn_forecasting(UKgas, h = 4, lags = 1:4, msas = "MIMO")
grnn_weights(pred)
}

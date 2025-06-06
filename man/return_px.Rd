% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/px.R
\name{return_px}
\alias{return_px}
\title{Return px object}
\usage{
return_px(x, validate)
}
\arguments{
\item{validate}{Optional. If TRUE a number of validation checks are performed on the px object, and an error is thrown if the object is not valid. If FALSE, the checks are skipped, which can be usefull for large px objects where the check can be time consuming. Use \code{\link[=px_validate]{px_validate()}} to manually preform the check.}
}
\description{
Wrapper potentially validate it and return px object.
}
\keyword{internal}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/modify_table1.R
\name{px_tableid}
\alias{px_tableid}
\alias{px_tableid.px}
\title{TABLEID}
\usage{
px_tableid(x, value, validate)

\method{px_tableid}{px}(x, value, validate = TRUE)
}
\arguments{
\item{x}{A px object}

\item{value}{Optional. A character string. If missing, the current TABLEID is returned. If NULL, TABLEID is removed.}

\item{validate}{Optional. If TRUE a number of validation checks are performed on the px object, and an error is thrown if the object is not valid. If FALSE, the checks are skipped, which can be usefull for large px objects where the check can be time consuming. Use \code{\link[=px_validate]{px_validate()}} to manually preform the check.}
}
\value{
A px object or a character string.
}
\description{
Inspect or change TABLEID.
}
\examples{
# Set TABLEID
x1 <-
   px(population_gl) |>
   px_tableid('POPGL')

# Print TABLEID
px_tableid(x1)

# Remove TABLEID
x2 <- px_tableid(x1, NULL)
px_tableid(x2)
}
\seealso{
\href{https://www.scb.se/globalassets/vara-tjanster/px-programmen/px-file_format_specification_2013.pdf#\%5B\%7B\%22num\%22\%3A54\%2C\%22gen\%22\%3A0\%7D\%2C\%7B\%22name\%22\%3A\%22XYZ\%22\%7D\%2C184\%2C280\%2C0\%5D}{Statistics Sweden's documentation}
}

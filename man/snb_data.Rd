% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/snb.R
\name{snb_data}
\alias{snb_data}
\title{Returns Swiss National Bank (SNB) data for a given id}
\source{
\url{https://data.snb.ch/en}
}
\usage{
snb_data(id, start_date = NULL, end_date = NULL, lang = c("en", "de"))
}
\arguments{
\item{id}{(\code{character(1)}) id of the time series.}

\item{start_date}{(\code{character(1)} | \code{Date(1)}) start date of the time series.}

\item{end_date}{(\code{character(1)} | \code{Date(1)}) end date of the time series.}

\item{lang}{(\code{character(1)}) language to query, either \code{"en"} or \code{"de"}.
Default \code{"en"}.}
}
\value{
A \code{\link[data.table:data.table]{data.table::data.table()}} with the requested data.
}
\description{
Returns Swiss National Bank (SNB) data for a given id
}
\examples{
\dontshow{if (curl::has_internet()) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
\donttest{
snb_data("rendopar")
# or filter for date range
snb_data("rendopar", "2020-01-01", "2020-12-31")
}
\dontshow{\}) # examplesIf}
}
\seealso{
Other data: 
\code{\link{bbk_data}()},
\code{\link{bbk_series}()},
\code{\link{boe_data}()},
\code{\link{ecb_data}()}
}
\concept{data}

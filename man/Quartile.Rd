% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Quartile.r
\encoding{UTF8}
\name{Quartile}
\alias{Quartile}
\title{Detection of outliers using quartiles and by comparing with other data in same or previous period.}
\usage{
Quartile(
  data,
  id,
  x1,
  y1,
  x2 = NULL,
  y2 = NULL,
  strataName = NULL,
  pKL = 1.5,
  pKU = 1.5
)
}
\arguments{
\item{data}{Input of Quartile is a data set of class data.frame.}

\item{id}{Name of the identification variable.}

\item{x1}{Name of x variable in period t.}

\item{y1}{Name of y variable in period t.}

\item{x2}{Name of x variable in period t-1. Optional}

\item{y2}{Name of y variable in period t-1. Optional}

\item{strataName}{Name of the stratification variable. Optional}

\item{pKL}{Parameter for lower limit.}

\item{pKU}{Parameter for upper limit.}
}
\value{
Output of Quartile is a data set of class data.frame. Only units with both x1 and y1 not missing
and greater than zero are included. The variables are:
   \item{id}{The input identification variable}
   \item{x1}{The input x1 variable}
   \item{y1}{The input y1 variable}
   \item{x2}{The input x2 variable}
   \item{y2}{The input y2 variable}
   \item{ratio}{The ratio between x1 and y1}
   \item{ratio2}{The ratio between x2 and y2}
   \item{ratioAll}{The ratio between the sum of x1 and the sum of y1 aggregated over the whole data set}
   \item{ratioAll2}{The ratio between the sum of x2 and the sum of y2 aggregated over the whole data set}
   \item{ratioStr}{The ratio between the sum of x1 and the sum of y1 aggregated over the stratum}
   \item{ratioStr2}{The ratio between the sum of x2 and the sum of y2 aggregated over the stratum}
   \item{lowerLimit}{The lower limit of the ratio}
   \item{upperLimit}{The upper limit of the ratio}
   \item{outlier}{A binary variable indicating whether the observation is outside the limits [q1 - pKL*(M - q1), q3 + pKU*(q3 - M)]},
   where M is the median and q1 and q3 the 1st an 3rd quartile respectively.
   \item{strata}{Strata name or number}
   \item{ranking}{The rank of ratio. For plotting purposes}
}
\description{
Detection of outliers using quartiles and by comparing with other data in same or previous period.
}
\examples{
 minedata <- KostraData("testdata")
 minedata$strata <- as.character(c(rep(1, 61), rep(2, 91), rep(3, 98), rep(4, 81), rep(5, 85)))
 Quartile(data = minedata, id = "Region", x1 = "areal_130_eier_2015", y1 = "areal_130_leier_2015", pKL = 2, pKU = 2)
 Quartile(data = minedata, id = "Region", x1 = "areal_130_eier_2015", y1 = "areal_130_leier_2015", strataName = "strata")
 Quartile(data = minedata, id = "Region", x1 = "areal_130_eier_2015", y1 = "areal_130_leier_2015",
          x2 = "areal_130_eier_2014", y2 = "areal_130_leier_2014", strataName = "strata")
}
\references{
Datarevisjon: Kontroll, granskning og retting av data. Anbefalt praksis,
   Statistisk sentralbyrås håndbøker, 2005/84.
}
\author{
Magnar Lillegård
}

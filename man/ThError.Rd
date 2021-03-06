% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ThError.R
\encoding{UTF8}
\name{ThError}
\alias{ThError}
\title{Detection of 1000-error}
\usage{
ThError(data, id, x1, x2, ll = -2.5, ul = 2.5)
}
\arguments{
\item{data}{Input data set of class data.frame.}

\item{id}{Name of identification variable.}

\item{x1}{Name of variable in period t.}

\item{x2}{Name of variable in period t-1.}

\item{ll}{Lower limit of log10(x1/x2) = log10(x1) - log10(x2). Default -2.5}

\item{ul}{Upper limit of log10(x1/x2) = log10(x1) - log10(x2). Default +2.5}
}
\value{
Output of ThError is a data set of class data.frame. Thousand Error is only checked if 
both x1 and x2 are not missing and not zero. The variables are:
   \item{id}{The input identification variable. }
   \item{x1}{The input x1 variable}
   \item{x2}{The input x2 variable}
   \item{outlier}{A binary (1/0) variable indicating whether the we suspect a 1000 error or not}
   \item{diffLog10}{The difference log10(x1) - log10(x2)}
   \item{lowerLimit}{The input parameter ll}
   \item{upperLimit}{The input parameter ul}
}
\description{
Detects units with possible 1000-error by comparing values in period t
with revised values from period t-1
}
\examples{
 minedata <- KostraData("testdata")
 minedata$areal_381_eier_2015[c(1, 4, 5)] <- 1000 * minedata$areal_381_eier_2015[c(1, 4, 5)]
 ThError(data = minedata, id = "Region", x1 = "areal_381_eier_2015", x2 = "areal_381_eier_2014")
 ThError(data = minedata, id = "Region", x1 = "areal_381_eier_2015", x2 = "areal_381_eier_2014",
         ll = -2, ul = 2)

}
\references{
Datarevisjon: Kontroll, granskning og retting av data. Anbefalt praksis,
   Statistisk sentralbyrås håndbøker, 2005/84.
}
\author{
Magnar Lillegård
}

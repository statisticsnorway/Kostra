% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Hb.R
\encoding{UTF8}
\name{Hb}
\alias{Hb}
\title{Detection of outliers using the Hidiroglou-Berthelot (HB) method}
\usage{
Hb(data, id, x1, x2, pU = 0.5, pA = 0.05, pC = 20, strataName = NULL)
}
\arguments{
\item{data}{Input of Hb is a data set of class data.frame.}

\item{id}{Name of an identification variable.}

\item{x1}{Name of variable in period t.}

\item{x2}{Name of variable in period t-1.}

\item{pU}{Parameter that adjusts for different level of the variables.Default value 0.5.}

\item{pA}{Parameter that adjusts for small differences between the median and the 1st or 3rd quartile. Default value 0.05.}

\item{pC}{Parameter that controls the length of the confidence interval.Default value 20.}

\item{strataName}{Name of stratification variable. Optional. If strataName is given, the HB method is performed within each stratum.}
}
\value{
Output of Hb is a data set of class data.frame. All units are returned, but the HB method is only performed on the data set
where units with both x1 and x2 not missing and greater than zero are included. In this data set, units with x1 = x2 are included in
the HB method only if they cover less than 50 per cent of the number of units in the stratum.
The output variables are:
   \item{id}{The input identification variable}
   \item{x1}{The input x1 variable}
   \item{x2}{The input x2 variable}
   \item{maxX}{The maximum of x1 and x2}
   \item{ratio}{The ratio between x1 and x2}
   \item{lowerLimit}{The lower limit of the ratio}
   \item{upperLimit}{The upper limit of the ratio}
   \item{medRatio}{The median ratio}
   \item{outlier}{A binary variable indicating whether the observation is an outlier (1) or not (0)}
   \item{strata}{Strata name or number}
}
\description{
Detects possible outliers of a variable in period t
by comparing it with revised values from period t-1
}
\examples{
 minedata <- KostraData("testdata")
 minedata$strata <- as.character(c(rep(1, 61), rep(2, 91), rep(3, 98), rep(4, 81), rep(5, 85)))
 Hb(data = minedata, id = "Region", x1 = "areal_381_eier_2015", x2 = "areal_381_eier_2014")
 Hb(data = minedata, id = "Region", x1 = "areal_381_eier_2015", x2 = "areal_381_eier_2014",
    strataName = "strata")
 Hb(data = minedata, id = "Region", x1 = "areal_381_eier_2015", x2 = "areal_381_eier_2014",
    pA = 0.1, strataName = "strata")

}
\references{
Datarevisjon: Kontroll, granskning og retting av data. Anbefalt praksis,
   Statistisk sentralbyrås håndbøker, 2005/84.
}
\author{
Magnar Lillegård
}

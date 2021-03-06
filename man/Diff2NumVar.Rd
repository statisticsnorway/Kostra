% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Diff2NumVar.R
\encoding{UTF8}
\name{Diff2NumVar}
\alias{Diff2NumVar}
\title{Difference between two numerical variables}
\usage{
Diff2NumVar(
  data,
  idVar,
  xVar,
  yVar,
  strataVar = NULL,
  antall = 5,
  grense = NULL,
  zVar = NULL,
  kommentarVar = NULL
)
}
\arguments{
\item{data}{Input data set of class data.frame.}

\item{idVar}{Name of an identification variable.}

\item{xVar}{Name of the x variable to be compared.}

\item{yVar}{Name of the y variable to be compared.}

\item{strataVar}{Name of stratification variable. Optional. If strataVar is given, the calculation and listing is
performed within each stratum.}

\item{antall}{Parameter specifying how many units with the biggest difference to be listed. Default 5.}

\item{grense}{Parameter specifying a threshold for the units to be listed. This parameter overrules antall. Optional.}

\item{zVar}{Name of the original y variable, before editing. Optional.}

\item{kommentarVar}{Name of a variable giving information about the editing. Optional.}
}
\value{
Output of Diff2NumVar is a data set of class data.frame. The variables in the data frame are:
   \item{strata}{The stratum (if strataVar is given, "1" otherwise)}
   \item{id}{The input identification variable}
   \item{x}{The input x variable}
   \item{y}{The input y variable}
   \item{Forh}{The ratio between x and y: y / x}
   \item{Diff}{The difference between x and y: y - x}
   \item{AbsDiff}{The absolute difference: |Diff|}
   \item{DiffProsAvx}{The difference in percent of x: (Diff / x) * 100}
   \item{DiffProsAvSumx}{The difference in percent of the stratum total for x: (Diff / stratum x) * 100}
   \item{DiffProsAvTotx}{The difference in percent of the total for x: (Diff / total x) * 100}
   \item{SumDiffProsAvSumx}{The stratum difference in percent of the stratum total for x: ((stratum y - stratum x) / stratum x) * 100}
   \item{SumDiffProsAvTotx}{The stratum difference in percent of the total for x: ((stratum y - stratum x) / total x) * 100}
   \item{z}{The input z variable}
   \item{EdEndring}{The difference between z and y: y - z}
   \item{Kommentar}{The input kommentar variable}
}
\description{
Calculating the difference between two numerical variables
Listing units with big difference, either the k units with the biggest absolute difference, or units with a absolute
difference greater than a threshold
Only units with value on both variables are used in the calculations
}
\examples{
testdata <- KostraData("testdata")

# lager en grupperingsvariabel
testdata$gr <- c(rep(3, 30), rep(5, 40), rep(1, 61), rep(2, 91), rep(3, 68), rep(4, 61),
                 rep(5, 45),  rep(4, 20))

# lager en z-variabel
testdata$z <- testdata$areal_130_eier_2015
testdata$z[4*(1:104)] <- testdata$areal_130_eier_2014[2*(1:104)]
testdata$z[10*(1:40)] <- 1.2 * testdata$areal_130_eier_2015[10*(1:40)]
testdata$z[10*(1:40) - 5] <- 0.7 * testdata$areal_130_eier_2015[10*(1:40) - 5]

# lager en kommentarvariabel
testdata$kommentar <- ifelse(testdata$areal_130_eier_2015 == testdata$z, "ikke kontrollert",
                            "godkjent")
testdata$kommentar[c(88)] <- "oppgavegiver kontaktet"

# uten strata
Diff2NumVar(data = testdata, idVar = "Region", xVar = "areal_130_eier_2014", yVar = "areal_130_eier_2015",
            strataVar = NULL, antall = 5, grense = NULL, zVar = NULL, kommentarVar = NULL)

# med strata
Diff2NumVar(data = testdata, idVar = "Region", xVar = "areal_130_eier_2014", yVar = "areal_130_eier_2015",
            strataVar = "gr", antall = 5, grense = NULL, zVar = NULL, kommentarVar = NULL)

# med z og kommentar
Diff2NumVar(data = testdata, idVar = "Region", xVar = "areal_130_eier_2014", yVar = "areal_130_eier_2015",
            strataVar = "gr", antall = 5, grense = NULL, zVar = "z", kommentarVar = "kommentar")

# med grense
Diff2NumVar(data = testdata, idVar = "Region", xVar = "areal_130_eier_2014", yVar = "areal_130_eier_2015",
            strataVar = "gr", antall = 5, grense = 5000, zVar = "z", kommentarVar = "kommentar")


}
\author{
Anna Mevik
}

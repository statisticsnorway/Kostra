% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/KostraWrappers.R
\encoding{UTF8}
\name{SimpleDiff2NumVar}
\alias{SimpleDiff2NumVar}
\title{SimpleDiff2NumVar}
\usage{
SimpleDiff2NumVar(
  data,
  idName,
  measureName,
  measureNameCompareAlt = NULL,
  periodName,
  period,
  periodCompare,
  strataName = NULL,
  antall,
  grense = NULL,
  kommentarName = NULL
)
}
\arguments{
\item{data}{Input data set of class data.frame.}

\item{idName}{Name of id-variable}

\item{measureName}{Name of the variable to edit}

\item{measureNameCompareAlt}{Name of the alternative variable to edit against}

\item{periodName}{Name of the period identification variable.}

\item{period}{value of period to edit.}

\item{periodCompare}{value of period to edit against.}

\item{strataName}{Name of starta-variable. Single strata when NULL (default)}

\item{antall}{Parameter specifying how many units with the biggest difference to be listed. Default 5.}

\item{grense}{Parameter specifying a threshold for the units to be listed. This parameter overrules antall. Optional.}

\item{kommentarName}{Name of a variable giving information about the editing. Optional.}
}
\description{
SimpleDiff2NumVar
}

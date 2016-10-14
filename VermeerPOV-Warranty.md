---
title: "VermeerPOV - Warranty"
author: "Todd Robinson"
date: "October 10, 2016"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Introduction
The machine under consideration here is the D24 X40 Series 2 - Horizontal Drill. There is fault data and there is warranty data associated with this machine. The business Objective is two-fold;
1. Determine if there are statistically signifcant correlations between warranty and fault data for this machine.
2. What is the methodology and process followed in attempting to answer #1. above.

Fault Data
These machines have controllers that collect sensor fault data from different subsystems of the horizontal drill at some time interval.
The data is aggregated at some interval and a cellular phone call is made from the controller to a Third Party Telematics company.
They aggregate the data and send a weekly extract of all machines to Vermeer.

Vermeer has uploaded into Azure BLOB storage a certain model machine with ~125 different sensor fault readings for a two year period.

The original Vermeer POV Machine Learning was done using this dataset.

Warranty Data
Vermeer also provides warranty and extended warranties on this model machine. 
Data is collected when warranty work is done on the machine.


This is a R Markdown document. It describes the steps necessary to process warranty data with Fault data. The prerequisites are;
1. R installed
2. R Studio installed
3. Access to the Warranty.csv
4. Access to the Fault.csv




When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r cars}
summary(cars)
```

## Including Plots

You can also embed plots, for example:

```{r pressure, echo=FALSE}
plot(pressure)
```

###Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.

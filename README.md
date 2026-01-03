Explanation of the Matlab functions

function f = f_mean(gma,pi2)
This function is used to estimate the mean soil moisture from two dimensionless parameters using the minimalist hydrological model (Porporato et al., The American Naturalist, 2004)
input: gma is a dimensionless parameter gamma
input: pi2 is a dimensionless parameter pi2=lambda/eta
output: f is mean soil moisture estimated from the minimalist hydrological model

function lbd = f_A2lambda(A,alpha,w0,Emax)
This function is used to estimate rainfall freqency for specified rainfall intensity and other hydroclimatic variables
input: A is advection
input: alpha is rainfall intensity (i.e., mean rainfall depth)
input: w0 is root-zone soil water capacity (=nZr(s1-sw))
input: Emax is potential evapotranspiration
output: lbd is rainfall freqency

function X = f_getMoments(filedirname)
This function gets the rainfall statistics from GHCN-D files
input: filedirname is the file direction and file name
output: X is N by 11 matrix where each column refers to the mean, variance, 10, 20, ... 90 percentiles of rainfall depth; N is the number of 15-year non-overlapping data blocks

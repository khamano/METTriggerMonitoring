#!/usr/bin/env python

"""
Fits cross-sections & rates
"""

import math
from array import array
import ROOT 
import sys

# Setup
#	k :  kurtosis printed
#	K :  kurtosis and kurtosis error printed
#	s :  skewness printed
#	S :  skewness and skewness error printed
#	i :  integral of bins printed
#	o :  number of overflows printed
#	u :  number of underflows printed
#	r :  rms printed
#	R :  rms and rms error printed
#	m :  mean value printed
#	M :  mean value mean error values printed
#	e :  number of entries printed
#	n :  name of histogram is printed

ROOT.gStyle.SetOptStat('eMRuoi')
ROOT.gStyle.SetFrameBorderMode(0) # this gets rid of the red line around the frame

#----------------------------------------------------------------------
def zipped_data_to_tcanvas():
    pass


#----------------------------------------------------------------------
def get_canvas():
    canvas = ROOT.TCanvas('canvas', 'canvas', 600, 600)
    canvas.SetFillColor(ROOT.kWhite)
    canvas.SetTickx()
    canvas.SetTicky()
    canvas.SetLeftMargin(0.12)
    canvas.SetBottomMargin(0.12)
    canvas.SetTopMargin(0.03)
    canvas.SetRightMargin(0.03)
    return canvas


#----------------------------------------------------------------------
def get_data(ttree):

    # vtos = observed counts after prescale
    # cnts = vtos / prescale-factor
    # rate = cnts / time-period
    # xsec = rate / lumi

    xdata = []
    ydata = []
    xdataerr = []
    ydataerr = []
    nentries = ttree.GetEntries()

    for ientry in xrange(nentries):

        # Load the tree
        ttree.GetEntry(ientry)

        # Get the (x,y) coord
        xpoint = ttree.evt__bunchlumi
        ypoint = ttree.xbp__L1_XE30

        # Exclude really small lumi < 1e28
        if xpoint < 0.01:
            continue

        # Fractional error for the y-axis from the counts
        ypointfracerr = 0
        if ttree.tav__L1_XE30>0:
            ypointfracerr = 1./math.sqrt(ttree.tav__L1_XE30) 

        # Error for the y-axis = y*(fractional error)
        ypointerr = ypoint * ypointfracerr

        # Error for the x-axis = none
        xpointerr = 0.

        # (x, y)
        xdata.append( xpoint )
        ydata.append( ypoint )

        # (xerr, yerr)
        xdataerr.append( xpointerr )
        ydataerr.append( ypointerr )

    # Zip it up to send it off!
    zipped_data = zip_data(xdata, ydata, xdataerr, ydataerr)

    return zipped_data 


#----------------------------------------------------------------------
def get_graph(gname, xname, yname, zipped_data):
    xdata, ydata, xdataerr, ydataerr = unzip_data(zipped_data)
    ptitle = ''
    ytitle = '%s trig. x-sec (mb)' % (yname)
    xtitle = 'inst. lumi. per proton bunch (10^{30} cm^{-2} s^{-1})'
    graph = ROOT.TGraphErrors(len(xdata),
                              array('f', xdata),
                              array('f', ydata),
                              array('f', xdataerr),
                              array('f', ydataerr) )
    graph.SetName( '%s__%s__vs__%s' % (gname, xname, yname) )
    graph.SetTitle('%s;%s;%s' % (ptitle, xtitle, ytitle) )
    graph.SetMarkerSize(0.8)
    graph.SetMarkerStyle(20)
    graph.SetMarkerColor(ROOT.kBlue)
    graph.SetLineWidth(2)
    graph.SetLineColor(ROOT.kGreen)
    graph.SetFillColor(ROOT.kGreen)
    graph.GetXaxis().SetTitleOffset(1.2)
    graph.GetYaxis().SetTitleOffset(1.4)
    graph.GetYaxis().SetNdivisions(504)
    graph.GetXaxis().SetNdivisions(504)
    return graph


#----------------------------------------------------------------------
def get_fn(xmin, xmax):
    fn = ROOT.TF1('fn', 'pol2', xmin, xmax)
    fn.SetLineColor(ROOT.kRed)
    return fn


#----------------------------------------------------------------------
def get_plotextrema(zipped_data, fn, sigma=3):
    xdata, ydata, xdataerr, ydataerr = unzip_data(zipped_data)
    ymaxset = [ y + sigma*ey for y, ey in zip(ydata, ydataerr) ]
    yminset = [ y - sigma*ey for y, ey in zip(ydata, ydataerr) ]
    for y in ydata:
        f = fn.Eval(y)

    ymin = min(yminset)
    ymax = max(ymaxset)
    return ymin, ymax


#----------------------------------------------------------------------
def get_yextrema(zipped_data, sigma=3):
    xdata, ydata, xdataerr, ydataerr = unzip_data(zipped_data)
    ymaxset = [ y + sigma*ey for y, ey in zip(ydata, ydataerr) ]
    yminset = [ y - sigma*ey for y, ey in zip(ydata, ydataerr) ]
    ymin = min(yminset)
    ymax = max(ymaxset)
    return ymin, ymax

#----------------------------------------------------------------------
def get_xextrema(zipped_data):
    xdata, ydata, xdataerr, ydataerr = unzip_data(zipped_data)
    xmin = min(xdata)
    xmax = max(xdata)
    return xmin, xmax


#----------------------------------------------------------------------
def zip_data(xdata, ydata, xdataerr, ydataerr):
    zipped_data = zip(xdata, ydata, xdataerr, ydataerr)
    zipped_data.sort()
    return zipped_data


#----------------------------------------------------------------------
def unzip_data(zipped_data):
    return map(list, zip(*zipped_data))


#----------------------------------------------------------------------
def filter_data(zipped_data):
    xdata, ydata, xdataerr, ydataerr = unzip_data(zipped_data)

    # (1) calculate distance between adjacent x-points for each point
    # (2) calculate overall average & rms
    dist_set = [ abs(xdata[i+1] - xdata[i]) for i in xrange(len(xdata)-1) ]
    ndist = len(dist_set)
    dist_avg = 0
    dist_err = 1e10
    if ndist>0:
        dist_avg = sum(dist_set)/ndist
        dist_rms2 = sum([ (dist_avg - dist)**2 for dist in dist_set ])/ndist
        dist_rms = math.sqrt(dist_rms2)
        dist_err = dist_rms / math.sqrt(ndist)

    # Keep a data set for those close by neighbors (5 sigma)
    xavg = sum(xdata)/len(xdata)
    zipped_filt = []
    for i, dist in enumerate(dist_set):
        if dist < dist_avg + 5*dist_err:
            zipped_filt.append( zipped_data[i] )

    return zipped_filt


#----------------------------------------------------------------------
# Main


#
# Inputs
#
run = 167607 #178109 #187811 
tfile_type = 'cool' #trp

#
# Open file & tree
#
tfile_name = 'root/%d_%s.root' % (run, tfile_type)
ttree_name = 'ntp1'
tfile = ROOT.TFile(tfile_name)
ttree = tfile.Get(ttree_name)

if tfile==None:
    print 'Could not open tfile = %s' % (tfile_name)
    sys.exit()

if ttree==None:
    print 'Could not open ttree = %s' % (ttree_name)
    sys.exit()

#
# Get all branches
#
tbranch_list = [ k.GetName() for k in ttree.GetListOfBranches() ]
xname = ''
yname = ''
for bname in tbranch_list:
    if bname == 'evt__bunchlumi':   xname = bname
    if bname == 'xbp__L1_XE30':     yname = bname

if len(xname) == 0:
    print 'Could not find x-axis variable', xname
    sys.exit()

if len(yname) == 0:
    print 'Could not find y-ayis variable', yname
    sys.exit()

#
# Get data to fit -- we want to exclude x-axis outliers 
#
zipped_data = get_data(ttree)           # Read ntuple & sort by x-value
zipped_filt = filter_data(zipped_data)  # Filter-out x-outliers

#
# Get min/max
#
xmin, xmax = get_xextrema(zipped_filt)
ymin, ymax = get_yextrema(zipped_filt) 

#
# Data -> graph
#
graph_data = get_graph('data', xname, yname, zipped_data)
graph_filt = get_graph('filt', xname, yname, zipped_filt)

#
# Draw on canvas
#
canvas = get_canvas()
graph_data.Draw('APZ')

#
# Fit data
#
fn = get_fn(xmin, xmax)
graph_filt.Fit(fn, '', '', xmin, xmax)
fn.Draw('SAME')
graph_filt.SetLineWidth(0)
graph_filt.Draw('PZ,SAME')

# 
# Save
#
canvas.SaveAs('plots/fit.eps')
print 'xmin-xmax', xmin, xmax
print 'ymin-ymax', ymin, ymax




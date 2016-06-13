#!/usr/bin/env python

###########################################################################
#
# Highlights:
#   xmonData() accesses TTree to print Highcharts setup & data to HTML
#
# def digits()
# def sigfig()
# class xmonData()
#   def __init__()
#   def data()
#   def dumpData()
#   def dumpVar()
#   def cutRange()
#   def cutVar()
#   def dumpEvt()
#   def setup()
#   def chartOption()
#   def legendOption()
#   def creditsOption()
#   def titleOption()
#   def plotOptionsOption()
#   def plotOptionsSeriesOption()
#   def plotOptionsEventsOption()
#   def xAxisOption()
#   def yAxisOption()
#   def miscOption()
#   def tooltipClick()
#   def tooltipPrintRow()
#   def tooltipSetup()
#   def dataFormat()
#   def getChartName()
#   def getChartIdx()
#   def getChartNumber()
#
###########################################################################

from array import array
import math
import TrigXMonitor.xmonHtmlUtility as xhu

#==========================================================================
def digits(x):
    """ Return amount of digits of x. """
    if x == 0: return 0
    return int(math.floor(math.log10(math.fabs(x))) + 1)


#==========================================================================
def sigfig(x, off=4):
    """ Return amount of decimals of x. """
    if x < 1e-16: return '0' # gotta be a reasonable number
    d = digits(x)
    if d > 0: d -= off + 1 # one extra for the decimal point
    else: d -= off
    return str( int(math.fabs(d)) ) if x != 0 else '0'


#==========================================================================
class xmonData:
    """
    Uses Highcharts JS
    """

    #==========================================================================
    def __init__(self, xmonParams):
        """
        """

        # Handers
        self.xP = xmonParams # Input handler --> xmonParams

        # Keep track of the time-stamp of the last data pt
        self.lastDataPoint = dict()
        self.lastDataPoint['time']   = -1
        self.lastDataPoint['jentry'] = 0


    #==========================================================================
    def data(self, tab=''):
        """
        # Main function
        # Uses dumpData(), setup()
        """

        tab = xhu.Print(tab, 'Highcharts.setOptions')
        tab = xhu.Print(tab, '(')
        tab = xhu.Print(tab, '{')

        # Define theme
        tab = xhu.Print(tab, 'chart:')
        tab = xhu.Print(tab, '{')
        tab = xhu.Print(tab, 'borderWidth: 0,')
        tab = xhu.Print(tab, 'borderRadius: 0,')
        tab = xhu.Print(tab, 'borderColor: "#000000"')
        tab = xhu.Print(tab, '},')

        # Use UTC time
        tab = xhu.Print(tab, 'global:{')
        tab = xhu.Print(tab, 'useUTC: true')
        tab = xhu.Print(tab, '}')

        tab = xhu.Print(tab, '}')
        tab = xhu.Print(tab, ');')

        # Get tree
        tchain = self.xP.inputs['tchain']

        # Define chart names
        for yChartIdx in xrange( len(self.xP.yVarList) ):

            for xChartIdx, xVarName in enumerate(self.xP.xVarList):

                # Set-up -- encode the indices  chartIdx into
                chartIdx    = [ xChartIdx, yChartIdx ]
                chartName   = "chart%d" % ( self.getChartNumber(chartIdx) )

                # Dump data
                tab = xhu.Print(tab,'')
                tab = xhu.Print(tab,'var %s; // globally available' % ( chartName ))
                tab = self.dumpData( tchain, chartIdx, tab )

        # Define charts
        tab = xhu.Print(tab,'')
        tab = xhu.Print(tab,'$(document).ready')
        tab = xhu.Print(tab,'(')
        tab = xhu.Print(tab,'function()')
        tab = xhu.Print(tab,'{')

        # Define chart data
        for yChartIdx in xrange( len(self.xP.yVarList) ):

            for xChartIdx, xVarName in enumerate(self.xP.xVarList):

                # Set-up
                chartIdx    = [ xChartIdx, yChartIdx ]
                chartName   = "chart%d" % ( self.getChartNumber(chartIdx) )
                xVarName    = self.getChartName( chartIdx, 'xAxis' )
                xLabel      = self.xP.niceLabel[ xVarName ]
                xLabelUnit  = self.xP.niceLabelUnit[ xVarName ]
                if len(xLabelUnit) > 0:
                    xLabelUnit = '(' + xLabelUnit + ')'

                # Execute
                tab = self.setup( tchain, chartIdx, xLabel, xLabelUnit, tab)

        # Close
        tab = xhu.Print(tab,'} // END function()')
        tab = xhu.Print(tab,'); // END document.ready')

        return tab

    #
    #
    # dumpData
    #
    #

    #==========================================================================
    def dumpData(self, tchain, chartIdx, tab = ''):
        """
        Used by data()
        Uses dumpVar(), self.getChartNumber()
        """

        # Open data
        tab = xhu.Print(tab, 'var data%d =' % ( self.getChartNumber(chartIdx) ))
        tab = xhu.Print(tab, '[')
        # Number of events to process
        nevt = int( tchain.GetEntries() )
        if self.xP.inputs['nevt'] != -1:
            nevt = self.xP.inputs['nevt']
        trigProperties = self.xP.inputs['varlist']['trig']

        #
        # Compare run-by-run
        #
        if self.xP.inputs['mode'] == 'compare':
            for i, run in enumerate(self.xP.inputs['runlist']):

                # Loop over triggers
                for trigIdx in xrange( len(trigProperties['name']) ):
                    tab = xhu.Print(tab, '{')
                    tab = xhu.Print(tab, 'id: "%d__%s",'   % ( run, trigProperties['name'][trigIdx] ))
                    tab = xhu.Print(tab, 'name: "%d, %s",' % ( run, trigProperties['name'][trigIdx] ))
                    tab = xhu.Print(tab, 'data:')
                    tab = xhu.Print(tab, '[')

                    # Dump variable
                    tab = self.dumpVar( tchain, chartIdx, trigIdx, nevt, run, tab )

                    # Close variable
                    tab = xhu.Print(tab, '] // var data-trigger-data:')
                    if trigIdx  != ( len(trigProperties['name'])-1 ) or i != len(self.xP.inputs['runlist'])-1:
                        tab = xhu.Print(tab, '}, // var data-trigger')
                    else:
                        tab = xhu.Print(tab, '} // var data-trigger')

        #
        # Merge runs -- a copy of above
        #
        else:

            # Loop over triggers
            for trigIdx in xrange( len(trigProperties['name']) ):
                tab = xhu.Print(tab, '{')
                tab = xhu.Print(tab, 'id: "%s",'   % ( trigProperties['name'][trigIdx] ))
                tab = xhu.Print(tab, 'name: "%s",' % ( trigProperties['name'][trigIdx] ))
                tab = xhu.Print(tab, 'data:')
                tab = xhu.Print(tab, '[')

                # Dump variable
                tab = self.dumpVar( tchain, chartIdx, trigIdx, nevt, -1, tab )

                # Close variable
                tab = xhu.Print(tab, '] // var data-trigger-data:')
                if trigIdx  != ( len(trigProperties['name'])-1 ):
                    tab = xhu.Print(tab, '}, // var data-trigger')
                else:
                    tab = xhu.Print(tab, '} // var data-trigger')

        # Close data
        tab = xhu.Print(tab, ']; // var data')

        return tab

#               \todo
#	            # Print linear fit
#	            tab = xhu.Print(tab, '{')
#	            tab = xhu.Print(tab, 'type: "line",')
#	            tab = xhu.Print(tab, 'name: "Regression Line",')
#	            tab = xhu.Print(tab, 'data: [[0, 1.11], [5, 4.51]],')
#	            tab = xhu.Print(tab, 'marker: {')
#	            tab = xhu.Print(tab, 'enabled: false')
#	            tab = xhu.Print(tab, '},')
#	            tab = xhu.Print(tab, 'states: {')
#	            tab = xhu.Print(tab, 'hover: {')
#	            tab = xhu.Print(tab, 'lineWidth: 0')
#	            tab = xhu.Print(tab, '}')
#	            tab = xhu.Print(tab, '},')


    #==========================================================================
    def dumpVar(self, tchain, chartIdx, trigIdx, nevt, runnumber=-1, tab = ''):
        """
        Used by dumpData()
        Uses dumpEvt(), cutRange(), self.getChartIdx()
        """

        # Get the correct variable
        xChartIdx = self.getChartIdx( chartIdx, 'xAxis' )
	#print chartIdx
	#print 'xChartIdx ', xChartIdx

        # Reset every time
        tchain.SetBranchStatus('*',0)
        tchain.ResetBranchAddresses()

        # Declare
        maxn = 1 # generalizable to an n-vector
        idx = 0  # generalizable to an n-vector
        tbranch = dict()

        # Initialize event-wise variables
        allname = self.xP.inputs['varlist']['evt']['name']
        alltype = self.xP.inputs['varlist']['evt']['type']
        for j in xrange( len(allname) ):
            thisname = allname[j]
            thistype = alltype[j]
            tbranch[thisname] = dict()
            thiszero = 0.
            if thistype.capitalize() == 'I':
                thiszero = 0

            branchname = 'evt__' + thisname
            tbranch[thisname]['evt'] = array(thistype, maxn*[thiszero])

            tchain.SetBranchStatus(  branchname, 1 )
            tchain.SetBranchAddress( branchname, tbranch[thisname]['evt'] )

            if self.xP.inputs['debug'] > 0:
                tab = xhu.Print(tab, '// DEBUG [%d/%d] Activated %s' % ( j, len(allname), thisname))

        ##############################
        # Activate individual branches
        ##############################

        # List of all branches in this tree
        allbranches = [ k.GetName() for k in tchain.GetListOfBranches() ]

        # Initialize trigger-wise variables (int or float)
        allname = [ self.xP.inputs['varlist']['trig']['name'][trigIdx] ]
        alltype = [ self.xP.inputs['varlist']['trig']['type'][trigIdx] ]
        for j in xrange( len(allname) ):
            thisname = allname[j]
            thistype = alltype[j]
            tbranch[thisname] = dict()
            if self.xP.inputs['debug'] > 0:
                tab = xhu.Print(tab, '// DEBUG [%d/%d] Considering to activate %s as type %s'
                                % (j,
                                   len(allname),
                                   thisname,
                                   thistype))

            if tchain.GetBranchStatus( 'xbp__' + thisname ) == 0:
                tbranch[thisname]['xbp'] = array('f', maxn*[0.])
                tbranch[thisname]['xap'] = array('f', maxn*[0.])
                tbranch[thisname]['xav'] = array('f', maxn*[0.])
                tbranch[thisname]['rbp'] = array('f', maxn*[0.])
                tbranch[thisname]['rap'] = array('f', maxn*[0.])
                tbranch[thisname]['rav'] = array('f', maxn*[0.])
                tbranch[thisname]['tbp'] = array('f', maxn*[0.])
                tbranch[thisname]['tap'] = array('f', maxn*[0.])
                tbranch[thisname]['tav'] = array('f', maxn*[0.])

                # Verify that this branch exists for this run
                if not (('xbp__' + thisname) in allbranches):
                    continue

                tchain.SetBranchStatus(  'xbp__' + thisname, 1 )
                tchain.SetBranchStatus(  'xap__' + thisname, 1 )
                tchain.SetBranchStatus(  'xav__' + thisname, 1 )
                tchain.SetBranchStatus(  'rbp__' + thisname, 1 )
                tchain.SetBranchStatus(  'rap__' + thisname, 1 )
                tchain.SetBranchStatus(  'rav__' + thisname, 1 )
                tchain.SetBranchStatus(  'tbp__' + thisname, 1 )
                tchain.SetBranchStatus(  'tap__' + thisname, 1 )
                tchain.SetBranchStatus(  'tav__' + thisname, 1 )
                tchain.SetBranchAddress( 'xbp__' + thisname, tbranch[thisname]['xbp'] )
                tchain.SetBranchAddress( 'xap__' + thisname, tbranch[thisname]['xap'] )
                tchain.SetBranchAddress( 'xav__' + thisname, tbranch[thisname]['xav'] )
                tchain.SetBranchAddress( 'rbp__' + thisname, tbranch[thisname]['rbp'] )
                tchain.SetBranchAddress( 'rap__' + thisname, tbranch[thisname]['rap'] )
                tchain.SetBranchAddress( 'rav__' + thisname, tbranch[thisname]['rav'] )
                tchain.SetBranchAddress( 'tbp__' + thisname, tbranch[thisname]['tbp'] )
                tchain.SetBranchAddress( 'tap__' + thisname, tbranch[thisname]['tap'] )
                tchain.SetBranchAddress( 'tav__' + thisname, tbranch[thisname]['tav'] )
                if self.xP.inputs['debug'] > 0:
                    tab = xhu.Print(tab, '// DEBUG [%d/%d] Activated %s for %d events' % ( j, len(allname), thisname, nevt ))

        ####################
        # Loop over entries
        ####################

        for jentry in xrange( nevt ):

            # Debug
            if self.xP.inputs['debug'] > 1:
                tab = xhu.Print(tab, '// jentry = %d ' % (jentry))

            # Load
            tchain.GetEntry(jentry)

            # Cuts
            keep = True
            keep = keep and self.cutRange(  tab, tbranch, idx )
            keep = keep and self.cutVar(    tab, tbranch, idx )

            # Match run number
            if runnumber != -1:
                if runnumber != tbranch['run']['evt'][idx]:
                    continue

            # Save the last data point that passed cuts
            if keep and self.lastDataPoint['time'] < tbranch['time']['evt'][idx]:
                self.lastDataPoint['time'] = tbranch['time']['evt'][idx]
                self.lastDataPoint['jentry'] = jentry

            # Sample LB
            lbsample = 2
            if self.xP.inputs['lbsample'] == 'auto':
                listlength = len(self.xP.inputs['runlist'])
                if listlength > 4:
                    lbsample = 8
                else:
                    lbsample = 2 * len(self.xP.inputs['runlist'])
            else:
                try:
                    lbsample = int( self.xP.inputs['lbsample'] )
                except:
                    pass

            keep = keep and ( jentry % lbsample == 0 )

            # Get out
            if not keep:
                continue

            # Dump
            varx = self.xP.inputs['varlist']['evt']['name'][ xChartIdx ]
            vary = self.xP.inputs['varlist']['trig']['name'][ trigIdx ]
	    if varx=='fill': varx='mu'
	    #print 'varx ' , varx, ' vary ', vary
            tab = self.dumpEvt( varx, vary, tbranch, chartIdx, idx, ',',  tab)

            # Debug
            if self.xP.inputs['debug'] > 1:
                tab = xhu.Print(tab, '// DEBUG [%d/%d] event' % ( jentry, nevt ))

        # Always plot last data point
        if self.xP.inputs['debug'] > 1:
            tab = xhu.Print(tab, '// DEBUG last event is %d ' % ( self.lastDataPoint['jentry'] ))

        tchain.GetEntry( self.lastDataPoint['jentry'] )         # Load all info in event
        varx = self.xP.inputs['varlist']['evt']['name'][ xChartIdx ]
        vary = self.xP.inputs['varlist']['trig']['name'][ trigIdx ]
	if varx=='fill': varx='mu'
        tab = self.dumpEvt( varx, vary, tbranch, chartIdx, idx, '', tab )

        return tab


    #==========================================================================
    def cutRange(self, tab, tbranch, idx = 0):
        """
        Used by dumpVar()
        Uses None
        """

        runlist = self.xP.inputs['runlist']
        runtype = 'run'
        thisrun = tbranch[runtype]['evt'][idx]

#	        keep = dict()
#	        keep['all']       = True
#	        keep['runRange'] = False
#	        keep = thisrun in runlist
#	        keep['all'] = keep['all'] and keep[item]

        keep = thisrun in runlist

        # Debug
        if self.xP.inputs['debug'] > 2:
            tab = xhu.Print(tab, '// dumpEvt run %d is %s in list %s'
                            % ( thisrun, '' if keep else 'NOT', runlist ))

        return keep


    #==========================================================================
    # Impose cuts
    #
    # Defined in xmonInputsHandler::readInput()
    # Coordinate with xmonDataObject::cutVar()
    #
    def cutVar(self, tab, tbranch, idx = 0):
        """
        Used by dumpVar()
        Uses None

        Impose cuts here
        """

        keep = True

        #
        # Sanity cuts
        #

        cutlist = ['lblength', 'lumi', 'bunchlumi', 'mu', 'bunches']
        for cutvar in cutlist:
            cutmin = self.xP.inputs[ cutvar+'min' ]
            cutmax = self.xP.inputs[ cutvar+'max' ]
            if cutmin > -1: keep = keep and tbranch[cutvar]['evt'][idx] > cutmin
            if cutmax > -1: keep = keep and tbranch[cutvar]['evt'][idx] < cutmax

        # Debug
        if self.xP.inputs['debug'] > 2:
            tab = xhu.Print(tab, '// dumpEvt variables %s %s'
                            % ( cutlist, 'passed' if keep else 'FAILED' ))


#	        TODO
#	        #
#	        # Trigger-based cuts
#	        #
#
#	        cutlist = ['L1_EM18VH'] # redefine list
#	        for cutvar in cutlist:
#	            cutmin = self.xP.inputs[ cutvar+'min' ]
#	            cutmax = self.xP.inputs[ cutvar+'max' ]
#	            if cutmin > -1: keep = keep and tbranch[cutvar]['tap'][idx] > cutmin
#	            if cutmax > -1: keep = keep and tbranch[cutvar]['tap'][idx] < cutmax
#	            if self.xP.inputs['debug'] > 2:
#	                tab = xhu.Print(tab, '// dumpEvt %s val=%f'
#	                                % ( cutvar, tbranch[cutvar]['tap'][idx] ))
#
#	        # Debug
#	        if self.xP.inputs['debug'] > 2:
#	            tab = xhu.Print(tab, '// dumpEvt variables %s %s'
#	                            % ( cutlist, 'passed' if keep else 'FAILED' ))

        return keep


    #==========================================================================
    def dumpEvt(self, varx, vary, tbranch, chartIdx = [], idx = 0, suffix = '', tab =''):
        """
        Used by dumpVar()
        Uses self.getChartName(), self.getChartNumber()
        """

        xChartName = self.getChartName(chartIdx, 'xAxis')
        yChartName = self.getChartName(chartIdx, 'yAxis') + self.xP.inputs['ps']

        if self.xP.inputs['debug'] > 1:
            tab = xhu.Print(tab, '// Consider varx %s vary %s yChartName %s chart%d' % (
                varx,
                vary,
                yChartName,
                self.getChartNumber(chartIdx)))
            tab = xhu.Print(tab, '// varx %s vary %s' % ( varx, vary))

        # Modify x-variable for cross-section if it is 'lumi'
        if 'lumi' in varx:
            if 'x' == yChartName[0]:
                varx = 'bunchlumi'

        # Get values
        valx = tbranch[varx]['evt'][idx]
	#print 'varx ', varx, ' idx ', idx , ' valx ', valx
        valy = tbranch[vary][yChartName][idx]
        yunits = 1. #self.xP.inputs[ 'yunits' ]
        xunits = 1. #self.xP.inputs[ 'xunits' ]
#	        valy *= yunits
#	        valx *= xunits if 'time' in varx else 1

        # Only positive numbers
        if valx <= 0.:
            return tab

        # Calculate prescale, veto
        psv = tbranch[vary]['tbp'][idx] / tbranch[vary]['tap'][idx] if tbranch[vary]['tap'][idx] > 0. else -1.
        vto = tbranch[vary]['tap'][idx] / tbranch[vary]['tav'][idx] if tbranch[vary]['tav'][idx] > 0. else -1.

        # If time, then need milliseconds, not microseconds -- do this in javascript
        if 'time' in xChartName:
            valx *= 1000.

        # Re-compute y-axis values
        xbp = yunits * tbranch[vary]['rbp'][idx] / tbranch['bunchlumi']['evt'][idx] # nb
        xap = yunits * tbranch[vary]['rap'][idx] / tbranch['bunchlumi']['evt'][idx] # nb
        xav = yunits * tbranch[vary]['rav'][idx] / tbranch['bunchlumi']['evt'][idx] # nb
#	        xbp = yunits * tbranch[vary]['xbp'][idx] # ub
#	        xap = yunits * tbranch[vary]['xap'][idx] # ub
#	        xav = yunits * tbranch[vary]['xav'][idx] # ub
        if   'xbp' == yChartName: valy = xbp
        elif 'xap' == yChartName: valy = xap
        elif 'xav' == yChartName: valy = xav

        # Scale down counts by 1e6
        if 't' == yChartName[0]:
            if self.xP.inputs['logy'] == 0:
                valy /= math.pow(10,6)

        # Logy
        if self.xP.inputs['logy'] == '1':
            if valy > 0:
                valy = math.log10( tbranch[vary][yChartName][idx] )
            else:
                return tab






        # Flatten data
        flatup = {}
        flatup['x'] = int(valx) if 'time' in varx else float(valx)
        flatup['y'] = valy
        varlist = ['time',
                   'lumi',
                   'fill',
                   'run',
                   'lb',
                   'lblumi',
                   'lblength',
                   'bunches',
                   'nbunch1',
                   'nbunch2',
                   'bunchlumi',
                  ]
        for varname in varlist:
            flatup[varname] = tbranch[varname]['evt'][idx]

        flatup['xbp'] = xbp
        flatup['xap'] = xap
        flatup['xav'] = xav
        flatup['rbp'] = yunits * tbranch[vary]['rbp'][idx]
        flatup['rap'] = yunits * tbranch[vary]['rap'][idx]
        flatup['rav'] = yunits * tbranch[vary]['rav'][idx]
        flatup['tbp'] = yunits * tbranch[vary]['tbp'][idx]
        flatup['tap'] = yunits * tbranch[vary]['tap'][idx]
        flatup['tav'] = yunits * tbranch[vary]['tav'][idx]
        flatup['psv'] = psv
        flatup['vto'] = vto
        flatup['sfx'] = suffix # end-of-line char is last!

        # Dump data in pairs only if positive
        s = '{'
        s += 'x:%(x)d,' if 'time' in varx else 'x:%(x).'+sigfig(valx)+'f,'
	##RJ
	if self.xP.inputs['logy'] == 1:
		#print 'logy is used'
		#print valy
		if valy>0: valy = math.log10(valy)
		else:	   valy = -100
		#print valy
	flatup['y'] = valy
        s += 'y:%(y).'+sigfig(valy,4)+'f,'
        s += 'fill:%(fill)d,'
        s += 'run:%(run)d,'
        s += 'lumi:%(lumi).'+sigfig(flatup['lumi'])+'f,'
        s += 'lb:%(lb)d,'
        s += 'lblumi:%(lblumi).'+sigfig(flatup['lblumi'])+'f,'
        s += 'lblength:%(lblength).2f,'
        s += 'time:%(time)d,'
        s += 'bunches:%(bunches)d,'
        s += 'nbunch1:%(nbunch1)d,'
        s += 'nbunch2:%(nbunch2)d,'
        s += 'bunchlumi:%(bunchlumi).'+sigfig(flatup['bunchlumi'])+'f,'
        s += 'xbp:%(xbp).'+sigfig(flatup['xbp'])+'f,'
        s += 'xap:%(xap).'+sigfig(flatup['xap'])+'f,'
        s += 'xav:%(xav).'+sigfig(flatup['xav'])+'f,'
        s += 'rbp:%(rbp).'+sigfig(flatup['rbp'])+'f,'
        s += 'rap:%(rap).'+sigfig(flatup['rap'])+'f,'
        s += 'rav:%(rav).'+sigfig(flatup['rav'])+'f,'
        s += 'tbp:%(tbp)d,'
        s += 'tap:%(tap)d,'
        s += 'tav:%(tav)d,'
        s += 'psv:%(psv).'+sigfig(flatup['psv'],1)+'f,'
        s += 'vto:%(vto).'+sigfig(flatup['vto'],1)+'f'

        # This is the last event!
        if suffix == '':
            s+= '' # ', marker: {symbol: "url(../scripts/images/sm23.gif)"}'

        s += '}%(sfx)s'
        tab = xhu.PrintNormal(tab, s % flatup)

        return tab

    #
    #
    # setup
    #
    #

    #==========================================================================
    def setup(self, tchain, chartIdx, xLabel, xLabelUnit, tab = ''):
        """
        used by data()
        uses tooltipSetup(), self.getChartNumber(), self.getChartIdx()
        """

        # Open chart
        tab = xhu.Print(tab, '')
        tab = xhu.Print(tab, 'chart%d = new Highcharts.Chart(' % ( self.getChartNumber(chartIdx) ))
        tab = xhu.Print(tab, '{')

        # Chart options
        tab = self.chartOption(chartIdx, tab)
        #tab = self.legendOption(tab)
        tab = self.creditsOption(tab)
        tab = self.titleOption(chartIdx, tab)
        tab = self.plotOptionsOption(chartIdx, tab)
        tab = self.xAxisOption(chartIdx, xLabel, xLabelUnit, tab)
        tab = self.yAxisOption(chartIdx, tab)
        tab = self.miscOption(chartIdx, tab)

        # Define series
        tab = xhu.Print(tab, 'series: data%d,' % (self.getChartNumber(chartIdx)))

        # Load series
        tab = xhu.Print(tab, 'load:')
        tab = xhu.Print(tab, 'function()')
        tab = xhu.Print(tab, '{')
        tab = xhu.Print(tab, 'document.getElementById("xmonChart%d").style.background = "none";'
            % ( self.getChartNumber(chartIdx) ))
        tab = xhu.Print(tab, '}')

        # Close chart
        tab = xhu.Print(tab, '});')

#	        # Print button
#	        chartid = 11
#	        tab = xhu.Print(tab, '$("#button%d").click' % chartid)
#	        tab = xhu.Print(tab, '(')
#	        tab = xhu.Print(tab, 'function()')
#	        tab = xhu.Print(tab, '{')
#	        tab = xhu.Print(tab, 'var mysvg = chart.getSVG();')
#	        tab = xhu.Print(tab, 'var c = document.getElementById("xmonChart%d");' % chartid)
#	        tab = xhu.Print(tab, 'canvg(c, mysvg, { ignoreMouse: true, ignoreAnimation: true });')
#	        tab = xhu.Print(tab, 'saveCanvas(c, "PNG");')
#	        tab = xhu.Print(tab, '});')

#	        # Put export buttons
#	        tab = xhu.Print(tab, '// the button handler')
#	        tab = xhu.Print(tab, '$("#buttoni%d").click' % ( self.getChartNumber(chartIdx) ))
#	        tab = xhu.Print(tab, '(')
#	        tab = xhu.Print(tab, 'function()')
#	        tab = xhu.Print(tab, '{')
#	        tab = xhu.Print(tab, 'chart%d.exportChart();' % ( self.getChartNumber(chartIdx) ))
#	        tab = xhu.Print(tab, '}')
#	        tab = xhu.Print(tab, ');')

        return tab


    #==========================================================================
    def chartOption(self, chartIdx, tab = '', endOfListChar=','):
        """
        Used by setup()
        Uses None
        """

        tab = xhu.Print(tab, 'chart:')
        tab = xhu.Print(tab, '{')
        tab = xhu.Print(tab, 'renderTo: "xmonChart%d",'  % ( self.getChartNumber(chartIdx) ))
        tab = xhu.Print(tab, 'defaultSeriesType: "scatter",')
        tab = xhu.Print(tab, 'zoomType: "xy",')
        tab = xhu.Print(tab, 'showAxes: true,')
        tab = xhu.Print(tab, 'plotBorderWidth: 1,')
        #tab = xhu.Print(tab, 'marginRight: 250,')
        tab = xhu.Print(tab, 'events: { selection: function() { } }')
        tab = xhu.Print(tab, '}%s' % endOfListChar)
        return tab


    #==========================================================================
    def legendOption(self, tab = '', endOfListChar=',' ):
        """
        Used by setup()
        Uses None
        """

        tab = xhu.Print(tab, 'legend:')
        tab = xhu.Print(tab, '{')
        tab = xhu.Print(tab, 'layout: "vertical",')
        tab = xhu.Print(tab, 'align: "right",')
        tab = xhu.Print(tab, 'verticalAlign: "top",')
        tab = xhu.Print(tab, 'borderWidth: 0,')
        tab = xhu.Print(tab, 'itemWidth: 250,')
        tab = xhu.Print(tab, 'x: 0,')
        tab = xhu.Print(tab, 'y: 50')
        tab = xhu.Print(tab, '}%s' % endOfListChar)
        return tab


    #==========================================================================
    def creditsOption(self, tab = '', endOfListChar=',' ):
        """
        Used by setup()
        Uses None
        """

        tab = xhu.Print(tab, 'credits:')
        tab = xhu.Print(tab, '{')
	tab = xhu.Print(tab, 'text: "ATLAS MET Trigger Rate/Cross-section Monitor",')
        #tab = xhu.Print(tab, 'text: "ATLAS <b>XMON</b> at %s",' % 'https://cern.ch/x')
        tab = xhu.Print(tab, 'href: "%s"'                       % 'https://rewang.web.cern.ch/rewang/xmon/cgi-bin/xmon.cgi')
        tab = xhu.Print(tab, '}%s' % endOfListChar)
        return tab


    #==========================================================================
    def titleOption(self, chartIdx, tab = '', endOfListChar=',' ):
        """
        Used by setup()
        Uses None
        """

        # Title
        yChartIdx = self.getChartIdx( chartIdx, 'yAxis' )
        yVarName = self.xP.yVarList[ yChartIdx ]
        psName =  self.xP.inputs['ps']
        yLabel = self.xP.niceLabel[ yVarName + psName ]

        tab = xhu.Print(tab, 'title:')
        tab = xhu.Print(tab, '{')
        tab = xhu.Print(tab, 'text: "%s"' % ( yLabel.capitalize()))
        tab = xhu.Print(tab, '},')

        # Sub-title
        ctext = ''

        # Sample LB
        lbsample = 2
        if self.xP.inputs['lbsample'] == 'auto':
            lbsample = 2*len(self.xP.inputs['runlist'])
        else:
            try:
                lbsample = int( self.xP.inputs['lbsample'] )
            except:
                pass

        if   lbsample == 1: ctext = ''
        elif lbsample == 2: ctext = '%dnd ' % ( lbsample )
        elif lbsample == 3: ctext = '%drd ' % ( lbsample )
        elif lbsample >  3: ctext = '%dth ' % ( lbsample )

        tab = xhu.Print(tab, 'subtitle:')
        tab = xhu.Print(tab, '{')
        tab = xhu.Print(tab, 'text: "Data points shown for every %sLB period"' % ( ctext ))
        tab = xhu.Print(tab, '}%s' % endOfListChar)
        return tab

    #==========================================================================
    def plotOptionsOption(self, chartIdx, tab = '', endOfListChar=',' ):
        """
        Used by setup()
        Uses None
        """

        # Open plotOptions
        tab = xhu.Print(tab, 'plotOptions: // Open plotOptions')
        tab = xhu.Print(tab, '{')

        # Marker
        tab = xhu.Print(tab, 'marker: {radius: 0},')

        # Open series
        tab = xhu.Print(tab, 'series: // Open plotOptions-series')
        tab = xhu.Print(tab, '{')

        tab = xhu.Print(tab, 'stickyTracking: false,')
        tab = self.plotOptionsSeriesOption(chartIdx, tab)
        tab = self.plotOptionsEventsOption(tab, '')

        # Close series
        tab = xhu.Print(tab, '} // Close plotOptions-series')

        # Close plotOptions
        tab = xhu.Print(tab, '}%s // Close plotOptions' % endOfListChar)
        return tab


    #==========================================================================
    def plotOptionsSeriesOption(self, chartIdx, tab = '', endOfListChar=',' ):
        """
        Used by plotOptionsOption()
        Uses None
        """

        # Open point
        tab = xhu.Print(tab, 'point: // Open plotOptions-series-point')
        tab = xhu.Print(tab, '{')

        # Open events
        tab = xhu.Print(tab, 'events: // Open plotOptions-series-point-events')
        tab = xhu.Print(tab, '{')

        # Click
        tab = xhu.Print(tab, 'click:')
        tab = xhu.Print(tab, 'function()')
        tab = xhu.Print(tab, '{')
        tab = xhu.Print(tab, 'alert')
        tab = xhu.Print(tab, '(')
        tab = self.tooltipClick( chartIdx, tab )
        tab = xhu.Print(tab, ');')
        tab = xhu.Print(tab, '},')

        # Open mouseOver
        tab = xhu.Print(tab, 'mouseOver: // Open plotOptions-series-point-events-mouseOver')
        tab = xhu.Print(tab, 'function()')
        tab = xhu.Print(tab, '{')

        # Print mouseOver box
        tab = xhu.Print(tab, '$("#xmonTooltip%d").html' % ( self.getChartNumber(chartIdx) ))
        tab = xhu.Print(tab, '(')
        tab = self.tooltipSetup( chartIdx, tab )
        tab = xhu.Print(tab, ');')

        # Close mouseOver
        tab = xhu.Print(tab, '} // Close plotOptions-series-point-events-mouseOver')

        # Close events
        tab = xhu.Print(tab, '} // Close plotOptions-series-point-events')

        # Close point
        tab = xhu.Print(tab, '}%s // Close plotOptions-series-point' % endOfListChar)
        return tab


    #==========================================================================
    def plotOptionsEventsOption(self, tab = '', endOfListChar=',' ):
        """
        Used by plotOptionsOption()
        Uses None
        """

        tab = xhu.Print(tab, 'events: // Open plotOptions-series-events')
        tab = xhu.Print(tab, '{')

#	        tab = xhu.Print(tab, 'mouseOut: function() {')
#	        tab = xhu.Print(tab, '$("#xmonTooltip%d").empty();' % ( self.getChartNumber(chartIdx) ))
#	        tab = xhu.Print(tab, '},')

        tab = xhu.Print(tab, 'legendItemClick: // Open plotOptions-series-events-legendItemClick')
        tab = xhu.Print(tab, 'function()')
        tab = xhu.Print(tab, '{')
        tab = xhu.Print(tab, 'if (this.visible) // Open plotOptions-series-events-legendItemClick-if')
        tab = xhu.Print(tab, '{')

#	        for i, xVarName in enumerate(self.xP.xVarList):
#	            tab = xhu.Print(tab, 'chart%d.get(this.name).hide();' % ( i ))

        tab = xhu.Print(tab, 'this.visible = true;')
        tab = xhu.Print(tab, '}')
        tab = xhu.Print(tab, 'else')
        tab = xhu.Print(tab, '{')

#	        for i, xVarName in enumerate(self.xP.xVarList):
#	            tab = xhu.Print(tab, 'chart%d.get(this.name).show();' % ( i ))

        tab = xhu.Print(tab, 'this.visible = false;')

        tab = xhu.Print(tab, '} // Close plotOptions-series-events-legendItemClick-if')
        tab = xhu.Print(tab, '} // Close plotOptions-series-events-legendItemClick')
        tab = xhu.Print(tab, '}%s // Close plotOptions-series-events' % endOfListChar)
        return tab


    #==========================================================================
    def xAxisOption(self, chartIdx, xLabel, xLabelUnit, tab = '', endOfListChar=',' ):
        """
        Used by setup()
        Uses None
        """

        tab = xhu.Print(tab, 'xAxis:')
        tab = xhu.Print(tab, '{')

        if 'time' in self.xP.xVarList[ self.getChartIdx( chartIdx, 'xAxis') ]:
            tab = xhu.Print(tab, 'type: "datetime",')
            tab = xhu.Print(tab, 'dateTimeLabelFormats:')
            tab = xhu.Print(tab, '{')
            tab = xhu.Print(tab, 'second: "%Mm.%Ss",')
            tab = xhu.Print(tab, 'minute: "%Hh%M",')
            tab = xhu.Print(tab, 'hour: "%ed.%Hh",')
            tab = xhu.Print(tab, 'day: "%b.%e",')
            tab = xhu.Print(tab, 'week: "%b.%e",')
            tab = xhu.Print(tab, 'month: "%b-%y",')
            tab = xhu.Print(tab, 'year: "%Y"')
            tab = xhu.Print(tab, '},')

#	        else:
#	            tab = xhu.Print(tab, 'min: 0,')

        tab = xhu.Print(tab, 'title: { text: "%s %s", enabled: true },' % ( xLabel, xLabelUnit ) ) # \todo
        tab = xhu.Print(tab, 'gridLineWidth: %d, ' % (int('x' in self.xP.inputs['grid'])))
        tab = xhu.Print(tab, 'showLastLabel: true,')
        tab = xhu.Print(tab, 'tickPosition: "inside",')
        tab = xhu.Print(tab, 'minPadding: 0.05,')
        tab = xhu.Print(tab, 'maxPadding: 0.05,')
        tab = xhu.Print(tab, 'allowDecmials: false,')
#	        tab = xhu.Print(tab, 'tickWidth: 1,')
#	        tab = xhu.Print(tab, 'endOnTick: true,')
#	        tab = xhu.Print(tab, 'startOnTick: true,')

        tab = xhu.Print(tab, '}%s // Close xAxis' % endOfListChar)
        return tab


    #==========================================================================
    def yAxisOption(self, chartIdx, tab = '', endOfListChar=',' ):
        """
        Used by setup()
        Uses None
        """

        tab = xhu.Print(tab, 'yAxis: // Open yAxis')
        tab = xhu.Print(tab, '{')

        # Title
        tab = xhu.Print(tab, 'title: // Open yAxis-title')
        tab = xhu.Print(tab, '{')
        prefix      = 'log of ' if self.xP.inputs['logy'] == 1 else ''
        yChartIdx   = self.getChartIdx( chartIdx, 'yAxis' )
        yVarName    = self.xP.yVarList[ yChartIdx ]
        psName      = self.xP.inputs['ps']
        yLabel      = self.xP.niceLabel[ yVarName + psName ]
        yLabelUnit  = self.xP.niceLabelUnit[ yVarName + psName ]
        if yLabelUnit == 'evt':
            yLabelUnit = '10^6 ' + yLabelUnit
        tab = xhu.Print(tab, 'text: "%s %s (%s)",' % (prefix, yLabel, yLabelUnit))
#	        tab = xhu.Print(tab, 'margin: "60"') # Highcharts 2.0.5
        tab = xhu.Print(tab, '}, // Close yAxis-title')

        # Other options
        tab = xhu.Print(tab, 'gridLineWidth: %d, ' % (int('y' in self.xP.inputs['grid'])))
        tab = xhu.Print(tab, 'tickPosition: "inside",')
        tab = xhu.Print(tab, 'tickWidth: 1,')
        tab = xhu.Print(tab, 'max: %s,' % ( self.xP.inputs['ymax'] ))
        if self.xP.inputs['logy'] != 0:
            tab = xhu.Print(tab, 'min: 0,')
            #if self.xP.inputs['ymin']:
        else:
	    tab = xhu.Print(tab, 'min: %s,' % ( self.xP.inputs['ymin'] ))

        tab = xhu.Print(tab, 'allowDecmials: false,')
#	        tab = xhu.Print(tab, 'tickInterval: 1,')

        # Axis label for log scale
        if self.xP.inputs['logy'] == 1:
            tab = xhu.Print(tab, 'labels:')
            tab = xhu.Print(tab, '{')
            tab = xhu.Print(tab, 'formatter:')
            tab = xhu.Print(tab, 'function()')
            tab = xhu.Print(tab, '{')

#	            # Linear, simple log10
#	            tab = xhu.Print(tab, 'return this.value;')
#	            tab = xhu.Print(tab, 'return Math.pow(10,this.value);')

            # Smart log10: logx = log(B x 10^E) = C.M, where
            #   B = base = 10^(0.M)
            #   C = characteristic
            #   M = mantissa = logx - exponent
            exponent = 'Math.floor(this.value)'
            mantissa = 'this.value - %s' % exponent
            base     = 'Math.round(100*Math.pow(10,%s))/100' % mantissa
            tab = xhu.Print(tab, 'if (%s==1) return "10^"+%s;' % (base, exponent))
            tab = xhu.Print(tab, 'return %s+"e"+%s;' % (base, exponent))
            tab = xhu.Print(tab, '}')
            tab = xhu.Print(tab, '}')

        tab = xhu.Print(tab, '}, // Close yAxis')
        return tab


    #==========================================================================
    def miscOption(self, chartIdx, tab = '', endOfListChar=',' ):
        """
        Used by setup()
        Uses None
        """

        # Tooltip
        tab = xhu.Print(tab, 'tooltip:')
        tab = xhu.Print(tab, '{')
        tab = xhu.Print(tab, 'snap: 20,')
        tab = xhu.Print(tab, 'crosshairs: [true, true],')

#	    tab = xhu.Print(tab, 'shared: true,') # Highchart 2.1

        # Log scale
        if self.xP.inputs['logy'] == 1:
            tab = xhu.Print(tab, 'formatter:')
            tab = xhu.Print(tab, 'function()')
            tab = xhu.Print(tab, '{')
#	            tab = xhu.Print(tab, 'return this.series.name+":"+ Math.pow(10,this.y);')
            tab = xhu.Print(tab, 'return Math.pow(10,this.y);')
            tab = xhu.Print(tab, '},')

        tab = xhu.Print(tab, '},')

        # Loading
        tab = xhu.Print(tab, 'loading:' )
        tab = xhu.Print(tab, '{')
        tab = xhu.Print(tab, 'showDuration: 1000,') # milliseconds
        tab = xhu.Print(tab, '},')

        return tab

    #
    #
    # Tooltip
    #
    #

    #==========================================================================
    def tooltipClick(self, chartIdx, tab = '' ):
        """
        """

        tab = xhu.Print(tab, 'this.series.name+", "')

        # Special format for time
        if 'time' in self.xP.xVarList[ chartIdx[0] ]:
            tab = xhu.Print(tab, '+Highcharts.dateFormat("%a %b %d, %Y %H:%M:%S UTC", this.x)')
        else:
            tab = xhu.Print(tab, '+this.x')

        tab = xhu.Print(tab, '+", "+%s.toPrecision(5)' % ('Math.pow(10,this.y)' if self.xP.inputs['logy'] else 'this.y'))
        tab = xhu.Print(tab, '+", %s "+this.fill+", %s "+this.run+", %s "+this.lb' % (
                self.xP.niceLabelAbbr['fill'],
                self.xP.niceLabelAbbr['run'],
                'LB'))

        return tab


    #==========================================================================
    def tooltipPrintRow(self, tab, var, labels, units, noCR=False, textinbetween=''):
        label = ''
        unit  = ''
        if var in labels.keys(): label = labels[var]
        if var in units .keys(): unit  = units[var]
        if len(unit):
            if '10' in unit:
                unit = '&times;'+unit
        if noCR:
            return xhu.Print(tab, '+"<b>%s</b>"+this.%s+" %s"' % (textinbetween, var, unit))
        return xhu.Print(tab, '+"<br/><b>%s</b> "+this.%s+" %s"' % (label, var, unit))

    #==========================================================================
    def tooltipSetup(self, chartIdx, tab = '' ):
        """
        Used by setup()
        Uses None
        """
        self.xPLabel = self.xP.niceLabelAbbr

        tab = xhu.Print(tab, '"<b>Name</b>: "+this.series.name+"<br/>"')
        tab = xhu.Print(tab, '+"<b>X</b>: "')

        # Special format for time
        if 'time' in self.xP.xVarList[ chartIdx[0] ]:
            tab = xhu.Print(tab, '+Highcharts.dateFormat("%a %b %d, %Y %H:%M:%S UTC", this.x)')
        else:
            tab = xhu.Print(tab, '+this.x')

        # Standard formatting
        tab = xhu.Print(tab, '+""')
        tab = xhu.Print(tab, '+"<br/><b>Y</b>: "+%s.toPrecision(5)' % ('Math.pow(10,this.y)' if self.xP.inputs['logy'] == 1 else 'this.y'))
#	        tab = xhu.Print(tab, '+"<br/>__________________________"')
        tab = xhu.Print(tab, '+Highcharts.dateFormat("<br/><b>T:</b> %a %b %d, %Y %H:%M:%S", 1000*this.time)+" UTC"')
        tab = xhu.Print(tab, '+"<br/><b>%s, %s, LB</b> "+this.fill+", "+this.run+", "+this.lb' % ( self.xPLabel['fill'], self.xPLabel['run']))
        tab = xhu.Print(tab, '+"<br/><b>No. bunches colliding </b> "+this.bunches')
        tab = xhu.Print(tab, '+"<br/><b>No. in <font color=blue>CW</font> beam1</b> "+this.nbunch1')
        tab = xhu.Print(tab, '+"<br/><b>No. in <font color=red>CCW</font> beam2</b> "+this.nbunch2')
#        tab = xhu.Print(tab, '+"<br/><b>No. minbias &quot;mu&quot;</b> "+(this.bunchlumi*6.358).toPrecision(3)') # = (1e30cm-2s-1) * 71.5 (mb) / 11.24558 (Hz)
        tab = xhu.Print(tab, '+"<br/><b>No. minbias &quot;mu&quot;</b> "+(this.bunchlumi*7.114).toPrecision(3)') # = (1e30cm-2s-1) * 80 (mb) / 11.24558 (Hz)

        tab = self.tooltipPrintRow(tab, 'bunchlumi',  self.xP.niceLabelAbbr, self.xP.niceLabelUnit)
        tab = self.tooltipPrintRow(tab, 'lumi',       self.xP.niceLabelAbbr, self.xP.niceLabelUnit)
        tab = self.tooltipPrintRow(tab, 'lblumi',     self.xP.niceLabelAbbr, self.xP.niceLabelUnit)
        tab = self.tooltipPrintRow(tab, 'lblength',   self.xP.niceLabelAbbr, self.xP.niceLabelUnit, True, ' in ')

        for item in ['xbp','rbp','rap','rav']:
            tab = xhu.Print(tab, '+"<br/><b>%s</b> "+(this.%s).toPrecision(4)+" %s"' % ( self.xP.niceLabelAbbr[item], item, self.xP.niceLabelUnit[item] ))

        for item in ['tbp','tap','tav']:
            tab = xhu.Print(tab, '+"<br/><b>%s</b> "+this.%s+" %s"' % ( self.xP.niceLabelAbbr[item], item, self.xP.niceLabelUnit[item] ))

        for item in ['psv','vto']:
            tab = xhu.Print(tab, '+"<br/><b>%s</b> "+(this.%s).toPrecision(4)+" %s"' % ( self.xP.niceLabelAbbr[item], item, self.xP.niceLabelUnit[item] ))

#	        tab = xhu.Print(tab, '+"<br/><b>%s, %s approx</b> "+this.psv+","+this.vto+"<br/>"' % ( self.xPLabel['psv'], self.xPLabel['vto'] ))

        return tab


    #==========================================================================
    def dataFormat(self, xChartIdx, tab = ''):
        """
        Used by None
        Uses None
        """

        # \todo Make the latest points blink (?) and latest run larger

#	        tab = xhu.Print(tab, 'data%d = $.map(data, function(point) {' % ( xChartIdx ))
#	        tab = xhu.Print(tab, 'console.log(point);')
#	        tab = xhu.Print(tab, 'if (point == data%d[-1]) {' % ( xChartidx ))
#	        tab = xhu.Print(tab, 'point = {')
#	        tab = xhu.Print(tab, 'y: point,')
#	        tab = xhu.Print(tab, 'marker: {')
#	        tab = xhu.Print(tab, 'symbol: "square"')
#	        tab = xhu.Print(tab, '}')
#	        tab = xhu.Print(tab, '};')
#	        tab = xhu.Print(tab, '}')
#	        tab = xhu.Print(tab, 'return point;')
#	        tab = xhu.Print(tab, '});')

        return tab


    #
    #
    # Utility functions
    #
    #

    #==========================================================================
    def getChartName(self, chartIdx, type):
        """
        Used by many functions
        Uses getChartIdx()
        """

        # Unpack
        xChartIdx   = self.getChartIdx(chartIdx,'xAxis')
        yChartIdx   = self.getChartIdx(chartIdx,'yAxis')
        xChartName  = self.xP.xVarList[ xChartIdx ]
        yChartName  = self.xP.yVarList[ yChartIdx ]

        # For 'yAxis'
        if type == 'yAxis':
            return yChartName

        # For 'xAxis', check if it is 'lumi'
        if 'lumi' in xChartName:
            if 'x' == yChartName[0]:
                return 'bunchlumi'
            else:
                return 'lumi'

        return xChartName


    #==========================================================================
    def getChartIdx(self, chartIdx, type):
        """
        Used by many functions, getChartName()
        Uses None
        """

        if 'y' in type:
            return chartIdx[1]
        return chartIdx[0]


    #==========================================================================
    def getChartNumber(self, chartIdx):
        """
        Used by many functions
        Uses None
        """

        chartNumber = 0
        for i in xrange(len(chartIdx) ):
            j = len(chartIdx) - i - 1
            chartNumber += math.pow(10,j)*(chartIdx[i] + 1)

        return int(chartNumber)






#!/usr/bin/env python

###########################################################################
#
# Input:    run = last2, comma-separated, range
# Output:   runlist = [1140, 1141]
# Uses:     xmonRootHandler
#
# def parseRunranges()
# def checkRun()
# def getNumberEntries()
# def readLastTime()
# def readLastLB()
# def readLastNrun()
# def readLastRunCOOL()
# def readLastRunTRP()
# def readLastRun()
# def readLast()
# def noDuplicates()
#
###########################################################################

import os
import sys
import re
import datetime

m_lastdir='/afs/cern.ch/user/r/rewang/www/xmon/last'

#==========================================================================
# Used by many
# Uses checkRun()
#
def parseRunranges(run=[]):

    run = ','.join(run)

    # Return object
    runlist = []

#	    # Set-up
#	    lastRun = readLastRunNumber()
#
#	    # If 'update', open text file & re-deterrunmine run
#	    runmin  = checkRun( runlist[0], 'runmin' )
#	    runmax  = lastRun+1
#	    if 'update' in run:
#	        run = '%d-%d' % ( lastRun, runmax )
#
#	    # Any non-integer inputs?
#	    if re.search('[a-z]', run):
#
#	        # All runs
#	        if 'all' in run:
#	            runlist.extend( range(runmin, runmax+1) )
#
#	        # LastN runs
#	        if 'last' in run:
#
#	            try:
#	                run = str( run.split(runType)[0] )
#	            except:
#	                print 'Could not find how many runs to process'
#	                sys.exit()
#
#	            # Figure out how many runs to process
#	            nRunProcessed = 0
#	            try:
#	                nRunProcessed = int ( run.split('last')[1] )
#	            except:
#	                print 'Could not find how many runs to process'
#	                sys.exit()
#
#	            # Run list
#	            runlist = makeLastRunlist( nRunProcessed )
#
#	    # Parse input
#	    else:

    # Comma-separated parsing (no blank spaces!)
    commalist = run.replace(' ','').split(',')
    for runitem in commalist:

        # Dash-separated parsing
        dashlist = runitem.split('-')
        if len(dashlist) == 1:
            try:
                runlist.append(int(runitem))
            except:
                print 'Non-integer run:', runitem
            continue
        elif len(dashlist) == 2:
            try:
                # Dash range in backwards order? No problem.
                runset = [ int(dashlist[0]), int(dashlist[1]) ]
                runset.sort()
                runrange = range( runset[0], runset[1] )
                runlist.extend( runrange )
            except:
                print 'Non-integer range:', dashlist
            continue

        else:
            print 'Illegal run range', commalist
            sys.exit()

    # Get rid of duplicates & sort it
    return noDuplicates(runlist)


#==========================================================================
# Used by parseRunranges()
# Uses none
#
def checkRun(runitem, message = ''):

    # Re-cast
    runitem = str(runitem)

    # Error check
    if len(runitem) < 1:
        print 'Missing run'
        sys.exit()

    # Only integer run
    run = -1
    try:
        run = int(runitem)
    except:
        print 'Non-integer run', runitem
        sys.exit()

    # Does it make sense?
    runmin = 10000
    runmax = 200000
    if run > runmax or run < runmin:
        print 'Error in run. Is it', runmin, '<', run, '<', runmax, '?'
        sys.exit()

    return run


#==========================================================================
def getNumberEntries(rootName='', treeName='ntp1'):

    nentries = 0
    tchain = TChain( treeName )

    if os.path.isfile( rootName ):
        tchain.Add( rootName )
        nentries = int( tchain.GetEntries() )

    return nentries


#	#==========================================================================
#	# Used by parseRunranges(), many
#	# Uses readLastRunNumber()
#	#
#	def makeLastRunlist(nRunProcessed, dir = '/afs/cern.ch/user/x/xmon/www/root'):
#
#	    # List to return
#	    runlist = []
#
#	    # Fetch last run number
#	    lastRunNumber = readLastRunNumber()
#
#	    # ROOT file handler
#	    xrh = xmonRootHandler()
#
#	    # Add to list if root file has events
#	    while nRunProcessed > 0:
#
#	        # Debug
#	        if lastRunNumber < 1000:
#	            print 'Error: illegal run number %d, exiting' % ( lastRunNumber )
#	            sys.exit()
#
#	        # Get file
#	        rootName = os.path.join(dir, 'run%d.root' % lastRunNumber)
#	        nentries = getNumberEntries( rootName )
#
#	        # Add to list
#	        if nentries > 0:
#	            runlist.append( lastRunNumber )
#	            nRunProcessed -= 1
#
#	        # Find the next one!
#	        lastRunNumber -= 1
#
#	    return runlist


#==========================================================================
# These files are defined in m_lastdir
#
def readLastTime():     return readLast('time.txt',     m_lastdir)
def readLastLB():       return readLast('lb.txt',       m_lastdir)
def readLastNrun():     return readLast('nrun.txt',     m_lastdir)
def readLastRunCOOL():  return readLast('run_cool.txt', m_lastdir)
def readLastRunTRP():   return readLast('run_trp.txt',  m_lastdir)
def readLastRun(ntup=''):
    if   ntup=='cool' : return readLastRunCOOL()
    elif ntup=='trp'  : return readLastRunTRP()
    #return readLastRunCOOL()
    return readLastRunTRP()

#==========================================================================
# Uses none
#
def readLast(file='lasttime.txt', dir=''):

    if len(dir)==0:
        dir = m_lastdir

    isrun = 'run' in file

    name = os.path.join(dir, file)

    # Return value
    last = []

    # Read-in most-recent run from a text file
    try:
        lastfile = open( name, 'r' )
        try:
            # Remember, we want the last line
            for line in lastfile:
                last.append(line.strip())
        finally:
            lastfile.close()
    except:
        print 'Could not open %s' % name
        pass

    # Reverse order
    n = len(last)
    rev = []
    for i in range(n):
        rev.append(last[n-i-1])

    return rev #last



#==========================================================================
# The preferred method is below, but not avail for python 2.3...
# result = sorted(set(runlist))
#
def noDuplicates(runlist):

    result = []
    for i, item in enumerate(runlist):
        if i==0:
            result.append(item)
        else:
            if result[i-1] != item:
                result.append(item)

    result.sort()
    return result

#eof

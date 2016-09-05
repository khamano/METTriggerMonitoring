#!/usr/bin/env python

###########################################################################
#
# def defaultLists()
# def parseCut()
# def readInput()
# def getTChain()
# class xmonParams()
#   def __init__()
#
###########################################################################

#import cgitb
#cgitb.enable()

import cgi
import os
import ROOT
import TrigXMonitor.xmonListUtility as xlu
import TrigXMonitor.xmonHtmlUtility as xhu

link = {}
link['cookies'] = 'http://www.google.com/support/accounts/bin/answer.py?hl=en&answer=61416'
comingsoon = '<span class="sc" style="color:red;">Soon</span>'


#==========================================================================
# There are two types of variable lists
# 1. 'evt'  contains variables like 'lumi' & 'time'
# 2. 'trig' contains variables like 'L1_EM2', etc.
#
def defaultLists():

    varprop = dict() # Map of variable type -> variable property
    varname = dict() # Map of variable type -> variable names
    varcuts = dict() # Map of variable type -> variable cuts

    for vartype in ['evt','trig']:
        varname[vartype] = []
        varcuts[vartype] = []

        # Each variable has a set of properties associated with it.
        varprop[vartype]                  = {}
        varprop[vartype]['name']          = [] # 'xbp__L1_EM3'
        varprop[vartype]['type']          = [] # 'f' for float
        varprop[vartype]['operator']      = {} # '<='
        varprop[vartype]['value']         = {} # '0.1'
        varprop[vartype]['size']          = 0  # 10
        varprop[vartype]['formatFirst']   = '' # %.1f
        varprop[vartype]['formatRest']    = '' # %.3f

    # "evt" default list
    varname['evt'].append('time/f')        # 0
    varname['evt'].append('lumi/f')        # 1
    varname['evt'].append('fill/i')        # 2
    varname['evt'].append('run/i')         # 3
    varname['evt'].append('lb/i')          # 4
    varname['evt'].append('lblumi/f')      # 5
    varname['evt'].append('lblength/f')    # 6
    varname['evt'].append('bunches/i')     # 7
    varname['evt'].append('nbunch1/i')     # 8
    varname['evt'].append('nbunch2/i')     # 9
    varname['evt'].append('bunchlumi/f')   # 10
    varname['evt'].append('mu/f')          # 11

    # "trig" default list
    #varname['trig'].append('L1_XE50/f')
    #varname['trig'].append('HLT_xe80_tc_lcw_L1XE50/f')
    varname['trig'].append('HLT_xe110_mht_L1XE50/f')
    #varname['trig'].append('HLT_xe100_tc_lcw_L1XE50/f')
    #varname['trig'].append('HLT_xe90_mht_L1XE50/f')
    #varname['trig'].append('HLT_xe100_mht_L1XE50/f')





#	    varname['trig'].append('L1_4J10/f')
#	    varname['trig'].append('L1_5J10/f')
#	    varname['trig'].append('L1_EM3/f')
#	    varname['trig'].append('EF_e20_medium/f')
#	    varname['trig'].append('EF_mu4/f')
#	    varname['trig'].append('L1_TAU5/f')
#	    varname['trig'].append('L1_MU0/f')
#	    varname['trig'].append('L1_BCM_AC_CA_BGRP0/f')
#	    varname['trig'].append('L1_J5/f')
#	    varname['trig'].append('L1_XE15/f')

    return [ varprop, varname, varcuts ]


#==========================================================================
def parseCut(varcuts, vartype):

    # Parse input
    alllist        = varcuts
    alln           = len(alllist)
    allname        = []
    alltype        = []
    allvalue       = {}
    alloperator    = {}
    allformatFirst = '%s"' # For first line -- 'tab'
    allformatOther = '%s"' # For all but first line -- 'tab'

    # For 'n' variables, determine name and type (int/float)
    for i in xrange(alln):

        # Parse fields 'xbp__L1_EM3/f/>/0' -> ['xbp__L1_EM3', 'f', '>', '0']
        thisfields = alllist[i].split('/')

        thisname    = ''   # name -- default is lumi
        thistype    = 'i'  # type -- default is integer
        thisformat  = '%d' # format
        thisoperator= ''   # cut operator
        thisvalue   = 0.   # cut value

        if len(thisfields) > 0: thisname     = thisfields[0]
        if len(thisfields) > 1: thistype     = thisfields[1]
        if len(thisfields) > 2: thisoperator = thisfields[2]
        if len(thisfields) > 3: thisvalue    = thisfields[3]
        if thistype == 'f':
            thisformat = '%.5f' # Parse print type

        allname.append( thisname )
        alltype.append( thistype.lower() )
        alloperator[thisname] = thisoperator
        allvalue[thisname]    = float( thisvalue )

        if i>0:
            allformatFirst += ',' # for all but first entry
            allformatOther += ',' # for all but first entry

        allformatFirst += '%s'
        allformatOther += thisformat

    allformatFirst += '%s' # for end-of-line char
    allformatOther += '%s' # for end-of-line char

    # Save
    prop = {}
    prop['name']         = allname
    prop['type']         = alltype
    prop['operator']     = alloperator
    prop['value']        = allvalue
    prop['size']         = alln
    prop['formatFirst']  = allformatFirst
    prop['formatOther']  = allformatOther

    return prop




#==========================================================================
def readInput():

    # Store QUERY_STRING
    QUERY_STRING = cgi.FieldStorage()

    # Advertised inputs
    inputs = dict()
    inputs['favtrigs']      = [comingsoon]
    inputs['browser']       = os.getenv('HTTP_USER_AGENT')
    inputs['ipaddress']     = os.getenv('REMOTE_ADDR')
    inputs['email']         = os.getenv('REMOTE_USER')
    inputs['user']          = os.getenv('USER')
    inputs['login']         = ''
    try:
        inputs['login']     = os.getenv('REMOTE_USER').split('@')[0] # os.getenv('HTTP_ADFS_LOGIN')
    except:
        inputs['login']     = '...'
    inputs['run']           = QUERY_STRING.getlist('run')
    inputs['lbsample']      =   str(QUERY_STRING.getfirst('lbsample',       'auto'))
    inputs['mode']          =   str(QUERY_STRING.getfirst('mode',           'compare')) # merge compare
    inputs['ps']            =   str(QUERY_STRING.getfirst('ps',             'av'))      # bp:"before ps" ap:"after ps" av:"after veto"
    inputs['xcut']          =   int(QUERY_STRING.getfirst('xcut',           '1'))       # 1 0
    inputs['logy']          =   int(QUERY_STRING.getfirst('logy',           '0'))       # 1 0
    inputs['grid']          =   str(QUERY_STRING.getfirst('grid',           'xy'))      # none x y xy
    inputs['page']          =   str(QUERY_STRING.getfirst('page',           'full'))    # full chart TODO: js png pdf
    inputs['ntup']          =   str(QUERY_STRING.getfirst('ntup',           'trp'))     # defualt: cool trp

    # Unadvertised inputs
    inputs['rootdir']       =   str(QUERY_STRING.getfirst('rootdir',        os.getenv('XMONROOTDIR')))
    inputs['width']         =   int(QUERY_STRING.getfirst('width',          '650'))
    inputs['height']        =   int(QUERY_STRING.getfirst('height',         '450'))
    inputs['nevt']          =   int(QUERY_STRING.getfirst('nevt',           '-1'))
    inputs['ymin']          =       QUERY_STRING.getfirst('ymin',           '0')
    inputs['ymax']          =       QUERY_STRING.getfirst('ymax',           'null')
    inputs['debug']         =   int(QUERY_STRING.getfirst('debug',          '0'))
    inputs['yunits']        =   int(QUERY_STRING.getfirst('yunits',         '1'))       # 1 = nb, Hz, evts
    inputs['xunits']        =   int(QUERY_STRING.getfirst('xunits',         '1'))       # 1 = 1e30

     # RJ
    inputs['nrun']        =   int(QUERY_STRING.getfirst('nrun',             '3'))
#    inputs['autorun']     =   int(QUERY_STRING.getfirst('autorun',       '0'))

#    if inputs['autorun']==1:
#	print '<font color="red">AUTORUN is enabled, please wait ... </font></a><br>'


#    if not inputs['yunits'] in [1, 1e3, 1e6]: inputs['yunits'] = 1
#    if not inputs['xunits'] in [1, 1e3, 1e6]: inputs['xunits'] = 1

    # Cuts -- done in xmonDataObject::cutVar()
    inputs['lblengthmin']   = float(QUERY_STRING.getfirst('lblengthmin',    '55'))      # seconds
    inputs['lblengthmax']   = float(QUERY_STRING.getfirst('lblengthmax',    '65'))
    inputs['lumimin']       = float(QUERY_STRING.getfirst('lumimin',        '0.01'))    # ''
    inputs['lumimax']       = float(QUERY_STRING.getfirst('lumimax',        '-1'))      # ''
    inputs['bunchlumimin']  = float(QUERY_STRING.getfirst('bunchlumimin',   '0.01'))    # 1e30
    inputs['bunchlumimax']  = float(QUERY_STRING.getfirst('bunchlumimax',   '-1'))      # ''
    inputs['mumin']         = float(QUERY_STRING.getfirst('mumin',          '0.01'))
    inputs['mumax']         = float(QUERY_STRING.getfirst('mumax',          '-1'))
    inputs['bunchesmin']    = float(QUERY_STRING.getfirst('bunchesmin',     '0'))
    inputs['bunchesmax']    = float(QUERY_STRING.getfirst('bunchesmax',     '-1'))
    inputs['L1_XE50min']    = float(QUERY_STRING.getfirst('L1_XE50min',   '10000'))
    inputs['L1_XE50max']    = float(QUERY_STRING.getfirst('L1_XE50max',   '-1'))
    inputs['HLT_xe80_tc_lcw_L1XE50min']    = float(QUERY_STRING.getfirst('HLT_xe80_tc_lcw_L1XE50min',   '10000'))
    inputs['HLT_xe80_tc_lcw_L1XE50max']    = float(QUERY_STRING.getfirst('HLT_xe80_tc_lcw_L1XE50max',   '-1'))
    inputs['HLT_xe90_tc_lcw_L1XE50min']    = float(QUERY_STRING.getfirst('HLT_xe90_tc_lcw_L1XE50min',   '10000'))
    inputs['HLT_xe90_tc_lcw_L1XE50max']    = float(QUERY_STRING.getfirst('HLT_xe90_tc_lcw_L1XE50max',   '-1'))
    inputs['HLT_xe100_tc_lcw_L1XE50min']    = float(QUERY_STRING.getfirst('HLT_xe100_tc_lcw_L1XE50min',   '10000'))
    inputs['HLT_xe100_tc_lcw_L1XE50max']    = float(QUERY_STRING.getfirst('HLT_xe100_tc_lcw_L1XE50max',   '-1'))
    inputs['HLT_xe90_mht_L1XE50min']    = float(QUERY_STRING.getfirst('HLT_xe90_mht_L1XE50min',   '10000'))
    inputs['HLT_xe90_mht_L1XE50max']    = float(QUERY_STRING.getfirst('HLT_xe90_mht_L1XE50max',   '-1'))
    inputs['HLT_xe100_mht_L1XE50min']    = float(QUERY_STRING.getfirst('HLT_xe100_mht_L1XE50min',   '10000'))
    inputs['HLT_xe100_mht_L1XE50max']    = float(QUERY_STRING.getfirst('HLT_xe100_mht_L1XE50max',   '-1'))


    # Default plotted variables
    lists = defaultLists()
    varprop = lists[0] # Map of variable type -> variable property
    varname = lists[1] # Map of variable type -> variable names
    varcuts = lists[2] # Map of variable type -> variable cuts

    # QUERY_STRING plotted variables
    for vartype in ['evt','trig']:

        # ['L1_EM2,L1_EM3','L1_EM5'] --> ['L1_EM2','L1_EM3','L1_EM5']
        commalist = QUERY_STRING.getlist(vartype)
        newlist = []
        for commaitem in commalist:
            templist = commaitem.split(',')
            for tempitem in templist:
                newlist.append( tempitem.replace(' ','') )

        # Read-in Name/Type/Operator/Value
        varcuts[vartype] = newlist

        # If no cuts, then just set to name
        if len( varcuts[vartype] )==0:
            varcuts[vartype] = varname[vartype]

        # Parse Name/Type/Operator/Value
        varprop[vartype] = parseCut( varcuts[vartype], vartype )

    inputs['evtlist'] = varname
    inputs['varlist'] = varprop

    #
    # Read-in recent runs
    #
    if len(inputs['run']) == 0:
        inputs['run'].extend( xlu.readLastRun()[:inputs['nrun']] )
#	        inputs['run'].append('178109')

    # If not, put some by hand
    if len(inputs['run']) == 0:
        inputs['run'].append('180153')
        inputs['run'].append('178109')
#	        inputs['run'].append('177965')
#	        inputs['run'].append('177682')
#	        inputs['run'].append('167680')

    inputs['lastrunlist'] = 20
    inputs['lastrunshow'] = 5

    return inputs


#==========================================================================
# Used by readInput()
# Uses ROOT
#
def getTChain(runlist, rootdir, ntup='cool', debug=0):

    tab = ''

    # Open root files
    tchain = ROOT.TChain( 'ntp1' )
    for run in runlist:
        file = '%s/%d_%s.root' % ( rootdir, run, ntup )
        if not os.path.exists( file ):
            tab = xhu.Print(tab, 'ERROR - input root file "%s" does not exist, continuing' % file)
            continue

        status = tchain.Add( file )

        if debug > 0:
            tab = xhu.Print(tab, '<!-- DEBUG added %s to tchain STATUS = %d -->' % (file, status))

    # Debug
    if debug > 1:
        tab = xhu.Print(tab, '<!-- DEBUG ')
        tab = xhu.Print(tab, tchain.Print() )
        tab = xhu.Print(tab, '-->')

    return tchain


#==========================================================================
class xmonParams:

    def __init__(self):

        # Parse QUERY_STRING
        self.inputs = readInput()

        # Open ROOT file
        self.inputs['runlist'] = xlu.parseRunranges(self.inputs['run'])
        self.inputs['tchain'] = getTChain(self.inputs['runlist'], self.inputs['rootdir'], self.inputs['ntup'])

        #
        # Nice labels
        #

        self.nShowHide      = dict()
        self.nTrigColumns   = 4
        self.nChartColumns  = 2
        self.xAxisVarList   = [] # x-axis vars will be referred by xChartIdx
        self.xAxisVarLumi   = {} # x-axis luminosity variable depends on the y-axis variable
        self.yAxisVarList   = [] # y-axis vars will be referred by yAxisChartIdx, yTypeChartIdx
        self.cellColor      = {}
        self.niceName       = {}
        self.niceFormula    = {}
        self.niceLabel      = {}
        self.niceLabelAbbr  = {}
        self.niceLabelUnit  = {}

        # User input
        self.xVarList = [ 'time', 'lumi', 'mu', ]     # xAxisChartIdx
        self.yVarList = [ 'x', 'r', ]           # yAxisChartIdx

        # User input
        self.niceName   ['rbp']        = 'rate'
        self.niceName   ['rap']        = 'rate'
        self.niceName   ['rav']        = 'rate'
        self.niceName   ['xbp']        = 'cross section'
        self.niceName   ['xap']        = 'cross section'
        self.niceName   ['xav']        = 'cross section'
        self.niceFormula['xbp']        = '(rate) / (inst. lumi. per pp crossing)'
        self.niceFormula['xap']        = '(rate) / (inst. lumi. per pp crossing)'
        self.niceFormula['xav']        = '(rate) / (inst. lumi. per pp crossing)'
        self.niceFormula['rbp']        = '(lumi-block counts) / (lumi-block time span)'
        self.niceFormula['rap']        = '(lumi-block counts) / (lumi-block time span)'
        self.niceFormula['rav']        = '(lumi-block counts) / (lumi-block time span)'
        self.cellColor  ['time']       = 'red'
        self.cellColor  ['bunchlumi']  = 'blue'
        self.cellColor  ['lumi']       = 'blue'

        # Conversions of keys to nice strings
        self.niceLabel['bunchlumi']    = 'Instantaneous luminosity per bunch'
        self.niceLabel['lumi']         = 'Instantaneous luminosity per crossing'
        self.niceLabel['lblumi']       = 'Integrated luminosity per LB'
        self.niceLabel['fill']         = 'LHC fill'
        self.niceLabel['run']          = 'ATLAS run'
        self.niceLabel['time']         = 'Time'
        self.niceLabel['lblength']     = 'Lumi-block length'
        self.niceLabel['xbp']          = 'Trigger cross section using input values'
        self.niceLabel['xap']          = 'Trigger cross section using after prescaled values'
        self.niceLabel['xav']          = 'Trigger cross section using output values'
        self.niceLabel['rbp']          = 'Trigger rate using input values'
        self.niceLabel['rap']          = 'Trigger rate using after prescaled values'
        self.niceLabel['rav']          = 'Trigger rate using output values'
        self.niceLabel['tbp']          = 'Trigger count using input values'
        self.niceLabel['tap']          = 'Trigger count using after prescaled values'
        self.niceLabel['tav']          = 'Trigger count using output values'
        self.niceLabel['psv']          = 'Trigger prescale value'
        self.niceLabel['vto']          = 'Trigger veto value'
	self.niceLabel['mu']           = 'Average number of processes per crossing'

        # Nice abbreviated strings
        self.niceLabelAbbr['bunchlumi']= 'L per bunch'
        self.niceLabelAbbr['lumi']     = 'L per crossing'
        self.niceLabelAbbr['lblumi']   = '&int;Ldt'
        self.niceLabelAbbr['mu']       = '&mu;'
        self.niceLabelAbbr['bunches']  = 'pp bunches'
        self.niceLabelAbbr['fill']     = 'Fill'
        self.niceLabelAbbr['run']      = 'Run'
        self.niceLabelAbbr['time']     = 'Time'
        self.niceLabelAbbr['lblength'] = 'LB length'
        self.niceLabelAbbr['xbp']      = 'Cross-sec.'
        self.niceLabelAbbr['xap']      = 'Cross-sec. &quot;after ps&quot;'
        self.niceLabelAbbr['xav']      = 'Cross-sec. &quot;output&quot;'
        self.niceLabelAbbr['rbp']      = 'Rate input'
        self.niceLabelAbbr['rap']      = 'Rate after ps'
        self.niceLabelAbbr['rav']      = 'Rate output'
        self.niceLabelAbbr['tbp']      = 'Counts input'
        self.niceLabelAbbr['tap']      = 'Counts after ps'
        self.niceLabelAbbr['tav']      = 'Counts output'
        self.niceLabelAbbr['psv']      = 'Prescale'
        self.niceLabelAbbr['vto']      = 'Alg. rej.'

        # For tab labels
        self.niceLabel['tab_bunchlumi']= 'vs. inst. luminosity per proton bunch'
        self.niceLabel['tab_lumi']     = 'vs. inst. luminosity per pp crossing'
        self.niceLabel['tab_time']     = 'vs. time'
        self.niceLabel['tab_fill']     = 'vs. fill number'
        self.niceLabel['tab_run']      = 'vs. run number'
        self.niceLabel['tab_xsec']     = 'trigger cross sections'
        self.niceLabel['tab_rate']     = 'trigger rates'
        self.niceLabel['tab_cnts']     = 'trigger counts'
        self.niceLabel['tab_x']        = self.niceLabel['tab_xsec']
        self.niceLabel['tab_mu']       = 'vs. &mu;'
        self.niceLabel['tab_r']        = self.niceLabel['tab_rate']
        self.niceLabel['tab_t']        = self.niceLabel['tab_cnts']
        self.niceLabel['tab_bp']       = 'before prescaling'
        self.niceLabel['tab_ap']       = 'after prescaling'
        self.niceLabel['tab_av']       = 'after vetoing'

        # Nice units
        self.niceLabelUnit['bunchlumi']= 'E30 cm^-2s^-1'
        self.niceLabelUnit['lumi']     = 'E30 cm^-2s^-1'
        self.niceLabelUnit['lblumi']   = '&mu;b-1 '
        self.niceLabelUnit['mu']       = ''
        self.niceLabelUnit['bunches']  = ''
        self.niceLabelUnit['fill']     = ''
        self.niceLabelUnit['run']      = ''
        self.niceLabelUnit['time']     = 'UTC'
        self.niceLabelUnit['lblength'] = 'sec'
        self.niceLabelUnit['xbp']      = 'nb'
        self.niceLabelUnit['xap']      = 'nb'
        self.niceLabelUnit['xav']      = 'nb'
        self.niceLabelUnit['rbp']      = 'Hz'
        self.niceLabelUnit['rap']      = 'Hz'
        self.niceLabelUnit['rav']      = 'Hz'
        self.niceLabelUnit['tbp']      = 'evt'
        self.niceLabelUnit['tap']      = 'evt'
        self.niceLabelUnit['tav']      = 'evt'
        self.niceLabelUnit['psv']      = '&larr;&nbsp;input/ps'
        self.niceLabelUnit['vto']      = '&larr;&nbsp;ps/output'
        self.niceLabelUnit['trig']     = 'evt'
        return


###############################################################################
# executed from the command line
if __name__ == '__main__':

    xhh = xmonInputHandler()
    xhh.open()
    tab = ''
    tab = xhu.Print(tab,'<p>')
    tab = xhu.Print(tab,'This is the default template.')
    tab = xhu.Print(tab,'</p>')
    xhh.close()

#eof

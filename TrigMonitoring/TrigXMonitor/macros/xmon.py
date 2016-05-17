#!/usr/bin/env python

"""
Dumps HTML
"""

import cgi
import cgitb
cgitb.enable()

import os
import sys
from optparse import OptionParser, OptionGroup
from TrigXMonitor.xmonInputHandler import xmonParams
from TrigXMonitor.xmonDataObject import xmonData
import TrigXMonitor.xmonHtmlUtility as xhu
import TrigXMonitor.xmonHtmlMaker as xhm

#==========================================================================
def chartonly(tab = ''):
    """
    Chart only
    """
    tab = xhu.Print(tab, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">')
    tab = xhu.Print(tab, '<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">')
    tab = xhm.printChartOnly(tab, options.site, xmonParams)
    tab = xhu.Print(tab,'<script type="text/javascript">')
    tab = xmonData.data(tab)
    tab = xhu.Print(tab,'</script>')
    tab = xhu.Print(tab, '</html>')
    return tab



#==========================================================================
def all(tab = '', ssi=False):
    """
    Dumps HTML
    """

    # Start
    tab = xhu.Print(tab, '<!-- BEGIN All -->')
    tab = xhu.Print(tab, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">')
    tab = xhu.Print(tab, '<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">')

    # Head
    tab = xhu.Print(tab, '<head>')
    tab = xhm.printIncludes(tab, options.site, 'includes.html' if ssi else '')
    tab = xhu.Print(tab, '</head>')

    # Body
    tab = xhu.Print(tab, '<body>')
    tab = xhm.printHeader(tab, options.site, 'header.html' if ssi else '', xmonParams)
    tab = body(tab)
    tab = xhm.printFooter(tab, options.site, 'footer.html' if ssi else '', xmonParams)
    tab = xhu.Print(tab, '</body>')

    # Data
    tab = xhu.Print(tab,'<script type="text/javascript">')
    if ssi:
#	        runliststring = '_'.join([str(i) for i in xmonParams.inputs['runlist']])
#	        tab = xhu.Print(tab, '<!--#include virtual="%s.js" -->' % runliststring)
        tab = xhu.Print(tab, '<!--#include virtual="%s.js" -->' % 'default')
    else:
        tab = xmonData.data(tab)
    tab = xhu.Print(tab,'</script>')

    # End
    tab = xhu.Print(tab, '</html>')
    tab = xhu.Print(tab, '<!-- End All -->')
    return tab


#==========================================================================
def body(tab = ''):
    """
    """
    tab = xhu.Print(tab, '<!-- BEGIN Body -->')
    tab = xhu.Print(tab, '<center>')

    # Open master tab
    tab = xhu.Print(tab, '<div class="tabber" id="mastertab">')
    tab = xhm.printAllcharts(tab, xmonParams, xmonData)

    # Make your own tab
    tab = xhu.Print(tab,'<div class="tabbertab" title="- Make your own plot -" style="width:865px;">')
    tab = xhm.printCustomize(tab, xmonParams)
    tab = xhu.Print(tab,'</div>')

#	    # Tutorial tab
#	    tab = xhu.Print(tab,'<div class="tabbertab" title="- Tutorial -" style="width:865px;">')
#	    tab = xhm.printTutorial(tab, options.site, 'tutorial.html' if options.ssi else '')
#	    tab = xhu.Print(tab,'</div>')
#
#	    # About tab
#	    tab = xhu.Print(tab,'<div class="tabbertab" title="- About -" style="width:865px;">')
#	    tab = xhm.printAbout(tab, options.site, 'about.html' if options.ssi else '')
#	    tab = xhu.Print(tab,'</div>')

    # Close all
    tab = xhu.Print(tab, '</div>')
    tab = xhu.Print(tab, '</center>')
    tab = xhu.Print(tab, '<!-- END Body -->')
    return tab


#==========================================================================
#
#
# Main
#
#

#site = 'https://cern.ch/x'
site = '..'

# Parse inputs
parser = OptionParser(usage='usage: %prog [options]', add_help_option=False)
parser.add_option('-h','--usage',       dest='help',          action='store_true',help="Show help")
parser.add_option('-r','--run',         dest='run',           default=None,       help="Make page for runrange")
parser.add_option('-l','--lbsample',    dest='lbsample',      default=None,       help="Make page for lbsample")
parser.add_option('-s','--ssi',         dest='ssi',           action='store_true',help="Don't print content -- use server-side include")
parser.add_option('-c','--cgi',         dest='cgi',           action='store_true',help="Start with 'Content-Type: text/html'")
parser.add_option('-w','--site',        dest='site', type="string", default=site, help="Server is '%s'" % site)
parser.add_option('','--chartonly',     dest='chartonly',     action='store_true',help="HTML Simple version with only charts.")
parser.add_option('','--header_html',   dest='header_html',   action='store_true',help="HTML Header     via xmonHtmlUtility")
parser.add_option('','--includes_html', dest='includes_html', action='store_true',help="HTML Includes   via xmonHtmlUtility")
parser.add_option('','--about_html',    dest='about_html',    action='store_true',help="HTML About tab  via xmonHtmlUtility")
parser.add_option('','--footer_html',   dest='footer_html',   action='store_true',help="HTML Footer     via xmonHtmlUtility")
parser.add_option('','--tutorial_html', dest='tutorial_html', action='store_true',help="HTML Tutorial   via xmonHtmlUtility")
parser.add_option('','--body_html',     dest='body_html',     action='store_true',help="HTML Body       via this script")
parser.add_option('','--runranges_html',dest='runranges_html',action='store_true',help="HTML Data range via this script")
parser.add_option('','--triggers_html', dest='triggers_html', action='store_true',help="HTML Trig lists via this script")
parser.add_option('','--data_html',     dest='data_html',     action='store_true',help="JS plot data    via this script")

(options, args) = parser.parse_args()

# Help
if options.help:
    parser.print_help()
    sys.exit()

# Modules
xmonParams = xmonParams()
xmonData = xmonData( xmonParams )

# Webpage component in order
tab = ''
if options.includes_html: tab = xhm.printIncludes   (tab, options.site, 'includes.html'  if options.ssi else '')
if options.header_html:   tab = xhm.printHeader     (tab, options.site, 'header.html'    if options.ssi else '', xmonParams)
if options.about_html:    tab = xhm.printAbout      (tab, options.site, 'about.html'     if options.ssi else '')
if options.tutorial_html: tab = xhm.printTutorial   (tab, options.site, 'tutorial.html'  if options.ssi else '')
if options.body_html:     tab = body(tab)
if options.triggers_html: tab = xhm.printTriggers   (tab, xmonParams,   'triggers.html'  if options.ssi else '')
if options.runranges_html:tab = xhm.printRunranges  (tab, xmonParams,   'runranges.html' if options.ssi else '')
if options.footer_html:   tab = xhm.printFooter     (tab, options.site, 'footer.html'    if options.ssi else '', xmonParams)
if options.data_html:     tab = xmonData.data(tab)

# If no argument given, run all
if not (options.includes_html      or \
        options.header_html        or \
        options.about_html         or \
        options.tutorial_html      or \
        options.body_html          or \
        options.triggers_html      or \
        options.runranges_html     or \
        options.footer_html        or \
        options.data_html          or \
        False):

    if   ('chart' in xmonParams.inputs['page']): tab = chartonly(tab)
    elif ('js'    in xmonParams.inputs['page']): tab = xmonData.data(tab)
    elif ('ssi'   in xmonParams.inputs['page']): tab = all(tab, True)
    else:
        tab = all(tab, options.ssi)







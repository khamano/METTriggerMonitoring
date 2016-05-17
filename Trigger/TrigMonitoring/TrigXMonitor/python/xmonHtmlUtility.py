#!/usr/bin/env python

###########################################################################
#
# Unlike other xmon*.py, the convention in this file is to capitalize the functions.
#
# def AppendEntry()
# def Print()
# def PrintSpace()
# def PrintNormal()
# def PrintSmart()
# def PrintLink()
# def PrintIndent()
# def PrintUnindent()
# def PrintChoice()
# def PrintDelta()
# def OpenMenu()
# def CloseMenu()
# def PrintMenuTrig()
# def PrintMenuRun()
# def RenameXaxis()
#
###########################################################################

comingsoon = '<span class="sc" style="color:red;">Soon</span>'

#==========================================================================
def AppendEntry(mydict={}, mykeys=[], mykey='', myentry=''):
    if len(mykey)==0:
        return
    mykeys.append(mykey)
    mydict[mykey] = myentry
    return


#==========================================================================
def Print(tab, text, noCR=False): return PrintSmart(tab, text, noCR)
def PrintSpace(tab, text, nSpace=0): return PrintSmart(tab, '&nbsp;'*nSpace + text)
def PrintNormal(tab, text, noCR=False):
    if text=='':
        print ''
    else:
        if noCR:
            print tab+text,
        else:
            print tab+text
    return tab


#==========================================================================
def PrintSmart(tab, text, noCR=False):

    # Special cases
    try:
        tag1 = text.split('>')[0].split(' ')[0].replace('<','')
        tag2 = text.split('<')[-1].split(' ')[0].replace('>','')
        if tag1==tag2[1:] and tag2[0]=='/':
            return PrintNormal(tab, text, noCR) # <tag> ends with </tag>
        if tag1 in ['br','br/','img','input','meta','link']:
            return PrintNormal(tab, text, noCR) # <tag/>
    except:
        pass

    # Indent space
    n = 1

    # Categorize HTML tags
    if   len(text)<1: return PrintNormal(tab, text, noCR)
    elif len(text)>1 and text[0:2]=='<!': return PrintNormal(tab, text, noCR)
    elif len(text)>1 and text[0:2]=='</': return PrintUnindent(tab, text, n, noCR)
    elif text[0] == '}': return PrintUnindent(tab, text, n, noCR)
    elif text[0] == ')': return PrintUnindent(tab, text, n, noCR)
    elif text[0] == ']': return PrintUnindent(tab, text, n, noCR)
    elif text[0] == '<': return PrintIndent(tab, text, n, noCR)
    elif text[0] == '{': return PrintIndent(tab, text, n, noCR)
    elif text[0] == '(': return PrintIndent(tab, text, n, noCR)
    elif text[0] == '[': return PrintIndent(tab, text, n, noCR)

    return PrintNormal(tab, text, noCR)



#==========================================================================
def PrintLink(tab, linktext, linkaddress):
    return PrintNormal(tab, '<a href="%s">%s</a>' % ( linkaddress, linktext ))


#==========================================================================
def PrintIndent(tab='', text='', n=1, noCR=False):
    if noCR:
        print tab+text,
    else:
        print tab+text

    for i in xrange(n):tab += ' '
    return tab # Indent


#==========================================================================
def PrintUnindent(tab='', text='', n=1, noCR=False):
    tab = tab[0:len(tab)-n] # Unindent
    if noCR:
        print tab+text,
    else:
        print tab+text

    return tab


#==========================================================================
def PrintChoice(tab, text, putBox=False, linkaddress='#', linkhover=''):
    box = ''
    if putBox:
        box = ' style="border:1px white solid;"'
#	    linkaddress = '#' # -- send user to current page if we are already there!

    return PrintNormal(tab, '<td%s><a href="%s" title="%s"> %s </a></td>' % ( box, linkaddress, linkhover, text ) )


#==========================================================================
def PrintDelta(tab='', delta=0.):
    tab = PrintNormal(tab, '&rarr; took only %.2f seconds!' % ( delta ))
    tab = PrintNormal(tab, '<br/>')
    tab = PrintNormal(tab, '<br/>')
    return tab

#
# Drop down menu
#

#==========================================================================
def OpenMenu(tab='', menuname='menu'):
    """
    Open drop down menu
    """
    tab = Print(tab, '<ul style="display:inline; margin:0; border:0; padding:0;" id="%s">' % menuname)
    return  tab


#==========================================================================
# Close drop down menu
#
def CloseMenu(tab=''):
    tab = Print(tab, '</ul>')
    return tab


#==========================================================================
def PrintMenuTrig(tab='', trig='', triglist={}, triglink='#', menuname='menu2'):
    tab = Print(tab, '<li class="sub" style="float:right;">')
    tab = Print(tab, '<a onmouseout="unclickMenu(%s);" onmouseover="clickMenu(%s);">%s</a>' %
                ("'%s'" % menuname,
                 "'%s'" % menuname,
                 trig))
    tab = Print(tab, '<ul>')
    savetab = tab
    for trigkey in triglist.keys():
        trigitems = triglist[trigkey]
        if trigitems==None: continue
        trigstring = trigitems.replace(' ','&trig=')
        tab = Print(tab, '<li><b>%s</b>: <a href="%s%s">%s</a></li>' % (trigkey, triglink, trigstring, trigitems), True)
        tab = ''

    tab = Print(savetab, '')
    tab = Print(tab, '</ul>')
    tab = Print(tab, '</li>')
    return tab


#==========================================================================
def PrintMenuRun(tab='', run=0, thisrun=False,
                 xmonLink       ='#',
                 compareLink    ='#',
                 datasummarylink='#',
                 runquerylink   ='#',
                 trigconflink   ='#',
                 runsummarylink ='#',
                 menuname       = 'menu'
                ):
    tab = Print(tab, '<li class="sub">')
    tab = Print(tab, '<a onmouseout="unclickMenu(%s);" onmouseover="clickMenu(%s);" %s style="%s">%d</a>'
                % ("'%s'" % menuname,
                   "'%s'" % menuname,
                   'class="selected"' if thisrun else '',
                   'border-bottom:1px dotted;' if thisrun else '',
                   run))
    tab = Print(tab, '<ul style="width:210px; padding:10px;">')
    tab = Print(tab, '<li><a href="%s">-&nbsp;Show&nbsp;this&nbsp;run&nbsp;only</a></li>'           % xmonLink)
    tab = Print(tab, '<li><a href="%s">-&nbsp;Compare&nbsp;with&nbsp;this&nbsp;run</a></li>'        % compareLink)
    tab = Print(tab, '<li><a href="%s">-&nbsp;Entry&nbsp;in&nbsp;Data&nbsp;Summary</a></li>'        % datasummarylink)
    tab = Print(tab, '<li><a href="%s">-&nbsp;Entry&nbsp;in&nbsp;Run&nbsp;Summary</a></li>'         % runsummarylink)
    tab = Print(tab, '<li><a href="%s">-&nbsp;Entry&nbsp;in&nbsp;Run&nbsp;Query</a></li>'           % runquerylink)
    tab = Print(tab, '<li><a href="%s">-&nbsp;Entry&nbsp;in&nbsp;TrigConfig&nbsp;Query</a></li>'    % trigconflink)
    tab = Print(tab, '</ul>')
    tab = Print(tab, '</li>')

    return tab


#==========================================================================
def RenameXaxis(xAxisName, varName):

    xAxisNewName = xAxisName

    # Rename xAxis variable
    if 'lumi' in xAxisName:
        if 'x'==varName[0]: xAxisNewName = 'bunchlumi'
        else              : xAxisNewName = 'lumi'

    return xAxisNewName

#eof

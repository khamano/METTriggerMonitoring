#!/bin/bash

#####################################################################
#
# Tae Min Hong, Univ. of Pennsylvania (2011, 2012)
#
# https://cern.ch/x/cgi-bin/xmon.cgi?QUERY_STRING
# /afs/cern.ch/user/x/xmon/www/cgi-bin/xmon.cgi "QUERY_STRING"
#
# Plus d'info --
#   ln -s xmon.cgi setup.cgi
#   https://cern.ch/x/cgi-bin/setup.cgi
#
# Xmon-specific exports:
#
#   XMONROOTDIR
#   USER
#   QUERY_STRING
#
# Standard exports:
#
#   ROOTSYS
#   LD_LIBRARY_PATH
#   PATH
#   PYTHONPATH
#   PYTHONDIR
#
#####################################################################

# Ntuple repository
export XMONROOTDIR=/afs/cern.ch/work/r/rewang/public/root

# Save current values
SAVE_PATH=$PATH
SAVE_LD_LIBRARY_PATH=$LD_LIBRARY_PATH
SAVE_PYTHONPATH=$PYTHONPATH

# On what machine is it executed?
web=0
export USER=`whoami`
if [ $USER == "apache" ]; then
    # Called by webserver: needs preface
    echo "Content-Type: text/html"
    echo
    web=1
else
    # Called from command-line: use 1st argt as input & erase it
    if [ ${#QUERY_STRING} -eq 0 ]; then
        export QUERY_STRING=$1
        shift
    fi
fi

# Retrieve system info
SLC_version=$(head -1 /etc/issue | awk -F"release" '{print $2}' | sed "s/[^0-9.]"//g | awk -F"." '{print $1}')
PLATFORM_version=$(uname -i) # e.g., i686

#------------------------------------------------------------------------------
# For ROOT, set gcc version
case $SLC_version in
  4)
  case $PLATFORM_version in
    "i386")     source /afs/cern.ch/sw/lcg/contrib/gcc/4.3/slc4_ia32_gcc34/setup.sh ;;
    "x86_64")   source /afs/cern.ch/sw/lcg/contrib/gcc/4.3/slc4_amd64_gcc34/setup.sh ;;
    *)          echo "Unrecognized platform=$PLATFORM_version" ; exit 1 ;;
  esac
  ;;
  5)
  case $PLATFORM_version in
    "i386")     source /afs/cern.ch/sw/lcg/contrib/gcc/4.3/i686-slc5-gcc34-opt/setup.sh ;;
    "x86_64")   source /afs/cern.ch/sw/lcg/contrib/gcc/4.3/x86_64-slc5-gcc43-opt/setup.sh ;;
    *)          echo "Unrecognized platform=$PLATFORM_version" ; exit 1 ;;
  esac
  ;;
  6)
  case $PLATFORM_version in
    "i386")     source /afs/cern.ch/sw/lcg/contrib/gcc/4.7/i686-slc6-gcc47-opt/setup.sh ;;
    "x86_64")   source /afs/cern.ch/sw/lcg/contrib/gcc/4.7/x86_64-slc6-gcc47-opt/setup.sh ;;
    *)          echo "Unrecognized platform=$PLATFORM_version" ; exit 1 ;;
  esac
  ;;
  *)            echo "Unrecognized SLC version=$SLC_version" ; exit 1 ;;
esac

#------------------------------------------------------------------------------
# For ROOT, set python path
case $SLC_version in
  4)
  case $PLATFORM_version in
    "i386")     export PYTHONDIR=/afs/cern.ch/sw/lcg/external/Python/2.5.4/slc4_ia32_gcc43 ;;
    "x86_64")   export PYTHONDIR=/afs/cern.ch/sw/lcg/external/Python/2.5.4//slc4_amd64_gcc43 ;;
    *)          echo "Unrecognized platform=$PLATFORM_version" ; exit 1 ;;
  esac
  ;;
  5)
  case $PLATFORM_version in
    "i386")     export PYTHONDIR=/afs/cern.ch/sw/lcg/external/Python/2.5.4/i686-slc5-gcc43-opt ;;
    "x86_64")   export PYTHONDIR=/afs/cern.ch/sw/lcg/external/Python/2.6.5/x86_64-slc5-gcc43-opt ;;
    *)          echo "Unrecognized platform=$PLATFORM_version" ; exit 1 ;;
  esac
  ;;
  6)
  case $PLATFORM_version in
    "i386")     export PYTHONDIR=/afs/cern.ch/sw/lcg/external/Python/2.7.6/i686-slc6-gcc47-opt ;;
    "x86_64")   export PYTHONDIR=/afs/cern.ch/sw/lcg/external/Python/2.7.6/x86_64-slc6-gcc47-opt ;;
    *)          echo "Unrecognized platform=$PLATFORM_version" ; exit 1 ;;
  esac
  ;;
  *)            echo "Unrecognized SLC version=$SLC_version" ; exit 1 ;;
esac

export PATH=$PYTHONDIR/bin:$PATH
export LD_LIBRARY_PATH=$PYTHONDIR/lib:$LD_LIBRARY_PATH

#------------------------------------------------------------------------------
# For ROOT, set root & pyroot paths
case $SLC_version in
  4)
  case $PLATFORM_version in
    "i386")     export ROOTSYS=/afs/cern.ch/sw/lcg/app/releases/ROOT/5.22.00d/slc4_ia32_gcc43/root ;;
    "x86_64")   export ROOTSYS=/afs/cern.ch/sw/lcg/app/releases/ROOT/5.22.00d/slc4_amd64_gcc43/root ;;
    *)          echo "Unrecognized platform=$PLATFORM_version" ; exit 1 ;;
  esac
  ;;
  5)
  case $PLATFORM_version in
    "i386")     export ROOTSYS=/afs/cern.ch/sw/lcg/app/releases/ROOT/5.26.00e_python2.6/i686-slc5-gcc43-opt/root ;;
    "x86_64")   export ROOTSYS=/afs/cern.ch/sw/lcg/app/releases/ROOT/5.26.00e_python2.6/x86_64-slc5-gcc43-opt/root ;;
    *)          echo "Unrecognized platform=$PLATFORM_version" ; exit 1 ;;
  esac
  ;;
  6)
  case $PLATFORM_version in
    "i386")     export ROOTSYS=/afs/cern.ch/sw/lcg/app/releases/ROOT/5.34.20/i686-slc6-gcc47-opt/root ;;
    "x86_64")   export ROOTSYS=/afs/cern.ch/sw/lcg/app/releases/ROOT/5.34.20/x86_64-slc6-gcc47-opt/root ;;
    *)          echo "Unrecognized platform=$PLATFORM_version" ; exit 1 ;;
  esac
  ;;
  *)            echo "Unrecognized SLC version=$SLC_version" ; exit 1 ;;
esac

export PATH="$ROOTSYS/bin:$PATH"
export LD_LIBRARY_PATH="$ROOTSYS/lib:$LD_LIBRARY_PATH"
export PYTHONPATH="$ROOTSYS/pyroot:$ROOTSYS/lib:$PYTHONPATH"


###############################################################################
#
#
# Main
#
#
###############################################################################

# This is the local installation
#INSTALLBASE=/afs/cern.ch/user/t/tmhong/public/cmthome
#INSTALLBASE=/afs/cern.ch/user/t/trigcomm/www/rates_webpage/xmon/cmthome
#INSTALLBASE=/afs/cern.ch/user/x/xmon/public/cmthome
INSTALLBASE=/afs/cern.ch/user/r/rewang/public/cmthome



# Code Repository
export PYTHONPATH="$PYTHONPATH:$INSTALLBASE/InstallArea/python"
export PYTHONPATH="$PYTHONPATH:$INSTALLBASE/InstallArea/share"

# Parse input               # $0  = /CERN_WWW/atlas-project-trigger-xmonitor/cgi-bin/xmon.cgi
cgifull=${0%/*}             # $0 -> /CERN_WWW/atlas-project-trigger-xmonitor/cgi-bin
webfull=${0%/*/*}           # $0 -> /CERN_WWW/atlas-project-trigger-xmonitor
webbase=${webfull##*/}      # $0 -> atlas-project-trigger-xmonitor
cgi=${0##*/}                # $0 -> xmon.cgi
pyth=${cgi%.cgi}.py         # $0 -> xmon.py

# Determine full script path. Does webbase contain 'test'?
scriptbase="Trigger/TrigMonitoring/TrigXMonitor"
#for token in `echo $webbase | sed 's/-/ /g'`; do
#    if [ $token == 'test' ] ; then
#        scriptbase="$token-$scriptbase"
#        break
#    fi
#done
script=$INSTALLBASE/$scriptbase/macros/$pyth

# Display setup
if [ `/bin/basename $0` == "setup.cgi" ] ; then
    echo
    if [ $web -eq 1 ] ; then
        echo "This is a script to show the environment for <b>xmon</b> on the web."
        echo "<br/><br/>"
        echo "The current set-up for"
        echo "<i>`/bin/ls -hog $script`</i>"
        echo -ne "on: "
        cat /etc/issue | head -n1
        echo "<br/><br/>"
        echo "<table style='border-style:solid; border-width:thin;'>"
        echo "<tr>"
        echo "<th style='text-align:left;'>Env. var.</th>"
        echo "<th style='text-align:left;'>Value</th>"
        echo "</tr>"
        echo "<tr>"
    else
        echo "This is a script to show the environment for xmon."
        echo
        echo "The current set-up for"
        echo "`/bin/ls -hog $script`"
        echo -ne "on: "
        cat /etc/issue | head -n1
        echo
        echo -e "---------\t| --------------------------------------------------------------------"
        echo -e "Env. var.\t| Value"
        echo -e "---------\t| --------------------------------------------------------------------"
    fi

    c=-1
    let c++; var[$c]="`whoami`"             ; name[$c]="user"
    let c++; var[$c]="`/bin/hostname`"      ; name[$c]="host"
    let c++; var[$c]="$SLC_version"         ; name[$c]="SLC_version"
    let c++; var[$c]="$PLATFORM_version"    ; name[$c]="PLATFORM_version"
    let c++; var[$c]="$ROOTSYS"             ; name[$c]="ROOTSYS"
    let c++; var[$c]="$PATH"                ; name[$c]="PATH"
    let c++; var[$c]="$LD_LIBRARY_PATH"     ; name[$c]="LD_LIBRARY_PATH"
    let c++; var[$c]="$PYTHONDIR"           ; name[$c]="PYTHONDIR"
    let c++; var[$c]="$PYTHONPATH"          ; name[$c]="PYTHONPATH"
    let c++; var[$c]="$INSTALLBASE"         ; name[$c]="INSTALLBASE"
    let c++; var[$c]="$script"              ; name[$c]="script"
    let c++;
    i=0
    while [ $i -lt $c ] ; do
        if [ $web -eq 1 ] ; then
            echo "<td>${name[$i]}</td>"
        else
            echo -ne ${name[$i]}
        fi
        j=0
        for item in `echo ${var[$i]} | /bin/sed 's/:/ /g' | /bin/sort `; do
            if [ $j -eq 0 ] ; then
                if [ $web -eq 1 ] ; then
                    echo "<td>$item</td>"
                else
                    if [ ${#name[$i]} -gt 7 ] ; then
                        echo -e "\t| $item"
                    else
                        echo -e "\t\t| $item"
                    fi
                fi
            else
                if [ $web -eq 1 ] ; then
                    echo "<tr>"
                    echo "<td></td>"
                    echo "<td>$item</td>"
                    echo "</tr>"
                else
                    echo -e "\t\t| $item"
                fi
            fi
            let j++
        done
        let i++
        if [ $web -eq 1 ] ; then
            echo "</tr>"
        fi
    done
    if [ $web -eq 1 ] ; then
        echo "</table>"
    fi
    echo
    exit
fi

#	# Send me email
#	if [ `/bin/basename $0` == "xmon.cgi" ] ; then
#	    addy=tae.min.hong@cern.ch
#	    echo "subject: xmon.cgi?$QUERY_STRING" | /usr/sbin/sendmail $addy
#	fi

#	echo "<b>xmon</b> is being maintained, so infrequent updates. Email for urgent requests. We expect to be up Monday, April 9."

# Execute
python $script

# Revert
PATH=$SAVE_PATH
LD_LIBRARY_PATH=$SAVE_LD_LIBRARY_PATH
PYTHONPATH=$SAVE_PYTHONPATH

#eof

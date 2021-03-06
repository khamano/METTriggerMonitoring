#!/bin/bash

# Creates html given cut
CreateFile()
{
    file=$1
    cut=$2
    name="_$file.html"
    old=$base/html/live/$name
    new=$base/html/$name
    echo Making $old
    $exe $cut > $old
    if [ $? -eq 0 ] ; then
        mv --verbose $old $new
        ls -lh $new
    else
        echo "ERROR - $name ended in error"
    fi
}

#
#
# Main
#
#

#exe=/afs/cern.ch/user/t/tmhong/public/cmthome/TrigXMonitor/macros/xmon.cgi
#base=/afs/cern.ch/user/t/trigcomm/www/rates_webpage/xmon
exe=/afs/cern.ch/user/r/rewang/public/cmthome/Trigger/TrigMonitoring/TrigXMonitor/macros/xmon.cgi
base=/afs/cern.ch/user/r/rewang/www/xmon

i=-1
# Most recent at top -- most default at bottom
let i=$i+1; filebase[$i]="gorini"   ; cutbase[$i]="trig=L1_BCM_AC_CA_BGRP0,L1_BCM_HT_BGRP0,L1_BCM_Wide_BGRP0"
let i=$i+1; filebase[$i]="met"      ; cutbase[$i]="trig=EF_xe80_noMu,L2_xe60_noMu,L1_XE60"
let i=$i+1; filebase[$i]="met_ef"   ; cutbase[$i]="trig=EF_xe30_noMu,EF_xe40_noMu,EF_xe80_noMu,EF_te900"
let i=$i+1; filebase[$i]="jet"      ; cutbase[$i]="trig=EF_L1J175_NoAlg,L2_L1J175_NoAlg,L1_J175"
let i=$i+1; filebase[$i]="jet_ef"   ; cutbase[$i]="trig=EF_L1J175_NoAlg,EF_L1J250_NoAlg"
let i=$i+1; filebase[$i]="el_low"   ; cutbase[$i]="trig=EF_e10_medium,L2_e10_medium,L1_EM5"
let i=$i+1; filebase[$i]="el_high"  ; cutbase[$i]="trig=EF_e15_medium,L2_e15_medium,L1_EM10"
let i=$i+1; filebase[$i]="el_ef"    ; cutbase[$i]="trig=EF_e10_medium,EF_e15_medium,EF_e20_loose,EF_g20_loose,EF_2e10_medium"
let i=$i+1; filebase[$i]="mu"       ; cutbase[$i]="trig=EF_mu20,L2_mu20,L1_MU10"
let i=$i+1; filebase[$i]="mu_ef"    ; cutbase[$i]="trig=EF_mu13,EF_mu13_MG,EF_mu20,EF_2mu6,EF_2mu4_Jpsimumu,EF_2mu10_loose"
let i=$i+1; filebase[$i]="minbias"  ; cutbase[$i]="trig=L1_ZDC,L1_LUCID,L1_MBTS_1_1,L1_MBTS_4_4,EF_mbSpTrk,EF_mbZdc_eff,EF_mbLucid_eff"
let i=$i+1; filebase[$i]="lowest_ef"; cutbase[$i]="trig=EF_e15_tight,EF_mu20,EF_L1J175_NoAlg,EF_xe80_noMu,EF_te600,EF_tau125_medium"
let i=$i+1; filebase[$i]="default"  ; cutbase[$i]=""
let i=$i+1;

j=-1
# Most recent at top -- most default at bottom
#	let j=$j+1; filesfx[$j]="liny_ap"   ; cutsfx[$j]="&logy=0&ps=ap"
#	let j=$j+1; filesfx[$j]="ap"        ; cutsfx[$j]="&ps=ap"
#	let j=$j+1; filesfx[$j]="liny"      ; cutsfx[$j]="&logy=0"
let j=$j+1; filesfx[$j]=""   ; cutsfx[$j]=""
let j=$j+1;

# Make default web pages
_i=$i
while [ $_i -gt 0 ] ; do
    let _i=$_i-1
    _j=$j
    while [ $_j -gt 0 ] ; do
        let _j=$_j-1
        _file="${filebase[$_i]}" # __${filesfx[$_j]}"
        _cut="${cutbase[$_i]}${cutsfx[$_j]}"
        CreateFile $_file $_cut
    done
done

#	# Make data file for dev
#	$exe "page=js" > $base/html/live/default.js







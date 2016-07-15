#source /afs/cern.ch/atlas/project/tdaq/cmt/bin/cmtsetup.sh tdaq-06-01-01
#coca_get_files $1



year=2016
run=`echo "$1" | sed -e s/TriggerRates_ATLAS_//`
run=`echo "$run" | sed -e s/.root//`
echo $run
if (( $run<289377 )); then
   year=2015
fi

/afs/cern.ch/project/eos/installation/0.3.84-aquamarine/bin/eos.select cp /eos/atlas/atlascerngroupdisk/tdaq-mon/coca/${year}/TRP-Rates/$1 /tmp/



#xrdcp root://eosatlas.cern.ch//eos/atlas/atlascerngroupdisk/tdaq-mon/coca/2016/TRP-Rates/$1 /tmp/


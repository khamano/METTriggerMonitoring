#source /afs/cern.ch/atlas/project/tdaq/cmt/bin/cmtsetup.sh tdaq-06-01-01
#coca_get_files $1

mkdir -p /tmp/`whoami`/;
/afs/cern.ch/project/eos/installation/0.3.84-aquamarine/bin/eos.select cp /eos/atlas/atlascerngroupdisk/tdaq-mon/coca/2016/TRP-Rates/$1 /tmp/`whoami`/


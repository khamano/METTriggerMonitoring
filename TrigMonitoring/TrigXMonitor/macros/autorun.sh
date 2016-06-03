#!/bin/bash

echo "Running autorun.sh"

xtime=$(date +"%Y-%m-%d-%Hh%Mm%Slocal")
if [ $# -eq 1 ]; then
  xtime=$1
fi

#
# Main
#
BASE=/afs/cern.ch/user/r/rewang/www/xmon
###############################################################################
pushd ${BASE}/workdir
date

# Set-up Athena
source /afs/cern.ch/user/r/rewang/public/cmthome/Trigger/TrigMonitoring/TrigXMonitor/macros/autosetup.sh

# Database type
for dbtype in cool; do
  cmd="makeRoot.py --$dbtype --window=72 --dir=${BASE}/root/live --update $*"
  time $cmd

  # Move from root/live -> root
  nroot=$(ls ${BASE}/root/live | grep -c root)
  if [ $nroot -eq 0 ]; then
    echo "WARNING - No $dbtype ROOT output was made"
  else
    echo "mv -v ${BASE}/root/live/*.root ${BASE}/root/"
    mv -v ${BASE}/root/live/*.root ${BASE}/root/
    cd ${BASE}/root/;
    ls *_${dbtype}.root > ${BASE}/last/run_${dbtype}.txt
    cd -;
    sed -i "s/_trp.root//g" ${BASE}/last/run_${dbtype}.txt
  fi

done

date
popd
###############################################################################

echo "Done autorun.sh"

#eof

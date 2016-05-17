# echo "setup TrigCostMonitor TrigCostMonitor-r502829 in /afs/cern.ch/user/r/rewang/public/cmthome/Trigger/TrigMonitoring"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/CMT/v1r25p20140131; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtTrigCostMonitortempfile=`${CMTROOT}/${CMTBIN}/cmt.exe -quiet build temporary_name`
if test ! $? = 0 ; then cmtTrigCostMonitortempfile=/tmp/cmt.$$; fi
${CMTROOT}/${CMTBIN}/cmt.exe setup -sh -pack=TrigCostMonitor -version=TrigCostMonitor-r502829 -path=/afs/cern.ch/user/r/rewang/public/cmthome/Trigger/TrigMonitoring  -no_cleanup $* >${cmtTrigCostMonitortempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/${CMTBIN}/cmt.exe setup -sh -pack=TrigCostMonitor -version=TrigCostMonitor-r502829 -path=/afs/cern.ch/user/r/rewang/public/cmthome/Trigger/TrigMonitoring  -no_cleanup $* >${cmtTrigCostMonitortempfile}"
  cmtsetupstatus=2
  /bin/rm -f ${cmtTrigCostMonitortempfile}
  unset cmtTrigCostMonitortempfile
  return $cmtsetupstatus
fi
cmtsetupstatus=0
. ${cmtTrigCostMonitortempfile}
if test $? != 0 ; then
  cmtsetupstatus=2
fi
/bin/rm -f ${cmtTrigCostMonitortempfile}
unset cmtTrigCostMonitortempfile
return $cmtsetupstatus


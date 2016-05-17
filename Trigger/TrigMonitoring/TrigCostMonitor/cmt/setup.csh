# echo "setup TrigCostMonitor TrigCostMonitor-r502829 in /afs/cern.ch/user/r/rewang/public/cmthome/Trigger/TrigMonitoring"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/CMT/v1r25p20140131
endif
source ${CMTROOT}/mgr/setup.csh
set cmtTrigCostMonitortempfile=`${CMTROOT}/${CMTBIN}/cmt.exe -quiet build temporary_name`
if $status != 0 then
  set cmtTrigCostMonitortempfile=/tmp/cmt.$$
endif
${CMTROOT}/${CMTBIN}/cmt.exe setup -csh -pack=TrigCostMonitor -version=TrigCostMonitor-r502829 -path=/afs/cern.ch/user/r/rewang/public/cmthome/Trigger/TrigMonitoring  -no_cleanup $* >${cmtTrigCostMonitortempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/${CMTBIN}/cmt.exe setup -csh -pack=TrigCostMonitor -version=TrigCostMonitor-r502829 -path=/afs/cern.ch/user/r/rewang/public/cmthome/Trigger/TrigMonitoring  -no_cleanup $* >${cmtTrigCostMonitortempfile}"
  set cmtsetupstatus=2
  /bin/rm -f ${cmtTrigCostMonitortempfile}
  unset cmtTrigCostMonitortempfile
  exit $cmtsetupstatus
endif
set cmtsetupstatus=0
source ${cmtTrigCostMonitortempfile}
if ( $status != 0 ) then
  set cmtsetupstatus=2
endif
/bin/rm -f ${cmtTrigCostMonitortempfile}
unset cmtTrigCostMonitortempfile
exit $cmtsetupstatus


# echo "cleanup TrigXMonitor TrigXMonitor-r502829 in /afs/cern.ch/user/r/rewang/public/cmthome/Trigger/TrigMonitoring"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/CMT/v1r25p20140131
endif
source ${CMTROOT}/mgr/setup.csh
set cmtTrigXMonitortempfile=`${CMTROOT}/${CMTBIN}/cmt.exe -quiet build temporary_name`
if $status != 0 then
  set cmtTrigXMonitortempfile=/tmp/cmt.$$
endif
${CMTROOT}/${CMTBIN}/cmt.exe cleanup -csh -pack=TrigXMonitor -version=TrigXMonitor-r502829 -path=/afs/cern.ch/user/r/rewang/public/cmthome/Trigger/TrigMonitoring  $* >${cmtTrigXMonitortempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/${CMTBIN}/cmt.exe cleanup -csh -pack=TrigXMonitor -version=TrigXMonitor-r502829 -path=/afs/cern.ch/user/r/rewang/public/cmthome/Trigger/TrigMonitoring  $* >${cmtTrigXMonitortempfile}"
  set cmtcleanupstatus=2
  /bin/rm -f ${cmtTrigXMonitortempfile}
  unset cmtTrigXMonitortempfile
  exit $cmtcleanupstatus
endif
set cmtcleanupstatus=0
source ${cmtTrigXMonitortempfile}
if ( $status != 0 ) then
  set cmtcleanupstatus=2
endif
/bin/rm -f ${cmtTrigXMonitortempfile}
unset cmtTrigXMonitortempfile
exit $cmtcleanupstatus


# echo "setup TrigCostPython TrigCostPython-r743883 in /afs/cern.ch/user/r/rewang/public/cmthome/Trigger/TrigCost"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/CMT/v1r25p20140131
endif
source ${CMTROOT}/mgr/setup.csh
set cmtTrigCostPythontempfile=`${CMTROOT}/${CMTBIN}/cmt.exe -quiet build temporary_name`
if $status != 0 then
  set cmtTrigCostPythontempfile=/tmp/cmt.$$
endif
${CMTROOT}/${CMTBIN}/cmt.exe setup -csh -pack=TrigCostPython -version=TrigCostPython-r743883 -path=/afs/cern.ch/user/r/rewang/public/cmthome/Trigger/TrigCost  -no_cleanup $* >${cmtTrigCostPythontempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/${CMTBIN}/cmt.exe setup -csh -pack=TrigCostPython -version=TrigCostPython-r743883 -path=/afs/cern.ch/user/r/rewang/public/cmthome/Trigger/TrigCost  -no_cleanup $* >${cmtTrigCostPythontempfile}"
  set cmtsetupstatus=2
  /bin/rm -f ${cmtTrigCostPythontempfile}
  unset cmtTrigCostPythontempfile
  exit $cmtsetupstatus
endif
set cmtsetupstatus=0
source ${cmtTrigCostPythontempfile}
if ( $status != 0 ) then
  set cmtsetupstatus=2
endif
/bin/rm -f ${cmtTrigCostPythontempfile}
unset cmtTrigCostPythontempfile
exit $cmtsetupstatus


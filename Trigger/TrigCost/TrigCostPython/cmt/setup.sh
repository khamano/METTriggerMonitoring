# echo "setup TrigCostPython TrigCostPython-r743883 in /afs/cern.ch/user/r/rewang/public/cmthome/Trigger/TrigCost"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/CMT/v1r25p20140131; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtTrigCostPythontempfile=`${CMTROOT}/${CMTBIN}/cmt.exe -quiet build temporary_name`
if test ! $? = 0 ; then cmtTrigCostPythontempfile=/tmp/cmt.$$; fi
${CMTROOT}/${CMTBIN}/cmt.exe setup -sh -pack=TrigCostPython -version=TrigCostPython-r743883 -path=/afs/cern.ch/user/r/rewang/public/cmthome/Trigger/TrigCost  -no_cleanup $* >${cmtTrigCostPythontempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/${CMTBIN}/cmt.exe setup -sh -pack=TrigCostPython -version=TrigCostPython-r743883 -path=/afs/cern.ch/user/r/rewang/public/cmthome/Trigger/TrigCost  -no_cleanup $* >${cmtTrigCostPythontempfile}"
  cmtsetupstatus=2
  /bin/rm -f ${cmtTrigCostPythontempfile}
  unset cmtTrigCostPythontempfile
  return $cmtsetupstatus
fi
cmtsetupstatus=0
. ${cmtTrigCostPythontempfile}
if test $? != 0 ; then
  cmtsetupstatus=2
fi
/bin/rm -f ${cmtTrigCostPythontempfile}
unset cmtTrigCostPythontempfile
return $cmtsetupstatus


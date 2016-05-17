# echo "cleanup WorkArea WorkArea-00-00-00 in /afs/cern.ch/user/r/rewang/public/cmthome"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/CMT/v1r25p20140131
endif
source ${CMTROOT}/mgr/setup.csh
set cmtWorkAreatempfile=`${CMTROOT}/${CMTBIN}/cmt.exe -quiet build temporary_name`
if $status != 0 then
  set cmtWorkAreatempfile=/tmp/cmt.$$
endif
${CMTROOT}/${CMTBIN}/cmt.exe cleanup -csh -pack=WorkArea -version=WorkArea-00-00-00 -path=/afs/cern.ch/user/r/rewang/public/cmthome  $* >${cmtWorkAreatempfile}
if ( $status != 0 ) then
  echo "${CMTROOT}/${CMTBIN}/cmt.exe cleanup -csh -pack=WorkArea -version=WorkArea-00-00-00 -path=/afs/cern.ch/user/r/rewang/public/cmthome  $* >${cmtWorkAreatempfile}"
  set cmtcleanupstatus=2
  /bin/rm -f ${cmtWorkAreatempfile}
  unset cmtWorkAreatempfile
  exit $cmtcleanupstatus
endif
set cmtcleanupstatus=0
source ${cmtWorkAreatempfile}
if ( $status != 0 ) then
  set cmtcleanupstatus=2
endif
/bin/rm -f ${cmtWorkAreatempfile}
unset cmtWorkAreatempfile
exit $cmtcleanupstatus


# echo "setup WorkArea WorkArea-00-00-00 in /afs/cern.ch/user/r/rewang/public/cmthome"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/CMT/v1r25p20140131; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtWorkAreatempfile=`${CMTROOT}/${CMTBIN}/cmt.exe -quiet build temporary_name`
if test ! $? = 0 ; then cmtWorkAreatempfile=/tmp/cmt.$$; fi
${CMTROOT}/${CMTBIN}/cmt.exe setup -sh -pack=WorkArea -version=WorkArea-00-00-00 -path=/afs/cern.ch/user/r/rewang/public/cmthome  -no_cleanup $* >${cmtWorkAreatempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/${CMTBIN}/cmt.exe setup -sh -pack=WorkArea -version=WorkArea-00-00-00 -path=/afs/cern.ch/user/r/rewang/public/cmthome  -no_cleanup $* >${cmtWorkAreatempfile}"
  cmtsetupstatus=2
  /bin/rm -f ${cmtWorkAreatempfile}
  unset cmtWorkAreatempfile
  return $cmtsetupstatus
fi
cmtsetupstatus=0
. ${cmtWorkAreatempfile}
if test $? != 0 ; then
  cmtsetupstatus=2
fi
/bin/rm -f ${cmtWorkAreatempfile}
unset cmtWorkAreatempfile
return $cmtsetupstatus


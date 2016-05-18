#-- start of make_header -----------------

#====================================
#  Document check_install_xmls
#
#   Generated Wed May 18 00:41:22 2016  by rewang
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_check_install_xmls_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_check_install_xmls_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_check_install_xmls

TrigCostPython_tag = $(tag)

#cmt_local_tagfile_check_install_xmls = $(TrigCostPython_tag)_check_install_xmls.make
cmt_local_tagfile_check_install_xmls = $(bin)$(TrigCostPython_tag)_check_install_xmls.make

else

tags      = $(tag),$(CMTEXTRATAGS)

TrigCostPython_tag = $(tag)

#cmt_local_tagfile_check_install_xmls = $(TrigCostPython_tag).make
cmt_local_tagfile_check_install_xmls = $(bin)$(TrigCostPython_tag).make

endif

include $(cmt_local_tagfile_check_install_xmls)
#-include $(cmt_local_tagfile_check_install_xmls)

ifdef cmt_check_install_xmls_has_target_tag

cmt_final_setup_check_install_xmls = $(bin)setup_check_install_xmls.make
cmt_dependencies_in_check_install_xmls = $(bin)dependencies_check_install_xmls.in
#cmt_final_setup_check_install_xmls = $(bin)TrigCostPython_check_install_xmlssetup.make
cmt_local_check_install_xmls_makefile = $(bin)check_install_xmls.make

else

cmt_final_setup_check_install_xmls = $(bin)setup.make
cmt_dependencies_in_check_install_xmls = $(bin)dependencies.in
#cmt_final_setup_check_install_xmls = $(bin)TrigCostPythonsetup.make
cmt_local_check_install_xmls_makefile = $(bin)check_install_xmls.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)TrigCostPythonsetup.make

#check_install_xmls :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'check_install_xmls'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = check_install_xmls/
#check_install_xmls::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of cmt_action_runner_header ---------------

ifdef ONCE
check_install_xmls_once = 1
endif

ifdef check_install_xmls_once

check_install_xmlsactionstamp = $(bin)check_install_xmls.actionstamp
#check_install_xmlsactionstamp = check_install_xmls.actionstamp

check_install_xmls :: $(check_install_xmlsactionstamp)
	$(echo) "check_install_xmls ok"
#	@echo check_install_xmls ok

#$(check_install_xmlsactionstamp) :: $(check_install_xmls_dependencies)
$(check_install_xmlsactionstamp) ::
	$(silent) /cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/cmt/atlas_check_installations.sh -files=' -s=../data *.dtd *.xml  ' -installdir=/afs/cern.ch/user/r/rewang/public/cmthome/InstallArea/XML/TrigCostPython -level=
	$(silent) cat /dev/null > $(check_install_xmlsactionstamp)
#	@echo ok > $(check_install_xmlsactionstamp)

check_install_xmlsclean ::
	$(cleanup_silent) /bin/rm -f $(check_install_xmlsactionstamp)

else

#check_install_xmls :: $(check_install_xmls_dependencies)
check_install_xmls ::
	$(silent) /cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/cmt/atlas_check_installations.sh -files=' -s=../data *.dtd *.xml  ' -installdir=/afs/cern.ch/user/r/rewang/public/cmthome/InstallArea/XML/TrigCostPython -level=

endif

install ::
uninstall ::

#-- end of cmt_action_runner_header -----------------
#-- start of cleanup_header --------------

clean :: check_install_xmlsclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(check_install_xmls.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

check_install_xmlsclean ::
#-- end of cleanup_header ---------------

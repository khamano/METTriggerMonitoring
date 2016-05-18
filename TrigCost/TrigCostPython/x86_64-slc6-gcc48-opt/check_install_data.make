#-- start of make_header -----------------

#====================================
#  Document check_install_data
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

cmt_check_install_data_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_check_install_data_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_check_install_data

TrigCostPython_tag = $(tag)

#cmt_local_tagfile_check_install_data = $(TrigCostPython_tag)_check_install_data.make
cmt_local_tagfile_check_install_data = $(bin)$(TrigCostPython_tag)_check_install_data.make

else

tags      = $(tag),$(CMTEXTRATAGS)

TrigCostPython_tag = $(tag)

#cmt_local_tagfile_check_install_data = $(TrigCostPython_tag).make
cmt_local_tagfile_check_install_data = $(bin)$(TrigCostPython_tag).make

endif

include $(cmt_local_tagfile_check_install_data)
#-include $(cmt_local_tagfile_check_install_data)

ifdef cmt_check_install_data_has_target_tag

cmt_final_setup_check_install_data = $(bin)setup_check_install_data.make
cmt_dependencies_in_check_install_data = $(bin)dependencies_check_install_data.in
#cmt_final_setup_check_install_data = $(bin)TrigCostPython_check_install_datasetup.make
cmt_local_check_install_data_makefile = $(bin)check_install_data.make

else

cmt_final_setup_check_install_data = $(bin)setup.make
cmt_dependencies_in_check_install_data = $(bin)dependencies.in
#cmt_final_setup_check_install_data = $(bin)TrigCostPythonsetup.make
cmt_local_check_install_data_makefile = $(bin)check_install_data.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)TrigCostPythonsetup.make

#check_install_data :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'check_install_data'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = check_install_data/
#check_install_data::
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
check_install_data_once = 1
endif

ifdef check_install_data_once

check_install_dataactionstamp = $(bin)check_install_data.actionstamp
#check_install_dataactionstamp = check_install_data.actionstamp

check_install_data :: $(check_install_dataactionstamp)
	$(echo) "check_install_data ok"
#	@echo check_install_data ok

#$(check_install_dataactionstamp) :: $(check_install_data_dependencies)
$(check_install_dataactionstamp) ::
	$(silent) /cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/cmt/atlas_check_installations.sh -files=' -s=../data *.html *.js ' -installdir=/afs/cern.ch/user/r/rewang/public/cmthome/InstallArea/share/TrigCostPython -level=
	$(silent) cat /dev/null > $(check_install_dataactionstamp)
#	@echo ok > $(check_install_dataactionstamp)

check_install_dataclean ::
	$(cleanup_silent) /bin/rm -f $(check_install_dataactionstamp)

else

#check_install_data :: $(check_install_data_dependencies)
check_install_data ::
	$(silent) /cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/cmt/atlas_check_installations.sh -files=' -s=../data *.html *.js ' -installdir=/afs/cern.ch/user/r/rewang/public/cmthome/InstallArea/share/TrigCostPython -level=

endif

install ::
uninstall ::

#-- end of cmt_action_runner_header -----------------
#-- start of cleanup_header --------------

clean :: check_install_dataclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(check_install_data.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

check_install_dataclean ::
#-- end of cleanup_header ---------------

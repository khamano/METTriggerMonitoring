#-- start of make_header -----------------

#====================================
#  Document check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap
#
#   Generated Wed May 18 00:41:40 2016  by rewang
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap

TrigCostMonitor_tag = $(tag)

#cmt_local_tagfile_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap = $(TrigCostMonitor_tag)_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap.make
cmt_local_tagfile_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap = $(bin)$(TrigCostMonitor_tag)_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap.make

else

tags      = $(tag),$(CMTEXTRATAGS)

TrigCostMonitor_tag = $(tag)

#cmt_local_tagfile_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap = $(TrigCostMonitor_tag).make
cmt_local_tagfile_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap = $(bin)$(TrigCostMonitor_tag).make

endif

include $(cmt_local_tagfile_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap)
#-include $(cmt_local_tagfile_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap)

ifdef cmt_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_has_target_tag

cmt_final_setup_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap = $(bin)setup_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap.make
cmt_dependencies_in_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap = $(bin)dependencies_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap.in
#cmt_final_setup_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap = $(bin)TrigCostMonitor_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmapsetup.make
cmt_local_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile = $(bin)check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap.make

else

cmt_final_setup_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap = $(bin)setup.make
cmt_dependencies_in_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap = $(bin)dependencies.in
#cmt_final_setup_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap = $(bin)TrigCostMonitorsetup.make
cmt_local_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile = $(bin)check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)TrigCostMonitorsetup.make

#check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap/
#check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap::
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
check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_once = 1
endif

ifdef check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_once

check_install_TrigCostMonitorDict_TrigCostMonitordictrootmapactionstamp = $(bin)check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap.actionstamp
#check_install_TrigCostMonitorDict_TrigCostMonitordictrootmapactionstamp = check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap.actionstamp

check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap :: $(check_install_TrigCostMonitorDict_TrigCostMonitordictrootmapactionstamp)
	$(echo) "check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap ok"
#	@echo check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap ok

#$(check_install_TrigCostMonitorDict_TrigCostMonitordictrootmapactionstamp) :: $(check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_dependencies)
$(check_install_TrigCostMonitorDict_TrigCostMonitordictrootmapactionstamp) ::
	$(silent) /cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/cmt/atlas_check_installations.sh -files=' ../x86_64-slc6-gcc48-opt/dict/TrigCostMonitor/TrigCostMonitorDict.dsomap ' -installdir=/afs/cern.ch/user/r/rewang/public/cmthome/InstallArea/x86_64-slc6-gcc48-opt/lib -level=
	$(silent) cat /dev/null > $(check_install_TrigCostMonitorDict_TrigCostMonitordictrootmapactionstamp)
#	@echo ok > $(check_install_TrigCostMonitorDict_TrigCostMonitordictrootmapactionstamp)

check_install_TrigCostMonitorDict_TrigCostMonitordictrootmapclean ::
	$(cleanup_silent) /bin/rm -f $(check_install_TrigCostMonitorDict_TrigCostMonitordictrootmapactionstamp)

else

#check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap :: $(check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_dependencies)
check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap ::
	$(silent) /cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/cmt/atlas_check_installations.sh -files=' ../x86_64-slc6-gcc48-opt/dict/TrigCostMonitor/TrigCostMonitorDict.dsomap ' -installdir=/afs/cern.ch/user/r/rewang/public/cmthome/InstallArea/x86_64-slc6-gcc48-opt/lib -level=

endif

install ::
uninstall ::

#-- end of cmt_action_runner_header -----------------
#-- start of cleanup_header --------------

clean :: check_install_TrigCostMonitorDict_TrigCostMonitordictrootmapclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

check_install_TrigCostMonitorDict_TrigCostMonitordictrootmapclean ::
#-- end of cleanup_header ---------------

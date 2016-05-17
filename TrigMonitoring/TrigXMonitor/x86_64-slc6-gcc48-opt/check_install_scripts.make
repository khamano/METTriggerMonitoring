#-- start of make_header -----------------

#====================================
#  Document check_install_scripts
#
#   Generated Sun May 15 17:50:04 2016  by rewang
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_check_install_scripts_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_check_install_scripts_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_check_install_scripts

TrigXMonitor_tag = $(tag)

#cmt_local_tagfile_check_install_scripts = $(TrigXMonitor_tag)_check_install_scripts.make
cmt_local_tagfile_check_install_scripts = $(bin)$(TrigXMonitor_tag)_check_install_scripts.make

else

tags      = $(tag),$(CMTEXTRATAGS)

TrigXMonitor_tag = $(tag)

#cmt_local_tagfile_check_install_scripts = $(TrigXMonitor_tag).make
cmt_local_tagfile_check_install_scripts = $(bin)$(TrigXMonitor_tag).make

endif

include $(cmt_local_tagfile_check_install_scripts)
#-include $(cmt_local_tagfile_check_install_scripts)

ifdef cmt_check_install_scripts_has_target_tag

cmt_final_setup_check_install_scripts = $(bin)setup_check_install_scripts.make
cmt_dependencies_in_check_install_scripts = $(bin)dependencies_check_install_scripts.in
#cmt_final_setup_check_install_scripts = $(bin)TrigXMonitor_check_install_scriptssetup.make
cmt_local_check_install_scripts_makefile = $(bin)check_install_scripts.make

else

cmt_final_setup_check_install_scripts = $(bin)setup.make
cmt_dependencies_in_check_install_scripts = $(bin)dependencies.in
#cmt_final_setup_check_install_scripts = $(bin)TrigXMonitorsetup.make
cmt_local_check_install_scripts_makefile = $(bin)check_install_scripts.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)TrigXMonitorsetup.make

#check_install_scripts :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'check_install_scripts'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = check_install_scripts/
#check_install_scripts::
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
check_install_scripts_once = 1
endif

ifdef check_install_scripts_once

check_install_scriptsactionstamp = $(bin)check_install_scripts.actionstamp
#check_install_scriptsactionstamp = check_install_scripts.actionstamp

check_install_scripts :: $(check_install_scriptsactionstamp)
	$(echo) "check_install_scripts ok"
#	@echo check_install_scripts ok

#$(check_install_scriptsactionstamp) :: $(check_install_scripts_dependencies)
$(check_install_scriptsactionstamp) ::
	$(silent) /cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/cmt/atlas_check_installations.sh -files=' -s=../share *.py ../macros/*.py ' -installdir=/afs/cern.ch/user/r/rewang/public/cmthome/InstallArea/share/bin -level=
	$(silent) cat /dev/null > $(check_install_scriptsactionstamp)
#	@echo ok > $(check_install_scriptsactionstamp)

check_install_scriptsclean ::
	$(cleanup_silent) /bin/rm -f $(check_install_scriptsactionstamp)

else

#check_install_scripts :: $(check_install_scripts_dependencies)
check_install_scripts ::
	$(silent) /cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/cmt/atlas_check_installations.sh -files=' -s=../share *.py ../macros/*.py ' -installdir=/afs/cern.ch/user/r/rewang/public/cmthome/InstallArea/share/bin -level=

endif

install ::
uninstall ::

#-- end of cmt_action_runner_header -----------------
#-- start of cleanup_header --------------

clean :: check_install_scriptsclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(check_install_scripts.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

check_install_scriptsclean ::
#-- end of cleanup_header ---------------

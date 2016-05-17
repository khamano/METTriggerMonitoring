#-- start of make_header -----------------

#====================================
#  Document TrigCostMonitorConf
#
#   Generated Sun May 15 17:52:21 2016  by rewang
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_TrigCostMonitorConf_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_TrigCostMonitorConf_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_TrigCostMonitorConf

TrigCostMonitor_tag = $(tag)

#cmt_local_tagfile_TrigCostMonitorConf = $(TrigCostMonitor_tag)_TrigCostMonitorConf.make
cmt_local_tagfile_TrigCostMonitorConf = $(bin)$(TrigCostMonitor_tag)_TrigCostMonitorConf.make

else

tags      = $(tag),$(CMTEXTRATAGS)

TrigCostMonitor_tag = $(tag)

#cmt_local_tagfile_TrigCostMonitorConf = $(TrigCostMonitor_tag).make
cmt_local_tagfile_TrigCostMonitorConf = $(bin)$(TrigCostMonitor_tag).make

endif

include $(cmt_local_tagfile_TrigCostMonitorConf)
#-include $(cmt_local_tagfile_TrigCostMonitorConf)

ifdef cmt_TrigCostMonitorConf_has_target_tag

cmt_final_setup_TrigCostMonitorConf = $(bin)setup_TrigCostMonitorConf.make
cmt_dependencies_in_TrigCostMonitorConf = $(bin)dependencies_TrigCostMonitorConf.in
#cmt_final_setup_TrigCostMonitorConf = $(bin)TrigCostMonitor_TrigCostMonitorConfsetup.make
cmt_local_TrigCostMonitorConf_makefile = $(bin)TrigCostMonitorConf.make

else

cmt_final_setup_TrigCostMonitorConf = $(bin)setup.make
cmt_dependencies_in_TrigCostMonitorConf = $(bin)dependencies.in
#cmt_final_setup_TrigCostMonitorConf = $(bin)TrigCostMonitorsetup.make
cmt_local_TrigCostMonitorConf_makefile = $(bin)TrigCostMonitorConf.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)TrigCostMonitorsetup.make

#TrigCostMonitorConf :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'TrigCostMonitorConf'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = TrigCostMonitorConf/
#TrigCostMonitorConf::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
# File: cmt/fragments/genconfig_header
# Author: Wim Lavrijsen (WLavrijsen@lbl.gov)

# Use genconf.exe to create configurables python modules, then have the
# normal python install procedure take over.

.PHONY: TrigCostMonitorConf TrigCostMonitorConfclean

confpy  := TrigCostMonitorConf.py
conflib := $(bin)$(library_prefix)TrigCostMonitor.$(shlibsuffix)
confdb  := TrigCostMonitor.confdb
instdir := $(CMTINSTALLAREA)$(shared_install_subdir)/python/$(package)
product := $(instdir)/$(confpy)
initpy  := $(instdir)/__init__.py

ifdef GENCONF_ECHO
genconf_silent =
else
genconf_silent = $(silent)
endif

TrigCostMonitorConf :: TrigCostMonitorConfinstall

install :: TrigCostMonitorConfinstall

TrigCostMonitorConfinstall : /afs/cern.ch/user/r/rewang/public/cmthome/Trigger/TrigMonitoring/TrigCostMonitor/genConf/TrigCostMonitor/$(confpy)
	@echo "Installing /afs/cern.ch/user/r/rewang/public/cmthome/Trigger/TrigMonitoring/TrigCostMonitor/genConf/TrigCostMonitor in /afs/cern.ch/user/r/rewang/public/cmthome/InstallArea/python" ; \
	 $(install_command) --exclude="*.py?" --exclude="__init__.py" --exclude="*.confdb" /afs/cern.ch/user/r/rewang/public/cmthome/Trigger/TrigMonitoring/TrigCostMonitor/genConf/TrigCostMonitor /afs/cern.ch/user/r/rewang/public/cmthome/InstallArea/python ; \

/afs/cern.ch/user/r/rewang/public/cmthome/Trigger/TrigMonitoring/TrigCostMonitor/genConf/TrigCostMonitor/$(confpy) : $(conflib) /afs/cern.ch/user/r/rewang/public/cmthome/Trigger/TrigMonitoring/TrigCostMonitor/genConf/TrigCostMonitor
	$(genconf_silent) $(genconfig_cmd)   -o /afs/cern.ch/user/r/rewang/public/cmthome/Trigger/TrigMonitoring/TrigCostMonitor/genConf/TrigCostMonitor -p $(package) \
	  --configurable-module=GaudiKernel.Proxy \
	  --configurable-default-name=Configurable.DefaultName \
	  --configurable-algorithm=ConfigurableAlgorithm \
	  --configurable-algtool=ConfigurableAlgTool \
	  --configurable-auditor=ConfigurableAuditor \
          --configurable-service=ConfigurableService \
	  -i ../$(tag)/$(library_prefix)TrigCostMonitor.$(shlibsuffix)

/afs/cern.ch/user/r/rewang/public/cmthome/Trigger/TrigMonitoring/TrigCostMonitor/genConf/TrigCostMonitor:
	@ if [ ! -d /afs/cern.ch/user/r/rewang/public/cmthome/Trigger/TrigMonitoring/TrigCostMonitor/genConf/TrigCostMonitor ] ; then mkdir -p /afs/cern.ch/user/r/rewang/public/cmthome/Trigger/TrigMonitoring/TrigCostMonitor/genConf/TrigCostMonitor ; fi ;

TrigCostMonitorConfclean :: TrigCostMonitorConfuninstall
	$(cleanup_silent) $(remove_command) /afs/cern.ch/user/r/rewang/public/cmthome/Trigger/TrigMonitoring/TrigCostMonitor/genConf/TrigCostMonitor/$(confpy) /afs/cern.ch/user/r/rewang/public/cmthome/Trigger/TrigMonitoring/TrigCostMonitor/genConf/TrigCostMonitor/$(confdb)

uninstall :: TrigCostMonitorConfuninstall

TrigCostMonitorConfuninstall ::
	@$(uninstall_command) /afs/cern.ch/user/r/rewang/public/cmthome/InstallArea/python
libTrigCostMonitor_so_dependencies = ../x86_64-slc6-gcc48-opt/libTrigCostMonitor.so
#-- start of cleanup_header --------------

clean :: TrigCostMonitorConfclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(TrigCostMonitorConf.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

TrigCostMonitorConfclean ::
#-- end of cleanup_header ---------------

#-- start of make_header -----------------

#====================================
#  Document TrigCostMonitorCLIDDB
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

cmt_TrigCostMonitorCLIDDB_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_TrigCostMonitorCLIDDB_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_TrigCostMonitorCLIDDB

TrigCostMonitor_tag = $(tag)

#cmt_local_tagfile_TrigCostMonitorCLIDDB = $(TrigCostMonitor_tag)_TrigCostMonitorCLIDDB.make
cmt_local_tagfile_TrigCostMonitorCLIDDB = $(bin)$(TrigCostMonitor_tag)_TrigCostMonitorCLIDDB.make

else

tags      = $(tag),$(CMTEXTRATAGS)

TrigCostMonitor_tag = $(tag)

#cmt_local_tagfile_TrigCostMonitorCLIDDB = $(TrigCostMonitor_tag).make
cmt_local_tagfile_TrigCostMonitorCLIDDB = $(bin)$(TrigCostMonitor_tag).make

endif

include $(cmt_local_tagfile_TrigCostMonitorCLIDDB)
#-include $(cmt_local_tagfile_TrigCostMonitorCLIDDB)

ifdef cmt_TrigCostMonitorCLIDDB_has_target_tag

cmt_final_setup_TrigCostMonitorCLIDDB = $(bin)setup_TrigCostMonitorCLIDDB.make
cmt_dependencies_in_TrigCostMonitorCLIDDB = $(bin)dependencies_TrigCostMonitorCLIDDB.in
#cmt_final_setup_TrigCostMonitorCLIDDB = $(bin)TrigCostMonitor_TrigCostMonitorCLIDDBsetup.make
cmt_local_TrigCostMonitorCLIDDB_makefile = $(bin)TrigCostMonitorCLIDDB.make

else

cmt_final_setup_TrigCostMonitorCLIDDB = $(bin)setup.make
cmt_dependencies_in_TrigCostMonitorCLIDDB = $(bin)dependencies.in
#cmt_final_setup_TrigCostMonitorCLIDDB = $(bin)TrigCostMonitorsetup.make
cmt_local_TrigCostMonitorCLIDDB_makefile = $(bin)TrigCostMonitorCLIDDB.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)TrigCostMonitorsetup.make

#TrigCostMonitorCLIDDB :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'TrigCostMonitorCLIDDB'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = TrigCostMonitorCLIDDB/
#TrigCostMonitorCLIDDB::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
# File: cmt/fragments/genCLIDDB_header
# Author: Paolo Calafiura
# derived from genconf_header

# Use genCLIDDB_cmd to create package clid.db files

.PHONY: TrigCostMonitorCLIDDB TrigCostMonitorCLIDDBclean

outname := clid.db
cliddb  := TrigCostMonitor_$(outname)
instdir := $(CMTINSTALLAREA)/share
result  := $(instdir)/$(cliddb)
product := $(instdir)/$(outname)
conflib := $(bin)$(library_prefix)TrigCostMonitor.$(shlibsuffix)

TrigCostMonitorCLIDDB :: $(result)

$(instdir) :
	$(mkdir) -p $(instdir)

$(result) : $(conflib) $(product)
	@$(genCLIDDB_cmd) -p TrigCostMonitor -i$(product) -o $(result)

$(product) : $(instdir)
	touch $(product)

TrigCostMonitorCLIDDBclean ::
	$(cleanup_silent) $(uninstall_command) $(product) $(result)
	$(cleanup_silent) $(cmt_uninstallarea_command) $(product) $(result)

#-- start of cleanup_header --------------

clean :: TrigCostMonitorCLIDDBclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(TrigCostMonitorCLIDDB.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

TrigCostMonitorCLIDDBclean ::
#-- end of cleanup_header ---------------

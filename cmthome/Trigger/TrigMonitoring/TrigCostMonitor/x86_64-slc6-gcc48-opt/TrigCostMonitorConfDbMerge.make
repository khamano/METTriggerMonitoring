#-- start of make_header -----------------

#====================================
#  Document TrigCostMonitorConfDbMerge
#
#   Generated Sun May 15 17:52:25 2016  by rewang
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_TrigCostMonitorConfDbMerge_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_TrigCostMonitorConfDbMerge_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_TrigCostMonitorConfDbMerge

TrigCostMonitor_tag = $(tag)

#cmt_local_tagfile_TrigCostMonitorConfDbMerge = $(TrigCostMonitor_tag)_TrigCostMonitorConfDbMerge.make
cmt_local_tagfile_TrigCostMonitorConfDbMerge = $(bin)$(TrigCostMonitor_tag)_TrigCostMonitorConfDbMerge.make

else

tags      = $(tag),$(CMTEXTRATAGS)

TrigCostMonitor_tag = $(tag)

#cmt_local_tagfile_TrigCostMonitorConfDbMerge = $(TrigCostMonitor_tag).make
cmt_local_tagfile_TrigCostMonitorConfDbMerge = $(bin)$(TrigCostMonitor_tag).make

endif

include $(cmt_local_tagfile_TrigCostMonitorConfDbMerge)
#-include $(cmt_local_tagfile_TrigCostMonitorConfDbMerge)

ifdef cmt_TrigCostMonitorConfDbMerge_has_target_tag

cmt_final_setup_TrigCostMonitorConfDbMerge = $(bin)setup_TrigCostMonitorConfDbMerge.make
cmt_dependencies_in_TrigCostMonitorConfDbMerge = $(bin)dependencies_TrigCostMonitorConfDbMerge.in
#cmt_final_setup_TrigCostMonitorConfDbMerge = $(bin)TrigCostMonitor_TrigCostMonitorConfDbMergesetup.make
cmt_local_TrigCostMonitorConfDbMerge_makefile = $(bin)TrigCostMonitorConfDbMerge.make

else

cmt_final_setup_TrigCostMonitorConfDbMerge = $(bin)setup.make
cmt_dependencies_in_TrigCostMonitorConfDbMerge = $(bin)dependencies.in
#cmt_final_setup_TrigCostMonitorConfDbMerge = $(bin)TrigCostMonitorsetup.make
cmt_local_TrigCostMonitorConfDbMerge_makefile = $(bin)TrigCostMonitorConfDbMerge.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)TrigCostMonitorsetup.make

#TrigCostMonitorConfDbMerge :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'TrigCostMonitorConfDbMerge'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = TrigCostMonitorConfDbMerge/
#TrigCostMonitorConfDbMerge::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
# File: cmt/fragments/merge_genconfDb_header
# Author: Sebastien Binet (binet@cern.ch)

# Makefile fragment to merge a <library>.confdb file into a single
# <project>.confdb file in the (lib) install area

.PHONY: TrigCostMonitorConfDbMerge TrigCostMonitorConfDbMergeclean

# default is already '#'
#genconfDb_comment_char := "'#'"

instdir      := ${CMTINSTALLAREA}/$(tag)
confDbRef    := /afs/cern.ch/user/r/rewang/public/cmthome/Trigger/TrigMonitoring/TrigCostMonitor/genConf/TrigCostMonitor/TrigCostMonitor.confdb
stampConfDb  := $(confDbRef).stamp
mergedConfDb := $(instdir)/lib/$(project).confdb

TrigCostMonitorConfDbMerge :: $(stampConfDb) $(mergedConfDb)
	@:

.NOTPARALLEL : $(stampConfDb) $(mergedConfDb)

$(stampConfDb) $(mergedConfDb) :: $(confDbRef)
	@echo "Running merge_genconfDb  TrigCostMonitorConfDbMerge"
	$(merge_genconfDb_cmd) \
          --do-merge \
          --input-file $(confDbRef) \
          --merged-file $(mergedConfDb)

TrigCostMonitorConfDbMergeclean ::
	$(cleanup_silent) $(merge_genconfDb_cmd) \
          --un-merge \
          --input-file $(confDbRef) \
          --merged-file $(mergedConfDb)	;
	$(cleanup_silent) $(remove_command) $(stampConfDb)
libTrigCostMonitor_so_dependencies = ../x86_64-slc6-gcc48-opt/libTrigCostMonitor.so
#-- start of cleanup_header --------------

clean :: TrigCostMonitorConfDbMergeclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(TrigCostMonitorConfDbMerge.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

TrigCostMonitorConfDbMergeclean ::
#-- end of cleanup_header ---------------

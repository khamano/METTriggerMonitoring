#-- start of make_header -----------------

#====================================
#  Document TrigCostMonitorMergeComponentsList
#
#   Generated Wed May 18 00:43:41 2016  by rewang
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_TrigCostMonitorMergeComponentsList_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_TrigCostMonitorMergeComponentsList_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_TrigCostMonitorMergeComponentsList

TrigCostMonitor_tag = $(tag)

#cmt_local_tagfile_TrigCostMonitorMergeComponentsList = $(TrigCostMonitor_tag)_TrigCostMonitorMergeComponentsList.make
cmt_local_tagfile_TrigCostMonitorMergeComponentsList = $(bin)$(TrigCostMonitor_tag)_TrigCostMonitorMergeComponentsList.make

else

tags      = $(tag),$(CMTEXTRATAGS)

TrigCostMonitor_tag = $(tag)

#cmt_local_tagfile_TrigCostMonitorMergeComponentsList = $(TrigCostMonitor_tag).make
cmt_local_tagfile_TrigCostMonitorMergeComponentsList = $(bin)$(TrigCostMonitor_tag).make

endif

include $(cmt_local_tagfile_TrigCostMonitorMergeComponentsList)
#-include $(cmt_local_tagfile_TrigCostMonitorMergeComponentsList)

ifdef cmt_TrigCostMonitorMergeComponentsList_has_target_tag

cmt_final_setup_TrigCostMonitorMergeComponentsList = $(bin)setup_TrigCostMonitorMergeComponentsList.make
cmt_dependencies_in_TrigCostMonitorMergeComponentsList = $(bin)dependencies_TrigCostMonitorMergeComponentsList.in
#cmt_final_setup_TrigCostMonitorMergeComponentsList = $(bin)TrigCostMonitor_TrigCostMonitorMergeComponentsListsetup.make
cmt_local_TrigCostMonitorMergeComponentsList_makefile = $(bin)TrigCostMonitorMergeComponentsList.make

else

cmt_final_setup_TrigCostMonitorMergeComponentsList = $(bin)setup.make
cmt_dependencies_in_TrigCostMonitorMergeComponentsList = $(bin)dependencies.in
#cmt_final_setup_TrigCostMonitorMergeComponentsList = $(bin)TrigCostMonitorsetup.make
cmt_local_TrigCostMonitorMergeComponentsList_makefile = $(bin)TrigCostMonitorMergeComponentsList.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)TrigCostMonitorsetup.make

#TrigCostMonitorMergeComponentsList :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'TrigCostMonitorMergeComponentsList'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = TrigCostMonitorMergeComponentsList/
#TrigCostMonitorMergeComponentsList::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
# File: cmt/fragments/merge_componentslist_header
# Author: Sebastien Binet (binet@cern.ch)

# Makefile fragment to merge a <library>.components file into a single
# <project>.components file in the (lib) install area
# If no InstallArea is present the fragment is dummy


.PHONY: TrigCostMonitorMergeComponentsList TrigCostMonitorMergeComponentsListclean

# default is already '#'
#genmap_comment_char := "'#'"

componentsListRef    := ../$(tag)/TrigCostMonitor.components

ifdef CMTINSTALLAREA
componentsListDir    := ${CMTINSTALLAREA}/$(tag)/lib
mergedComponentsList := $(componentsListDir)/$(project).components
stampComponentsList  := $(componentsListRef).stamp
else
componentsListDir    := ../$(tag)
mergedComponentsList :=
stampComponentsList  :=
endif

TrigCostMonitorMergeComponentsList :: $(stampComponentsList) $(mergedComponentsList)
	@:

.NOTPARALLEL : $(stampComponentsList) $(mergedComponentsList)

$(stampComponentsList) $(mergedComponentsList) :: $(componentsListRef)
	@echo "Running merge_componentslist  TrigCostMonitorMergeComponentsList"
	$(merge_componentslist_cmd) --do-merge \
         --input-file $(componentsListRef) --merged-file $(mergedComponentsList)

TrigCostMonitorMergeComponentsListclean ::
	$(cleanup_silent) $(merge_componentslist_cmd) --un-merge \
         --input-file $(componentsListRef) --merged-file $(mergedComponentsList) ;
	$(cleanup_silent) $(remove_command) $(stampComponentsList)
libTrigCostMonitor_so_dependencies = ../x86_64-slc6-gcc48-opt/libTrigCostMonitor.so
#-- start of cleanup_header --------------

clean :: TrigCostMonitorMergeComponentsListclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(TrigCostMonitorMergeComponentsList.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

TrigCostMonitorMergeComponentsListclean ::
#-- end of cleanup_header ---------------

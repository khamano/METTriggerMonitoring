#-- start of make_header -----------------

#====================================
#  Document TrigCostMonitorDictMerge
#
#   Generated Sun May 15 17:52:32 2016  by rewang
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_TrigCostMonitorDictMerge_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_TrigCostMonitorDictMerge_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_TrigCostMonitorDictMerge

TrigCostMonitor_tag = $(tag)

#cmt_local_tagfile_TrigCostMonitorDictMerge = $(TrigCostMonitor_tag)_TrigCostMonitorDictMerge.make
cmt_local_tagfile_TrigCostMonitorDictMerge = $(bin)$(TrigCostMonitor_tag)_TrigCostMonitorDictMerge.make

else

tags      = $(tag),$(CMTEXTRATAGS)

TrigCostMonitor_tag = $(tag)

#cmt_local_tagfile_TrigCostMonitorDictMerge = $(TrigCostMonitor_tag).make
cmt_local_tagfile_TrigCostMonitorDictMerge = $(bin)$(TrigCostMonitor_tag).make

endif

include $(cmt_local_tagfile_TrigCostMonitorDictMerge)
#-include $(cmt_local_tagfile_TrigCostMonitorDictMerge)

ifdef cmt_TrigCostMonitorDictMerge_has_target_tag

cmt_final_setup_TrigCostMonitorDictMerge = $(bin)setup_TrigCostMonitorDictMerge.make
cmt_dependencies_in_TrigCostMonitorDictMerge = $(bin)dependencies_TrigCostMonitorDictMerge.in
#cmt_final_setup_TrigCostMonitorDictMerge = $(bin)TrigCostMonitor_TrigCostMonitorDictMergesetup.make
cmt_local_TrigCostMonitorDictMerge_makefile = $(bin)TrigCostMonitorDictMerge.make

else

cmt_final_setup_TrigCostMonitorDictMerge = $(bin)setup.make
cmt_dependencies_in_TrigCostMonitorDictMerge = $(bin)dependencies.in
#cmt_final_setup_TrigCostMonitorDictMerge = $(bin)TrigCostMonitorsetup.make
cmt_local_TrigCostMonitorDictMerge_makefile = $(bin)TrigCostMonitorDictMerge.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)TrigCostMonitorsetup.make

#TrigCostMonitorDictMerge :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'TrigCostMonitorDictMerge'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = TrigCostMonitorDictMerge/
#TrigCostMonitorDictMerge::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#
#  Makefile fragment to merge a <package>Dict.dsomap file into 
#  a single <project>Dict.rootmap file in the install area
#

dsoMapFile    := ${dict_dir}/TrigCostMonitor/TrigCostMonitorDict.dsomap
dsoMapStamp   := $(dsoMapFile).stamp
mergedDictMap := ${CMTINSTALLAREA}/$(tag)/lib/$(project)Dict.rootmap

# drive the running of this fragment off of a <package>Dict.dsomap.stamp file
TrigCostMonitorDictMerge ::  $(dsoMapStamp) $(mergedDictMap)

$(mergedDictMap) : ${CMTINSTALLAREA}/$(tag)/lib
	touch $(mergedDictMap)

$(dsoMapFile) :
	touch $(dsoMapFile)

ifeq ($(MAKE_VERSION),3.79.1)          # slc3
$(dsoMapStamp)   : $(dsoMapFile) $(mergedDictMap)
else
$(dsoMapStamp)   : $(mergedDictMap) | $(dsoMapFile)
endif
	@echo "Running merge_dict_rootmap  TrigCostMonitorDictMerge. Map: ${mergedDictMap}" ; 
	$(merge_dict_rootmap_cmd) $(dsoMapFile) $(mergedDictMap)

TrigCostMonitorDictMergeclean ::
	$(cleanup_silent) $(uninstall_command) $(dsoMapStamp)
#-- start of dependencies ------------------
ifneq ($(MAKECMDGOALS),TrigCostMonitorDictMergeclean)
ifneq ($(MAKECMDGOALS),uninstall)

$(bin)TrigCostMonitorDictMerge_dependencies.make : $(use_requirements) $(cmt_final_setup_TrigCostMonitorDictMerge)
	$(echo) "(TrigCostMonitorDictMerge.make) Rebuilding $@"; \
	  $(cmtexe) -tag=$(tags) build dependencies -out=$@ -start_all ../TrigCostMonitor/TrigCostMonitorDict.h -end_all $(includes) $(app_TrigCostMonitorDictMerge_cppflags) $(lib_TrigCostMonitorDictMerge_cppflags) -name=TrigCostMonitorDictMerge $? -f=$(cmt_dependencies_in_TrigCostMonitorDictMerge) -without_cmt

-include $(bin)TrigCostMonitorDictMerge_dependencies.make

endif
endif

TrigCostMonitorDictMergeclean ::
	$(cleanup_silent) \rm -rf $(bin)TrigCostMonitorDictMerge_deps $(bin)TrigCostMonitorDictMerge_dependencies.make
#-- end of dependencies -------------------
#-- start of dependency ------------------
ifneq ($(MAKECMDGOALS),TrigCostMonitorDictMergeclean)
ifneq ($(MAKECMDGOALS),uninstall)

$(bin)TrigCostMonitorDictMerge_dependencies.make : $(TrigCostMonitorDict_h_dependencies)

$(bin)TrigCostMonitorDictMerge_dependencies.make : ../TrigCostMonitor/TrigCostMonitorDict.h

endif
endif
#-- end of dependency -------------------
#-- start of cleanup_header --------------

clean :: TrigCostMonitorDictMergeclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(TrigCostMonitorDictMerge.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

TrigCostMonitorDictMergeclean ::
#-- end of cleanup_header ---------------

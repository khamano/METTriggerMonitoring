#-- start of make_header -----------------

#====================================
#  Document TrigCostMonitorComponentsList
#
#   Generated Wed May 18 00:43:39 2016  by rewang
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_TrigCostMonitorComponentsList_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_TrigCostMonitorComponentsList_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_TrigCostMonitorComponentsList

TrigCostMonitor_tag = $(tag)

#cmt_local_tagfile_TrigCostMonitorComponentsList = $(TrigCostMonitor_tag)_TrigCostMonitorComponentsList.make
cmt_local_tagfile_TrigCostMonitorComponentsList = $(bin)$(TrigCostMonitor_tag)_TrigCostMonitorComponentsList.make

else

tags      = $(tag),$(CMTEXTRATAGS)

TrigCostMonitor_tag = $(tag)

#cmt_local_tagfile_TrigCostMonitorComponentsList = $(TrigCostMonitor_tag).make
cmt_local_tagfile_TrigCostMonitorComponentsList = $(bin)$(TrigCostMonitor_tag).make

endif

include $(cmt_local_tagfile_TrigCostMonitorComponentsList)
#-include $(cmt_local_tagfile_TrigCostMonitorComponentsList)

ifdef cmt_TrigCostMonitorComponentsList_has_target_tag

cmt_final_setup_TrigCostMonitorComponentsList = $(bin)setup_TrigCostMonitorComponentsList.make
cmt_dependencies_in_TrigCostMonitorComponentsList = $(bin)dependencies_TrigCostMonitorComponentsList.in
#cmt_final_setup_TrigCostMonitorComponentsList = $(bin)TrigCostMonitor_TrigCostMonitorComponentsListsetup.make
cmt_local_TrigCostMonitorComponentsList_makefile = $(bin)TrigCostMonitorComponentsList.make

else

cmt_final_setup_TrigCostMonitorComponentsList = $(bin)setup.make
cmt_dependencies_in_TrigCostMonitorComponentsList = $(bin)dependencies.in
#cmt_final_setup_TrigCostMonitorComponentsList = $(bin)TrigCostMonitorsetup.make
cmt_local_TrigCostMonitorComponentsList_makefile = $(bin)TrigCostMonitorComponentsList.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)TrigCostMonitorsetup.make

#TrigCostMonitorComponentsList :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'TrigCostMonitorComponentsList'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = TrigCostMonitorComponentsList/
#TrigCostMonitorComponentsList::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
##
componentslistfile = TrigCostMonitor.components
COMPONENTSLIST_DIR = ../$(tag)
fulllibname = libTrigCostMonitor.$(shlibsuffix)

TrigCostMonitorComponentsList :: ${COMPONENTSLIST_DIR}/$(componentslistfile)
	@:

${COMPONENTSLIST_DIR}/$(componentslistfile) :: $(bin)$(fulllibname)
	@echo 'Generating componentslist file for $(fulllibname)'
	cd ../$(tag);$(listcomponents_cmd) --output ${COMPONENTSLIST_DIR}/$(componentslistfile) $(fulllibname)

install :: TrigCostMonitorComponentsListinstall
TrigCostMonitorComponentsListinstall :: TrigCostMonitorComponentsList

uninstall :: TrigCostMonitorComponentsListuninstall
TrigCostMonitorComponentsListuninstall :: TrigCostMonitorComponentsListclean

TrigCostMonitorComponentsListclean ::
	@echo 'Deleting $(componentslistfile)'
	@rm -f ${COMPONENTSLIST_DIR}/$(componentslistfile)

#-- start of cleanup_header --------------

clean :: TrigCostMonitorComponentsListclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(TrigCostMonitorComponentsList.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

TrigCostMonitorComponentsListclean ::
#-- end of cleanup_header ---------------

#-- start of make_header -----------------

#====================================
#  Document install_TrigCostMonitorDict_TrigCostMonitordictrootmap
#
#   Generated Sun May 15 17:50:27 2016  by rewang
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_install_TrigCostMonitorDict_TrigCostMonitordictrootmap

TrigCostMonitor_tag = $(tag)

#cmt_local_tagfile_install_TrigCostMonitorDict_TrigCostMonitordictrootmap = $(TrigCostMonitor_tag)_install_TrigCostMonitorDict_TrigCostMonitordictrootmap.make
cmt_local_tagfile_install_TrigCostMonitorDict_TrigCostMonitordictrootmap = $(bin)$(TrigCostMonitor_tag)_install_TrigCostMonitorDict_TrigCostMonitordictrootmap.make

else

tags      = $(tag),$(CMTEXTRATAGS)

TrigCostMonitor_tag = $(tag)

#cmt_local_tagfile_install_TrigCostMonitorDict_TrigCostMonitordictrootmap = $(TrigCostMonitor_tag).make
cmt_local_tagfile_install_TrigCostMonitorDict_TrigCostMonitordictrootmap = $(bin)$(TrigCostMonitor_tag).make

endif

include $(cmt_local_tagfile_install_TrigCostMonitorDict_TrigCostMonitordictrootmap)
#-include $(cmt_local_tagfile_install_TrigCostMonitorDict_TrigCostMonitordictrootmap)

ifdef cmt_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_has_target_tag

cmt_final_setup_install_TrigCostMonitorDict_TrigCostMonitordictrootmap = $(bin)setup_install_TrigCostMonitorDict_TrigCostMonitordictrootmap.make
cmt_dependencies_in_install_TrigCostMonitorDict_TrigCostMonitordictrootmap = $(bin)dependencies_install_TrigCostMonitorDict_TrigCostMonitordictrootmap.in
#cmt_final_setup_install_TrigCostMonitorDict_TrigCostMonitordictrootmap = $(bin)TrigCostMonitor_install_TrigCostMonitorDict_TrigCostMonitordictrootmapsetup.make
cmt_local_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile = $(bin)install_TrigCostMonitorDict_TrigCostMonitordictrootmap.make

else

cmt_final_setup_install_TrigCostMonitorDict_TrigCostMonitordictrootmap = $(bin)setup.make
cmt_dependencies_in_install_TrigCostMonitorDict_TrigCostMonitordictrootmap = $(bin)dependencies.in
#cmt_final_setup_install_TrigCostMonitorDict_TrigCostMonitordictrootmap = $(bin)TrigCostMonitorsetup.make
cmt_local_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile = $(bin)install_TrigCostMonitorDict_TrigCostMonitordictrootmap.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)TrigCostMonitorsetup.make

#install_TrigCostMonitorDict_TrigCostMonitordictrootmap :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'install_TrigCostMonitorDict_TrigCostMonitordictrootmap'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = install_TrigCostMonitorDict_TrigCostMonitordictrootmap/
#install_TrigCostMonitorDict_TrigCostMonitordictrootmap::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------


ifeq ($(INSTALLAREA),)
installarea = $(CMTINSTALLAREA)
else
ifeq ($(findstring `,$(INSTALLAREA)),`)
installarea = $(shell $(subst `,, $(INSTALLAREA)))
else
installarea = $(INSTALLAREA)
endif
endif

install_dir = ${installarea}/x86_64-slc6-gcc48-opt/lib

install_TrigCostMonitorDict_TrigCostMonitordictrootmap :: install_TrigCostMonitorDict_TrigCostMonitordictrootmapinstall ;

install :: install_TrigCostMonitorDict_TrigCostMonitordictrootmapinstall ;

install_TrigCostMonitorDict_TrigCostMonitordictrootmapclean :: install_TrigCostMonitorDict_TrigCostMonitordictrootmapuninstall

uninstall :: install_TrigCostMonitorDict_TrigCostMonitordictrootmapuninstall


# This is to avoid error in case there are no files to install
# Ideally, the fragment should not be used without files to install,
# and this line should be dropped then
install_TrigCostMonitorDict_TrigCostMonitordictrootmapinstall :: ;

TrigCostMonitorDict_dsomap_dependencies = ../x86_64-slc6-gcc48-opt/dict/TrigCostMonitor/TrigCostMonitorDict.dsomap


install_TrigCostMonitorDict_TrigCostMonitordictrootmapinstall :: ${install_dir}/TrigCostMonitorDict.dsomap
	@if test ! "${installarea}" = ""; then\
	  echo "installation done"; \
	fi

${install_dir}/TrigCostMonitorDict.dsomap :: ../x86_64-slc6-gcc48-opt/dict/TrigCostMonitor/TrigCostMonitorDict.dsomap
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../x86_64-slc6-gcc48-opt/dict/TrigCostMonitor/TrigCostMonitorDict.dsomap`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "TrigCostMonitorDict.dsomap" "$(install_dir)" "ln -sf" "$($(package)_cmtpath)"; \
	fi

../x86_64-slc6-gcc48-opt/dict/TrigCostMonitor/TrigCostMonitorDict.dsomap : ;

install_TrigCostMonitorDict_TrigCostMonitordictrootmapuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../x86_64-slc6-gcc48-opt/dict/TrigCostMonitor/TrigCostMonitorDict.dsomap`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "TrigCostMonitorDict.dsomap" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi
#-- start of cleanup_header --------------

clean :: install_TrigCostMonitorDict_TrigCostMonitordictrootmapclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(install_TrigCostMonitorDict_TrigCostMonitordictrootmap.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

install_TrigCostMonitorDict_TrigCostMonitordictrootmapclean ::
#-- end of cleanup_header ---------------

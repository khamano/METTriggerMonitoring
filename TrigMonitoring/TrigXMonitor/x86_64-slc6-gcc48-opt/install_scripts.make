#-- start of make_header -----------------

#====================================
#  Document install_scripts
#
#   Generated Wed May 18 00:41:19 2016  by rewang
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_install_scripts_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_install_scripts_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_install_scripts

TrigXMonitor_tag = $(tag)

#cmt_local_tagfile_install_scripts = $(TrigXMonitor_tag)_install_scripts.make
cmt_local_tagfile_install_scripts = $(bin)$(TrigXMonitor_tag)_install_scripts.make

else

tags      = $(tag),$(CMTEXTRATAGS)

TrigXMonitor_tag = $(tag)

#cmt_local_tagfile_install_scripts = $(TrigXMonitor_tag).make
cmt_local_tagfile_install_scripts = $(bin)$(TrigXMonitor_tag).make

endif

include $(cmt_local_tagfile_install_scripts)
#-include $(cmt_local_tagfile_install_scripts)

ifdef cmt_install_scripts_has_target_tag

cmt_final_setup_install_scripts = $(bin)setup_install_scripts.make
cmt_dependencies_in_install_scripts = $(bin)dependencies_install_scripts.in
#cmt_final_setup_install_scripts = $(bin)TrigXMonitor_install_scriptssetup.make
cmt_local_install_scripts_makefile = $(bin)install_scripts.make

else

cmt_final_setup_install_scripts = $(bin)setup.make
cmt_dependencies_in_install_scripts = $(bin)dependencies.in
#cmt_final_setup_install_scripts = $(bin)TrigXMonitorsetup.make
cmt_local_install_scripts_makefile = $(bin)install_scripts.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)TrigXMonitorsetup.make

#install_scripts :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'install_scripts'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = install_scripts/
#install_scripts::
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

install_dir = ${installarea}/share/bin

install_scripts :: install_scriptsinstall ;

install :: install_scriptsinstall ;

install_scriptsclean :: install_scriptsuninstall

uninstall :: install_scriptsuninstall


# This is to avoid error in case there are no files to install
# Ideally, the fragment should not be used without files to install,
# and this line should be dropped then
install_scriptsinstall :: ;

fit_py_dependencies = ../macros/fit.py
xmon_py_dependencies = ../macros/xmon.py


install_scriptsinstall :: ${install_dir}/fit.py ;

${install_dir}/fit.py :: ../macros/fit.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/fit.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "fit.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/fit.py : ;

install_scriptsuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/fit.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "fit.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_scriptsinstall :: ${install_dir}/xmon.py ;

${install_dir}/xmon.py :: ../macros/xmon.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/xmon.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "xmon.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/xmon.py : ;

install_scriptsuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/xmon.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "xmon.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi
#-- start of cleanup_header --------------

clean :: install_scriptsclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(install_scripts.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

install_scriptsclean ::
#-- end of cleanup_header ---------------

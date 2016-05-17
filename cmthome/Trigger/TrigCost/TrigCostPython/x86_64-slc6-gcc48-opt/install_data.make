#-- start of make_header -----------------

#====================================
#  Document install_data
#
#   Generated Sun May 15 17:50:07 2016  by rewang
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_install_data_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_install_data_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_install_data

TrigCostPython_tag = $(tag)

#cmt_local_tagfile_install_data = $(TrigCostPython_tag)_install_data.make
cmt_local_tagfile_install_data = $(bin)$(TrigCostPython_tag)_install_data.make

else

tags      = $(tag),$(CMTEXTRATAGS)

TrigCostPython_tag = $(tag)

#cmt_local_tagfile_install_data = $(TrigCostPython_tag).make
cmt_local_tagfile_install_data = $(bin)$(TrigCostPython_tag).make

endif

include $(cmt_local_tagfile_install_data)
#-include $(cmt_local_tagfile_install_data)

ifdef cmt_install_data_has_target_tag

cmt_final_setup_install_data = $(bin)setup_install_data.make
cmt_dependencies_in_install_data = $(bin)dependencies_install_data.in
#cmt_final_setup_install_data = $(bin)TrigCostPython_install_datasetup.make
cmt_local_install_data_makefile = $(bin)install_data.make

else

cmt_final_setup_install_data = $(bin)setup.make
cmt_dependencies_in_install_data = $(bin)dependencies.in
#cmt_final_setup_install_data = $(bin)TrigCostPythonsetup.make
cmt_local_install_data_makefile = $(bin)install_data.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)TrigCostPythonsetup.make

#install_data :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'install_data'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = install_data/
#install_data::
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

install_dir = ${installarea}/share/TrigCostPython

install_data :: install_datainstall ;

install :: install_datainstall ;

install_dataclean :: install_datauninstall

uninstall :: install_datauninstall


# This is to avoid error in case there are no files to install
# Ideally, the fragment should not be used without files to install,
# and this line should be dropped then
install_datainstall :: ;

compRates_head_html_dependencies = ../data/compRates_head.html
highlight_js_dependencies = ../data/highlight.js
sorttable_js_dependencies = ../data/sorttable.js


install_datainstall :: ${install_dir}/compRates_head.html ;

${install_dir}/compRates_head.html :: ../data/compRates_head.html
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../data/compRates_head.html`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "compRates_head.html" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../data/compRates_head.html : ;

install_datauninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../data/compRates_head.html`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "compRates_head.html" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_datainstall :: ${install_dir}/highlight.js ;

${install_dir}/highlight.js :: ../data/highlight.js
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../data/highlight.js`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "highlight.js" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../data/highlight.js : ;

install_datauninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../data/highlight.js`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "highlight.js" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_datainstall :: ${install_dir}/sorttable.js ;

${install_dir}/sorttable.js :: ../data/sorttable.js
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../data/sorttable.js`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "sorttable.js" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../data/sorttable.js : ;

install_datauninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../data/sorttable.js`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "sorttable.js" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi
#-- start of cleanup_header --------------

clean :: install_dataclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(install_data.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

install_dataclean ::
#-- end of cleanup_header ---------------

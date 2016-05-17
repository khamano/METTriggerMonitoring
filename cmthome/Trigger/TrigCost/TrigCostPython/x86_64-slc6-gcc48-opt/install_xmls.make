#-- start of make_header -----------------

#====================================
#  Document install_xmls
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

cmt_install_xmls_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_install_xmls_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_install_xmls

TrigCostPython_tag = $(tag)

#cmt_local_tagfile_install_xmls = $(TrigCostPython_tag)_install_xmls.make
cmt_local_tagfile_install_xmls = $(bin)$(TrigCostPython_tag)_install_xmls.make

else

tags      = $(tag),$(CMTEXTRATAGS)

TrigCostPython_tag = $(tag)

#cmt_local_tagfile_install_xmls = $(TrigCostPython_tag).make
cmt_local_tagfile_install_xmls = $(bin)$(TrigCostPython_tag).make

endif

include $(cmt_local_tagfile_install_xmls)
#-include $(cmt_local_tagfile_install_xmls)

ifdef cmt_install_xmls_has_target_tag

cmt_final_setup_install_xmls = $(bin)setup_install_xmls.make
cmt_dependencies_in_install_xmls = $(bin)dependencies_install_xmls.in
#cmt_final_setup_install_xmls = $(bin)TrigCostPython_install_xmlssetup.make
cmt_local_install_xmls_makefile = $(bin)install_xmls.make

else

cmt_final_setup_install_xmls = $(bin)setup.make
cmt_dependencies_in_install_xmls = $(bin)dependencies.in
#cmt_final_setup_install_xmls = $(bin)TrigCostPythonsetup.make
cmt_local_install_xmls_makefile = $(bin)install_xmls.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)TrigCostPythonsetup.make

#install_xmls :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'install_xmls'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = install_xmls/
#install_xmls::
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

install_dir = ${installarea}/XML/TrigCostPython

install_xmls :: install_xmlsinstall ;

install :: install_xmlsinstall ;

install_xmlsclean :: install_xmlsuninstall

uninstall :: install_xmlsuninstall


# This is to avoid error in case there are no files to install
# Ideally, the fragment should not be used without files to install,
# and this line should be dropped then
install_xmlsinstall :: ;

exampleRanges_xml_dependencies = ../data/exampleRanges.xml


install_xmlsinstall :: ${install_dir}/exampleRanges.xml ;

${install_dir}/exampleRanges.xml :: ../data/exampleRanges.xml
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../data/exampleRanges.xml`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "exampleRanges.xml" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../data/exampleRanges.xml : ;

install_xmlsuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../data/exampleRanges.xml`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "exampleRanges.xml" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi
#-- start of cleanup_header --------------

clean :: install_xmlsclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(install_xmls.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

install_xmlsclean ::
#-- end of cleanup_header ---------------

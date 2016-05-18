#-- start of make_header -----------------

#====================================
#  Document install_binaries
#
#   Generated Wed May 18 00:41:24 2016  by rewang
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_install_binaries_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_install_binaries_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_install_binaries

TrigCostPython_tag = $(tag)

#cmt_local_tagfile_install_binaries = $(TrigCostPython_tag)_install_binaries.make
cmt_local_tagfile_install_binaries = $(bin)$(TrigCostPython_tag)_install_binaries.make

else

tags      = $(tag),$(CMTEXTRATAGS)

TrigCostPython_tag = $(tag)

#cmt_local_tagfile_install_binaries = $(TrigCostPython_tag).make
cmt_local_tagfile_install_binaries = $(bin)$(TrigCostPython_tag).make

endif

include $(cmt_local_tagfile_install_binaries)
#-include $(cmt_local_tagfile_install_binaries)

ifdef cmt_install_binaries_has_target_tag

cmt_final_setup_install_binaries = $(bin)setup_install_binaries.make
cmt_dependencies_in_install_binaries = $(bin)dependencies_install_binaries.in
#cmt_final_setup_install_binaries = $(bin)TrigCostPython_install_binariessetup.make
cmt_local_install_binaries_makefile = $(bin)install_binaries.make

else

cmt_final_setup_install_binaries = $(bin)setup.make
cmt_dependencies_in_install_binaries = $(bin)dependencies.in
#cmt_final_setup_install_binaries = $(bin)TrigCostPythonsetup.make
cmt_local_install_binaries_makefile = $(bin)install_binaries.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)TrigCostPythonsetup.make

#install_binaries :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'install_binaries'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = install_binaries/
#install_binaries::
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

install_binaries :: install_binariesinstall ;

install :: install_binariesinstall ;

install_binariesclean :: install_binariesuninstall

uninstall :: install_binariesuninstall


# This is to avoid error in case there are no files to install
# Ideally, the fragment should not be used without files to install,
# and this line should be dropped then
install_binariesinstall :: ;

AddPieChart_py_dependencies = ../macros/AddPieChart.py
DeadTime_py_dependencies = ../macros/DeadTime.py
DumpMuXML_py_dependencies = ../macros/DumpMuXML.py
EBStats_py_dependencies = ../macros/EBStats.py
MultiRatesJobList_py_dependencies = ../macros/MultiRatesJobList.py
NonlinearityCheck_py_dependencies = ../macros/NonlinearityCheck.py
PlotTime_vs_Mu_py_dependencies = ../macros/PlotTime_vs_Mu.py
RTT_steering_py_dependencies = ../macros/RTT_steering.py
RunMultiRates_py_dependencies = ../macros/RunMultiRates.py
addDataXml_py_dependencies = ../macros/addDataXml.py
addPrescales_py_dependencies = ../macros/addPrescales.py
calcRateMan_py_dependencies = ../macros/calcRateMan.py
checkOptPS_py_dependencies = ../macros/checkOptPS.py
compOnline_py_dependencies = ../macros/compOnline.py
compRates_py_dependencies = ../macros/compRates.py
compRatesPS1_py_dependencies = ../macros/compRatesPS1.py
compResults_py_dependencies = ../macros/compResults.py
costxml2html_py_dependencies = ../macros/costxml2html.py
exampleCost_py_dependencies = ../macros/exampleCost.py
fitRoot_py_dependencies = ../macros/fitRoot.py
histRates_py_dependencies = ../macros/histRates.py
makeCumuTables_py_dependencies = ../macros/makeCumuTables.py
makeGroupTables_py_dependencies = ../macros/makeGroupTables.py
makeGroupXML_py_dependencies = ../macros/makeGroupXML.py
makePieCharts_py_dependencies = ../macros/makePieCharts.py
makePrescaleXML_py_dependencies = ../macros/makePrescaleXML.py
makeRoot_py_dependencies = ../macros/makeRoot.py
makeSuperGroupXML_py_dependencies = ../macros/makeSuperGroupXML.py
makeTable_py_dependencies = ../macros/makeTable.py
plotRoot_py_dependencies = ../macros/plotRoot.py
plotRootSimple_py_dependencies = ../macros/plotRootSimple.py
prepareForTwiki_py_dependencies = ../macros/prepareForTwiki.py
processCoolRates_py_dependencies = ../macros/processCoolRates.py
rangeCheck_py_dependencies = ../macros/rangeCheck.py
rateVThrsh_py_dependencies = ../macros/rateVThrsh.py
getfile_sh_dependencies = ../macros/getfile.sh


install_binariesinstall :: ${install_dir}/AddPieChart.py ;

${install_dir}/AddPieChart.py :: ../macros/AddPieChart.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/AddPieChart.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "AddPieChart.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/AddPieChart.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/AddPieChart.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "AddPieChart.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/DeadTime.py ;

${install_dir}/DeadTime.py :: ../macros/DeadTime.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/DeadTime.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "DeadTime.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/DeadTime.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/DeadTime.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "DeadTime.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/DumpMuXML.py ;

${install_dir}/DumpMuXML.py :: ../macros/DumpMuXML.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/DumpMuXML.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "DumpMuXML.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/DumpMuXML.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/DumpMuXML.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "DumpMuXML.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/EBStats.py ;

${install_dir}/EBStats.py :: ../macros/EBStats.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/EBStats.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "EBStats.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/EBStats.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/EBStats.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "EBStats.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/MultiRatesJobList.py ;

${install_dir}/MultiRatesJobList.py :: ../macros/MultiRatesJobList.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/MultiRatesJobList.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "MultiRatesJobList.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/MultiRatesJobList.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/MultiRatesJobList.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "MultiRatesJobList.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/NonlinearityCheck.py ;

${install_dir}/NonlinearityCheck.py :: ../macros/NonlinearityCheck.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/NonlinearityCheck.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "NonlinearityCheck.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/NonlinearityCheck.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/NonlinearityCheck.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "NonlinearityCheck.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/PlotTime_vs_Mu.py ;

${install_dir}/PlotTime_vs_Mu.py :: ../macros/PlotTime_vs_Mu.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/PlotTime_vs_Mu.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "PlotTime_vs_Mu.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/PlotTime_vs_Mu.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/PlotTime_vs_Mu.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "PlotTime_vs_Mu.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/RTT_steering.py ;

${install_dir}/RTT_steering.py :: ../macros/RTT_steering.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/RTT_steering.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "RTT_steering.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/RTT_steering.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/RTT_steering.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "RTT_steering.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/RunMultiRates.py ;

${install_dir}/RunMultiRates.py :: ../macros/RunMultiRates.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/RunMultiRates.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "RunMultiRates.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/RunMultiRates.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/RunMultiRates.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "RunMultiRates.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/addDataXml.py ;

${install_dir}/addDataXml.py :: ../macros/addDataXml.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/addDataXml.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "addDataXml.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/addDataXml.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/addDataXml.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "addDataXml.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/addPrescales.py ;

${install_dir}/addPrescales.py :: ../macros/addPrescales.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/addPrescales.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "addPrescales.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/addPrescales.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/addPrescales.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "addPrescales.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/calcRateMan.py ;

${install_dir}/calcRateMan.py :: ../macros/calcRateMan.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/calcRateMan.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "calcRateMan.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/calcRateMan.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/calcRateMan.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "calcRateMan.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/checkOptPS.py ;

${install_dir}/checkOptPS.py :: ../macros/checkOptPS.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/checkOptPS.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "checkOptPS.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/checkOptPS.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/checkOptPS.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "checkOptPS.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/compOnline.py ;

${install_dir}/compOnline.py :: ../macros/compOnline.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/compOnline.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "compOnline.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/compOnline.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/compOnline.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "compOnline.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/compRates.py ;

${install_dir}/compRates.py :: ../macros/compRates.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/compRates.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "compRates.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/compRates.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/compRates.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "compRates.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/compRatesPS1.py ;

${install_dir}/compRatesPS1.py :: ../macros/compRatesPS1.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/compRatesPS1.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "compRatesPS1.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/compRatesPS1.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/compRatesPS1.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "compRatesPS1.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/compResults.py ;

${install_dir}/compResults.py :: ../macros/compResults.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/compResults.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "compResults.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/compResults.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/compResults.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "compResults.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/costxml2html.py ;

${install_dir}/costxml2html.py :: ../macros/costxml2html.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/costxml2html.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "costxml2html.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/costxml2html.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/costxml2html.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "costxml2html.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/exampleCost.py ;

${install_dir}/exampleCost.py :: ../macros/exampleCost.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/exampleCost.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "exampleCost.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/exampleCost.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/exampleCost.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "exampleCost.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/fitRoot.py ;

${install_dir}/fitRoot.py :: ../macros/fitRoot.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/fitRoot.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "fitRoot.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/fitRoot.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/fitRoot.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "fitRoot.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/histRates.py ;

${install_dir}/histRates.py :: ../macros/histRates.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/histRates.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "histRates.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/histRates.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/histRates.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "histRates.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/makeCumuTables.py ;

${install_dir}/makeCumuTables.py :: ../macros/makeCumuTables.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/makeCumuTables.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "makeCumuTables.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/makeCumuTables.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/makeCumuTables.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "makeCumuTables.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/makeGroupTables.py ;

${install_dir}/makeGroupTables.py :: ../macros/makeGroupTables.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/makeGroupTables.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "makeGroupTables.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/makeGroupTables.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/makeGroupTables.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "makeGroupTables.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/makeGroupXML.py ;

${install_dir}/makeGroupXML.py :: ../macros/makeGroupXML.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/makeGroupXML.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "makeGroupXML.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/makeGroupXML.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/makeGroupXML.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "makeGroupXML.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/makePieCharts.py ;

${install_dir}/makePieCharts.py :: ../macros/makePieCharts.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/makePieCharts.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "makePieCharts.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/makePieCharts.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/makePieCharts.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "makePieCharts.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/makePrescaleXML.py ;

${install_dir}/makePrescaleXML.py :: ../macros/makePrescaleXML.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/makePrescaleXML.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "makePrescaleXML.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/makePrescaleXML.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/makePrescaleXML.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "makePrescaleXML.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/makeRoot.py ;

${install_dir}/makeRoot.py :: ../macros/makeRoot.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/makeRoot.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "makeRoot.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/makeRoot.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/makeRoot.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "makeRoot.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/makeSuperGroupXML.py ;

${install_dir}/makeSuperGroupXML.py :: ../macros/makeSuperGroupXML.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/makeSuperGroupXML.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "makeSuperGroupXML.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/makeSuperGroupXML.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/makeSuperGroupXML.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "makeSuperGroupXML.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/makeTable.py ;

${install_dir}/makeTable.py :: ../macros/makeTable.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/makeTable.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "makeTable.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/makeTable.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/makeTable.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "makeTable.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/plotRoot.py ;

${install_dir}/plotRoot.py :: ../macros/plotRoot.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/plotRoot.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "plotRoot.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/plotRoot.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/plotRoot.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "plotRoot.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/plotRootSimple.py ;

${install_dir}/plotRootSimple.py :: ../macros/plotRootSimple.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/plotRootSimple.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "plotRootSimple.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/plotRootSimple.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/plotRootSimple.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "plotRootSimple.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/prepareForTwiki.py ;

${install_dir}/prepareForTwiki.py :: ../macros/prepareForTwiki.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/prepareForTwiki.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "prepareForTwiki.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/prepareForTwiki.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/prepareForTwiki.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "prepareForTwiki.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/processCoolRates.py ;

${install_dir}/processCoolRates.py :: ../macros/processCoolRates.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/processCoolRates.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "processCoolRates.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/processCoolRates.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/processCoolRates.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "processCoolRates.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/rangeCheck.py ;

${install_dir}/rangeCheck.py :: ../macros/rangeCheck.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/rangeCheck.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "rangeCheck.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/rangeCheck.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/rangeCheck.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "rangeCheck.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/rateVThrsh.py ;

${install_dir}/rateVThrsh.py :: ../macros/rateVThrsh.py
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/rateVThrsh.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "rateVThrsh.py" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/rateVThrsh.py : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/rateVThrsh.py`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "rateVThrsh.py" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi


install_binariesinstall :: ${install_dir}/getfile.sh ;

${install_dir}/getfile.sh :: ../macros/getfile.sh
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/getfile.sh`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_install_action) "$${d}" "getfile.sh" "$(install_dir)" "/cvmfs/atlas.cern.ch/repo/sw/software/x86_64-slc6-gcc48-opt/20.3.5/AtlasCore/20.3.5/External/ExternalPolicy/src/symlink.sh" "$($(package)_cmtpath)"; \
	fi

../macros/getfile.sh : ;

install_binariesuninstall ::
	@if test ! "${installarea}" = ""; then \
	  d=`dirname ../macros/getfile.sh`; \
	  d=`(cd $${d}; pwd)`; \
	  CMTINSTALLAREA=${CMTINSTALLAREA}; export CMTINSTALLAREA; \
	  $(cmt_uninstall_action) "$${d}" "getfile.sh" "$(install_dir)" "$($(package)_cmtpath)"; \
	fi
#-- start of cleanup_header --------------

clean :: install_binariesclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(install_binaries.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

install_binariesclean ::
#-- end of cleanup_header ---------------

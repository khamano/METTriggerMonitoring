#-- start of make_header -----------------

#====================================
#  Library TrigCostMonitorLib
#
#   Generated Sun May 15 17:50:11 2016  by rewang
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_TrigCostMonitorLib_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_TrigCostMonitorLib_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_TrigCostMonitorLib

TrigCostMonitor_tag = $(tag)

#cmt_local_tagfile_TrigCostMonitorLib = $(TrigCostMonitor_tag)_TrigCostMonitorLib.make
cmt_local_tagfile_TrigCostMonitorLib = $(bin)$(TrigCostMonitor_tag)_TrigCostMonitorLib.make

else

tags      = $(tag),$(CMTEXTRATAGS)

TrigCostMonitor_tag = $(tag)

#cmt_local_tagfile_TrigCostMonitorLib = $(TrigCostMonitor_tag).make
cmt_local_tagfile_TrigCostMonitorLib = $(bin)$(TrigCostMonitor_tag).make

endif

include $(cmt_local_tagfile_TrigCostMonitorLib)
#-include $(cmt_local_tagfile_TrigCostMonitorLib)

ifdef cmt_TrigCostMonitorLib_has_target_tag

cmt_final_setup_TrigCostMonitorLib = $(bin)setup_TrigCostMonitorLib.make
cmt_dependencies_in_TrigCostMonitorLib = $(bin)dependencies_TrigCostMonitorLib.in
#cmt_final_setup_TrigCostMonitorLib = $(bin)TrigCostMonitor_TrigCostMonitorLibsetup.make
cmt_local_TrigCostMonitorLib_makefile = $(bin)TrigCostMonitorLib.make

else

cmt_final_setup_TrigCostMonitorLib = $(bin)setup.make
cmt_dependencies_in_TrigCostMonitorLib = $(bin)dependencies.in
#cmt_final_setup_TrigCostMonitorLib = $(bin)TrigCostMonitorsetup.make
cmt_local_TrigCostMonitorLib_makefile = $(bin)TrigCostMonitorLib.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)TrigCostMonitorsetup.make

#TrigCostMonitorLib :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'TrigCostMonitorLib'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = TrigCostMonitorLib/
#TrigCostMonitorLib::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

TrigCostMonitorLiblibname   = $(bin)$(library_prefix)TrigCostMonitorLib$(library_suffix)
TrigCostMonitorLiblib       = $(TrigCostMonitorLiblibname).a
TrigCostMonitorLibstamp     = $(bin)TrigCostMonitorLib.stamp
TrigCostMonitorLibshstamp   = $(bin)TrigCostMonitorLib.shstamp

TrigCostMonitorLib :: dirs  TrigCostMonitorLibLIB
	$(echo) "TrigCostMonitorLib ok"

#-- end of libary_header ----------------
#-- start of library_no_static ------

#TrigCostMonitorLibLIB :: $(TrigCostMonitorLiblib) $(TrigCostMonitorLibshstamp)
TrigCostMonitorLibLIB :: $(TrigCostMonitorLibshstamp)
	$(echo) "TrigCostMonitorLib : library ok"

$(TrigCostMonitorLiblib) :: $(bin)ReadConf.o $(bin)TrigCostAlg.o $(bin)TrigCostRun.o $(bin)TrigNtEBWeightTool.o $(bin)TrigNtSaveTool.o $(bin)TrigNtRobsTool.o $(bin)FillConf.o $(bin)TrigCostTool.o $(bin)TrigNtHltRTool.o $(bin)TrigNtVarsTool.o $(bin)TrigNtLvl1Tool.o $(bin)UtilCost.o $(bin)TrigNtElemTool.o $(bin)TrigNtExecTool.o $(bin)TrigNtPostTool.o $(bin)TrigNtConfTool.o $(bin)ReadLumiBlock.o
	$(lib_echo) "static library $@"
	$(lib_silent) cd $(bin); \
	  $(ar) $(TrigCostMonitorLiblib) $?
	$(lib_silent) $(ranlib) $(TrigCostMonitorLiblib)
	$(lib_silent) cat /dev/null >$(TrigCostMonitorLibstamp)

#------------------------------------------------------------------
#  Future improvement? to empty the object files after
#  storing in the library
#
##	  for f in $?; do \
##	    rm $${f}; touch $${f}; \
##	  done
#------------------------------------------------------------------

#
# We add one level of dependency upon the true shared library 
# (rather than simply upon the stamp file)
# this is for cases where the shared library has not been built
# while the stamp was created (error??) 
#

$(TrigCostMonitorLiblibname).$(shlibsuffix) :: $(bin)ReadConf.o $(bin)TrigCostAlg.o $(bin)TrigCostRun.o $(bin)TrigNtEBWeightTool.o $(bin)TrigNtSaveTool.o $(bin)TrigNtRobsTool.o $(bin)FillConf.o $(bin)TrigCostTool.o $(bin)TrigNtHltRTool.o $(bin)TrigNtVarsTool.o $(bin)TrigNtLvl1Tool.o $(bin)UtilCost.o $(bin)TrigNtElemTool.o $(bin)TrigNtExecTool.o $(bin)TrigNtPostTool.o $(bin)TrigNtConfTool.o $(bin)ReadLumiBlock.o $(use_requirements) $(TrigCostMonitorLibstamps)
	$(lib_echo) "shared library $@"
	$(lib_silent) $(shlibbuilder) $(shlibflags) -o $@ $(bin)ReadConf.o $(bin)TrigCostAlg.o $(bin)TrigCostRun.o $(bin)TrigNtEBWeightTool.o $(bin)TrigNtSaveTool.o $(bin)TrigNtRobsTool.o $(bin)FillConf.o $(bin)TrigCostTool.o $(bin)TrigNtHltRTool.o $(bin)TrigNtVarsTool.o $(bin)TrigNtLvl1Tool.o $(bin)UtilCost.o $(bin)TrigNtElemTool.o $(bin)TrigNtExecTool.o $(bin)TrigNtPostTool.o $(bin)TrigNtConfTool.o $(bin)ReadLumiBlock.o $(TrigCostMonitorLib_shlibflags)
	$(lib_silent) cat /dev/null >$(TrigCostMonitorLibstamp) && \
	  cat /dev/null >$(TrigCostMonitorLibshstamp)

$(TrigCostMonitorLibshstamp) :: $(TrigCostMonitorLiblibname).$(shlibsuffix)
	$(lib_silent) if test -f $(TrigCostMonitorLiblibname).$(shlibsuffix) ; then \
	  cat /dev/null >$(TrigCostMonitorLibstamp) && \
	  cat /dev/null >$(TrigCostMonitorLibshstamp) ; fi

TrigCostMonitorLibclean ::
	$(cleanup_echo) objects TrigCostMonitorLib
	$(cleanup_silent) /bin/rm -f $(bin)ReadConf.o $(bin)TrigCostAlg.o $(bin)TrigCostRun.o $(bin)TrigNtEBWeightTool.o $(bin)TrigNtSaveTool.o $(bin)TrigNtRobsTool.o $(bin)FillConf.o $(bin)TrigCostTool.o $(bin)TrigNtHltRTool.o $(bin)TrigNtVarsTool.o $(bin)TrigNtLvl1Tool.o $(bin)UtilCost.o $(bin)TrigNtElemTool.o $(bin)TrigNtExecTool.o $(bin)TrigNtPostTool.o $(bin)TrigNtConfTool.o $(bin)ReadLumiBlock.o
	$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)ReadConf.o $(bin)TrigCostAlg.o $(bin)TrigCostRun.o $(bin)TrigNtEBWeightTool.o $(bin)TrigNtSaveTool.o $(bin)TrigNtRobsTool.o $(bin)FillConf.o $(bin)TrigCostTool.o $(bin)TrigNtHltRTool.o $(bin)TrigNtVarsTool.o $(bin)TrigNtLvl1Tool.o $(bin)UtilCost.o $(bin)TrigNtElemTool.o $(bin)TrigNtExecTool.o $(bin)TrigNtPostTool.o $(bin)TrigNtConfTool.o $(bin)ReadLumiBlock.o) $(patsubst %.o,%.dep,$(bin)ReadConf.o $(bin)TrigCostAlg.o $(bin)TrigCostRun.o $(bin)TrigNtEBWeightTool.o $(bin)TrigNtSaveTool.o $(bin)TrigNtRobsTool.o $(bin)FillConf.o $(bin)TrigCostTool.o $(bin)TrigNtHltRTool.o $(bin)TrigNtVarsTool.o $(bin)TrigNtLvl1Tool.o $(bin)UtilCost.o $(bin)TrigNtElemTool.o $(bin)TrigNtExecTool.o $(bin)TrigNtPostTool.o $(bin)TrigNtConfTool.o $(bin)ReadLumiBlock.o) $(patsubst %.o,%.d.stamp,$(bin)ReadConf.o $(bin)TrigCostAlg.o $(bin)TrigCostRun.o $(bin)TrigNtEBWeightTool.o $(bin)TrigNtSaveTool.o $(bin)TrigNtRobsTool.o $(bin)FillConf.o $(bin)TrigCostTool.o $(bin)TrigNtHltRTool.o $(bin)TrigNtVarsTool.o $(bin)TrigNtLvl1Tool.o $(bin)UtilCost.o $(bin)TrigNtElemTool.o $(bin)TrigNtExecTool.o $(bin)TrigNtPostTool.o $(bin)TrigNtConfTool.o $(bin)ReadLumiBlock.o)
	$(cleanup_silent) cd $(bin); /bin/rm -rf TrigCostMonitorLib_deps TrigCostMonitorLib_dependencies.make

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/lib
TrigCostMonitorLibinstallname = $(library_prefix)TrigCostMonitorLib$(library_suffix).$(shlibsuffix)

TrigCostMonitorLib :: TrigCostMonitorLibinstall ;

install :: TrigCostMonitorLibinstall ;

TrigCostMonitorLibinstall :: $(install_dir)/$(TrigCostMonitorLibinstallname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(TrigCostMonitorLibinstallname) :: $(bin)$(TrigCostMonitorLibinstallname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(TrigCostMonitorLibinstallname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##TrigCostMonitorLibclean :: TrigCostMonitorLibuninstall

uninstall :: TrigCostMonitorLibuninstall ;

TrigCostMonitorLibuninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(TrigCostMonitorLibinstallname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#-- end of library_no_static ------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),TrigCostMonitorLibclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ReadConf.d

$(bin)$(binobj)ReadConf.d :

$(bin)$(binobj)ReadConf.o : $(cmt_final_setup_TrigCostMonitorLib)

$(bin)$(binobj)ReadConf.o : $(src)ReadConf.cxx
	$(cpp_echo) $(src)ReadConf.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(ReadConf_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(ReadConf_cppflags) $(ReadConf_cxx_cppflags)  $(src)ReadConf.cxx
endif
endif

else
$(bin)TrigCostMonitorLib_dependencies.make : $(ReadConf_cxx_dependencies)

$(bin)TrigCostMonitorLib_dependencies.make : $(src)ReadConf.cxx

$(bin)$(binobj)ReadConf.o : $(ReadConf_cxx_dependencies)
	$(cpp_echo) $(src)ReadConf.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(ReadConf_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(ReadConf_cppflags) $(ReadConf_cxx_cppflags)  $(src)ReadConf.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),TrigCostMonitorLibclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)TrigCostAlg.d

$(bin)$(binobj)TrigCostAlg.d :

$(bin)$(binobj)TrigCostAlg.o : $(cmt_final_setup_TrigCostMonitorLib)

$(bin)$(binobj)TrigCostAlg.o : $(src)TrigCostAlg.cxx
	$(cpp_echo) $(src)TrigCostAlg.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(TrigCostAlg_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(TrigCostAlg_cppflags) $(TrigCostAlg_cxx_cppflags)  $(src)TrigCostAlg.cxx
endif
endif

else
$(bin)TrigCostMonitorLib_dependencies.make : $(TrigCostAlg_cxx_dependencies)

$(bin)TrigCostMonitorLib_dependencies.make : $(src)TrigCostAlg.cxx

$(bin)$(binobj)TrigCostAlg.o : $(TrigCostAlg_cxx_dependencies)
	$(cpp_echo) $(src)TrigCostAlg.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(TrigCostAlg_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(TrigCostAlg_cppflags) $(TrigCostAlg_cxx_cppflags)  $(src)TrigCostAlg.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),TrigCostMonitorLibclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)TrigCostRun.d

$(bin)$(binobj)TrigCostRun.d :

$(bin)$(binobj)TrigCostRun.o : $(cmt_final_setup_TrigCostMonitorLib)

$(bin)$(binobj)TrigCostRun.o : $(src)TrigCostRun.cxx
	$(cpp_echo) $(src)TrigCostRun.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(TrigCostRun_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(TrigCostRun_cppflags) $(TrigCostRun_cxx_cppflags)  $(src)TrigCostRun.cxx
endif
endif

else
$(bin)TrigCostMonitorLib_dependencies.make : $(TrigCostRun_cxx_dependencies)

$(bin)TrigCostMonitorLib_dependencies.make : $(src)TrigCostRun.cxx

$(bin)$(binobj)TrigCostRun.o : $(TrigCostRun_cxx_dependencies)
	$(cpp_echo) $(src)TrigCostRun.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(TrigCostRun_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(TrigCostRun_cppflags) $(TrigCostRun_cxx_cppflags)  $(src)TrigCostRun.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),TrigCostMonitorLibclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)TrigNtEBWeightTool.d

$(bin)$(binobj)TrigNtEBWeightTool.d :

$(bin)$(binobj)TrigNtEBWeightTool.o : $(cmt_final_setup_TrigCostMonitorLib)

$(bin)$(binobj)TrigNtEBWeightTool.o : $(src)TrigNtEBWeightTool.cxx
	$(cpp_echo) $(src)TrigNtEBWeightTool.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(TrigNtEBWeightTool_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(TrigNtEBWeightTool_cppflags) $(TrigNtEBWeightTool_cxx_cppflags)  $(src)TrigNtEBWeightTool.cxx
endif
endif

else
$(bin)TrigCostMonitorLib_dependencies.make : $(TrigNtEBWeightTool_cxx_dependencies)

$(bin)TrigCostMonitorLib_dependencies.make : $(src)TrigNtEBWeightTool.cxx

$(bin)$(binobj)TrigNtEBWeightTool.o : $(TrigNtEBWeightTool_cxx_dependencies)
	$(cpp_echo) $(src)TrigNtEBWeightTool.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(TrigNtEBWeightTool_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(TrigNtEBWeightTool_cppflags) $(TrigNtEBWeightTool_cxx_cppflags)  $(src)TrigNtEBWeightTool.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),TrigCostMonitorLibclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)TrigNtSaveTool.d

$(bin)$(binobj)TrigNtSaveTool.d :

$(bin)$(binobj)TrigNtSaveTool.o : $(cmt_final_setup_TrigCostMonitorLib)

$(bin)$(binobj)TrigNtSaveTool.o : $(src)TrigNtSaveTool.cxx
	$(cpp_echo) $(src)TrigNtSaveTool.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(TrigNtSaveTool_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(TrigNtSaveTool_cppflags) $(TrigNtSaveTool_cxx_cppflags)  $(src)TrigNtSaveTool.cxx
endif
endif

else
$(bin)TrigCostMonitorLib_dependencies.make : $(TrigNtSaveTool_cxx_dependencies)

$(bin)TrigCostMonitorLib_dependencies.make : $(src)TrigNtSaveTool.cxx

$(bin)$(binobj)TrigNtSaveTool.o : $(TrigNtSaveTool_cxx_dependencies)
	$(cpp_echo) $(src)TrigNtSaveTool.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(TrigNtSaveTool_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(TrigNtSaveTool_cppflags) $(TrigNtSaveTool_cxx_cppflags)  $(src)TrigNtSaveTool.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),TrigCostMonitorLibclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)TrigNtRobsTool.d

$(bin)$(binobj)TrigNtRobsTool.d :

$(bin)$(binobj)TrigNtRobsTool.o : $(cmt_final_setup_TrigCostMonitorLib)

$(bin)$(binobj)TrigNtRobsTool.o : $(src)TrigNtRobsTool.cxx
	$(cpp_echo) $(src)TrigNtRobsTool.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(TrigNtRobsTool_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(TrigNtRobsTool_cppflags) $(TrigNtRobsTool_cxx_cppflags)  $(src)TrigNtRobsTool.cxx
endif
endif

else
$(bin)TrigCostMonitorLib_dependencies.make : $(TrigNtRobsTool_cxx_dependencies)

$(bin)TrigCostMonitorLib_dependencies.make : $(src)TrigNtRobsTool.cxx

$(bin)$(binobj)TrigNtRobsTool.o : $(TrigNtRobsTool_cxx_dependencies)
	$(cpp_echo) $(src)TrigNtRobsTool.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(TrigNtRobsTool_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(TrigNtRobsTool_cppflags) $(TrigNtRobsTool_cxx_cppflags)  $(src)TrigNtRobsTool.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),TrigCostMonitorLibclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)FillConf.d

$(bin)$(binobj)FillConf.d :

$(bin)$(binobj)FillConf.o : $(cmt_final_setup_TrigCostMonitorLib)

$(bin)$(binobj)FillConf.o : $(src)FillConf.cxx
	$(cpp_echo) $(src)FillConf.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(FillConf_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(FillConf_cppflags) $(FillConf_cxx_cppflags)  $(src)FillConf.cxx
endif
endif

else
$(bin)TrigCostMonitorLib_dependencies.make : $(FillConf_cxx_dependencies)

$(bin)TrigCostMonitorLib_dependencies.make : $(src)FillConf.cxx

$(bin)$(binobj)FillConf.o : $(FillConf_cxx_dependencies)
	$(cpp_echo) $(src)FillConf.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(FillConf_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(FillConf_cppflags) $(FillConf_cxx_cppflags)  $(src)FillConf.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),TrigCostMonitorLibclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)TrigCostTool.d

$(bin)$(binobj)TrigCostTool.d :

$(bin)$(binobj)TrigCostTool.o : $(cmt_final_setup_TrigCostMonitorLib)

$(bin)$(binobj)TrigCostTool.o : $(src)TrigCostTool.cxx
	$(cpp_echo) $(src)TrigCostTool.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(TrigCostTool_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(TrigCostTool_cppflags) $(TrigCostTool_cxx_cppflags)  $(src)TrigCostTool.cxx
endif
endif

else
$(bin)TrigCostMonitorLib_dependencies.make : $(TrigCostTool_cxx_dependencies)

$(bin)TrigCostMonitorLib_dependencies.make : $(src)TrigCostTool.cxx

$(bin)$(binobj)TrigCostTool.o : $(TrigCostTool_cxx_dependencies)
	$(cpp_echo) $(src)TrigCostTool.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(TrigCostTool_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(TrigCostTool_cppflags) $(TrigCostTool_cxx_cppflags)  $(src)TrigCostTool.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),TrigCostMonitorLibclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)TrigNtHltRTool.d

$(bin)$(binobj)TrigNtHltRTool.d :

$(bin)$(binobj)TrigNtHltRTool.o : $(cmt_final_setup_TrigCostMonitorLib)

$(bin)$(binobj)TrigNtHltRTool.o : $(src)TrigNtHltRTool.cxx
	$(cpp_echo) $(src)TrigNtHltRTool.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(TrigNtHltRTool_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(TrigNtHltRTool_cppflags) $(TrigNtHltRTool_cxx_cppflags)  $(src)TrigNtHltRTool.cxx
endif
endif

else
$(bin)TrigCostMonitorLib_dependencies.make : $(TrigNtHltRTool_cxx_dependencies)

$(bin)TrigCostMonitorLib_dependencies.make : $(src)TrigNtHltRTool.cxx

$(bin)$(binobj)TrigNtHltRTool.o : $(TrigNtHltRTool_cxx_dependencies)
	$(cpp_echo) $(src)TrigNtHltRTool.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(TrigNtHltRTool_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(TrigNtHltRTool_cppflags) $(TrigNtHltRTool_cxx_cppflags)  $(src)TrigNtHltRTool.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),TrigCostMonitorLibclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)TrigNtVarsTool.d

$(bin)$(binobj)TrigNtVarsTool.d :

$(bin)$(binobj)TrigNtVarsTool.o : $(cmt_final_setup_TrigCostMonitorLib)

$(bin)$(binobj)TrigNtVarsTool.o : $(src)TrigNtVarsTool.cxx
	$(cpp_echo) $(src)TrigNtVarsTool.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(TrigNtVarsTool_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(TrigNtVarsTool_cppflags) $(TrigNtVarsTool_cxx_cppflags)  $(src)TrigNtVarsTool.cxx
endif
endif

else
$(bin)TrigCostMonitorLib_dependencies.make : $(TrigNtVarsTool_cxx_dependencies)

$(bin)TrigCostMonitorLib_dependencies.make : $(src)TrigNtVarsTool.cxx

$(bin)$(binobj)TrigNtVarsTool.o : $(TrigNtVarsTool_cxx_dependencies)
	$(cpp_echo) $(src)TrigNtVarsTool.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(TrigNtVarsTool_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(TrigNtVarsTool_cppflags) $(TrigNtVarsTool_cxx_cppflags)  $(src)TrigNtVarsTool.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),TrigCostMonitorLibclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)TrigNtLvl1Tool.d

$(bin)$(binobj)TrigNtLvl1Tool.d :

$(bin)$(binobj)TrigNtLvl1Tool.o : $(cmt_final_setup_TrigCostMonitorLib)

$(bin)$(binobj)TrigNtLvl1Tool.o : $(src)TrigNtLvl1Tool.cxx
	$(cpp_echo) $(src)TrigNtLvl1Tool.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(TrigNtLvl1Tool_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(TrigNtLvl1Tool_cppflags) $(TrigNtLvl1Tool_cxx_cppflags)  $(src)TrigNtLvl1Tool.cxx
endif
endif

else
$(bin)TrigCostMonitorLib_dependencies.make : $(TrigNtLvl1Tool_cxx_dependencies)

$(bin)TrigCostMonitorLib_dependencies.make : $(src)TrigNtLvl1Tool.cxx

$(bin)$(binobj)TrigNtLvl1Tool.o : $(TrigNtLvl1Tool_cxx_dependencies)
	$(cpp_echo) $(src)TrigNtLvl1Tool.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(TrigNtLvl1Tool_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(TrigNtLvl1Tool_cppflags) $(TrigNtLvl1Tool_cxx_cppflags)  $(src)TrigNtLvl1Tool.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),TrigCostMonitorLibclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)UtilCost.d

$(bin)$(binobj)UtilCost.d :

$(bin)$(binobj)UtilCost.o : $(cmt_final_setup_TrigCostMonitorLib)

$(bin)$(binobj)UtilCost.o : $(src)UtilCost.cxx
	$(cpp_echo) $(src)UtilCost.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(UtilCost_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(UtilCost_cppflags) $(UtilCost_cxx_cppflags)  $(src)UtilCost.cxx
endif
endif

else
$(bin)TrigCostMonitorLib_dependencies.make : $(UtilCost_cxx_dependencies)

$(bin)TrigCostMonitorLib_dependencies.make : $(src)UtilCost.cxx

$(bin)$(binobj)UtilCost.o : $(UtilCost_cxx_dependencies)
	$(cpp_echo) $(src)UtilCost.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(UtilCost_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(UtilCost_cppflags) $(UtilCost_cxx_cppflags)  $(src)UtilCost.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),TrigCostMonitorLibclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)TrigNtElemTool.d

$(bin)$(binobj)TrigNtElemTool.d :

$(bin)$(binobj)TrigNtElemTool.o : $(cmt_final_setup_TrigCostMonitorLib)

$(bin)$(binobj)TrigNtElemTool.o : $(src)TrigNtElemTool.cxx
	$(cpp_echo) $(src)TrigNtElemTool.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(TrigNtElemTool_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(TrigNtElemTool_cppflags) $(TrigNtElemTool_cxx_cppflags)  $(src)TrigNtElemTool.cxx
endif
endif

else
$(bin)TrigCostMonitorLib_dependencies.make : $(TrigNtElemTool_cxx_dependencies)

$(bin)TrigCostMonitorLib_dependencies.make : $(src)TrigNtElemTool.cxx

$(bin)$(binobj)TrigNtElemTool.o : $(TrigNtElemTool_cxx_dependencies)
	$(cpp_echo) $(src)TrigNtElemTool.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(TrigNtElemTool_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(TrigNtElemTool_cppflags) $(TrigNtElemTool_cxx_cppflags)  $(src)TrigNtElemTool.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),TrigCostMonitorLibclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)TrigNtExecTool.d

$(bin)$(binobj)TrigNtExecTool.d :

$(bin)$(binobj)TrigNtExecTool.o : $(cmt_final_setup_TrigCostMonitorLib)

$(bin)$(binobj)TrigNtExecTool.o : $(src)TrigNtExecTool.cxx
	$(cpp_echo) $(src)TrigNtExecTool.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(TrigNtExecTool_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(TrigNtExecTool_cppflags) $(TrigNtExecTool_cxx_cppflags)  $(src)TrigNtExecTool.cxx
endif
endif

else
$(bin)TrigCostMonitorLib_dependencies.make : $(TrigNtExecTool_cxx_dependencies)

$(bin)TrigCostMonitorLib_dependencies.make : $(src)TrigNtExecTool.cxx

$(bin)$(binobj)TrigNtExecTool.o : $(TrigNtExecTool_cxx_dependencies)
	$(cpp_echo) $(src)TrigNtExecTool.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(TrigNtExecTool_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(TrigNtExecTool_cppflags) $(TrigNtExecTool_cxx_cppflags)  $(src)TrigNtExecTool.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),TrigCostMonitorLibclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)TrigNtPostTool.d

$(bin)$(binobj)TrigNtPostTool.d :

$(bin)$(binobj)TrigNtPostTool.o : $(cmt_final_setup_TrigCostMonitorLib)

$(bin)$(binobj)TrigNtPostTool.o : $(src)TrigNtPostTool.cxx
	$(cpp_echo) $(src)TrigNtPostTool.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(TrigNtPostTool_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(TrigNtPostTool_cppflags) $(TrigNtPostTool_cxx_cppflags)  $(src)TrigNtPostTool.cxx
endif
endif

else
$(bin)TrigCostMonitorLib_dependencies.make : $(TrigNtPostTool_cxx_dependencies)

$(bin)TrigCostMonitorLib_dependencies.make : $(src)TrigNtPostTool.cxx

$(bin)$(binobj)TrigNtPostTool.o : $(TrigNtPostTool_cxx_dependencies)
	$(cpp_echo) $(src)TrigNtPostTool.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(TrigNtPostTool_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(TrigNtPostTool_cppflags) $(TrigNtPostTool_cxx_cppflags)  $(src)TrigNtPostTool.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),TrigCostMonitorLibclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)TrigNtConfTool.d

$(bin)$(binobj)TrigNtConfTool.d :

$(bin)$(binobj)TrigNtConfTool.o : $(cmt_final_setup_TrigCostMonitorLib)

$(bin)$(binobj)TrigNtConfTool.o : $(src)TrigNtConfTool.cxx
	$(cpp_echo) $(src)TrigNtConfTool.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(TrigNtConfTool_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(TrigNtConfTool_cppflags) $(TrigNtConfTool_cxx_cppflags)  $(src)TrigNtConfTool.cxx
endif
endif

else
$(bin)TrigCostMonitorLib_dependencies.make : $(TrigNtConfTool_cxx_dependencies)

$(bin)TrigCostMonitorLib_dependencies.make : $(src)TrigNtConfTool.cxx

$(bin)$(binobj)TrigNtConfTool.o : $(TrigNtConfTool_cxx_dependencies)
	$(cpp_echo) $(src)TrigNtConfTool.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(TrigNtConfTool_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(TrigNtConfTool_cppflags) $(TrigNtConfTool_cxx_cppflags)  $(src)TrigNtConfTool.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),TrigCostMonitorLibclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)ReadLumiBlock.d

$(bin)$(binobj)ReadLumiBlock.d :

$(bin)$(binobj)ReadLumiBlock.o : $(cmt_final_setup_TrigCostMonitorLib)

$(bin)$(binobj)ReadLumiBlock.o : $(src)ReadLumiBlock.cxx
	$(cpp_echo) $(src)ReadLumiBlock.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(ReadLumiBlock_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(ReadLumiBlock_cppflags) $(ReadLumiBlock_cxx_cppflags)  $(src)ReadLumiBlock.cxx
endif
endif

else
$(bin)TrigCostMonitorLib_dependencies.make : $(ReadLumiBlock_cxx_dependencies)

$(bin)TrigCostMonitorLib_dependencies.make : $(src)ReadLumiBlock.cxx

$(bin)$(binobj)ReadLumiBlock.o : $(ReadLumiBlock_cxx_dependencies)
	$(cpp_echo) $(src)ReadLumiBlock.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(TrigCostMonitorLib_pp_cppflags) $(lib_TrigCostMonitorLib_pp_cppflags) $(ReadLumiBlock_pp_cppflags) $(use_cppflags) $(TrigCostMonitorLib_cppflags) $(lib_TrigCostMonitorLib_cppflags) $(ReadLumiBlock_cppflags) $(ReadLumiBlock_cxx_cppflags)  $(src)ReadLumiBlock.cxx

endif

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: TrigCostMonitorLibclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(TrigCostMonitorLib.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

TrigCostMonitorLibclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library TrigCostMonitorLib
	-$(cleanup_silent) cd $(bin) && \rm -f $(library_prefix)TrigCostMonitorLib$(library_suffix).a $(library_prefix)TrigCostMonitorLib$(library_suffix).$(shlibsuffix) TrigCostMonitorLib.stamp TrigCostMonitorLib.shstamp
#-- end of cleanup_library ---------------

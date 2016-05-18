#-- start of make_header -----------------

#====================================
#  Library TrigCostMonitorDict
#
#   Generated Wed May 18 00:43:34 2016  by rewang
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_TrigCostMonitorDict_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_TrigCostMonitorDict_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_TrigCostMonitorDict

TrigCostMonitor_tag = $(tag)

#cmt_local_tagfile_TrigCostMonitorDict = $(TrigCostMonitor_tag)_TrigCostMonitorDict.make
cmt_local_tagfile_TrigCostMonitorDict = $(bin)$(TrigCostMonitor_tag)_TrigCostMonitorDict.make

else

tags      = $(tag),$(CMTEXTRATAGS)

TrigCostMonitor_tag = $(tag)

#cmt_local_tagfile_TrigCostMonitorDict = $(TrigCostMonitor_tag).make
cmt_local_tagfile_TrigCostMonitorDict = $(bin)$(TrigCostMonitor_tag).make

endif

include $(cmt_local_tagfile_TrigCostMonitorDict)
#-include $(cmt_local_tagfile_TrigCostMonitorDict)

ifdef cmt_TrigCostMonitorDict_has_target_tag

cmt_final_setup_TrigCostMonitorDict = $(bin)setup_TrigCostMonitorDict.make
cmt_dependencies_in_TrigCostMonitorDict = $(bin)dependencies_TrigCostMonitorDict.in
#cmt_final_setup_TrigCostMonitorDict = $(bin)TrigCostMonitor_TrigCostMonitorDictsetup.make
cmt_local_TrigCostMonitorDict_makefile = $(bin)TrigCostMonitorDict.make

else

cmt_final_setup_TrigCostMonitorDict = $(bin)setup.make
cmt_dependencies_in_TrigCostMonitorDict = $(bin)dependencies.in
#cmt_final_setup_TrigCostMonitorDict = $(bin)TrigCostMonitorsetup.make
cmt_local_TrigCostMonitorDict_makefile = $(bin)TrigCostMonitorDict.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)TrigCostMonitorsetup.make

#TrigCostMonitorDict :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'TrigCostMonitorDict'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = TrigCostMonitorDict/
#TrigCostMonitorDict::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

TrigCostMonitorDictlibname   = $(bin)$(library_prefix)TrigCostMonitorDict$(library_suffix)
TrigCostMonitorDictlib       = $(TrigCostMonitorDictlibname).a
TrigCostMonitorDictstamp     = $(bin)TrigCostMonitorDict.stamp
TrigCostMonitorDictshstamp   = $(bin)TrigCostMonitorDict.shstamp

TrigCostMonitorDict :: dirs  TrigCostMonitorDictLIB
	$(echo) "TrigCostMonitorDict ok"

#-- end of libary_header ----------------
#-- start of library_no_static ------

#TrigCostMonitorDictLIB :: $(TrigCostMonitorDictlib) $(TrigCostMonitorDictshstamp)
TrigCostMonitorDictLIB :: $(TrigCostMonitorDictshstamp)
	$(echo) "TrigCostMonitorDict : library ok"

$(TrigCostMonitorDictlib) :: $(bin)TrigCostMonitorDict_gen_rflx_TrigCostMonitor.o
	$(lib_echo) "static library $@"
	$(lib_silent) cd $(bin); \
	  $(ar) $(TrigCostMonitorDictlib) $?
	$(lib_silent) $(ranlib) $(TrigCostMonitorDictlib)
	$(lib_silent) cat /dev/null >$(TrigCostMonitorDictstamp)

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

$(TrigCostMonitorDictlibname).$(shlibsuffix) :: $(bin)TrigCostMonitorDict_gen_rflx_TrigCostMonitor.o $(use_requirements) $(TrigCostMonitorDictstamps)
	$(lib_echo) "shared library $@"
	$(lib_silent) $(shlibbuilder) $(shlibflags) -o $@ $(bin)TrigCostMonitorDict_gen_rflx_TrigCostMonitor.o $(TrigCostMonitorDict_shlibflags)
	$(lib_silent) cat /dev/null >$(TrigCostMonitorDictstamp) && \
	  cat /dev/null >$(TrigCostMonitorDictshstamp)

$(TrigCostMonitorDictshstamp) :: $(TrigCostMonitorDictlibname).$(shlibsuffix)
	$(lib_silent) if test -f $(TrigCostMonitorDictlibname).$(shlibsuffix) ; then \
	  cat /dev/null >$(TrigCostMonitorDictstamp) && \
	  cat /dev/null >$(TrigCostMonitorDictshstamp) ; fi

TrigCostMonitorDictclean ::
	$(cleanup_echo) objects TrigCostMonitorDict
	$(cleanup_silent) /bin/rm -f $(bin)TrigCostMonitorDict_gen_rflx_TrigCostMonitor.o
	$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)TrigCostMonitorDict_gen_rflx_TrigCostMonitor.o) $(patsubst %.o,%.dep,$(bin)TrigCostMonitorDict_gen_rflx_TrigCostMonitor.o) $(patsubst %.o,%.d.stamp,$(bin)TrigCostMonitorDict_gen_rflx_TrigCostMonitor.o)
	$(cleanup_silent) cd $(bin); /bin/rm -rf TrigCostMonitorDict_deps TrigCostMonitorDict_dependencies.make

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/lib
TrigCostMonitorDictinstallname = $(library_prefix)TrigCostMonitorDict$(library_suffix).$(shlibsuffix)

TrigCostMonitorDict :: TrigCostMonitorDictinstall ;

install :: TrigCostMonitorDictinstall ;

TrigCostMonitorDictinstall :: $(install_dir)/$(TrigCostMonitorDictinstallname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(TrigCostMonitorDictinstallname) :: $(bin)$(TrigCostMonitorDictinstallname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(TrigCostMonitorDictinstallname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##TrigCostMonitorDictclean :: TrigCostMonitorDictuninstall

uninstall :: TrigCostMonitorDictuninstall ;

TrigCostMonitorDictuninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(TrigCostMonitorDictinstallname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#-- end of library_no_static ------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),TrigCostMonitorDictclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)TrigCostMonitorDict_gen_rflx_TrigCostMonitor.d

$(bin)$(binobj)TrigCostMonitorDict_gen_rflx_TrigCostMonitor.d :

$(bin)$(binobj)TrigCostMonitorDict_gen_rflx_TrigCostMonitor.o : $(cmt_final_setup_TrigCostMonitorDict)

$(bin)$(binobj)TrigCostMonitorDict_gen_rflx_TrigCostMonitor.o : ../x86_64-slc6-gcc48-opt/dict/TrigCostMonitor/TrigCostMonitorDict_gen_rflx.cpp
	$(cpp_echo) ../x86_64-slc6-gcc48-opt/dict/TrigCostMonitor/TrigCostMonitorDict_gen_rflx.cpp
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(TrigCostMonitorDict_pp_cppflags) $(lib_TrigCostMonitorDict_pp_cppflags) $(TrigCostMonitorDict_gen_rflx_pp_cppflags) $(use_cppflags) $(TrigCostMonitorDict_cppflags) $(lib_TrigCostMonitorDict_cppflags) $(TrigCostMonitorDict_gen_rflx_cppflags) $(TrigCostMonitorDict_gen_rflx_cpp_cppflags) -I../x86_64-slc6-gcc48-opt/dict/TrigCostMonitor ../x86_64-slc6-gcc48-opt/dict/TrigCostMonitor/TrigCostMonitorDict_gen_rflx.cpp
endif
endif

else
$(bin)TrigCostMonitorDict_dependencies.make : $(TrigCostMonitorDict_gen_rflx_cpp_dependencies)

$(bin)TrigCostMonitorDict_dependencies.make : ../x86_64-slc6-gcc48-opt/dict/TrigCostMonitor/TrigCostMonitorDict_gen_rflx.cpp

$(bin)$(binobj)TrigCostMonitorDict_gen_rflx_TrigCostMonitor.o : $(TrigCostMonitorDict_gen_rflx_cpp_dependencies)
	$(cpp_echo) ../x86_64-slc6-gcc48-opt/dict/TrigCostMonitor/TrigCostMonitorDict_gen_rflx.cpp
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(TrigCostMonitorDict_pp_cppflags) $(lib_TrigCostMonitorDict_pp_cppflags) $(TrigCostMonitorDict_gen_rflx_pp_cppflags) $(use_cppflags) $(TrigCostMonitorDict_cppflags) $(lib_TrigCostMonitorDict_cppflags) $(TrigCostMonitorDict_gen_rflx_cppflags) $(TrigCostMonitorDict_gen_rflx_cpp_cppflags) -I../x86_64-slc6-gcc48-opt/dict/TrigCostMonitor ../x86_64-slc6-gcc48-opt/dict/TrigCostMonitor/TrigCostMonitorDict_gen_rflx.cpp

endif

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: TrigCostMonitorDictclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(TrigCostMonitorDict.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

TrigCostMonitorDictclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library TrigCostMonitorDict
	-$(cleanup_silent) cd $(bin) && \rm -f $(library_prefix)TrigCostMonitorDict$(library_suffix).a $(library_prefix)TrigCostMonitorDict$(library_suffix).$(shlibsuffix) TrigCostMonitorDict.stamp TrigCostMonitorDict.shstamp
#-- end of cleanup_library ---------------

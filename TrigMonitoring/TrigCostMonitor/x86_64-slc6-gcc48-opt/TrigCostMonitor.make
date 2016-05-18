#-- start of make_header -----------------

#====================================
#  Library TrigCostMonitor
#
#   Generated Wed May 18 00:42:53 2016  by rewang
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_TrigCostMonitor_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_TrigCostMonitor_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_TrigCostMonitor

TrigCostMonitor_tag = $(tag)

#cmt_local_tagfile_TrigCostMonitor = $(TrigCostMonitor_tag)_TrigCostMonitor.make
cmt_local_tagfile_TrigCostMonitor = $(bin)$(TrigCostMonitor_tag)_TrigCostMonitor.make

else

tags      = $(tag),$(CMTEXTRATAGS)

TrigCostMonitor_tag = $(tag)

#cmt_local_tagfile_TrigCostMonitor = $(TrigCostMonitor_tag).make
cmt_local_tagfile_TrigCostMonitor = $(bin)$(TrigCostMonitor_tag).make

endif

include $(cmt_local_tagfile_TrigCostMonitor)
#-include $(cmt_local_tagfile_TrigCostMonitor)

ifdef cmt_TrigCostMonitor_has_target_tag

cmt_final_setup_TrigCostMonitor = $(bin)setup_TrigCostMonitor.make
cmt_dependencies_in_TrigCostMonitor = $(bin)dependencies_TrigCostMonitor.in
#cmt_final_setup_TrigCostMonitor = $(bin)TrigCostMonitor_TrigCostMonitorsetup.make
cmt_local_TrigCostMonitor_makefile = $(bin)TrigCostMonitor.make

else

cmt_final_setup_TrigCostMonitor = $(bin)setup.make
cmt_dependencies_in_TrigCostMonitor = $(bin)dependencies.in
#cmt_final_setup_TrigCostMonitor = $(bin)TrigCostMonitorsetup.make
cmt_local_TrigCostMonitor_makefile = $(bin)TrigCostMonitor.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)TrigCostMonitorsetup.make

#TrigCostMonitor :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'TrigCostMonitor'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = TrigCostMonitor/
#TrigCostMonitor::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

TrigCostMonitorlibname   = $(bin)$(library_prefix)TrigCostMonitor$(library_suffix)
TrigCostMonitorlib       = $(TrigCostMonitorlibname).a
TrigCostMonitorstamp     = $(bin)TrigCostMonitor.stamp
TrigCostMonitorshstamp   = $(bin)TrigCostMonitor.shstamp

TrigCostMonitor :: dirs  TrigCostMonitorLIB
	$(echo) "TrigCostMonitor ok"

#-- end of libary_header ----------------
#-- start of library_no_static ------

#TrigCostMonitorLIB :: $(TrigCostMonitorlib) $(TrigCostMonitorshstamp)
TrigCostMonitorLIB :: $(TrigCostMonitorshstamp)
	$(echo) "TrigCostMonitor : library ok"

$(TrigCostMonitorlib) :: $(bin)TrigCostMonitor_entries.o $(bin)TrigCostMonitor_load.o
	$(lib_echo) "static library $@"
	$(lib_silent) cd $(bin); \
	  $(ar) $(TrigCostMonitorlib) $?
	$(lib_silent) $(ranlib) $(TrigCostMonitorlib)
	$(lib_silent) cat /dev/null >$(TrigCostMonitorstamp)

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

$(TrigCostMonitorlibname).$(shlibsuffix) :: $(bin)TrigCostMonitor_entries.o $(bin)TrigCostMonitor_load.o $(use_requirements) $(TrigCostMonitorstamps)
	$(lib_echo) "shared library $@"
	$(lib_silent) $(shlibbuilder) $(shlibflags) -o $@ $(bin)TrigCostMonitor_entries.o $(bin)TrigCostMonitor_load.o $(TrigCostMonitor_shlibflags)
	$(lib_silent) cat /dev/null >$(TrigCostMonitorstamp) && \
	  cat /dev/null >$(TrigCostMonitorshstamp)

$(TrigCostMonitorshstamp) :: $(TrigCostMonitorlibname).$(shlibsuffix)
	$(lib_silent) if test -f $(TrigCostMonitorlibname).$(shlibsuffix) ; then \
	  cat /dev/null >$(TrigCostMonitorstamp) && \
	  cat /dev/null >$(TrigCostMonitorshstamp) ; fi

TrigCostMonitorclean ::
	$(cleanup_echo) objects TrigCostMonitor
	$(cleanup_silent) /bin/rm -f $(bin)TrigCostMonitor_entries.o $(bin)TrigCostMonitor_load.o
	$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)TrigCostMonitor_entries.o $(bin)TrigCostMonitor_load.o) $(patsubst %.o,%.dep,$(bin)TrigCostMonitor_entries.o $(bin)TrigCostMonitor_load.o) $(patsubst %.o,%.d.stamp,$(bin)TrigCostMonitor_entries.o $(bin)TrigCostMonitor_load.o)
	$(cleanup_silent) cd $(bin); /bin/rm -rf TrigCostMonitor_deps TrigCostMonitor_dependencies.make

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/lib
TrigCostMonitorinstallname = $(library_prefix)TrigCostMonitor$(library_suffix).$(shlibsuffix)

TrigCostMonitor :: TrigCostMonitorinstall ;

install :: TrigCostMonitorinstall ;

TrigCostMonitorinstall :: $(install_dir)/$(TrigCostMonitorinstallname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(TrigCostMonitorinstallname) :: $(bin)$(TrigCostMonitorinstallname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(TrigCostMonitorinstallname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##TrigCostMonitorclean :: TrigCostMonitoruninstall

uninstall :: TrigCostMonitoruninstall ;

TrigCostMonitoruninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(TrigCostMonitorinstallname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#-- end of library_no_static ------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),TrigCostMonitorclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)TrigCostMonitor_entries.d

$(bin)$(binobj)TrigCostMonitor_entries.d :

$(bin)$(binobj)TrigCostMonitor_entries.o : $(cmt_final_setup_TrigCostMonitor)

$(bin)$(binobj)TrigCostMonitor_entries.o : $(src)components/TrigCostMonitor_entries.cxx
	$(cpp_echo) $(src)components/TrigCostMonitor_entries.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(TrigCostMonitor_pp_cppflags) $(lib_TrigCostMonitor_pp_cppflags) $(TrigCostMonitor_entries_pp_cppflags) $(use_cppflags) $(TrigCostMonitor_cppflags) $(lib_TrigCostMonitor_cppflags) $(TrigCostMonitor_entries_cppflags) $(TrigCostMonitor_entries_cxx_cppflags) -I../src/components $(src)components/TrigCostMonitor_entries.cxx
endif
endif

else
$(bin)TrigCostMonitor_dependencies.make : $(TrigCostMonitor_entries_cxx_dependencies)

$(bin)TrigCostMonitor_dependencies.make : $(src)components/TrigCostMonitor_entries.cxx

$(bin)$(binobj)TrigCostMonitor_entries.o : $(TrigCostMonitor_entries_cxx_dependencies)
	$(cpp_echo) $(src)components/TrigCostMonitor_entries.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(TrigCostMonitor_pp_cppflags) $(lib_TrigCostMonitor_pp_cppflags) $(TrigCostMonitor_entries_pp_cppflags) $(use_cppflags) $(TrigCostMonitor_cppflags) $(lib_TrigCostMonitor_cppflags) $(TrigCostMonitor_entries_cppflags) $(TrigCostMonitor_entries_cxx_cppflags) -I../src/components $(src)components/TrigCostMonitor_entries.cxx

endif

#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq (-MMD -MP -MF $*.d -MQ $@,)

ifneq ($(MAKECMDGOALS),TrigCostMonitorclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)TrigCostMonitor_load.d

$(bin)$(binobj)TrigCostMonitor_load.d :

$(bin)$(binobj)TrigCostMonitor_load.o : $(cmt_final_setup_TrigCostMonitor)

$(bin)$(binobj)TrigCostMonitor_load.o : $(src)components/TrigCostMonitor_load.cxx
	$(cpp_echo) $(src)components/TrigCostMonitor_load.cxx
	$(cpp_silent) $(cppcomp) -MMD -MP -MF $*.d -MQ $@ -o $@ $(use_pp_cppflags) $(TrigCostMonitor_pp_cppflags) $(lib_TrigCostMonitor_pp_cppflags) $(TrigCostMonitor_load_pp_cppflags) $(use_cppflags) $(TrigCostMonitor_cppflags) $(lib_TrigCostMonitor_cppflags) $(TrigCostMonitor_load_cppflags) $(TrigCostMonitor_load_cxx_cppflags) -I../src/components $(src)components/TrigCostMonitor_load.cxx
endif
endif

else
$(bin)TrigCostMonitor_dependencies.make : $(TrigCostMonitor_load_cxx_dependencies)

$(bin)TrigCostMonitor_dependencies.make : $(src)components/TrigCostMonitor_load.cxx

$(bin)$(binobj)TrigCostMonitor_load.o : $(TrigCostMonitor_load_cxx_dependencies)
	$(cpp_echo) $(src)components/TrigCostMonitor_load.cxx
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(TrigCostMonitor_pp_cppflags) $(lib_TrigCostMonitor_pp_cppflags) $(TrigCostMonitor_load_pp_cppflags) $(use_cppflags) $(TrigCostMonitor_cppflags) $(lib_TrigCostMonitor_cppflags) $(TrigCostMonitor_load_cppflags) $(TrigCostMonitor_load_cxx_cppflags) -I../src/components $(src)components/TrigCostMonitor_load.cxx

endif

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: TrigCostMonitorclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(TrigCostMonitor.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

TrigCostMonitorclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library TrigCostMonitor
	-$(cleanup_silent) cd $(bin) && \rm -f $(library_prefix)TrigCostMonitor$(library_suffix).a $(library_prefix)TrigCostMonitor$(library_suffix).$(shlibsuffix) TrigCostMonitor.stamp TrigCostMonitor.shstamp
#-- end of cleanup_library ---------------

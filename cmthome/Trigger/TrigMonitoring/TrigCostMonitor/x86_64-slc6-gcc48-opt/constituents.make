
#-- start of constituents_header ------

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

tags      = $(tag),$(CMTEXTRATAGS)

TrigCostMonitor_tag = $(tag)

#cmt_local_tagfile = $(TrigCostMonitor_tag).make
cmt_local_tagfile = $(bin)$(TrigCostMonitor_tag).make

#-include $(cmt_local_tagfile)
include $(cmt_local_tagfile)

#cmt_local_setup = $(bin)setup$$$$.make
#cmt_local_setup = $(bin)$(package)setup$$$$.make
#cmt_final_setup = $(bin)TrigCostMonitorsetup.make
cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)$(package)setup.make

cmt_build_library_linksstamp = $(bin)cmt_build_library_links.stamp
#--------------------------------------------------------

#cmt_lock_setup = /tmp/lock$(cmt_lock_pid).make
#cmt_temp_tag = /tmp/tag$(cmt_lock_pid).make

#first :: $(cmt_local_tagfile)
#	@echo $(cmt_local_tagfile) ok
#ifndef QUICK
#first :: $(cmt_final_setup) ;
#else
#first :: ;
#endif

##	@bin=`$(cmtexe) show macro_value bin`

#$(cmt_local_tagfile) : $(cmt_lock_setup)
#	@echo "#CMT> Error: $@: No such file" >&2; exit 1
#$(cmt_local_tagfile) :
#	@echo "#CMT> Warning: $@: No such file" >&2; exit
#	@echo "#CMT> Info: $@: No need to rebuild file" >&2; exit

#$(cmt_final_setup) : $(cmt_local_tagfile) 
#	$(echo) "(constituents.make) Rebuilding $@"
#	@if test ! -d $(@D); then $(mkdir) -p $(@D); fi; \
#	  if test -f $(cmt_local_setup); then /bin/rm -f $(cmt_local_setup); fi; \
#	  trap '/bin/rm -f $(cmt_local_setup)' 0 1 2 15; \
#	  $(cmtexe) -tag=$(tags) show setup >>$(cmt_local_setup); \
#	  if test ! -f $@; then \
#	    mv $(cmt_local_setup) $@; \
#	  else \
#	    if /usr/bin/diff $(cmt_local_setup) $@ >/dev/null ; then \
#	      : ; \
#	    else \
#	      mv $(cmt_local_setup) $@; \
#	    fi; \
#	  fi

#	@/bin/echo $@ ok   

#config :: checkuses
#	@exit 0
#checkuses : ;

env.make ::
	printenv >env.make.tmp; $(cmtexe) check files env.make.tmp env.make

ifndef QUICK
all :: build_library_links ;
else
all :: $(cmt_build_library_linksstamp) ;
endif

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

dirs :: requirements
	@if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi
#	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
#	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

#requirements :
#	@if test ! -r requirements ; then echo "No requirements file" ; fi

build_library_links : dirs
	$(echo) "(constituents.make) Rebuilding library links"; \
	 $(build_library_links)
#	if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi; \
#	$(build_library_links)

$(cmt_build_library_linksstamp) : $(cmt_final_setup) $(cmt_local_tagfile) $(bin)library_links.in
	$(echo) "(constituents.make) Rebuilding library links"; \
	 $(build_library_links) -f=$(bin)library_links.in -without_cmt
	$(silent) \touch $@

ifndef PEDANTIC
.DEFAULT ::
#.DEFAULT :
	$(echo) "(constituents.make) $@: No rule for such target" >&2
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of constituents_header ------
#-- start of group ------

all_groups :: all

all :: $(all_dependencies)  $(all_pre_constituents) $(all_constituents)  $(all_post_constituents)
	$(echo) "all ok."

#	@/bin/echo " all ok."

clean :: allclean

allclean ::  $(all_constituentsclean)
	$(echo) $(all_constituentsclean)
	$(echo) "allclean ok."

#	@echo $(all_constituentsclean)
#	@/bin/echo " allclean ok."

#-- end of group ------
#-- start of group ------

all_groups :: cmt_actions

cmt_actions :: $(cmt_actions_dependencies)  $(cmt_actions_pre_constituents) $(cmt_actions_constituents)  $(cmt_actions_post_constituents)
	$(echo) "cmt_actions ok."

#	@/bin/echo " cmt_actions ok."

clean :: allclean

cmt_actionsclean ::  $(cmt_actions_constituentsclean)
	$(echo) $(cmt_actions_constituentsclean)
	$(echo) "cmt_actionsclean ok."

#	@echo $(cmt_actions_constituentsclean)
#	@/bin/echo " cmt_actionsclean ok."

#-- end of group ------
#-- start of group ------

all_groups :: rulechecker

rulechecker :: $(rulechecker_dependencies)  $(rulechecker_pre_constituents) $(rulechecker_constituents)  $(rulechecker_post_constituents)
	$(echo) "rulechecker ok."

#	@/bin/echo " rulechecker ok."

clean :: allclean

rulecheckerclean ::  $(rulechecker_constituentsclean)
	$(echo) $(rulechecker_constituentsclean)
	$(echo) "rulecheckerclean ok."

#	@echo $(rulechecker_constituentsclean)
#	@/bin/echo " rulecheckerclean ok."

#-- end of group ------
#-- start of group ------

all_groups :: ctest

ctest :: $(ctest_dependencies)  $(ctest_pre_constituents) $(ctest_constituents)  $(ctest_post_constituents)
	$(echo) "ctest ok."

#	@/bin/echo " ctest ok."

clean :: allclean

ctestclean ::  $(ctest_constituentsclean)
	$(echo) $(ctest_constituentsclean)
	$(echo) "ctestclean ok."

#	@echo $(ctest_constituentsclean)
#	@/bin/echo " ctestclean ok."

#-- end of group ------
#-- start of constituent ------

cmt_TrigCostMonitorLib_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_TrigCostMonitorLib_has_target_tag

cmt_local_tagfile_TrigCostMonitorLib = $(bin)$(TrigCostMonitor_tag)_TrigCostMonitorLib.make
cmt_final_setup_TrigCostMonitorLib = $(bin)setup_TrigCostMonitorLib.make
cmt_local_TrigCostMonitorLib_makefile = $(bin)TrigCostMonitorLib.make

TrigCostMonitorLib_extratags = -tag_add=target_TrigCostMonitorLib

else

cmt_local_tagfile_TrigCostMonitorLib = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_TrigCostMonitorLib = $(bin)setup.make
cmt_local_TrigCostMonitorLib_makefile = $(bin)TrigCostMonitorLib.make

endif

not_TrigCostMonitorLib_dependencies = { n=0; for p in $?; do m=0; for d in $(TrigCostMonitorLib_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
TrigCostMonitorLibdirs :
	@if test ! -d $(bin)TrigCostMonitorLib; then $(mkdir) -p $(bin)TrigCostMonitorLib; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)TrigCostMonitorLib
else
TrigCostMonitorLibdirs : ;
endif

ifdef cmt_TrigCostMonitorLib_has_target_tag

ifndef QUICK
$(cmt_local_TrigCostMonitorLib_makefile) : $(TrigCostMonitorLib_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitorLib.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorLib_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitorLib_makefile) TrigCostMonitorLib
else
$(cmt_local_TrigCostMonitorLib_makefile) : $(TrigCostMonitorLib_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitorLib) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitorLib) ] || \
	  $(not_TrigCostMonitorLib_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitorLib.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorLib_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitorLib_makefile) TrigCostMonitorLib; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_TrigCostMonitorLib_makefile) : $(TrigCostMonitorLib_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitorLib.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitorLib.in -tag=$(tags) $(TrigCostMonitorLib_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitorLib_makefile) TrigCostMonitorLib
else
$(cmt_local_TrigCostMonitorLib_makefile) : $(TrigCostMonitorLib_dependencies) $(cmt_build_library_linksstamp) $(bin)TrigCostMonitorLib.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitorLib) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitorLib) ] || \
	  $(not_TrigCostMonitorLib_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitorLib.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitorLib.in -tag=$(tags) $(TrigCostMonitorLib_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitorLib_makefile) TrigCostMonitorLib; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorLib_extratags) build constituent_makefile -out=$(cmt_local_TrigCostMonitorLib_makefile) TrigCostMonitorLib

TrigCostMonitorLib :: $(TrigCostMonitorLib_dependencies) $(cmt_local_TrigCostMonitorLib_makefile) dirs TrigCostMonitorLibdirs
	$(echo) "(constituents.make) Starting TrigCostMonitorLib"
	@if test -f $(cmt_local_TrigCostMonitorLib_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorLib_makefile) TrigCostMonitorLib; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitorLib_makefile) TrigCostMonitorLib
	$(echo) "(constituents.make) TrigCostMonitorLib done"

clean :: TrigCostMonitorLibclean ;

TrigCostMonitorLibclean :: $(TrigCostMonitorLibclean_dependencies) ##$(cmt_local_TrigCostMonitorLib_makefile)
	$(echo) "(constituents.make) Starting TrigCostMonitorLibclean"
	@-if test -f $(cmt_local_TrigCostMonitorLib_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorLib_makefile) TrigCostMonitorLibclean; \
	fi
	$(echo) "(constituents.make) TrigCostMonitorLibclean done"
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitorLib_makefile) TrigCostMonitorLibclean

##	  /bin/rm -f $(cmt_local_TrigCostMonitorLib_makefile) $(bin)TrigCostMonitorLib_dependencies.make

install :: TrigCostMonitorLibinstall ;

TrigCostMonitorLibinstall :: $(TrigCostMonitorLib_dependencies) $(cmt_local_TrigCostMonitorLib_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_TrigCostMonitorLib_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorLib_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitorLib_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : TrigCostMonitorLibuninstall

$(foreach d,$(TrigCostMonitorLib_dependencies),$(eval $(d)uninstall_dependencies += TrigCostMonitorLibuninstall))

TrigCostMonitorLibuninstall : $(TrigCostMonitorLibuninstall_dependencies) ##$(cmt_local_TrigCostMonitorLib_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_TrigCostMonitorLib_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorLib_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitorLib_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: TrigCostMonitorLibuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ TrigCostMonitorLib"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ TrigCostMonitorLib done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_TrigCostMonitor_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_TrigCostMonitor_has_target_tag

cmt_local_tagfile_TrigCostMonitor = $(bin)$(TrigCostMonitor_tag)_TrigCostMonitor.make
cmt_final_setup_TrigCostMonitor = $(bin)setup_TrigCostMonitor.make
cmt_local_TrigCostMonitor_makefile = $(bin)TrigCostMonitor.make

TrigCostMonitor_extratags = -tag_add=target_TrigCostMonitor

else

cmt_local_tagfile_TrigCostMonitor = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_TrigCostMonitor = $(bin)setup.make
cmt_local_TrigCostMonitor_makefile = $(bin)TrigCostMonitor.make

endif

not_TrigCostMonitor_dependencies = { n=0; for p in $?; do m=0; for d in $(TrigCostMonitor_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
TrigCostMonitordirs :
	@if test ! -d $(bin)TrigCostMonitor; then $(mkdir) -p $(bin)TrigCostMonitor; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)TrigCostMonitor
else
TrigCostMonitordirs : ;
endif

ifdef cmt_TrigCostMonitor_has_target_tag

ifndef QUICK
$(cmt_local_TrigCostMonitor_makefile) : $(TrigCostMonitor_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitor.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitor_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitor_makefile) TrigCostMonitor
else
$(cmt_local_TrigCostMonitor_makefile) : $(TrigCostMonitor_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitor) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitor) ] || \
	  $(not_TrigCostMonitor_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitor.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitor_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitor_makefile) TrigCostMonitor; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_TrigCostMonitor_makefile) : $(TrigCostMonitor_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitor.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitor.in -tag=$(tags) $(TrigCostMonitor_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitor_makefile) TrigCostMonitor
else
$(cmt_local_TrigCostMonitor_makefile) : $(TrigCostMonitor_dependencies) $(cmt_build_library_linksstamp) $(bin)TrigCostMonitor.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitor) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitor) ] || \
	  $(not_TrigCostMonitor_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitor.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitor.in -tag=$(tags) $(TrigCostMonitor_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitor_makefile) TrigCostMonitor; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(TrigCostMonitor_extratags) build constituent_makefile -out=$(cmt_local_TrigCostMonitor_makefile) TrigCostMonitor

TrigCostMonitor :: $(TrigCostMonitor_dependencies) $(cmt_local_TrigCostMonitor_makefile) dirs TrigCostMonitordirs
	$(echo) "(constituents.make) Starting TrigCostMonitor"
	@if test -f $(cmt_local_TrigCostMonitor_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitor_makefile) TrigCostMonitor; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitor_makefile) TrigCostMonitor
	$(echo) "(constituents.make) TrigCostMonitor done"

clean :: TrigCostMonitorclean ;

TrigCostMonitorclean :: $(TrigCostMonitorclean_dependencies) ##$(cmt_local_TrigCostMonitor_makefile)
	$(echo) "(constituents.make) Starting TrigCostMonitorclean"
	@-if test -f $(cmt_local_TrigCostMonitor_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitor_makefile) TrigCostMonitorclean; \
	fi
	$(echo) "(constituents.make) TrigCostMonitorclean done"
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitor_makefile) TrigCostMonitorclean

##	  /bin/rm -f $(cmt_local_TrigCostMonitor_makefile) $(bin)TrigCostMonitor_dependencies.make

install :: TrigCostMonitorinstall ;

TrigCostMonitorinstall :: $(TrigCostMonitor_dependencies) $(cmt_local_TrigCostMonitor_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_TrigCostMonitor_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitor_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitor_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : TrigCostMonitoruninstall

$(foreach d,$(TrigCostMonitor_dependencies),$(eval $(d)uninstall_dependencies += TrigCostMonitoruninstall))

TrigCostMonitoruninstall : $(TrigCostMonitoruninstall_dependencies) ##$(cmt_local_TrigCostMonitor_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_TrigCostMonitor_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitor_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitor_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: TrigCostMonitoruninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ TrigCostMonitor"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ TrigCostMonitor done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_TrigCostMonitorConf_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_TrigCostMonitorConf_has_target_tag

cmt_local_tagfile_TrigCostMonitorConf = $(bin)$(TrigCostMonitor_tag)_TrigCostMonitorConf.make
cmt_final_setup_TrigCostMonitorConf = $(bin)setup_TrigCostMonitorConf.make
cmt_local_TrigCostMonitorConf_makefile = $(bin)TrigCostMonitorConf.make

TrigCostMonitorConf_extratags = -tag_add=target_TrigCostMonitorConf

else

cmt_local_tagfile_TrigCostMonitorConf = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_TrigCostMonitorConf = $(bin)setup.make
cmt_local_TrigCostMonitorConf_makefile = $(bin)TrigCostMonitorConf.make

endif

not_TrigCostMonitorConf_dependencies = { n=0; for p in $?; do m=0; for d in $(TrigCostMonitorConf_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
TrigCostMonitorConfdirs :
	@if test ! -d $(bin)TrigCostMonitorConf; then $(mkdir) -p $(bin)TrigCostMonitorConf; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)TrigCostMonitorConf
else
TrigCostMonitorConfdirs : ;
endif

ifdef cmt_TrigCostMonitorConf_has_target_tag

ifndef QUICK
$(cmt_local_TrigCostMonitorConf_makefile) : $(TrigCostMonitorConf_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitorConf.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorConf_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitorConf_makefile) TrigCostMonitorConf
else
$(cmt_local_TrigCostMonitorConf_makefile) : $(TrigCostMonitorConf_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitorConf) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitorConf) ] || \
	  $(not_TrigCostMonitorConf_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitorConf.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorConf_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitorConf_makefile) TrigCostMonitorConf; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_TrigCostMonitorConf_makefile) : $(TrigCostMonitorConf_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitorConf.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitorConf.in -tag=$(tags) $(TrigCostMonitorConf_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitorConf_makefile) TrigCostMonitorConf
else
$(cmt_local_TrigCostMonitorConf_makefile) : $(TrigCostMonitorConf_dependencies) $(cmt_build_library_linksstamp) $(bin)TrigCostMonitorConf.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitorConf) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitorConf) ] || \
	  $(not_TrigCostMonitorConf_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitorConf.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitorConf.in -tag=$(tags) $(TrigCostMonitorConf_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitorConf_makefile) TrigCostMonitorConf; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorConf_extratags) build constituent_makefile -out=$(cmt_local_TrigCostMonitorConf_makefile) TrigCostMonitorConf

TrigCostMonitorConf :: $(TrigCostMonitorConf_dependencies) $(cmt_local_TrigCostMonitorConf_makefile) dirs TrigCostMonitorConfdirs
	$(echo) "(constituents.make) Starting TrigCostMonitorConf"
	@if test -f $(cmt_local_TrigCostMonitorConf_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorConf_makefile) TrigCostMonitorConf; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitorConf_makefile) TrigCostMonitorConf
	$(echo) "(constituents.make) TrigCostMonitorConf done"

clean :: TrigCostMonitorConfclean ;

TrigCostMonitorConfclean :: $(TrigCostMonitorConfclean_dependencies) ##$(cmt_local_TrigCostMonitorConf_makefile)
	$(echo) "(constituents.make) Starting TrigCostMonitorConfclean"
	@-if test -f $(cmt_local_TrigCostMonitorConf_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorConf_makefile) TrigCostMonitorConfclean; \
	fi
	$(echo) "(constituents.make) TrigCostMonitorConfclean done"
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitorConf_makefile) TrigCostMonitorConfclean

##	  /bin/rm -f $(cmt_local_TrigCostMonitorConf_makefile) $(bin)TrigCostMonitorConf_dependencies.make

install :: TrigCostMonitorConfinstall ;

TrigCostMonitorConfinstall :: $(TrigCostMonitorConf_dependencies) $(cmt_local_TrigCostMonitorConf_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_TrigCostMonitorConf_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorConf_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitorConf_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : TrigCostMonitorConfuninstall

$(foreach d,$(TrigCostMonitorConf_dependencies),$(eval $(d)uninstall_dependencies += TrigCostMonitorConfuninstall))

TrigCostMonitorConfuninstall : $(TrigCostMonitorConfuninstall_dependencies) ##$(cmt_local_TrigCostMonitorConf_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_TrigCostMonitorConf_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorConf_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitorConf_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: TrigCostMonitorConfuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ TrigCostMonitorConf"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ TrigCostMonitorConf done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_TrigCostMonitor_python_init_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_TrigCostMonitor_python_init_has_target_tag

cmt_local_tagfile_TrigCostMonitor_python_init = $(bin)$(TrigCostMonitor_tag)_TrigCostMonitor_python_init.make
cmt_final_setup_TrigCostMonitor_python_init = $(bin)setup_TrigCostMonitor_python_init.make
cmt_local_TrigCostMonitor_python_init_makefile = $(bin)TrigCostMonitor_python_init.make

TrigCostMonitor_python_init_extratags = -tag_add=target_TrigCostMonitor_python_init

else

cmt_local_tagfile_TrigCostMonitor_python_init = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_TrigCostMonitor_python_init = $(bin)setup.make
cmt_local_TrigCostMonitor_python_init_makefile = $(bin)TrigCostMonitor_python_init.make

endif

not_TrigCostMonitor_python_init_dependencies = { n=0; for p in $?; do m=0; for d in $(TrigCostMonitor_python_init_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
TrigCostMonitor_python_initdirs :
	@if test ! -d $(bin)TrigCostMonitor_python_init; then $(mkdir) -p $(bin)TrigCostMonitor_python_init; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)TrigCostMonitor_python_init
else
TrigCostMonitor_python_initdirs : ;
endif

ifdef cmt_TrigCostMonitor_python_init_has_target_tag

ifndef QUICK
$(cmt_local_TrigCostMonitor_python_init_makefile) : $(TrigCostMonitor_python_init_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitor_python_init.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitor_python_init_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitor_python_init_makefile) TrigCostMonitor_python_init
else
$(cmt_local_TrigCostMonitor_python_init_makefile) : $(TrigCostMonitor_python_init_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitor_python_init) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitor_python_init) ] || \
	  $(not_TrigCostMonitor_python_init_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitor_python_init.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitor_python_init_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitor_python_init_makefile) TrigCostMonitor_python_init; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_TrigCostMonitor_python_init_makefile) : $(TrigCostMonitor_python_init_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitor_python_init.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitor_python_init.in -tag=$(tags) $(TrigCostMonitor_python_init_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitor_python_init_makefile) TrigCostMonitor_python_init
else
$(cmt_local_TrigCostMonitor_python_init_makefile) : $(TrigCostMonitor_python_init_dependencies) $(cmt_build_library_linksstamp) $(bin)TrigCostMonitor_python_init.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitor_python_init) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitor_python_init) ] || \
	  $(not_TrigCostMonitor_python_init_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitor_python_init.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitor_python_init.in -tag=$(tags) $(TrigCostMonitor_python_init_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitor_python_init_makefile) TrigCostMonitor_python_init; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(TrigCostMonitor_python_init_extratags) build constituent_makefile -out=$(cmt_local_TrigCostMonitor_python_init_makefile) TrigCostMonitor_python_init

TrigCostMonitor_python_init :: $(TrigCostMonitor_python_init_dependencies) $(cmt_local_TrigCostMonitor_python_init_makefile) dirs TrigCostMonitor_python_initdirs
	$(echo) "(constituents.make) Starting TrigCostMonitor_python_init"
	@if test -f $(cmt_local_TrigCostMonitor_python_init_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitor_python_init_makefile) TrigCostMonitor_python_init; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitor_python_init_makefile) TrigCostMonitor_python_init
	$(echo) "(constituents.make) TrigCostMonitor_python_init done"

clean :: TrigCostMonitor_python_initclean ;

TrigCostMonitor_python_initclean :: $(TrigCostMonitor_python_initclean_dependencies) ##$(cmt_local_TrigCostMonitor_python_init_makefile)
	$(echo) "(constituents.make) Starting TrigCostMonitor_python_initclean"
	@-if test -f $(cmt_local_TrigCostMonitor_python_init_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitor_python_init_makefile) TrigCostMonitor_python_initclean; \
	fi
	$(echo) "(constituents.make) TrigCostMonitor_python_initclean done"
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitor_python_init_makefile) TrigCostMonitor_python_initclean

##	  /bin/rm -f $(cmt_local_TrigCostMonitor_python_init_makefile) $(bin)TrigCostMonitor_python_init_dependencies.make

install :: TrigCostMonitor_python_initinstall ;

TrigCostMonitor_python_initinstall :: $(TrigCostMonitor_python_init_dependencies) $(cmt_local_TrigCostMonitor_python_init_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_TrigCostMonitor_python_init_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitor_python_init_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitor_python_init_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : TrigCostMonitor_python_inituninstall

$(foreach d,$(TrigCostMonitor_python_init_dependencies),$(eval $(d)uninstall_dependencies += TrigCostMonitor_python_inituninstall))

TrigCostMonitor_python_inituninstall : $(TrigCostMonitor_python_inituninstall_dependencies) ##$(cmt_local_TrigCostMonitor_python_init_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_TrigCostMonitor_python_init_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitor_python_init_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitor_python_init_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: TrigCostMonitor_python_inituninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ TrigCostMonitor_python_init"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ TrigCostMonitor_python_init done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_TrigCostMonitorConfDbMerge_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_TrigCostMonitorConfDbMerge_has_target_tag

cmt_local_tagfile_TrigCostMonitorConfDbMerge = $(bin)$(TrigCostMonitor_tag)_TrigCostMonitorConfDbMerge.make
cmt_final_setup_TrigCostMonitorConfDbMerge = $(bin)setup_TrigCostMonitorConfDbMerge.make
cmt_local_TrigCostMonitorConfDbMerge_makefile = $(bin)TrigCostMonitorConfDbMerge.make

TrigCostMonitorConfDbMerge_extratags = -tag_add=target_TrigCostMonitorConfDbMerge

else

cmt_local_tagfile_TrigCostMonitorConfDbMerge = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_TrigCostMonitorConfDbMerge = $(bin)setup.make
cmt_local_TrigCostMonitorConfDbMerge_makefile = $(bin)TrigCostMonitorConfDbMerge.make

endif

not_TrigCostMonitorConfDbMerge_dependencies = { n=0; for p in $?; do m=0; for d in $(TrigCostMonitorConfDbMerge_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
TrigCostMonitorConfDbMergedirs :
	@if test ! -d $(bin)TrigCostMonitorConfDbMerge; then $(mkdir) -p $(bin)TrigCostMonitorConfDbMerge; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)TrigCostMonitorConfDbMerge
else
TrigCostMonitorConfDbMergedirs : ;
endif

ifdef cmt_TrigCostMonitorConfDbMerge_has_target_tag

ifndef QUICK
$(cmt_local_TrigCostMonitorConfDbMerge_makefile) : $(TrigCostMonitorConfDbMerge_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitorConfDbMerge.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorConfDbMerge_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitorConfDbMerge_makefile) TrigCostMonitorConfDbMerge
else
$(cmt_local_TrigCostMonitorConfDbMerge_makefile) : $(TrigCostMonitorConfDbMerge_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitorConfDbMerge) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitorConfDbMerge) ] || \
	  $(not_TrigCostMonitorConfDbMerge_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitorConfDbMerge.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorConfDbMerge_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitorConfDbMerge_makefile) TrigCostMonitorConfDbMerge; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_TrigCostMonitorConfDbMerge_makefile) : $(TrigCostMonitorConfDbMerge_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitorConfDbMerge.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitorConfDbMerge.in -tag=$(tags) $(TrigCostMonitorConfDbMerge_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitorConfDbMerge_makefile) TrigCostMonitorConfDbMerge
else
$(cmt_local_TrigCostMonitorConfDbMerge_makefile) : $(TrigCostMonitorConfDbMerge_dependencies) $(cmt_build_library_linksstamp) $(bin)TrigCostMonitorConfDbMerge.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitorConfDbMerge) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitorConfDbMerge) ] || \
	  $(not_TrigCostMonitorConfDbMerge_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitorConfDbMerge.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitorConfDbMerge.in -tag=$(tags) $(TrigCostMonitorConfDbMerge_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitorConfDbMerge_makefile) TrigCostMonitorConfDbMerge; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorConfDbMerge_extratags) build constituent_makefile -out=$(cmt_local_TrigCostMonitorConfDbMerge_makefile) TrigCostMonitorConfDbMerge

TrigCostMonitorConfDbMerge :: $(TrigCostMonitorConfDbMerge_dependencies) $(cmt_local_TrigCostMonitorConfDbMerge_makefile) dirs TrigCostMonitorConfDbMergedirs
	$(echo) "(constituents.make) Starting TrigCostMonitorConfDbMerge"
	@if test -f $(cmt_local_TrigCostMonitorConfDbMerge_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorConfDbMerge_makefile) TrigCostMonitorConfDbMerge; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitorConfDbMerge_makefile) TrigCostMonitorConfDbMerge
	$(echo) "(constituents.make) TrigCostMonitorConfDbMerge done"

clean :: TrigCostMonitorConfDbMergeclean ;

TrigCostMonitorConfDbMergeclean :: $(TrigCostMonitorConfDbMergeclean_dependencies) ##$(cmt_local_TrigCostMonitorConfDbMerge_makefile)
	$(echo) "(constituents.make) Starting TrigCostMonitorConfDbMergeclean"
	@-if test -f $(cmt_local_TrigCostMonitorConfDbMerge_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorConfDbMerge_makefile) TrigCostMonitorConfDbMergeclean; \
	fi
	$(echo) "(constituents.make) TrigCostMonitorConfDbMergeclean done"
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitorConfDbMerge_makefile) TrigCostMonitorConfDbMergeclean

##	  /bin/rm -f $(cmt_local_TrigCostMonitorConfDbMerge_makefile) $(bin)TrigCostMonitorConfDbMerge_dependencies.make

install :: TrigCostMonitorConfDbMergeinstall ;

TrigCostMonitorConfDbMergeinstall :: $(TrigCostMonitorConfDbMerge_dependencies) $(cmt_local_TrigCostMonitorConfDbMerge_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_TrigCostMonitorConfDbMerge_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorConfDbMerge_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitorConfDbMerge_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : TrigCostMonitorConfDbMergeuninstall

$(foreach d,$(TrigCostMonitorConfDbMerge_dependencies),$(eval $(d)uninstall_dependencies += TrigCostMonitorConfDbMergeuninstall))

TrigCostMonitorConfDbMergeuninstall : $(TrigCostMonitorConfDbMergeuninstall_dependencies) ##$(cmt_local_TrigCostMonitorConfDbMerge_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_TrigCostMonitorConfDbMerge_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorConfDbMerge_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitorConfDbMerge_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: TrigCostMonitorConfDbMergeuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ TrigCostMonitorConfDbMerge"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ TrigCostMonitorConfDbMerge done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_TrigCostMonitorComponentsList_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_TrigCostMonitorComponentsList_has_target_tag

cmt_local_tagfile_TrigCostMonitorComponentsList = $(bin)$(TrigCostMonitor_tag)_TrigCostMonitorComponentsList.make
cmt_final_setup_TrigCostMonitorComponentsList = $(bin)setup_TrigCostMonitorComponentsList.make
cmt_local_TrigCostMonitorComponentsList_makefile = $(bin)TrigCostMonitorComponentsList.make

TrigCostMonitorComponentsList_extratags = -tag_add=target_TrigCostMonitorComponentsList

else

cmt_local_tagfile_TrigCostMonitorComponentsList = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_TrigCostMonitorComponentsList = $(bin)setup.make
cmt_local_TrigCostMonitorComponentsList_makefile = $(bin)TrigCostMonitorComponentsList.make

endif

not_TrigCostMonitorComponentsList_dependencies = { n=0; for p in $?; do m=0; for d in $(TrigCostMonitorComponentsList_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
TrigCostMonitorComponentsListdirs :
	@if test ! -d $(bin)TrigCostMonitorComponentsList; then $(mkdir) -p $(bin)TrigCostMonitorComponentsList; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)TrigCostMonitorComponentsList
else
TrigCostMonitorComponentsListdirs : ;
endif

ifdef cmt_TrigCostMonitorComponentsList_has_target_tag

ifndef QUICK
$(cmt_local_TrigCostMonitorComponentsList_makefile) : $(TrigCostMonitorComponentsList_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitorComponentsList.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorComponentsList_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitorComponentsList_makefile) TrigCostMonitorComponentsList
else
$(cmt_local_TrigCostMonitorComponentsList_makefile) : $(TrigCostMonitorComponentsList_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitorComponentsList) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitorComponentsList) ] || \
	  $(not_TrigCostMonitorComponentsList_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitorComponentsList.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorComponentsList_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitorComponentsList_makefile) TrigCostMonitorComponentsList; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_TrigCostMonitorComponentsList_makefile) : $(TrigCostMonitorComponentsList_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitorComponentsList.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitorComponentsList.in -tag=$(tags) $(TrigCostMonitorComponentsList_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitorComponentsList_makefile) TrigCostMonitorComponentsList
else
$(cmt_local_TrigCostMonitorComponentsList_makefile) : $(TrigCostMonitorComponentsList_dependencies) $(cmt_build_library_linksstamp) $(bin)TrigCostMonitorComponentsList.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitorComponentsList) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitorComponentsList) ] || \
	  $(not_TrigCostMonitorComponentsList_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitorComponentsList.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitorComponentsList.in -tag=$(tags) $(TrigCostMonitorComponentsList_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitorComponentsList_makefile) TrigCostMonitorComponentsList; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorComponentsList_extratags) build constituent_makefile -out=$(cmt_local_TrigCostMonitorComponentsList_makefile) TrigCostMonitorComponentsList

TrigCostMonitorComponentsList :: $(TrigCostMonitorComponentsList_dependencies) $(cmt_local_TrigCostMonitorComponentsList_makefile) dirs TrigCostMonitorComponentsListdirs
	$(echo) "(constituents.make) Starting TrigCostMonitorComponentsList"
	@if test -f $(cmt_local_TrigCostMonitorComponentsList_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorComponentsList_makefile) TrigCostMonitorComponentsList; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitorComponentsList_makefile) TrigCostMonitorComponentsList
	$(echo) "(constituents.make) TrigCostMonitorComponentsList done"

clean :: TrigCostMonitorComponentsListclean ;

TrigCostMonitorComponentsListclean :: $(TrigCostMonitorComponentsListclean_dependencies) ##$(cmt_local_TrigCostMonitorComponentsList_makefile)
	$(echo) "(constituents.make) Starting TrigCostMonitorComponentsListclean"
	@-if test -f $(cmt_local_TrigCostMonitorComponentsList_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorComponentsList_makefile) TrigCostMonitorComponentsListclean; \
	fi
	$(echo) "(constituents.make) TrigCostMonitorComponentsListclean done"
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitorComponentsList_makefile) TrigCostMonitorComponentsListclean

##	  /bin/rm -f $(cmt_local_TrigCostMonitorComponentsList_makefile) $(bin)TrigCostMonitorComponentsList_dependencies.make

install :: TrigCostMonitorComponentsListinstall ;

TrigCostMonitorComponentsListinstall :: $(TrigCostMonitorComponentsList_dependencies) $(cmt_local_TrigCostMonitorComponentsList_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_TrigCostMonitorComponentsList_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorComponentsList_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitorComponentsList_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : TrigCostMonitorComponentsListuninstall

$(foreach d,$(TrigCostMonitorComponentsList_dependencies),$(eval $(d)uninstall_dependencies += TrigCostMonitorComponentsListuninstall))

TrigCostMonitorComponentsListuninstall : $(TrigCostMonitorComponentsListuninstall_dependencies) ##$(cmt_local_TrigCostMonitorComponentsList_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_TrigCostMonitorComponentsList_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorComponentsList_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitorComponentsList_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: TrigCostMonitorComponentsListuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ TrigCostMonitorComponentsList"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ TrigCostMonitorComponentsList done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_TrigCostMonitorMergeComponentsList_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_TrigCostMonitorMergeComponentsList_has_target_tag

cmt_local_tagfile_TrigCostMonitorMergeComponentsList = $(bin)$(TrigCostMonitor_tag)_TrigCostMonitorMergeComponentsList.make
cmt_final_setup_TrigCostMonitorMergeComponentsList = $(bin)setup_TrigCostMonitorMergeComponentsList.make
cmt_local_TrigCostMonitorMergeComponentsList_makefile = $(bin)TrigCostMonitorMergeComponentsList.make

TrigCostMonitorMergeComponentsList_extratags = -tag_add=target_TrigCostMonitorMergeComponentsList

else

cmt_local_tagfile_TrigCostMonitorMergeComponentsList = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_TrigCostMonitorMergeComponentsList = $(bin)setup.make
cmt_local_TrigCostMonitorMergeComponentsList_makefile = $(bin)TrigCostMonitorMergeComponentsList.make

endif

not_TrigCostMonitorMergeComponentsList_dependencies = { n=0; for p in $?; do m=0; for d in $(TrigCostMonitorMergeComponentsList_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
TrigCostMonitorMergeComponentsListdirs :
	@if test ! -d $(bin)TrigCostMonitorMergeComponentsList; then $(mkdir) -p $(bin)TrigCostMonitorMergeComponentsList; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)TrigCostMonitorMergeComponentsList
else
TrigCostMonitorMergeComponentsListdirs : ;
endif

ifdef cmt_TrigCostMonitorMergeComponentsList_has_target_tag

ifndef QUICK
$(cmt_local_TrigCostMonitorMergeComponentsList_makefile) : $(TrigCostMonitorMergeComponentsList_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitorMergeComponentsList.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorMergeComponentsList_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitorMergeComponentsList_makefile) TrigCostMonitorMergeComponentsList
else
$(cmt_local_TrigCostMonitorMergeComponentsList_makefile) : $(TrigCostMonitorMergeComponentsList_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitorMergeComponentsList) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitorMergeComponentsList) ] || \
	  $(not_TrigCostMonitorMergeComponentsList_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitorMergeComponentsList.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorMergeComponentsList_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitorMergeComponentsList_makefile) TrigCostMonitorMergeComponentsList; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_TrigCostMonitorMergeComponentsList_makefile) : $(TrigCostMonitorMergeComponentsList_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitorMergeComponentsList.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitorMergeComponentsList.in -tag=$(tags) $(TrigCostMonitorMergeComponentsList_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitorMergeComponentsList_makefile) TrigCostMonitorMergeComponentsList
else
$(cmt_local_TrigCostMonitorMergeComponentsList_makefile) : $(TrigCostMonitorMergeComponentsList_dependencies) $(cmt_build_library_linksstamp) $(bin)TrigCostMonitorMergeComponentsList.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitorMergeComponentsList) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitorMergeComponentsList) ] || \
	  $(not_TrigCostMonitorMergeComponentsList_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitorMergeComponentsList.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitorMergeComponentsList.in -tag=$(tags) $(TrigCostMonitorMergeComponentsList_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitorMergeComponentsList_makefile) TrigCostMonitorMergeComponentsList; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorMergeComponentsList_extratags) build constituent_makefile -out=$(cmt_local_TrigCostMonitorMergeComponentsList_makefile) TrigCostMonitorMergeComponentsList

TrigCostMonitorMergeComponentsList :: $(TrigCostMonitorMergeComponentsList_dependencies) $(cmt_local_TrigCostMonitorMergeComponentsList_makefile) dirs TrigCostMonitorMergeComponentsListdirs
	$(echo) "(constituents.make) Starting TrigCostMonitorMergeComponentsList"
	@if test -f $(cmt_local_TrigCostMonitorMergeComponentsList_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorMergeComponentsList_makefile) TrigCostMonitorMergeComponentsList; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitorMergeComponentsList_makefile) TrigCostMonitorMergeComponentsList
	$(echo) "(constituents.make) TrigCostMonitorMergeComponentsList done"

clean :: TrigCostMonitorMergeComponentsListclean ;

TrigCostMonitorMergeComponentsListclean :: $(TrigCostMonitorMergeComponentsListclean_dependencies) ##$(cmt_local_TrigCostMonitorMergeComponentsList_makefile)
	$(echo) "(constituents.make) Starting TrigCostMonitorMergeComponentsListclean"
	@-if test -f $(cmt_local_TrigCostMonitorMergeComponentsList_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorMergeComponentsList_makefile) TrigCostMonitorMergeComponentsListclean; \
	fi
	$(echo) "(constituents.make) TrigCostMonitorMergeComponentsListclean done"
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitorMergeComponentsList_makefile) TrigCostMonitorMergeComponentsListclean

##	  /bin/rm -f $(cmt_local_TrigCostMonitorMergeComponentsList_makefile) $(bin)TrigCostMonitorMergeComponentsList_dependencies.make

install :: TrigCostMonitorMergeComponentsListinstall ;

TrigCostMonitorMergeComponentsListinstall :: $(TrigCostMonitorMergeComponentsList_dependencies) $(cmt_local_TrigCostMonitorMergeComponentsList_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_TrigCostMonitorMergeComponentsList_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorMergeComponentsList_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitorMergeComponentsList_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : TrigCostMonitorMergeComponentsListuninstall

$(foreach d,$(TrigCostMonitorMergeComponentsList_dependencies),$(eval $(d)uninstall_dependencies += TrigCostMonitorMergeComponentsListuninstall))

TrigCostMonitorMergeComponentsListuninstall : $(TrigCostMonitorMergeComponentsListuninstall_dependencies) ##$(cmt_local_TrigCostMonitorMergeComponentsList_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_TrigCostMonitorMergeComponentsList_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorMergeComponentsList_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitorMergeComponentsList_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: TrigCostMonitorMergeComponentsListuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ TrigCostMonitorMergeComponentsList"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ TrigCostMonitorMergeComponentsList done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_TrigCostMonitorCLIDDB_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_TrigCostMonitorCLIDDB_has_target_tag

cmt_local_tagfile_TrigCostMonitorCLIDDB = $(bin)$(TrigCostMonitor_tag)_TrigCostMonitorCLIDDB.make
cmt_final_setup_TrigCostMonitorCLIDDB = $(bin)setup_TrigCostMonitorCLIDDB.make
cmt_local_TrigCostMonitorCLIDDB_makefile = $(bin)TrigCostMonitorCLIDDB.make

TrigCostMonitorCLIDDB_extratags = -tag_add=target_TrigCostMonitorCLIDDB

else

cmt_local_tagfile_TrigCostMonitorCLIDDB = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_TrigCostMonitorCLIDDB = $(bin)setup.make
cmt_local_TrigCostMonitorCLIDDB_makefile = $(bin)TrigCostMonitorCLIDDB.make

endif

not_TrigCostMonitorCLIDDB_dependencies = { n=0; for p in $?; do m=0; for d in $(TrigCostMonitorCLIDDB_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
TrigCostMonitorCLIDDBdirs :
	@if test ! -d $(bin)TrigCostMonitorCLIDDB; then $(mkdir) -p $(bin)TrigCostMonitorCLIDDB; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)TrigCostMonitorCLIDDB
else
TrigCostMonitorCLIDDBdirs : ;
endif

ifdef cmt_TrigCostMonitorCLIDDB_has_target_tag

ifndef QUICK
$(cmt_local_TrigCostMonitorCLIDDB_makefile) : $(TrigCostMonitorCLIDDB_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitorCLIDDB.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorCLIDDB_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitorCLIDDB_makefile) TrigCostMonitorCLIDDB
else
$(cmt_local_TrigCostMonitorCLIDDB_makefile) : $(TrigCostMonitorCLIDDB_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitorCLIDDB) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitorCLIDDB) ] || \
	  $(not_TrigCostMonitorCLIDDB_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitorCLIDDB.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorCLIDDB_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitorCLIDDB_makefile) TrigCostMonitorCLIDDB; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_TrigCostMonitorCLIDDB_makefile) : $(TrigCostMonitorCLIDDB_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitorCLIDDB.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitorCLIDDB.in -tag=$(tags) $(TrigCostMonitorCLIDDB_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitorCLIDDB_makefile) TrigCostMonitorCLIDDB
else
$(cmt_local_TrigCostMonitorCLIDDB_makefile) : $(TrigCostMonitorCLIDDB_dependencies) $(cmt_build_library_linksstamp) $(bin)TrigCostMonitorCLIDDB.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitorCLIDDB) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitorCLIDDB) ] || \
	  $(not_TrigCostMonitorCLIDDB_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitorCLIDDB.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitorCLIDDB.in -tag=$(tags) $(TrigCostMonitorCLIDDB_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitorCLIDDB_makefile) TrigCostMonitorCLIDDB; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorCLIDDB_extratags) build constituent_makefile -out=$(cmt_local_TrigCostMonitorCLIDDB_makefile) TrigCostMonitorCLIDDB

TrigCostMonitorCLIDDB :: $(TrigCostMonitorCLIDDB_dependencies) $(cmt_local_TrigCostMonitorCLIDDB_makefile) dirs TrigCostMonitorCLIDDBdirs
	$(echo) "(constituents.make) Starting TrigCostMonitorCLIDDB"
	@if test -f $(cmt_local_TrigCostMonitorCLIDDB_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorCLIDDB_makefile) TrigCostMonitorCLIDDB; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitorCLIDDB_makefile) TrigCostMonitorCLIDDB
	$(echo) "(constituents.make) TrigCostMonitorCLIDDB done"

clean :: TrigCostMonitorCLIDDBclean ;

TrigCostMonitorCLIDDBclean :: $(TrigCostMonitorCLIDDBclean_dependencies) ##$(cmt_local_TrigCostMonitorCLIDDB_makefile)
	$(echo) "(constituents.make) Starting TrigCostMonitorCLIDDBclean"
	@-if test -f $(cmt_local_TrigCostMonitorCLIDDB_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorCLIDDB_makefile) TrigCostMonitorCLIDDBclean; \
	fi
	$(echo) "(constituents.make) TrigCostMonitorCLIDDBclean done"
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitorCLIDDB_makefile) TrigCostMonitorCLIDDBclean

##	  /bin/rm -f $(cmt_local_TrigCostMonitorCLIDDB_makefile) $(bin)TrigCostMonitorCLIDDB_dependencies.make

install :: TrigCostMonitorCLIDDBinstall ;

TrigCostMonitorCLIDDBinstall :: $(TrigCostMonitorCLIDDB_dependencies) $(cmt_local_TrigCostMonitorCLIDDB_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_TrigCostMonitorCLIDDB_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorCLIDDB_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitorCLIDDB_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : TrigCostMonitorCLIDDBuninstall

$(foreach d,$(TrigCostMonitorCLIDDB_dependencies),$(eval $(d)uninstall_dependencies += TrigCostMonitorCLIDDBuninstall))

TrigCostMonitorCLIDDBuninstall : $(TrigCostMonitorCLIDDBuninstall_dependencies) ##$(cmt_local_TrigCostMonitorCLIDDB_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_TrigCostMonitorCLIDDB_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorCLIDDB_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitorCLIDDB_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: TrigCostMonitorCLIDDBuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ TrigCostMonitorCLIDDB"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ TrigCostMonitorCLIDDB done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_TrigCostMonitor_optdebug_library_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_TrigCostMonitor_optdebug_library_has_target_tag

cmt_local_tagfile_TrigCostMonitor_optdebug_library = $(bin)$(TrigCostMonitor_tag)_TrigCostMonitor_optdebug_library.make
cmt_final_setup_TrigCostMonitor_optdebug_library = $(bin)setup_TrigCostMonitor_optdebug_library.make
cmt_local_TrigCostMonitor_optdebug_library_makefile = $(bin)TrigCostMonitor_optdebug_library.make

TrigCostMonitor_optdebug_library_extratags = -tag_add=target_TrigCostMonitor_optdebug_library

else

cmt_local_tagfile_TrigCostMonitor_optdebug_library = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_TrigCostMonitor_optdebug_library = $(bin)setup.make
cmt_local_TrigCostMonitor_optdebug_library_makefile = $(bin)TrigCostMonitor_optdebug_library.make

endif

not_TrigCostMonitor_optdebug_library_dependencies = { n=0; for p in $?; do m=0; for d in $(TrigCostMonitor_optdebug_library_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
TrigCostMonitor_optdebug_librarydirs :
	@if test ! -d $(bin)TrigCostMonitor_optdebug_library; then $(mkdir) -p $(bin)TrigCostMonitor_optdebug_library; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)TrigCostMonitor_optdebug_library
else
TrigCostMonitor_optdebug_librarydirs : ;
endif

ifdef cmt_TrigCostMonitor_optdebug_library_has_target_tag

ifndef QUICK
$(cmt_local_TrigCostMonitor_optdebug_library_makefile) : $(TrigCostMonitor_optdebug_library_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitor_optdebug_library.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitor_optdebug_library_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitor_optdebug_library_makefile) TrigCostMonitor_optdebug_library
else
$(cmt_local_TrigCostMonitor_optdebug_library_makefile) : $(TrigCostMonitor_optdebug_library_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitor_optdebug_library) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitor_optdebug_library) ] || \
	  $(not_TrigCostMonitor_optdebug_library_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitor_optdebug_library.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitor_optdebug_library_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitor_optdebug_library_makefile) TrigCostMonitor_optdebug_library; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_TrigCostMonitor_optdebug_library_makefile) : $(TrigCostMonitor_optdebug_library_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitor_optdebug_library.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitor_optdebug_library.in -tag=$(tags) $(TrigCostMonitor_optdebug_library_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitor_optdebug_library_makefile) TrigCostMonitor_optdebug_library
else
$(cmt_local_TrigCostMonitor_optdebug_library_makefile) : $(TrigCostMonitor_optdebug_library_dependencies) $(cmt_build_library_linksstamp) $(bin)TrigCostMonitor_optdebug_library.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitor_optdebug_library) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitor_optdebug_library) ] || \
	  $(not_TrigCostMonitor_optdebug_library_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitor_optdebug_library.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitor_optdebug_library.in -tag=$(tags) $(TrigCostMonitor_optdebug_library_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitor_optdebug_library_makefile) TrigCostMonitor_optdebug_library; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(TrigCostMonitor_optdebug_library_extratags) build constituent_makefile -out=$(cmt_local_TrigCostMonitor_optdebug_library_makefile) TrigCostMonitor_optdebug_library

TrigCostMonitor_optdebug_library :: $(TrigCostMonitor_optdebug_library_dependencies) $(cmt_local_TrigCostMonitor_optdebug_library_makefile) dirs TrigCostMonitor_optdebug_librarydirs
	$(echo) "(constituents.make) Starting TrigCostMonitor_optdebug_library"
	@if test -f $(cmt_local_TrigCostMonitor_optdebug_library_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitor_optdebug_library_makefile) TrigCostMonitor_optdebug_library; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitor_optdebug_library_makefile) TrigCostMonitor_optdebug_library
	$(echo) "(constituents.make) TrigCostMonitor_optdebug_library done"

clean :: TrigCostMonitor_optdebug_libraryclean ;

TrigCostMonitor_optdebug_libraryclean :: $(TrigCostMonitor_optdebug_libraryclean_dependencies) ##$(cmt_local_TrigCostMonitor_optdebug_library_makefile)
	$(echo) "(constituents.make) Starting TrigCostMonitor_optdebug_libraryclean"
	@-if test -f $(cmt_local_TrigCostMonitor_optdebug_library_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitor_optdebug_library_makefile) TrigCostMonitor_optdebug_libraryclean; \
	fi
	$(echo) "(constituents.make) TrigCostMonitor_optdebug_libraryclean done"
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitor_optdebug_library_makefile) TrigCostMonitor_optdebug_libraryclean

##	  /bin/rm -f $(cmt_local_TrigCostMonitor_optdebug_library_makefile) $(bin)TrigCostMonitor_optdebug_library_dependencies.make

install :: TrigCostMonitor_optdebug_libraryinstall ;

TrigCostMonitor_optdebug_libraryinstall :: $(TrigCostMonitor_optdebug_library_dependencies) $(cmt_local_TrigCostMonitor_optdebug_library_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_TrigCostMonitor_optdebug_library_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitor_optdebug_library_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitor_optdebug_library_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : TrigCostMonitor_optdebug_libraryuninstall

$(foreach d,$(TrigCostMonitor_optdebug_library_dependencies),$(eval $(d)uninstall_dependencies += TrigCostMonitor_optdebug_libraryuninstall))

TrigCostMonitor_optdebug_libraryuninstall : $(TrigCostMonitor_optdebug_libraryuninstall_dependencies) ##$(cmt_local_TrigCostMonitor_optdebug_library_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_TrigCostMonitor_optdebug_library_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitor_optdebug_library_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitor_optdebug_library_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: TrigCostMonitor_optdebug_libraryuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ TrigCostMonitor_optdebug_library"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ TrigCostMonitor_optdebug_library done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_TrigCostMonitorLib_optdebug_library_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_TrigCostMonitorLib_optdebug_library_has_target_tag

cmt_local_tagfile_TrigCostMonitorLib_optdebug_library = $(bin)$(TrigCostMonitor_tag)_TrigCostMonitorLib_optdebug_library.make
cmt_final_setup_TrigCostMonitorLib_optdebug_library = $(bin)setup_TrigCostMonitorLib_optdebug_library.make
cmt_local_TrigCostMonitorLib_optdebug_library_makefile = $(bin)TrigCostMonitorLib_optdebug_library.make

TrigCostMonitorLib_optdebug_library_extratags = -tag_add=target_TrigCostMonitorLib_optdebug_library

else

cmt_local_tagfile_TrigCostMonitorLib_optdebug_library = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_TrigCostMonitorLib_optdebug_library = $(bin)setup.make
cmt_local_TrigCostMonitorLib_optdebug_library_makefile = $(bin)TrigCostMonitorLib_optdebug_library.make

endif

not_TrigCostMonitorLib_optdebug_library_dependencies = { n=0; for p in $?; do m=0; for d in $(TrigCostMonitorLib_optdebug_library_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
TrigCostMonitorLib_optdebug_librarydirs :
	@if test ! -d $(bin)TrigCostMonitorLib_optdebug_library; then $(mkdir) -p $(bin)TrigCostMonitorLib_optdebug_library; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)TrigCostMonitorLib_optdebug_library
else
TrigCostMonitorLib_optdebug_librarydirs : ;
endif

ifdef cmt_TrigCostMonitorLib_optdebug_library_has_target_tag

ifndef QUICK
$(cmt_local_TrigCostMonitorLib_optdebug_library_makefile) : $(TrigCostMonitorLib_optdebug_library_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitorLib_optdebug_library.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorLib_optdebug_library_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitorLib_optdebug_library_makefile) TrigCostMonitorLib_optdebug_library
else
$(cmt_local_TrigCostMonitorLib_optdebug_library_makefile) : $(TrigCostMonitorLib_optdebug_library_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitorLib_optdebug_library) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitorLib_optdebug_library) ] || \
	  $(not_TrigCostMonitorLib_optdebug_library_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitorLib_optdebug_library.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorLib_optdebug_library_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitorLib_optdebug_library_makefile) TrigCostMonitorLib_optdebug_library; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_TrigCostMonitorLib_optdebug_library_makefile) : $(TrigCostMonitorLib_optdebug_library_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitorLib_optdebug_library.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitorLib_optdebug_library.in -tag=$(tags) $(TrigCostMonitorLib_optdebug_library_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitorLib_optdebug_library_makefile) TrigCostMonitorLib_optdebug_library
else
$(cmt_local_TrigCostMonitorLib_optdebug_library_makefile) : $(TrigCostMonitorLib_optdebug_library_dependencies) $(cmt_build_library_linksstamp) $(bin)TrigCostMonitorLib_optdebug_library.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitorLib_optdebug_library) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitorLib_optdebug_library) ] || \
	  $(not_TrigCostMonitorLib_optdebug_library_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitorLib_optdebug_library.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitorLib_optdebug_library.in -tag=$(tags) $(TrigCostMonitorLib_optdebug_library_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitorLib_optdebug_library_makefile) TrigCostMonitorLib_optdebug_library; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorLib_optdebug_library_extratags) build constituent_makefile -out=$(cmt_local_TrigCostMonitorLib_optdebug_library_makefile) TrigCostMonitorLib_optdebug_library

TrigCostMonitorLib_optdebug_library :: $(TrigCostMonitorLib_optdebug_library_dependencies) $(cmt_local_TrigCostMonitorLib_optdebug_library_makefile) dirs TrigCostMonitorLib_optdebug_librarydirs
	$(echo) "(constituents.make) Starting TrigCostMonitorLib_optdebug_library"
	@if test -f $(cmt_local_TrigCostMonitorLib_optdebug_library_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorLib_optdebug_library_makefile) TrigCostMonitorLib_optdebug_library; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitorLib_optdebug_library_makefile) TrigCostMonitorLib_optdebug_library
	$(echo) "(constituents.make) TrigCostMonitorLib_optdebug_library done"

clean :: TrigCostMonitorLib_optdebug_libraryclean ;

TrigCostMonitorLib_optdebug_libraryclean :: $(TrigCostMonitorLib_optdebug_libraryclean_dependencies) ##$(cmt_local_TrigCostMonitorLib_optdebug_library_makefile)
	$(echo) "(constituents.make) Starting TrigCostMonitorLib_optdebug_libraryclean"
	@-if test -f $(cmt_local_TrigCostMonitorLib_optdebug_library_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorLib_optdebug_library_makefile) TrigCostMonitorLib_optdebug_libraryclean; \
	fi
	$(echo) "(constituents.make) TrigCostMonitorLib_optdebug_libraryclean done"
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitorLib_optdebug_library_makefile) TrigCostMonitorLib_optdebug_libraryclean

##	  /bin/rm -f $(cmt_local_TrigCostMonitorLib_optdebug_library_makefile) $(bin)TrigCostMonitorLib_optdebug_library_dependencies.make

install :: TrigCostMonitorLib_optdebug_libraryinstall ;

TrigCostMonitorLib_optdebug_libraryinstall :: $(TrigCostMonitorLib_optdebug_library_dependencies) $(cmt_local_TrigCostMonitorLib_optdebug_library_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_TrigCostMonitorLib_optdebug_library_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorLib_optdebug_library_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitorLib_optdebug_library_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : TrigCostMonitorLib_optdebug_libraryuninstall

$(foreach d,$(TrigCostMonitorLib_optdebug_library_dependencies),$(eval $(d)uninstall_dependencies += TrigCostMonitorLib_optdebug_libraryuninstall))

TrigCostMonitorLib_optdebug_libraryuninstall : $(TrigCostMonitorLib_optdebug_libraryuninstall_dependencies) ##$(cmt_local_TrigCostMonitorLib_optdebug_library_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_TrigCostMonitorLib_optdebug_library_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorLib_optdebug_library_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitorLib_optdebug_library_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: TrigCostMonitorLib_optdebug_libraryuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ TrigCostMonitorLib_optdebug_library"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ TrigCostMonitorLib_optdebug_library done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_install_python_modules_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_install_python_modules_has_target_tag

cmt_local_tagfile_install_python_modules = $(bin)$(TrigCostMonitor_tag)_install_python_modules.make
cmt_final_setup_install_python_modules = $(bin)setup_install_python_modules.make
cmt_local_install_python_modules_makefile = $(bin)install_python_modules.make

install_python_modules_extratags = -tag_add=target_install_python_modules

else

cmt_local_tagfile_install_python_modules = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_install_python_modules = $(bin)setup.make
cmt_local_install_python_modules_makefile = $(bin)install_python_modules.make

endif

not_install_python_modules_dependencies = { n=0; for p in $?; do m=0; for d in $(install_python_modules_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
install_python_modulesdirs :
	@if test ! -d $(bin)install_python_modules; then $(mkdir) -p $(bin)install_python_modules; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)install_python_modules
else
install_python_modulesdirs : ;
endif

ifdef cmt_install_python_modules_has_target_tag

ifndef QUICK
$(cmt_local_install_python_modules_makefile) : $(install_python_modules_dependencies) build_library_links
	$(echo) "(constituents.make) Building install_python_modules.make"; \
	  $(cmtexe) -tag=$(tags) $(install_python_modules_extratags) build constituent_config -out=$(cmt_local_install_python_modules_makefile) install_python_modules
else
$(cmt_local_install_python_modules_makefile) : $(install_python_modules_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_install_python_modules) ] || \
	  [ ! -f $(cmt_final_setup_install_python_modules) ] || \
	  $(not_install_python_modules_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building install_python_modules.make"; \
	  $(cmtexe) -tag=$(tags) $(install_python_modules_extratags) build constituent_config -out=$(cmt_local_install_python_modules_makefile) install_python_modules; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_install_python_modules_makefile) : $(install_python_modules_dependencies) build_library_links
	$(echo) "(constituents.make) Building install_python_modules.make"; \
	  $(cmtexe) -f=$(bin)install_python_modules.in -tag=$(tags) $(install_python_modules_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_install_python_modules_makefile) install_python_modules
else
$(cmt_local_install_python_modules_makefile) : $(install_python_modules_dependencies) $(cmt_build_library_linksstamp) $(bin)install_python_modules.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_install_python_modules) ] || \
	  [ ! -f $(cmt_final_setup_install_python_modules) ] || \
	  $(not_install_python_modules_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building install_python_modules.make"; \
	  $(cmtexe) -f=$(bin)install_python_modules.in -tag=$(tags) $(install_python_modules_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_install_python_modules_makefile) install_python_modules; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(install_python_modules_extratags) build constituent_makefile -out=$(cmt_local_install_python_modules_makefile) install_python_modules

install_python_modules :: $(install_python_modules_dependencies) $(cmt_local_install_python_modules_makefile) dirs install_python_modulesdirs
	$(echo) "(constituents.make) Starting install_python_modules"
	@if test -f $(cmt_local_install_python_modules_makefile); then \
	  $(MAKE) -f $(cmt_local_install_python_modules_makefile) install_python_modules; \
	  fi
#	@$(MAKE) -f $(cmt_local_install_python_modules_makefile) install_python_modules
	$(echo) "(constituents.make) install_python_modules done"

clean :: install_python_modulesclean ;

install_python_modulesclean :: $(install_python_modulesclean_dependencies) ##$(cmt_local_install_python_modules_makefile)
	$(echo) "(constituents.make) Starting install_python_modulesclean"
	@-if test -f $(cmt_local_install_python_modules_makefile); then \
	  $(MAKE) -f $(cmt_local_install_python_modules_makefile) install_python_modulesclean; \
	fi
	$(echo) "(constituents.make) install_python_modulesclean done"
#	@-$(MAKE) -f $(cmt_local_install_python_modules_makefile) install_python_modulesclean

##	  /bin/rm -f $(cmt_local_install_python_modules_makefile) $(bin)install_python_modules_dependencies.make

install :: install_python_modulesinstall ;

install_python_modulesinstall :: $(install_python_modules_dependencies) $(cmt_local_install_python_modules_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_install_python_modules_makefile); then \
	  $(MAKE) -f $(cmt_local_install_python_modules_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_install_python_modules_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : install_python_modulesuninstall

$(foreach d,$(install_python_modules_dependencies),$(eval $(d)uninstall_dependencies += install_python_modulesuninstall))

install_python_modulesuninstall : $(install_python_modulesuninstall_dependencies) ##$(cmt_local_install_python_modules_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_install_python_modules_makefile); then \
	  $(MAKE) -f $(cmt_local_install_python_modules_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_install_python_modules_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: install_python_modulesuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ install_python_modules"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ install_python_modules done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_install_joboptions_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_install_joboptions_has_target_tag

cmt_local_tagfile_install_joboptions = $(bin)$(TrigCostMonitor_tag)_install_joboptions.make
cmt_final_setup_install_joboptions = $(bin)setup_install_joboptions.make
cmt_local_install_joboptions_makefile = $(bin)install_joboptions.make

install_joboptions_extratags = -tag_add=target_install_joboptions

else

cmt_local_tagfile_install_joboptions = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_install_joboptions = $(bin)setup.make
cmt_local_install_joboptions_makefile = $(bin)install_joboptions.make

endif

not_install_joboptions_dependencies = { n=0; for p in $?; do m=0; for d in $(install_joboptions_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
install_joboptionsdirs :
	@if test ! -d $(bin)install_joboptions; then $(mkdir) -p $(bin)install_joboptions; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)install_joboptions
else
install_joboptionsdirs : ;
endif

ifdef cmt_install_joboptions_has_target_tag

ifndef QUICK
$(cmt_local_install_joboptions_makefile) : $(install_joboptions_dependencies) build_library_links
	$(echo) "(constituents.make) Building install_joboptions.make"; \
	  $(cmtexe) -tag=$(tags) $(install_joboptions_extratags) build constituent_config -out=$(cmt_local_install_joboptions_makefile) install_joboptions
else
$(cmt_local_install_joboptions_makefile) : $(install_joboptions_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_install_joboptions) ] || \
	  [ ! -f $(cmt_final_setup_install_joboptions) ] || \
	  $(not_install_joboptions_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building install_joboptions.make"; \
	  $(cmtexe) -tag=$(tags) $(install_joboptions_extratags) build constituent_config -out=$(cmt_local_install_joboptions_makefile) install_joboptions; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_install_joboptions_makefile) : $(install_joboptions_dependencies) build_library_links
	$(echo) "(constituents.make) Building install_joboptions.make"; \
	  $(cmtexe) -f=$(bin)install_joboptions.in -tag=$(tags) $(install_joboptions_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_install_joboptions_makefile) install_joboptions
else
$(cmt_local_install_joboptions_makefile) : $(install_joboptions_dependencies) $(cmt_build_library_linksstamp) $(bin)install_joboptions.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_install_joboptions) ] || \
	  [ ! -f $(cmt_final_setup_install_joboptions) ] || \
	  $(not_install_joboptions_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building install_joboptions.make"; \
	  $(cmtexe) -f=$(bin)install_joboptions.in -tag=$(tags) $(install_joboptions_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_install_joboptions_makefile) install_joboptions; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(install_joboptions_extratags) build constituent_makefile -out=$(cmt_local_install_joboptions_makefile) install_joboptions

install_joboptions :: $(install_joboptions_dependencies) $(cmt_local_install_joboptions_makefile) dirs install_joboptionsdirs
	$(echo) "(constituents.make) Starting install_joboptions"
	@if test -f $(cmt_local_install_joboptions_makefile); then \
	  $(MAKE) -f $(cmt_local_install_joboptions_makefile) install_joboptions; \
	  fi
#	@$(MAKE) -f $(cmt_local_install_joboptions_makefile) install_joboptions
	$(echo) "(constituents.make) install_joboptions done"

clean :: install_joboptionsclean ;

install_joboptionsclean :: $(install_joboptionsclean_dependencies) ##$(cmt_local_install_joboptions_makefile)
	$(echo) "(constituents.make) Starting install_joboptionsclean"
	@-if test -f $(cmt_local_install_joboptions_makefile); then \
	  $(MAKE) -f $(cmt_local_install_joboptions_makefile) install_joboptionsclean; \
	fi
	$(echo) "(constituents.make) install_joboptionsclean done"
#	@-$(MAKE) -f $(cmt_local_install_joboptions_makefile) install_joboptionsclean

##	  /bin/rm -f $(cmt_local_install_joboptions_makefile) $(bin)install_joboptions_dependencies.make

install :: install_joboptionsinstall ;

install_joboptionsinstall :: $(install_joboptions_dependencies) $(cmt_local_install_joboptions_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_install_joboptions_makefile); then \
	  $(MAKE) -f $(cmt_local_install_joboptions_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_install_joboptions_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : install_joboptionsuninstall

$(foreach d,$(install_joboptions_dependencies),$(eval $(d)uninstall_dependencies += install_joboptionsuninstall))

install_joboptionsuninstall : $(install_joboptionsuninstall_dependencies) ##$(cmt_local_install_joboptions_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_install_joboptions_makefile); then \
	  $(MAKE) -f $(cmt_local_install_joboptions_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_install_joboptions_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: install_joboptionsuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ install_joboptions"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ install_joboptions done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_install_runtime_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_install_runtime_has_target_tag

cmt_local_tagfile_install_runtime = $(bin)$(TrigCostMonitor_tag)_install_runtime.make
cmt_final_setup_install_runtime = $(bin)setup_install_runtime.make
cmt_local_install_runtime_makefile = $(bin)install_runtime.make

install_runtime_extratags = -tag_add=target_install_runtime

else

cmt_local_tagfile_install_runtime = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_install_runtime = $(bin)setup.make
cmt_local_install_runtime_makefile = $(bin)install_runtime.make

endif

not_install_runtime_dependencies = { n=0; for p in $?; do m=0; for d in $(install_runtime_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
install_runtimedirs :
	@if test ! -d $(bin)install_runtime; then $(mkdir) -p $(bin)install_runtime; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)install_runtime
else
install_runtimedirs : ;
endif

ifdef cmt_install_runtime_has_target_tag

ifndef QUICK
$(cmt_local_install_runtime_makefile) : $(install_runtime_dependencies) build_library_links
	$(echo) "(constituents.make) Building install_runtime.make"; \
	  $(cmtexe) -tag=$(tags) $(install_runtime_extratags) build constituent_config -out=$(cmt_local_install_runtime_makefile) install_runtime
else
$(cmt_local_install_runtime_makefile) : $(install_runtime_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_install_runtime) ] || \
	  [ ! -f $(cmt_final_setup_install_runtime) ] || \
	  $(not_install_runtime_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building install_runtime.make"; \
	  $(cmtexe) -tag=$(tags) $(install_runtime_extratags) build constituent_config -out=$(cmt_local_install_runtime_makefile) install_runtime; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_install_runtime_makefile) : $(install_runtime_dependencies) build_library_links
	$(echo) "(constituents.make) Building install_runtime.make"; \
	  $(cmtexe) -f=$(bin)install_runtime.in -tag=$(tags) $(install_runtime_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_install_runtime_makefile) install_runtime
else
$(cmt_local_install_runtime_makefile) : $(install_runtime_dependencies) $(cmt_build_library_linksstamp) $(bin)install_runtime.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_install_runtime) ] || \
	  [ ! -f $(cmt_final_setup_install_runtime) ] || \
	  $(not_install_runtime_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building install_runtime.make"; \
	  $(cmtexe) -f=$(bin)install_runtime.in -tag=$(tags) $(install_runtime_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_install_runtime_makefile) install_runtime; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(install_runtime_extratags) build constituent_makefile -out=$(cmt_local_install_runtime_makefile) install_runtime

install_runtime :: $(install_runtime_dependencies) $(cmt_local_install_runtime_makefile) dirs install_runtimedirs
	$(echo) "(constituents.make) Starting install_runtime"
	@if test -f $(cmt_local_install_runtime_makefile); then \
	  $(MAKE) -f $(cmt_local_install_runtime_makefile) install_runtime; \
	  fi
#	@$(MAKE) -f $(cmt_local_install_runtime_makefile) install_runtime
	$(echo) "(constituents.make) install_runtime done"

clean :: install_runtimeclean ;

install_runtimeclean :: $(install_runtimeclean_dependencies) ##$(cmt_local_install_runtime_makefile)
	$(echo) "(constituents.make) Starting install_runtimeclean"
	@-if test -f $(cmt_local_install_runtime_makefile); then \
	  $(MAKE) -f $(cmt_local_install_runtime_makefile) install_runtimeclean; \
	fi
	$(echo) "(constituents.make) install_runtimeclean done"
#	@-$(MAKE) -f $(cmt_local_install_runtime_makefile) install_runtimeclean

##	  /bin/rm -f $(cmt_local_install_runtime_makefile) $(bin)install_runtime_dependencies.make

install :: install_runtimeinstall ;

install_runtimeinstall :: $(install_runtime_dependencies) $(cmt_local_install_runtime_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_install_runtime_makefile); then \
	  $(MAKE) -f $(cmt_local_install_runtime_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_install_runtime_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : install_runtimeuninstall

$(foreach d,$(install_runtime_dependencies),$(eval $(d)uninstall_dependencies += install_runtimeuninstall))

install_runtimeuninstall : $(install_runtimeuninstall_dependencies) ##$(cmt_local_install_runtime_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_install_runtime_makefile); then \
	  $(MAKE) -f $(cmt_local_install_runtime_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_install_runtime_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: install_runtimeuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ install_runtime"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ install_runtime done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_TrigCostMonitorGen_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_TrigCostMonitorGen_has_target_tag

cmt_local_tagfile_TrigCostMonitorGen = $(bin)$(TrigCostMonitor_tag)_TrigCostMonitorGen.make
cmt_final_setup_TrigCostMonitorGen = $(bin)setup_TrigCostMonitorGen.make
cmt_local_TrigCostMonitorGen_makefile = $(bin)TrigCostMonitorGen.make

TrigCostMonitorGen_extratags = -tag_add=target_TrigCostMonitorGen

else

cmt_local_tagfile_TrigCostMonitorGen = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_TrigCostMonitorGen = $(bin)setup.make
cmt_local_TrigCostMonitorGen_makefile = $(bin)TrigCostMonitorGen.make

endif

not_TrigCostMonitorGen_dependencies = { n=0; for p in $?; do m=0; for d in $(TrigCostMonitorGen_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
TrigCostMonitorGendirs :
	@if test ! -d $(bin)TrigCostMonitorGen; then $(mkdir) -p $(bin)TrigCostMonitorGen; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)TrigCostMonitorGen
else
TrigCostMonitorGendirs : ;
endif

ifdef cmt_TrigCostMonitorGen_has_target_tag

ifndef QUICK
$(cmt_local_TrigCostMonitorGen_makefile) : $(TrigCostMonitorGen_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitorGen.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorGen_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitorGen_makefile) TrigCostMonitorGen
else
$(cmt_local_TrigCostMonitorGen_makefile) : $(TrigCostMonitorGen_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitorGen) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitorGen) ] || \
	  $(not_TrigCostMonitorGen_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitorGen.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorGen_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitorGen_makefile) TrigCostMonitorGen; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_TrigCostMonitorGen_makefile) : $(TrigCostMonitorGen_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitorGen.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitorGen.in -tag=$(tags) $(TrigCostMonitorGen_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitorGen_makefile) TrigCostMonitorGen
else
$(cmt_local_TrigCostMonitorGen_makefile) : $(TrigCostMonitorGen_dependencies) $(cmt_build_library_linksstamp) $(bin)TrigCostMonitorGen.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitorGen) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitorGen) ] || \
	  $(not_TrigCostMonitorGen_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitorGen.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitorGen.in -tag=$(tags) $(TrigCostMonitorGen_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitorGen_makefile) TrigCostMonitorGen; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorGen_extratags) build constituent_makefile -out=$(cmt_local_TrigCostMonitorGen_makefile) TrigCostMonitorGen

TrigCostMonitorGen :: $(TrigCostMonitorGen_dependencies) $(cmt_local_TrigCostMonitorGen_makefile) dirs TrigCostMonitorGendirs
	$(echo) "(constituents.make) Starting TrigCostMonitorGen"
	@if test -f $(cmt_local_TrigCostMonitorGen_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorGen_makefile) TrigCostMonitorGen; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitorGen_makefile) TrigCostMonitorGen
	$(echo) "(constituents.make) TrigCostMonitorGen done"

clean :: TrigCostMonitorGenclean ;

TrigCostMonitorGenclean :: $(TrigCostMonitorGenclean_dependencies) ##$(cmt_local_TrigCostMonitorGen_makefile)
	$(echo) "(constituents.make) Starting TrigCostMonitorGenclean"
	@-if test -f $(cmt_local_TrigCostMonitorGen_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorGen_makefile) TrigCostMonitorGenclean; \
	fi
	$(echo) "(constituents.make) TrigCostMonitorGenclean done"
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitorGen_makefile) TrigCostMonitorGenclean

##	  /bin/rm -f $(cmt_local_TrigCostMonitorGen_makefile) $(bin)TrigCostMonitorGen_dependencies.make

install :: TrigCostMonitorGeninstall ;

TrigCostMonitorGeninstall :: $(TrigCostMonitorGen_dependencies) $(cmt_local_TrigCostMonitorGen_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_TrigCostMonitorGen_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorGen_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitorGen_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : TrigCostMonitorGenuninstall

$(foreach d,$(TrigCostMonitorGen_dependencies),$(eval $(d)uninstall_dependencies += TrigCostMonitorGenuninstall))

TrigCostMonitorGenuninstall : $(TrigCostMonitorGenuninstall_dependencies) ##$(cmt_local_TrigCostMonitorGen_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_TrigCostMonitorGen_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorGen_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitorGen_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: TrigCostMonitorGenuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ TrigCostMonitorGen"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ TrigCostMonitorGen done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_TrigCostMonitorDict_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_TrigCostMonitorDict_has_target_tag

cmt_local_tagfile_TrigCostMonitorDict = $(bin)$(TrigCostMonitor_tag)_TrigCostMonitorDict.make
cmt_final_setup_TrigCostMonitorDict = $(bin)setup_TrigCostMonitorDict.make
cmt_local_TrigCostMonitorDict_makefile = $(bin)TrigCostMonitorDict.make

TrigCostMonitorDict_extratags = -tag_add=target_TrigCostMonitorDict

else

cmt_local_tagfile_TrigCostMonitorDict = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_TrigCostMonitorDict = $(bin)setup.make
cmt_local_TrigCostMonitorDict_makefile = $(bin)TrigCostMonitorDict.make

endif

not_TrigCostMonitorDict_dependencies = { n=0; for p in $?; do m=0; for d in $(TrigCostMonitorDict_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
TrigCostMonitorDictdirs :
	@if test ! -d $(bin)TrigCostMonitorDict; then $(mkdir) -p $(bin)TrigCostMonitorDict; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)TrigCostMonitorDict
else
TrigCostMonitorDictdirs : ;
endif

ifdef cmt_TrigCostMonitorDict_has_target_tag

ifndef QUICK
$(cmt_local_TrigCostMonitorDict_makefile) : $(TrigCostMonitorDict_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitorDict.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorDict_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitorDict_makefile) TrigCostMonitorDict
else
$(cmt_local_TrigCostMonitorDict_makefile) : $(TrigCostMonitorDict_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitorDict) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitorDict) ] || \
	  $(not_TrigCostMonitorDict_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitorDict.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorDict_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitorDict_makefile) TrigCostMonitorDict; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_TrigCostMonitorDict_makefile) : $(TrigCostMonitorDict_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitorDict.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitorDict.in -tag=$(tags) $(TrigCostMonitorDict_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitorDict_makefile) TrigCostMonitorDict
else
$(cmt_local_TrigCostMonitorDict_makefile) : $(TrigCostMonitorDict_dependencies) $(cmt_build_library_linksstamp) $(bin)TrigCostMonitorDict.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitorDict) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitorDict) ] || \
	  $(not_TrigCostMonitorDict_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitorDict.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitorDict.in -tag=$(tags) $(TrigCostMonitorDict_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitorDict_makefile) TrigCostMonitorDict; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorDict_extratags) build constituent_makefile -out=$(cmt_local_TrigCostMonitorDict_makefile) TrigCostMonitorDict

TrigCostMonitorDict :: $(TrigCostMonitorDict_dependencies) $(cmt_local_TrigCostMonitorDict_makefile) dirs TrigCostMonitorDictdirs
	$(echo) "(constituents.make) Starting TrigCostMonitorDict"
	@if test -f $(cmt_local_TrigCostMonitorDict_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorDict_makefile) TrigCostMonitorDict; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitorDict_makefile) TrigCostMonitorDict
	$(echo) "(constituents.make) TrigCostMonitorDict done"

clean :: TrigCostMonitorDictclean ;

TrigCostMonitorDictclean :: $(TrigCostMonitorDictclean_dependencies) ##$(cmt_local_TrigCostMonitorDict_makefile)
	$(echo) "(constituents.make) Starting TrigCostMonitorDictclean"
	@-if test -f $(cmt_local_TrigCostMonitorDict_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorDict_makefile) TrigCostMonitorDictclean; \
	fi
	$(echo) "(constituents.make) TrigCostMonitorDictclean done"
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitorDict_makefile) TrigCostMonitorDictclean

##	  /bin/rm -f $(cmt_local_TrigCostMonitorDict_makefile) $(bin)TrigCostMonitorDict_dependencies.make

install :: TrigCostMonitorDictinstall ;

TrigCostMonitorDictinstall :: $(TrigCostMonitorDict_dependencies) $(cmt_local_TrigCostMonitorDict_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_TrigCostMonitorDict_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorDict_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitorDict_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : TrigCostMonitorDictuninstall

$(foreach d,$(TrigCostMonitorDict_dependencies),$(eval $(d)uninstall_dependencies += TrigCostMonitorDictuninstall))

TrigCostMonitorDictuninstall : $(TrigCostMonitorDictuninstall_dependencies) ##$(cmt_local_TrigCostMonitorDict_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_TrigCostMonitorDict_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorDict_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitorDict_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: TrigCostMonitorDictuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ TrigCostMonitorDict"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ TrigCostMonitorDict done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_has_target_tag

cmt_local_tagfile_install_TrigCostMonitorDict_TrigCostMonitordictrootmap = $(bin)$(TrigCostMonitor_tag)_install_TrigCostMonitorDict_TrigCostMonitordictrootmap.make
cmt_final_setup_install_TrigCostMonitorDict_TrigCostMonitordictrootmap = $(bin)setup_install_TrigCostMonitorDict_TrigCostMonitordictrootmap.make
cmt_local_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile = $(bin)install_TrigCostMonitorDict_TrigCostMonitordictrootmap.make

install_TrigCostMonitorDict_TrigCostMonitordictrootmap_extratags = -tag_add=target_install_TrigCostMonitorDict_TrigCostMonitordictrootmap

else

cmt_local_tagfile_install_TrigCostMonitorDict_TrigCostMonitordictrootmap = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_install_TrigCostMonitorDict_TrigCostMonitordictrootmap = $(bin)setup.make
cmt_local_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile = $(bin)install_TrigCostMonitorDict_TrigCostMonitordictrootmap.make

endif

not_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_dependencies = { n=0; for p in $?; do m=0; for d in $(install_TrigCostMonitorDict_TrigCostMonitordictrootmap_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
install_TrigCostMonitorDict_TrigCostMonitordictrootmapdirs :
	@if test ! -d $(bin)install_TrigCostMonitorDict_TrigCostMonitordictrootmap; then $(mkdir) -p $(bin)install_TrigCostMonitorDict_TrigCostMonitordictrootmap; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)install_TrigCostMonitorDict_TrigCostMonitordictrootmap
else
install_TrigCostMonitorDict_TrigCostMonitordictrootmapdirs : ;
endif

ifdef cmt_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_has_target_tag

ifndef QUICK
$(cmt_local_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) : $(install_TrigCostMonitorDict_TrigCostMonitordictrootmap_dependencies) build_library_links
	$(echo) "(constituents.make) Building install_TrigCostMonitorDict_TrigCostMonitordictrootmap.make"; \
	  $(cmtexe) -tag=$(tags) $(install_TrigCostMonitorDict_TrigCostMonitordictrootmap_extratags) build constituent_config -out=$(cmt_local_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) install_TrigCostMonitorDict_TrigCostMonitordictrootmap
else
$(cmt_local_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) : $(install_TrigCostMonitorDict_TrigCostMonitordictrootmap_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_install_TrigCostMonitorDict_TrigCostMonitordictrootmap) ] || \
	  [ ! -f $(cmt_final_setup_install_TrigCostMonitorDict_TrigCostMonitordictrootmap) ] || \
	  $(not_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building install_TrigCostMonitorDict_TrigCostMonitordictrootmap.make"; \
	  $(cmtexe) -tag=$(tags) $(install_TrigCostMonitorDict_TrigCostMonitordictrootmap_extratags) build constituent_config -out=$(cmt_local_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) install_TrigCostMonitorDict_TrigCostMonitordictrootmap; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) : $(install_TrigCostMonitorDict_TrigCostMonitordictrootmap_dependencies) build_library_links
	$(echo) "(constituents.make) Building install_TrigCostMonitorDict_TrigCostMonitordictrootmap.make"; \
	  $(cmtexe) -f=$(bin)install_TrigCostMonitorDict_TrigCostMonitordictrootmap.in -tag=$(tags) $(install_TrigCostMonitorDict_TrigCostMonitordictrootmap_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) install_TrigCostMonitorDict_TrigCostMonitordictrootmap
else
$(cmt_local_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) : $(install_TrigCostMonitorDict_TrigCostMonitordictrootmap_dependencies) $(cmt_build_library_linksstamp) $(bin)install_TrigCostMonitorDict_TrigCostMonitordictrootmap.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_install_TrigCostMonitorDict_TrigCostMonitordictrootmap) ] || \
	  [ ! -f $(cmt_final_setup_install_TrigCostMonitorDict_TrigCostMonitordictrootmap) ] || \
	  $(not_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building install_TrigCostMonitorDict_TrigCostMonitordictrootmap.make"; \
	  $(cmtexe) -f=$(bin)install_TrigCostMonitorDict_TrigCostMonitordictrootmap.in -tag=$(tags) $(install_TrigCostMonitorDict_TrigCostMonitordictrootmap_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) install_TrigCostMonitorDict_TrigCostMonitordictrootmap; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(install_TrigCostMonitorDict_TrigCostMonitordictrootmap_extratags) build constituent_makefile -out=$(cmt_local_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) install_TrigCostMonitorDict_TrigCostMonitordictrootmap

install_TrigCostMonitorDict_TrigCostMonitordictrootmap :: $(install_TrigCostMonitorDict_TrigCostMonitordictrootmap_dependencies) $(cmt_local_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) dirs install_TrigCostMonitorDict_TrigCostMonitordictrootmapdirs
	$(echo) "(constituents.make) Starting install_TrigCostMonitorDict_TrigCostMonitordictrootmap"
	@if test -f $(cmt_local_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile); then \
	  $(MAKE) -f $(cmt_local_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) install_TrigCostMonitorDict_TrigCostMonitordictrootmap; \
	  fi
#	@$(MAKE) -f $(cmt_local_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) install_TrigCostMonitorDict_TrigCostMonitordictrootmap
	$(echo) "(constituents.make) install_TrigCostMonitorDict_TrigCostMonitordictrootmap done"

clean :: install_TrigCostMonitorDict_TrigCostMonitordictrootmapclean ;

install_TrigCostMonitorDict_TrigCostMonitordictrootmapclean :: $(install_TrigCostMonitorDict_TrigCostMonitordictrootmapclean_dependencies) ##$(cmt_local_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile)
	$(echo) "(constituents.make) Starting install_TrigCostMonitorDict_TrigCostMonitordictrootmapclean"
	@-if test -f $(cmt_local_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile); then \
	  $(MAKE) -f $(cmt_local_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) install_TrigCostMonitorDict_TrigCostMonitordictrootmapclean; \
	fi
	$(echo) "(constituents.make) install_TrigCostMonitorDict_TrigCostMonitordictrootmapclean done"
#	@-$(MAKE) -f $(cmt_local_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) install_TrigCostMonitorDict_TrigCostMonitordictrootmapclean

##	  /bin/rm -f $(cmt_local_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) $(bin)install_TrigCostMonitorDict_TrigCostMonitordictrootmap_dependencies.make

install :: install_TrigCostMonitorDict_TrigCostMonitordictrootmapinstall ;

install_TrigCostMonitorDict_TrigCostMonitordictrootmapinstall :: $(install_TrigCostMonitorDict_TrigCostMonitordictrootmap_dependencies) $(cmt_local_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile); then \
	  $(MAKE) -f $(cmt_local_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : install_TrigCostMonitorDict_TrigCostMonitordictrootmapuninstall

$(foreach d,$(install_TrigCostMonitorDict_TrigCostMonitordictrootmap_dependencies),$(eval $(d)uninstall_dependencies += install_TrigCostMonitorDict_TrigCostMonitordictrootmapuninstall))

install_TrigCostMonitorDict_TrigCostMonitordictrootmapuninstall : $(install_TrigCostMonitorDict_TrigCostMonitordictrootmapuninstall_dependencies) ##$(cmt_local_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile); then \
	  $(MAKE) -f $(cmt_local_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: install_TrigCostMonitorDict_TrigCostMonitordictrootmapuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ install_TrigCostMonitorDict_TrigCostMonitordictrootmap"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ install_TrigCostMonitorDict_TrigCostMonitordictrootmap done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_TrigCostMonitorDict_optdebug_library_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_TrigCostMonitorDict_optdebug_library_has_target_tag

cmt_local_tagfile_TrigCostMonitorDict_optdebug_library = $(bin)$(TrigCostMonitor_tag)_TrigCostMonitorDict_optdebug_library.make
cmt_final_setup_TrigCostMonitorDict_optdebug_library = $(bin)setup_TrigCostMonitorDict_optdebug_library.make
cmt_local_TrigCostMonitorDict_optdebug_library_makefile = $(bin)TrigCostMonitorDict_optdebug_library.make

TrigCostMonitorDict_optdebug_library_extratags = -tag_add=target_TrigCostMonitorDict_optdebug_library

else

cmt_local_tagfile_TrigCostMonitorDict_optdebug_library = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_TrigCostMonitorDict_optdebug_library = $(bin)setup.make
cmt_local_TrigCostMonitorDict_optdebug_library_makefile = $(bin)TrigCostMonitorDict_optdebug_library.make

endif

not_TrigCostMonitorDict_optdebug_library_dependencies = { n=0; for p in $?; do m=0; for d in $(TrigCostMonitorDict_optdebug_library_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
TrigCostMonitorDict_optdebug_librarydirs :
	@if test ! -d $(bin)TrigCostMonitorDict_optdebug_library; then $(mkdir) -p $(bin)TrigCostMonitorDict_optdebug_library; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)TrigCostMonitorDict_optdebug_library
else
TrigCostMonitorDict_optdebug_librarydirs : ;
endif

ifdef cmt_TrigCostMonitorDict_optdebug_library_has_target_tag

ifndef QUICK
$(cmt_local_TrigCostMonitorDict_optdebug_library_makefile) : $(TrigCostMonitorDict_optdebug_library_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitorDict_optdebug_library.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorDict_optdebug_library_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitorDict_optdebug_library_makefile) TrigCostMonitorDict_optdebug_library
else
$(cmt_local_TrigCostMonitorDict_optdebug_library_makefile) : $(TrigCostMonitorDict_optdebug_library_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitorDict_optdebug_library) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitorDict_optdebug_library) ] || \
	  $(not_TrigCostMonitorDict_optdebug_library_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitorDict_optdebug_library.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorDict_optdebug_library_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitorDict_optdebug_library_makefile) TrigCostMonitorDict_optdebug_library; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_TrigCostMonitorDict_optdebug_library_makefile) : $(TrigCostMonitorDict_optdebug_library_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitorDict_optdebug_library.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitorDict_optdebug_library.in -tag=$(tags) $(TrigCostMonitorDict_optdebug_library_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitorDict_optdebug_library_makefile) TrigCostMonitorDict_optdebug_library
else
$(cmt_local_TrigCostMonitorDict_optdebug_library_makefile) : $(TrigCostMonitorDict_optdebug_library_dependencies) $(cmt_build_library_linksstamp) $(bin)TrigCostMonitorDict_optdebug_library.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitorDict_optdebug_library) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitorDict_optdebug_library) ] || \
	  $(not_TrigCostMonitorDict_optdebug_library_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitorDict_optdebug_library.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitorDict_optdebug_library.in -tag=$(tags) $(TrigCostMonitorDict_optdebug_library_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitorDict_optdebug_library_makefile) TrigCostMonitorDict_optdebug_library; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorDict_optdebug_library_extratags) build constituent_makefile -out=$(cmt_local_TrigCostMonitorDict_optdebug_library_makefile) TrigCostMonitorDict_optdebug_library

TrigCostMonitorDict_optdebug_library :: $(TrigCostMonitorDict_optdebug_library_dependencies) $(cmt_local_TrigCostMonitorDict_optdebug_library_makefile) dirs TrigCostMonitorDict_optdebug_librarydirs
	$(echo) "(constituents.make) Starting TrigCostMonitorDict_optdebug_library"
	@if test -f $(cmt_local_TrigCostMonitorDict_optdebug_library_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorDict_optdebug_library_makefile) TrigCostMonitorDict_optdebug_library; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitorDict_optdebug_library_makefile) TrigCostMonitorDict_optdebug_library
	$(echo) "(constituents.make) TrigCostMonitorDict_optdebug_library done"

clean :: TrigCostMonitorDict_optdebug_libraryclean ;

TrigCostMonitorDict_optdebug_libraryclean :: $(TrigCostMonitorDict_optdebug_libraryclean_dependencies) ##$(cmt_local_TrigCostMonitorDict_optdebug_library_makefile)
	$(echo) "(constituents.make) Starting TrigCostMonitorDict_optdebug_libraryclean"
	@-if test -f $(cmt_local_TrigCostMonitorDict_optdebug_library_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorDict_optdebug_library_makefile) TrigCostMonitorDict_optdebug_libraryclean; \
	fi
	$(echo) "(constituents.make) TrigCostMonitorDict_optdebug_libraryclean done"
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitorDict_optdebug_library_makefile) TrigCostMonitorDict_optdebug_libraryclean

##	  /bin/rm -f $(cmt_local_TrigCostMonitorDict_optdebug_library_makefile) $(bin)TrigCostMonitorDict_optdebug_library_dependencies.make

install :: TrigCostMonitorDict_optdebug_libraryinstall ;

TrigCostMonitorDict_optdebug_libraryinstall :: $(TrigCostMonitorDict_optdebug_library_dependencies) $(cmt_local_TrigCostMonitorDict_optdebug_library_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_TrigCostMonitorDict_optdebug_library_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorDict_optdebug_library_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitorDict_optdebug_library_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : TrigCostMonitorDict_optdebug_libraryuninstall

$(foreach d,$(TrigCostMonitorDict_optdebug_library_dependencies),$(eval $(d)uninstall_dependencies += TrigCostMonitorDict_optdebug_libraryuninstall))

TrigCostMonitorDict_optdebug_libraryuninstall : $(TrigCostMonitorDict_optdebug_libraryuninstall_dependencies) ##$(cmt_local_TrigCostMonitorDict_optdebug_library_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_TrigCostMonitorDict_optdebug_library_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorDict_optdebug_library_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitorDict_optdebug_library_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: TrigCostMonitorDict_optdebug_libraryuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ TrigCostMonitorDict_optdebug_library"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ TrigCostMonitorDict_optdebug_library done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_TrigCostMonitorDictMerge_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_TrigCostMonitorDictMerge_has_target_tag

cmt_local_tagfile_TrigCostMonitorDictMerge = $(bin)$(TrigCostMonitor_tag)_TrigCostMonitorDictMerge.make
cmt_final_setup_TrigCostMonitorDictMerge = $(bin)setup_TrigCostMonitorDictMerge.make
cmt_local_TrigCostMonitorDictMerge_makefile = $(bin)TrigCostMonitorDictMerge.make

TrigCostMonitorDictMerge_extratags = -tag_add=target_TrigCostMonitorDictMerge

else

cmt_local_tagfile_TrigCostMonitorDictMerge = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_TrigCostMonitorDictMerge = $(bin)setup.make
cmt_local_TrigCostMonitorDictMerge_makefile = $(bin)TrigCostMonitorDictMerge.make

endif

not_TrigCostMonitorDictMerge_dependencies = { n=0; for p in $?; do m=0; for d in $(TrigCostMonitorDictMerge_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
TrigCostMonitorDictMergedirs :
	@if test ! -d $(bin)TrigCostMonitorDictMerge; then $(mkdir) -p $(bin)TrigCostMonitorDictMerge; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)TrigCostMonitorDictMerge
else
TrigCostMonitorDictMergedirs : ;
endif

ifdef cmt_TrigCostMonitorDictMerge_has_target_tag

ifndef QUICK
$(cmt_local_TrigCostMonitorDictMerge_makefile) : $(TrigCostMonitorDictMerge_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitorDictMerge.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorDictMerge_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitorDictMerge_makefile) TrigCostMonitorDictMerge
else
$(cmt_local_TrigCostMonitorDictMerge_makefile) : $(TrigCostMonitorDictMerge_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitorDictMerge) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitorDictMerge) ] || \
	  $(not_TrigCostMonitorDictMerge_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitorDictMerge.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorDictMerge_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitorDictMerge_makefile) TrigCostMonitorDictMerge; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_TrigCostMonitorDictMerge_makefile) : $(TrigCostMonitorDictMerge_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitorDictMerge.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitorDictMerge.in -tag=$(tags) $(TrigCostMonitorDictMerge_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitorDictMerge_makefile) TrigCostMonitorDictMerge
else
$(cmt_local_TrigCostMonitorDictMerge_makefile) : $(TrigCostMonitorDictMerge_dependencies) $(cmt_build_library_linksstamp) $(bin)TrigCostMonitorDictMerge.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitorDictMerge) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitorDictMerge) ] || \
	  $(not_TrigCostMonitorDictMerge_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitorDictMerge.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitorDictMerge.in -tag=$(tags) $(TrigCostMonitorDictMerge_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitorDictMerge_makefile) TrigCostMonitorDictMerge; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorDictMerge_extratags) build constituent_makefile -out=$(cmt_local_TrigCostMonitorDictMerge_makefile) TrigCostMonitorDictMerge

TrigCostMonitorDictMerge :: $(TrigCostMonitorDictMerge_dependencies) $(cmt_local_TrigCostMonitorDictMerge_makefile) dirs TrigCostMonitorDictMergedirs
	$(echo) "(constituents.make) Starting TrigCostMonitorDictMerge"
	@if test -f $(cmt_local_TrigCostMonitorDictMerge_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorDictMerge_makefile) TrigCostMonitorDictMerge; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitorDictMerge_makefile) TrigCostMonitorDictMerge
	$(echo) "(constituents.make) TrigCostMonitorDictMerge done"

clean :: TrigCostMonitorDictMergeclean ;

TrigCostMonitorDictMergeclean :: $(TrigCostMonitorDictMergeclean_dependencies) ##$(cmt_local_TrigCostMonitorDictMerge_makefile)
	$(echo) "(constituents.make) Starting TrigCostMonitorDictMergeclean"
	@-if test -f $(cmt_local_TrigCostMonitorDictMerge_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorDictMerge_makefile) TrigCostMonitorDictMergeclean; \
	fi
	$(echo) "(constituents.make) TrigCostMonitorDictMergeclean done"
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitorDictMerge_makefile) TrigCostMonitorDictMergeclean

##	  /bin/rm -f $(cmt_local_TrigCostMonitorDictMerge_makefile) $(bin)TrigCostMonitorDictMerge_dependencies.make

install :: TrigCostMonitorDictMergeinstall ;

TrigCostMonitorDictMergeinstall :: $(TrigCostMonitorDictMerge_dependencies) $(cmt_local_TrigCostMonitorDictMerge_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_TrigCostMonitorDictMerge_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorDictMerge_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitorDictMerge_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : TrigCostMonitorDictMergeuninstall

$(foreach d,$(TrigCostMonitorDictMerge_dependencies),$(eval $(d)uninstall_dependencies += TrigCostMonitorDictMergeuninstall))

TrigCostMonitorDictMergeuninstall : $(TrigCostMonitorDictMergeuninstall_dependencies) ##$(cmt_local_TrigCostMonitorDictMerge_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_TrigCostMonitorDictMerge_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorDictMerge_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitorDictMerge_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: TrigCostMonitorDictMergeuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ TrigCostMonitorDictMerge"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ TrigCostMonitorDictMerge done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_TrigCostMonitorrchk_has_target_tag = 1

#--------------------------------------

ifdef cmt_TrigCostMonitorrchk_has_target_tag

cmt_local_tagfile_TrigCostMonitorrchk = $(bin)$(TrigCostMonitor_tag)_TrigCostMonitorrchk.make
cmt_final_setup_TrigCostMonitorrchk = $(bin)setup_TrigCostMonitorrchk.make
cmt_local_TrigCostMonitorrchk_makefile = $(bin)TrigCostMonitorrchk.make

TrigCostMonitorrchk_extratags = -tag_add=target_TrigCostMonitorrchk

else

cmt_local_tagfile_TrigCostMonitorrchk = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_TrigCostMonitorrchk = $(bin)setup.make
cmt_local_TrigCostMonitorrchk_makefile = $(bin)TrigCostMonitorrchk.make

endif

not_TrigCostMonitorrchk_dependencies = { n=0; for p in $?; do m=0; for d in $(TrigCostMonitorrchk_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
TrigCostMonitorrchkdirs :
	@if test ! -d $(bin)TrigCostMonitorrchk; then $(mkdir) -p $(bin)TrigCostMonitorrchk; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)TrigCostMonitorrchk
else
TrigCostMonitorrchkdirs : ;
endif

ifdef cmt_TrigCostMonitorrchk_has_target_tag

ifndef QUICK
$(cmt_local_TrigCostMonitorrchk_makefile) : $(TrigCostMonitorrchk_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitorrchk.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorrchk_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitorrchk_makefile) TrigCostMonitorrchk
else
$(cmt_local_TrigCostMonitorrchk_makefile) : $(TrigCostMonitorrchk_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitorrchk) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitorrchk) ] || \
	  $(not_TrigCostMonitorrchk_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitorrchk.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorrchk_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitorrchk_makefile) TrigCostMonitorrchk; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_TrigCostMonitorrchk_makefile) : $(TrigCostMonitorrchk_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitorrchk.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitorrchk.in -tag=$(tags) $(TrigCostMonitorrchk_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitorrchk_makefile) TrigCostMonitorrchk
else
$(cmt_local_TrigCostMonitorrchk_makefile) : $(TrigCostMonitorrchk_dependencies) $(cmt_build_library_linksstamp) $(bin)TrigCostMonitorrchk.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitorrchk) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitorrchk) ] || \
	  $(not_TrigCostMonitorrchk_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitorrchk.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitorrchk.in -tag=$(tags) $(TrigCostMonitorrchk_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitorrchk_makefile) TrigCostMonitorrchk; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorrchk_extratags) build constituent_makefile -out=$(cmt_local_TrigCostMonitorrchk_makefile) TrigCostMonitorrchk

TrigCostMonitorrchk :: $(TrigCostMonitorrchk_dependencies) $(cmt_local_TrigCostMonitorrchk_makefile) dirs TrigCostMonitorrchkdirs
	$(echo) "(constituents.make) Starting TrigCostMonitorrchk"
	@if test -f $(cmt_local_TrigCostMonitorrchk_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorrchk_makefile) TrigCostMonitorrchk; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitorrchk_makefile) TrigCostMonitorrchk
	$(echo) "(constituents.make) TrigCostMonitorrchk done"

clean :: TrigCostMonitorrchkclean ;

TrigCostMonitorrchkclean :: $(TrigCostMonitorrchkclean_dependencies) ##$(cmt_local_TrigCostMonitorrchk_makefile)
	$(echo) "(constituents.make) Starting TrigCostMonitorrchkclean"
	@-if test -f $(cmt_local_TrigCostMonitorrchk_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorrchk_makefile) TrigCostMonitorrchkclean; \
	fi
	$(echo) "(constituents.make) TrigCostMonitorrchkclean done"
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitorrchk_makefile) TrigCostMonitorrchkclean

##	  /bin/rm -f $(cmt_local_TrigCostMonitorrchk_makefile) $(bin)TrigCostMonitorrchk_dependencies.make

install :: TrigCostMonitorrchkinstall ;

TrigCostMonitorrchkinstall :: $(TrigCostMonitorrchk_dependencies) $(cmt_local_TrigCostMonitorrchk_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_TrigCostMonitorrchk_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorrchk_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitorrchk_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : TrigCostMonitorrchkuninstall

$(foreach d,$(TrigCostMonitorrchk_dependencies),$(eval $(d)uninstall_dependencies += TrigCostMonitorrchkuninstall))

TrigCostMonitorrchkuninstall : $(TrigCostMonitorrchkuninstall_dependencies) ##$(cmt_local_TrigCostMonitorrchk_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_TrigCostMonitorrchk_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorrchk_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitorrchk_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: TrigCostMonitorrchkuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ TrigCostMonitorrchk"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ TrigCostMonitorrchk done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_install_root_include_path_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_install_root_include_path_has_target_tag

cmt_local_tagfile_install_root_include_path = $(bin)$(TrigCostMonitor_tag)_install_root_include_path.make
cmt_final_setup_install_root_include_path = $(bin)setup_install_root_include_path.make
cmt_local_install_root_include_path_makefile = $(bin)install_root_include_path.make

install_root_include_path_extratags = -tag_add=target_install_root_include_path

else

cmt_local_tagfile_install_root_include_path = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_install_root_include_path = $(bin)setup.make
cmt_local_install_root_include_path_makefile = $(bin)install_root_include_path.make

endif

not_install_root_include_path_dependencies = { n=0; for p in $?; do m=0; for d in $(install_root_include_path_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
install_root_include_pathdirs :
	@if test ! -d $(bin)install_root_include_path; then $(mkdir) -p $(bin)install_root_include_path; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)install_root_include_path
else
install_root_include_pathdirs : ;
endif

ifdef cmt_install_root_include_path_has_target_tag

ifndef QUICK
$(cmt_local_install_root_include_path_makefile) : $(install_root_include_path_dependencies) build_library_links
	$(echo) "(constituents.make) Building install_root_include_path.make"; \
	  $(cmtexe) -tag=$(tags) $(install_root_include_path_extratags) build constituent_config -out=$(cmt_local_install_root_include_path_makefile) install_root_include_path
else
$(cmt_local_install_root_include_path_makefile) : $(install_root_include_path_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_install_root_include_path) ] || \
	  [ ! -f $(cmt_final_setup_install_root_include_path) ] || \
	  $(not_install_root_include_path_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building install_root_include_path.make"; \
	  $(cmtexe) -tag=$(tags) $(install_root_include_path_extratags) build constituent_config -out=$(cmt_local_install_root_include_path_makefile) install_root_include_path; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_install_root_include_path_makefile) : $(install_root_include_path_dependencies) build_library_links
	$(echo) "(constituents.make) Building install_root_include_path.make"; \
	  $(cmtexe) -f=$(bin)install_root_include_path.in -tag=$(tags) $(install_root_include_path_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_install_root_include_path_makefile) install_root_include_path
else
$(cmt_local_install_root_include_path_makefile) : $(install_root_include_path_dependencies) $(cmt_build_library_linksstamp) $(bin)install_root_include_path.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_install_root_include_path) ] || \
	  [ ! -f $(cmt_final_setup_install_root_include_path) ] || \
	  $(not_install_root_include_path_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building install_root_include_path.make"; \
	  $(cmtexe) -f=$(bin)install_root_include_path.in -tag=$(tags) $(install_root_include_path_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_install_root_include_path_makefile) install_root_include_path; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(install_root_include_path_extratags) build constituent_makefile -out=$(cmt_local_install_root_include_path_makefile) install_root_include_path

install_root_include_path :: $(install_root_include_path_dependencies) $(cmt_local_install_root_include_path_makefile) dirs install_root_include_pathdirs
	$(echo) "(constituents.make) Starting install_root_include_path"
	@if test -f $(cmt_local_install_root_include_path_makefile); then \
	  $(MAKE) -f $(cmt_local_install_root_include_path_makefile) install_root_include_path; \
	  fi
#	@$(MAKE) -f $(cmt_local_install_root_include_path_makefile) install_root_include_path
	$(echo) "(constituents.make) install_root_include_path done"

clean :: install_root_include_pathclean ;

install_root_include_pathclean :: $(install_root_include_pathclean_dependencies) ##$(cmt_local_install_root_include_path_makefile)
	$(echo) "(constituents.make) Starting install_root_include_pathclean"
	@-if test -f $(cmt_local_install_root_include_path_makefile); then \
	  $(MAKE) -f $(cmt_local_install_root_include_path_makefile) install_root_include_pathclean; \
	fi
	$(echo) "(constituents.make) install_root_include_pathclean done"
#	@-$(MAKE) -f $(cmt_local_install_root_include_path_makefile) install_root_include_pathclean

##	  /bin/rm -f $(cmt_local_install_root_include_path_makefile) $(bin)install_root_include_path_dependencies.make

install :: install_root_include_pathinstall ;

install_root_include_pathinstall :: $(install_root_include_path_dependencies) $(cmt_local_install_root_include_path_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_install_root_include_path_makefile); then \
	  $(MAKE) -f $(cmt_local_install_root_include_path_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_install_root_include_path_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : install_root_include_pathuninstall

$(foreach d,$(install_root_include_path_dependencies),$(eval $(d)uninstall_dependencies += install_root_include_pathuninstall))

install_root_include_pathuninstall : $(install_root_include_pathuninstall_dependencies) ##$(cmt_local_install_root_include_path_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_install_root_include_path_makefile); then \
	  $(MAKE) -f $(cmt_local_install_root_include_path_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_install_root_include_path_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: install_root_include_pathuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ install_root_include_path"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ install_root_include_path done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_install_includes_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_install_includes_has_target_tag

cmt_local_tagfile_install_includes = $(bin)$(TrigCostMonitor_tag)_install_includes.make
cmt_final_setup_install_includes = $(bin)setup_install_includes.make
cmt_local_install_includes_makefile = $(bin)install_includes.make

install_includes_extratags = -tag_add=target_install_includes

else

cmt_local_tagfile_install_includes = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_install_includes = $(bin)setup.make
cmt_local_install_includes_makefile = $(bin)install_includes.make

endif

not_install_includes_dependencies = { n=0; for p in $?; do m=0; for d in $(install_includes_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
install_includesdirs :
	@if test ! -d $(bin)install_includes; then $(mkdir) -p $(bin)install_includes; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)install_includes
else
install_includesdirs : ;
endif

ifdef cmt_install_includes_has_target_tag

ifndef QUICK
$(cmt_local_install_includes_makefile) : $(install_includes_dependencies) build_library_links
	$(echo) "(constituents.make) Building install_includes.make"; \
	  $(cmtexe) -tag=$(tags) $(install_includes_extratags) build constituent_config -out=$(cmt_local_install_includes_makefile) install_includes
else
$(cmt_local_install_includes_makefile) : $(install_includes_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_install_includes) ] || \
	  [ ! -f $(cmt_final_setup_install_includes) ] || \
	  $(not_install_includes_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building install_includes.make"; \
	  $(cmtexe) -tag=$(tags) $(install_includes_extratags) build constituent_config -out=$(cmt_local_install_includes_makefile) install_includes; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_install_includes_makefile) : $(install_includes_dependencies) build_library_links
	$(echo) "(constituents.make) Building install_includes.make"; \
	  $(cmtexe) -f=$(bin)install_includes.in -tag=$(tags) $(install_includes_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_install_includes_makefile) install_includes
else
$(cmt_local_install_includes_makefile) : $(install_includes_dependencies) $(cmt_build_library_linksstamp) $(bin)install_includes.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_install_includes) ] || \
	  [ ! -f $(cmt_final_setup_install_includes) ] || \
	  $(not_install_includes_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building install_includes.make"; \
	  $(cmtexe) -f=$(bin)install_includes.in -tag=$(tags) $(install_includes_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_install_includes_makefile) install_includes; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(install_includes_extratags) build constituent_makefile -out=$(cmt_local_install_includes_makefile) install_includes

install_includes :: $(install_includes_dependencies) $(cmt_local_install_includes_makefile) dirs install_includesdirs
	$(echo) "(constituents.make) Starting install_includes"
	@if test -f $(cmt_local_install_includes_makefile); then \
	  $(MAKE) -f $(cmt_local_install_includes_makefile) install_includes; \
	  fi
#	@$(MAKE) -f $(cmt_local_install_includes_makefile) install_includes
	$(echo) "(constituents.make) install_includes done"

clean :: install_includesclean ;

install_includesclean :: $(install_includesclean_dependencies) ##$(cmt_local_install_includes_makefile)
	$(echo) "(constituents.make) Starting install_includesclean"
	@-if test -f $(cmt_local_install_includes_makefile); then \
	  $(MAKE) -f $(cmt_local_install_includes_makefile) install_includesclean; \
	fi
	$(echo) "(constituents.make) install_includesclean done"
#	@-$(MAKE) -f $(cmt_local_install_includes_makefile) install_includesclean

##	  /bin/rm -f $(cmt_local_install_includes_makefile) $(bin)install_includes_dependencies.make

install :: install_includesinstall ;

install_includesinstall :: $(install_includes_dependencies) $(cmt_local_install_includes_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_install_includes_makefile); then \
	  $(MAKE) -f $(cmt_local_install_includes_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_install_includes_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : install_includesuninstall

$(foreach d,$(install_includes_dependencies),$(eval $(d)uninstall_dependencies += install_includesuninstall))

install_includesuninstall : $(install_includesuninstall_dependencies) ##$(cmt_local_install_includes_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_install_includes_makefile); then \
	  $(MAKE) -f $(cmt_local_install_includes_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_install_includes_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: install_includesuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ install_includes"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ install_includes done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_myctest_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_myctest_has_target_tag

cmt_local_tagfile_myctest = $(bin)$(TrigCostMonitor_tag)_myctest.make
cmt_final_setup_myctest = $(bin)setup_myctest.make
cmt_local_myctest_makefile = $(bin)myctest.make

myctest_extratags = -tag_add=target_myctest

else

cmt_local_tagfile_myctest = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_myctest = $(bin)setup.make
cmt_local_myctest_makefile = $(bin)myctest.make

endif

not_myctest_dependencies = { n=0; for p in $?; do m=0; for d in $(myctest_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
myctestdirs :
	@if test ! -d $(bin)myctest; then $(mkdir) -p $(bin)myctest; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)myctest
else
myctestdirs : ;
endif

ifdef cmt_myctest_has_target_tag

ifndef QUICK
$(cmt_local_myctest_makefile) : $(myctest_dependencies) build_library_links
	$(echo) "(constituents.make) Building myctest.make"; \
	  $(cmtexe) -tag=$(tags) $(myctest_extratags) build constituent_config -out=$(cmt_local_myctest_makefile) myctest
else
$(cmt_local_myctest_makefile) : $(myctest_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_myctest) ] || \
	  [ ! -f $(cmt_final_setup_myctest) ] || \
	  $(not_myctest_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building myctest.make"; \
	  $(cmtexe) -tag=$(tags) $(myctest_extratags) build constituent_config -out=$(cmt_local_myctest_makefile) myctest; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_myctest_makefile) : $(myctest_dependencies) build_library_links
	$(echo) "(constituents.make) Building myctest.make"; \
	  $(cmtexe) -f=$(bin)myctest.in -tag=$(tags) $(myctest_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_myctest_makefile) myctest
else
$(cmt_local_myctest_makefile) : $(myctest_dependencies) $(cmt_build_library_linksstamp) $(bin)myctest.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_myctest) ] || \
	  [ ! -f $(cmt_final_setup_myctest) ] || \
	  $(not_myctest_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building myctest.make"; \
	  $(cmtexe) -f=$(bin)myctest.in -tag=$(tags) $(myctest_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_myctest_makefile) myctest; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(myctest_extratags) build constituent_makefile -out=$(cmt_local_myctest_makefile) myctest

myctest :: $(myctest_dependencies) $(cmt_local_myctest_makefile) dirs myctestdirs
	$(echo) "(constituents.make) Starting myctest"
	@if test -f $(cmt_local_myctest_makefile); then \
	  $(MAKE) -f $(cmt_local_myctest_makefile) myctest; \
	  fi
#	@$(MAKE) -f $(cmt_local_myctest_makefile) myctest
	$(echo) "(constituents.make) myctest done"

clean :: myctestclean ;

myctestclean :: $(myctestclean_dependencies) ##$(cmt_local_myctest_makefile)
	$(echo) "(constituents.make) Starting myctestclean"
	@-if test -f $(cmt_local_myctest_makefile); then \
	  $(MAKE) -f $(cmt_local_myctest_makefile) myctestclean; \
	fi
	$(echo) "(constituents.make) myctestclean done"
#	@-$(MAKE) -f $(cmt_local_myctest_makefile) myctestclean

##	  /bin/rm -f $(cmt_local_myctest_makefile) $(bin)myctest_dependencies.make

install :: myctestinstall ;

myctestinstall :: $(myctest_dependencies) $(cmt_local_myctest_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_myctest_makefile); then \
	  $(MAKE) -f $(cmt_local_myctest_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_myctest_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : myctestuninstall

$(foreach d,$(myctest_dependencies),$(eval $(d)uninstall_dependencies += myctestuninstall))

myctestuninstall : $(myctestuninstall_dependencies) ##$(cmt_local_myctest_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_myctest_makefile); then \
	  $(MAKE) -f $(cmt_local_myctest_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_myctest_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: myctestuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ myctest"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ myctest done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_make_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_make_has_target_tag

cmt_local_tagfile_make = $(bin)$(TrigCostMonitor_tag)_make.make
cmt_final_setup_make = $(bin)setup_make.make
cmt_local_make_makefile = $(bin)make.make

make_extratags = -tag_add=target_make

else

cmt_local_tagfile_make = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_make = $(bin)setup.make
cmt_local_make_makefile = $(bin)make.make

endif

not_make_dependencies = { n=0; for p in $?; do m=0; for d in $(make_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
makedirs :
	@if test ! -d $(bin)make; then $(mkdir) -p $(bin)make; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)make
else
makedirs : ;
endif

ifdef cmt_make_has_target_tag

ifndef QUICK
$(cmt_local_make_makefile) : $(make_dependencies) build_library_links
	$(echo) "(constituents.make) Building make.make"; \
	  $(cmtexe) -tag=$(tags) $(make_extratags) build constituent_config -out=$(cmt_local_make_makefile) make
else
$(cmt_local_make_makefile) : $(make_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_make) ] || \
	  [ ! -f $(cmt_final_setup_make) ] || \
	  $(not_make_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building make.make"; \
	  $(cmtexe) -tag=$(tags) $(make_extratags) build constituent_config -out=$(cmt_local_make_makefile) make; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_make_makefile) : $(make_dependencies) build_library_links
	$(echo) "(constituents.make) Building make.make"; \
	  $(cmtexe) -f=$(bin)make.in -tag=$(tags) $(make_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_make_makefile) make
else
$(cmt_local_make_makefile) : $(make_dependencies) $(cmt_build_library_linksstamp) $(bin)make.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_make) ] || \
	  [ ! -f $(cmt_final_setup_make) ] || \
	  $(not_make_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building make.make"; \
	  $(cmtexe) -f=$(bin)make.in -tag=$(tags) $(make_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_make_makefile) make; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(make_extratags) build constituent_makefile -out=$(cmt_local_make_makefile) make

make :: $(make_dependencies) $(cmt_local_make_makefile) dirs makedirs
	$(echo) "(constituents.make) Starting make"
	@if test -f $(cmt_local_make_makefile); then \
	  $(MAKE) -f $(cmt_local_make_makefile) make; \
	  fi
#	@$(MAKE) -f $(cmt_local_make_makefile) make
	$(echo) "(constituents.make) make done"

clean :: makeclean ;

makeclean :: $(makeclean_dependencies) ##$(cmt_local_make_makefile)
	$(echo) "(constituents.make) Starting makeclean"
	@-if test -f $(cmt_local_make_makefile); then \
	  $(MAKE) -f $(cmt_local_make_makefile) makeclean; \
	fi
	$(echo) "(constituents.make) makeclean done"
#	@-$(MAKE) -f $(cmt_local_make_makefile) makeclean

##	  /bin/rm -f $(cmt_local_make_makefile) $(bin)make_dependencies.make

install :: makeinstall ;

makeinstall :: $(make_dependencies) $(cmt_local_make_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_make_makefile); then \
	  $(MAKE) -f $(cmt_local_make_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_make_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : makeuninstall

$(foreach d,$(make_dependencies),$(eval $(d)uninstall_dependencies += makeuninstall))

makeuninstall : $(makeuninstall_dependencies) ##$(cmt_local_make_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_make_makefile); then \
	  $(MAKE) -f $(cmt_local_make_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_make_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: makeuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ make"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ make done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_CompilePython_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_CompilePython_has_target_tag

cmt_local_tagfile_CompilePython = $(bin)$(TrigCostMonitor_tag)_CompilePython.make
cmt_final_setup_CompilePython = $(bin)setup_CompilePython.make
cmt_local_CompilePython_makefile = $(bin)CompilePython.make

CompilePython_extratags = -tag_add=target_CompilePython

else

cmt_local_tagfile_CompilePython = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_CompilePython = $(bin)setup.make
cmt_local_CompilePython_makefile = $(bin)CompilePython.make

endif

not_CompilePython_dependencies = { n=0; for p in $?; do m=0; for d in $(CompilePython_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
CompilePythondirs :
	@if test ! -d $(bin)CompilePython; then $(mkdir) -p $(bin)CompilePython; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)CompilePython
else
CompilePythondirs : ;
endif

ifdef cmt_CompilePython_has_target_tag

ifndef QUICK
$(cmt_local_CompilePython_makefile) : $(CompilePython_dependencies) build_library_links
	$(echo) "(constituents.make) Building CompilePython.make"; \
	  $(cmtexe) -tag=$(tags) $(CompilePython_extratags) build constituent_config -out=$(cmt_local_CompilePython_makefile) CompilePython
else
$(cmt_local_CompilePython_makefile) : $(CompilePython_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_CompilePython) ] || \
	  [ ! -f $(cmt_final_setup_CompilePython) ] || \
	  $(not_CompilePython_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building CompilePython.make"; \
	  $(cmtexe) -tag=$(tags) $(CompilePython_extratags) build constituent_config -out=$(cmt_local_CompilePython_makefile) CompilePython; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_CompilePython_makefile) : $(CompilePython_dependencies) build_library_links
	$(echo) "(constituents.make) Building CompilePython.make"; \
	  $(cmtexe) -f=$(bin)CompilePython.in -tag=$(tags) $(CompilePython_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_CompilePython_makefile) CompilePython
else
$(cmt_local_CompilePython_makefile) : $(CompilePython_dependencies) $(cmt_build_library_linksstamp) $(bin)CompilePython.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_CompilePython) ] || \
	  [ ! -f $(cmt_final_setup_CompilePython) ] || \
	  $(not_CompilePython_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building CompilePython.make"; \
	  $(cmtexe) -f=$(bin)CompilePython.in -tag=$(tags) $(CompilePython_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_CompilePython_makefile) CompilePython; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(CompilePython_extratags) build constituent_makefile -out=$(cmt_local_CompilePython_makefile) CompilePython

CompilePython :: $(CompilePython_dependencies) $(cmt_local_CompilePython_makefile) dirs CompilePythondirs
	$(echo) "(constituents.make) Starting CompilePython"
	@if test -f $(cmt_local_CompilePython_makefile); then \
	  $(MAKE) -f $(cmt_local_CompilePython_makefile) CompilePython; \
	  fi
#	@$(MAKE) -f $(cmt_local_CompilePython_makefile) CompilePython
	$(echo) "(constituents.make) CompilePython done"

clean :: CompilePythonclean ;

CompilePythonclean :: $(CompilePythonclean_dependencies) ##$(cmt_local_CompilePython_makefile)
	$(echo) "(constituents.make) Starting CompilePythonclean"
	@-if test -f $(cmt_local_CompilePython_makefile); then \
	  $(MAKE) -f $(cmt_local_CompilePython_makefile) CompilePythonclean; \
	fi
	$(echo) "(constituents.make) CompilePythonclean done"
#	@-$(MAKE) -f $(cmt_local_CompilePython_makefile) CompilePythonclean

##	  /bin/rm -f $(cmt_local_CompilePython_makefile) $(bin)CompilePython_dependencies.make

install :: CompilePythoninstall ;

CompilePythoninstall :: $(CompilePython_dependencies) $(cmt_local_CompilePython_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_CompilePython_makefile); then \
	  $(MAKE) -f $(cmt_local_CompilePython_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_CompilePython_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : CompilePythonuninstall

$(foreach d,$(CompilePython_dependencies),$(eval $(d)uninstall_dependencies += CompilePythonuninstall))

CompilePythonuninstall : $(CompilePythonuninstall_dependencies) ##$(cmt_local_CompilePython_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_CompilePython_makefile); then \
	  $(MAKE) -f $(cmt_local_CompilePython_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_CompilePython_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: CompilePythonuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ CompilePython"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ CompilePython done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_qmtest_run_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_qmtest_run_has_target_tag

cmt_local_tagfile_qmtest_run = $(bin)$(TrigCostMonitor_tag)_qmtest_run.make
cmt_final_setup_qmtest_run = $(bin)setup_qmtest_run.make
cmt_local_qmtest_run_makefile = $(bin)qmtest_run.make

qmtest_run_extratags = -tag_add=target_qmtest_run

else

cmt_local_tagfile_qmtest_run = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_qmtest_run = $(bin)setup.make
cmt_local_qmtest_run_makefile = $(bin)qmtest_run.make

endif

not_qmtest_run_dependencies = { n=0; for p in $?; do m=0; for d in $(qmtest_run_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
qmtest_rundirs :
	@if test ! -d $(bin)qmtest_run; then $(mkdir) -p $(bin)qmtest_run; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)qmtest_run
else
qmtest_rundirs : ;
endif

ifdef cmt_qmtest_run_has_target_tag

ifndef QUICK
$(cmt_local_qmtest_run_makefile) : $(qmtest_run_dependencies) build_library_links
	$(echo) "(constituents.make) Building qmtest_run.make"; \
	  $(cmtexe) -tag=$(tags) $(qmtest_run_extratags) build constituent_config -out=$(cmt_local_qmtest_run_makefile) qmtest_run
else
$(cmt_local_qmtest_run_makefile) : $(qmtest_run_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_qmtest_run) ] || \
	  [ ! -f $(cmt_final_setup_qmtest_run) ] || \
	  $(not_qmtest_run_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building qmtest_run.make"; \
	  $(cmtexe) -tag=$(tags) $(qmtest_run_extratags) build constituent_config -out=$(cmt_local_qmtest_run_makefile) qmtest_run; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_qmtest_run_makefile) : $(qmtest_run_dependencies) build_library_links
	$(echo) "(constituents.make) Building qmtest_run.make"; \
	  $(cmtexe) -f=$(bin)qmtest_run.in -tag=$(tags) $(qmtest_run_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_qmtest_run_makefile) qmtest_run
else
$(cmt_local_qmtest_run_makefile) : $(qmtest_run_dependencies) $(cmt_build_library_linksstamp) $(bin)qmtest_run.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_qmtest_run) ] || \
	  [ ! -f $(cmt_final_setup_qmtest_run) ] || \
	  $(not_qmtest_run_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building qmtest_run.make"; \
	  $(cmtexe) -f=$(bin)qmtest_run.in -tag=$(tags) $(qmtest_run_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_qmtest_run_makefile) qmtest_run; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(qmtest_run_extratags) build constituent_makefile -out=$(cmt_local_qmtest_run_makefile) qmtest_run

qmtest_run :: $(qmtest_run_dependencies) $(cmt_local_qmtest_run_makefile) dirs qmtest_rundirs
	$(echo) "(constituents.make) Starting qmtest_run"
	@if test -f $(cmt_local_qmtest_run_makefile); then \
	  $(MAKE) -f $(cmt_local_qmtest_run_makefile) qmtest_run; \
	  fi
#	@$(MAKE) -f $(cmt_local_qmtest_run_makefile) qmtest_run
	$(echo) "(constituents.make) qmtest_run done"

clean :: qmtest_runclean ;

qmtest_runclean :: $(qmtest_runclean_dependencies) ##$(cmt_local_qmtest_run_makefile)
	$(echo) "(constituents.make) Starting qmtest_runclean"
	@-if test -f $(cmt_local_qmtest_run_makefile); then \
	  $(MAKE) -f $(cmt_local_qmtest_run_makefile) qmtest_runclean; \
	fi
	$(echo) "(constituents.make) qmtest_runclean done"
#	@-$(MAKE) -f $(cmt_local_qmtest_run_makefile) qmtest_runclean

##	  /bin/rm -f $(cmt_local_qmtest_run_makefile) $(bin)qmtest_run_dependencies.make

install :: qmtest_runinstall ;

qmtest_runinstall :: $(qmtest_run_dependencies) $(cmt_local_qmtest_run_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_qmtest_run_makefile); then \
	  $(MAKE) -f $(cmt_local_qmtest_run_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_qmtest_run_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : qmtest_rununinstall

$(foreach d,$(qmtest_run_dependencies),$(eval $(d)uninstall_dependencies += qmtest_rununinstall))

qmtest_rununinstall : $(qmtest_rununinstall_dependencies) ##$(cmt_local_qmtest_run_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_qmtest_run_makefile); then \
	  $(MAKE) -f $(cmt_local_qmtest_run_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_qmtest_run_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: qmtest_rununinstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ qmtest_run"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ qmtest_run done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_qmtest_summarize_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_qmtest_summarize_has_target_tag

cmt_local_tagfile_qmtest_summarize = $(bin)$(TrigCostMonitor_tag)_qmtest_summarize.make
cmt_final_setup_qmtest_summarize = $(bin)setup_qmtest_summarize.make
cmt_local_qmtest_summarize_makefile = $(bin)qmtest_summarize.make

qmtest_summarize_extratags = -tag_add=target_qmtest_summarize

else

cmt_local_tagfile_qmtest_summarize = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_qmtest_summarize = $(bin)setup.make
cmt_local_qmtest_summarize_makefile = $(bin)qmtest_summarize.make

endif

not_qmtest_summarize_dependencies = { n=0; for p in $?; do m=0; for d in $(qmtest_summarize_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
qmtest_summarizedirs :
	@if test ! -d $(bin)qmtest_summarize; then $(mkdir) -p $(bin)qmtest_summarize; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)qmtest_summarize
else
qmtest_summarizedirs : ;
endif

ifdef cmt_qmtest_summarize_has_target_tag

ifndef QUICK
$(cmt_local_qmtest_summarize_makefile) : $(qmtest_summarize_dependencies) build_library_links
	$(echo) "(constituents.make) Building qmtest_summarize.make"; \
	  $(cmtexe) -tag=$(tags) $(qmtest_summarize_extratags) build constituent_config -out=$(cmt_local_qmtest_summarize_makefile) qmtest_summarize
else
$(cmt_local_qmtest_summarize_makefile) : $(qmtest_summarize_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_qmtest_summarize) ] || \
	  [ ! -f $(cmt_final_setup_qmtest_summarize) ] || \
	  $(not_qmtest_summarize_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building qmtest_summarize.make"; \
	  $(cmtexe) -tag=$(tags) $(qmtest_summarize_extratags) build constituent_config -out=$(cmt_local_qmtest_summarize_makefile) qmtest_summarize; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_qmtest_summarize_makefile) : $(qmtest_summarize_dependencies) build_library_links
	$(echo) "(constituents.make) Building qmtest_summarize.make"; \
	  $(cmtexe) -f=$(bin)qmtest_summarize.in -tag=$(tags) $(qmtest_summarize_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_qmtest_summarize_makefile) qmtest_summarize
else
$(cmt_local_qmtest_summarize_makefile) : $(qmtest_summarize_dependencies) $(cmt_build_library_linksstamp) $(bin)qmtest_summarize.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_qmtest_summarize) ] || \
	  [ ! -f $(cmt_final_setup_qmtest_summarize) ] || \
	  $(not_qmtest_summarize_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building qmtest_summarize.make"; \
	  $(cmtexe) -f=$(bin)qmtest_summarize.in -tag=$(tags) $(qmtest_summarize_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_qmtest_summarize_makefile) qmtest_summarize; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(qmtest_summarize_extratags) build constituent_makefile -out=$(cmt_local_qmtest_summarize_makefile) qmtest_summarize

qmtest_summarize :: $(qmtest_summarize_dependencies) $(cmt_local_qmtest_summarize_makefile) dirs qmtest_summarizedirs
	$(echo) "(constituents.make) Starting qmtest_summarize"
	@if test -f $(cmt_local_qmtest_summarize_makefile); then \
	  $(MAKE) -f $(cmt_local_qmtest_summarize_makefile) qmtest_summarize; \
	  fi
#	@$(MAKE) -f $(cmt_local_qmtest_summarize_makefile) qmtest_summarize
	$(echo) "(constituents.make) qmtest_summarize done"

clean :: qmtest_summarizeclean ;

qmtest_summarizeclean :: $(qmtest_summarizeclean_dependencies) ##$(cmt_local_qmtest_summarize_makefile)
	$(echo) "(constituents.make) Starting qmtest_summarizeclean"
	@-if test -f $(cmt_local_qmtest_summarize_makefile); then \
	  $(MAKE) -f $(cmt_local_qmtest_summarize_makefile) qmtest_summarizeclean; \
	fi
	$(echo) "(constituents.make) qmtest_summarizeclean done"
#	@-$(MAKE) -f $(cmt_local_qmtest_summarize_makefile) qmtest_summarizeclean

##	  /bin/rm -f $(cmt_local_qmtest_summarize_makefile) $(bin)qmtest_summarize_dependencies.make

install :: qmtest_summarizeinstall ;

qmtest_summarizeinstall :: $(qmtest_summarize_dependencies) $(cmt_local_qmtest_summarize_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_qmtest_summarize_makefile); then \
	  $(MAKE) -f $(cmt_local_qmtest_summarize_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_qmtest_summarize_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : qmtest_summarizeuninstall

$(foreach d,$(qmtest_summarize_dependencies),$(eval $(d)uninstall_dependencies += qmtest_summarizeuninstall))

qmtest_summarizeuninstall : $(qmtest_summarizeuninstall_dependencies) ##$(cmt_local_qmtest_summarize_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_qmtest_summarize_makefile); then \
	  $(MAKE) -f $(cmt_local_qmtest_summarize_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_qmtest_summarize_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: qmtest_summarizeuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ qmtest_summarize"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ qmtest_summarize done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_TestPackage_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_TestPackage_has_target_tag

cmt_local_tagfile_TestPackage = $(bin)$(TrigCostMonitor_tag)_TestPackage.make
cmt_final_setup_TestPackage = $(bin)setup_TestPackage.make
cmt_local_TestPackage_makefile = $(bin)TestPackage.make

TestPackage_extratags = -tag_add=target_TestPackage

else

cmt_local_tagfile_TestPackage = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_TestPackage = $(bin)setup.make
cmt_local_TestPackage_makefile = $(bin)TestPackage.make

endif

not_TestPackage_dependencies = { n=0; for p in $?; do m=0; for d in $(TestPackage_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
TestPackagedirs :
	@if test ! -d $(bin)TestPackage; then $(mkdir) -p $(bin)TestPackage; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)TestPackage
else
TestPackagedirs : ;
endif

ifdef cmt_TestPackage_has_target_tag

ifndef QUICK
$(cmt_local_TestPackage_makefile) : $(TestPackage_dependencies) build_library_links
	$(echo) "(constituents.make) Building TestPackage.make"; \
	  $(cmtexe) -tag=$(tags) $(TestPackage_extratags) build constituent_config -out=$(cmt_local_TestPackage_makefile) TestPackage
else
$(cmt_local_TestPackage_makefile) : $(TestPackage_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TestPackage) ] || \
	  [ ! -f $(cmt_final_setup_TestPackage) ] || \
	  $(not_TestPackage_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TestPackage.make"; \
	  $(cmtexe) -tag=$(tags) $(TestPackage_extratags) build constituent_config -out=$(cmt_local_TestPackage_makefile) TestPackage; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_TestPackage_makefile) : $(TestPackage_dependencies) build_library_links
	$(echo) "(constituents.make) Building TestPackage.make"; \
	  $(cmtexe) -f=$(bin)TestPackage.in -tag=$(tags) $(TestPackage_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TestPackage_makefile) TestPackage
else
$(cmt_local_TestPackage_makefile) : $(TestPackage_dependencies) $(cmt_build_library_linksstamp) $(bin)TestPackage.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TestPackage) ] || \
	  [ ! -f $(cmt_final_setup_TestPackage) ] || \
	  $(not_TestPackage_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TestPackage.make"; \
	  $(cmtexe) -f=$(bin)TestPackage.in -tag=$(tags) $(TestPackage_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TestPackage_makefile) TestPackage; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(TestPackage_extratags) build constituent_makefile -out=$(cmt_local_TestPackage_makefile) TestPackage

TestPackage :: $(TestPackage_dependencies) $(cmt_local_TestPackage_makefile) dirs TestPackagedirs
	$(echo) "(constituents.make) Starting TestPackage"
	@if test -f $(cmt_local_TestPackage_makefile); then \
	  $(MAKE) -f $(cmt_local_TestPackage_makefile) TestPackage; \
	  fi
#	@$(MAKE) -f $(cmt_local_TestPackage_makefile) TestPackage
	$(echo) "(constituents.make) TestPackage done"

clean :: TestPackageclean ;

TestPackageclean :: $(TestPackageclean_dependencies) ##$(cmt_local_TestPackage_makefile)
	$(echo) "(constituents.make) Starting TestPackageclean"
	@-if test -f $(cmt_local_TestPackage_makefile); then \
	  $(MAKE) -f $(cmt_local_TestPackage_makefile) TestPackageclean; \
	fi
	$(echo) "(constituents.make) TestPackageclean done"
#	@-$(MAKE) -f $(cmt_local_TestPackage_makefile) TestPackageclean

##	  /bin/rm -f $(cmt_local_TestPackage_makefile) $(bin)TestPackage_dependencies.make

install :: TestPackageinstall ;

TestPackageinstall :: $(TestPackage_dependencies) $(cmt_local_TestPackage_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_TestPackage_makefile); then \
	  $(MAKE) -f $(cmt_local_TestPackage_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_TestPackage_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : TestPackageuninstall

$(foreach d,$(TestPackage_dependencies),$(eval $(d)uninstall_dependencies += TestPackageuninstall))

TestPackageuninstall : $(TestPackageuninstall_dependencies) ##$(cmt_local_TestPackage_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_TestPackage_makefile); then \
	  $(MAKE) -f $(cmt_local_TestPackage_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_TestPackage_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: TestPackageuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ TestPackage"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ TestPackage done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_TestProject_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_TestProject_has_target_tag

cmt_local_tagfile_TestProject = $(bin)$(TrigCostMonitor_tag)_TestProject.make
cmt_final_setup_TestProject = $(bin)setup_TestProject.make
cmt_local_TestProject_makefile = $(bin)TestProject.make

TestProject_extratags = -tag_add=target_TestProject

else

cmt_local_tagfile_TestProject = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_TestProject = $(bin)setup.make
cmt_local_TestProject_makefile = $(bin)TestProject.make

endif

not_TestProject_dependencies = { n=0; for p in $?; do m=0; for d in $(TestProject_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
TestProjectdirs :
	@if test ! -d $(bin)TestProject; then $(mkdir) -p $(bin)TestProject; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)TestProject
else
TestProjectdirs : ;
endif

ifdef cmt_TestProject_has_target_tag

ifndef QUICK
$(cmt_local_TestProject_makefile) : $(TestProject_dependencies) build_library_links
	$(echo) "(constituents.make) Building TestProject.make"; \
	  $(cmtexe) -tag=$(tags) $(TestProject_extratags) build constituent_config -out=$(cmt_local_TestProject_makefile) TestProject
else
$(cmt_local_TestProject_makefile) : $(TestProject_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TestProject) ] || \
	  [ ! -f $(cmt_final_setup_TestProject) ] || \
	  $(not_TestProject_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TestProject.make"; \
	  $(cmtexe) -tag=$(tags) $(TestProject_extratags) build constituent_config -out=$(cmt_local_TestProject_makefile) TestProject; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_TestProject_makefile) : $(TestProject_dependencies) build_library_links
	$(echo) "(constituents.make) Building TestProject.make"; \
	  $(cmtexe) -f=$(bin)TestProject.in -tag=$(tags) $(TestProject_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TestProject_makefile) TestProject
else
$(cmt_local_TestProject_makefile) : $(TestProject_dependencies) $(cmt_build_library_linksstamp) $(bin)TestProject.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TestProject) ] || \
	  [ ! -f $(cmt_final_setup_TestProject) ] || \
	  $(not_TestProject_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TestProject.make"; \
	  $(cmtexe) -f=$(bin)TestProject.in -tag=$(tags) $(TestProject_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TestProject_makefile) TestProject; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(TestProject_extratags) build constituent_makefile -out=$(cmt_local_TestProject_makefile) TestProject

TestProject :: $(TestProject_dependencies) $(cmt_local_TestProject_makefile) dirs TestProjectdirs
	$(echo) "(constituents.make) Starting TestProject"
	@if test -f $(cmt_local_TestProject_makefile); then \
	  $(MAKE) -f $(cmt_local_TestProject_makefile) TestProject; \
	  fi
#	@$(MAKE) -f $(cmt_local_TestProject_makefile) TestProject
	$(echo) "(constituents.make) TestProject done"

clean :: TestProjectclean ;

TestProjectclean :: $(TestProjectclean_dependencies) ##$(cmt_local_TestProject_makefile)
	$(echo) "(constituents.make) Starting TestProjectclean"
	@-if test -f $(cmt_local_TestProject_makefile); then \
	  $(MAKE) -f $(cmt_local_TestProject_makefile) TestProjectclean; \
	fi
	$(echo) "(constituents.make) TestProjectclean done"
#	@-$(MAKE) -f $(cmt_local_TestProject_makefile) TestProjectclean

##	  /bin/rm -f $(cmt_local_TestProject_makefile) $(bin)TestProject_dependencies.make

install :: TestProjectinstall ;

TestProjectinstall :: $(TestProject_dependencies) $(cmt_local_TestProject_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_TestProject_makefile); then \
	  $(MAKE) -f $(cmt_local_TestProject_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_TestProject_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : TestProjectuninstall

$(foreach d,$(TestProject_dependencies),$(eval $(d)uninstall_dependencies += TestProjectuninstall))

TestProjectuninstall : $(TestProjectuninstall_dependencies) ##$(cmt_local_TestProject_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_TestProject_makefile); then \
	  $(MAKE) -f $(cmt_local_TestProject_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_TestProject_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: TestProjectuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ TestProject"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ TestProject done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_new_rootsys_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_new_rootsys_has_target_tag

cmt_local_tagfile_new_rootsys = $(bin)$(TrigCostMonitor_tag)_new_rootsys.make
cmt_final_setup_new_rootsys = $(bin)setup_new_rootsys.make
cmt_local_new_rootsys_makefile = $(bin)new_rootsys.make

new_rootsys_extratags = -tag_add=target_new_rootsys

else

cmt_local_tagfile_new_rootsys = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_new_rootsys = $(bin)setup.make
cmt_local_new_rootsys_makefile = $(bin)new_rootsys.make

endif

not_new_rootsys_dependencies = { n=0; for p in $?; do m=0; for d in $(new_rootsys_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
new_rootsysdirs :
	@if test ! -d $(bin)new_rootsys; then $(mkdir) -p $(bin)new_rootsys; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)new_rootsys
else
new_rootsysdirs : ;
endif

ifdef cmt_new_rootsys_has_target_tag

ifndef QUICK
$(cmt_local_new_rootsys_makefile) : $(new_rootsys_dependencies) build_library_links
	$(echo) "(constituents.make) Building new_rootsys.make"; \
	  $(cmtexe) -tag=$(tags) $(new_rootsys_extratags) build constituent_config -out=$(cmt_local_new_rootsys_makefile) new_rootsys
else
$(cmt_local_new_rootsys_makefile) : $(new_rootsys_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_new_rootsys) ] || \
	  [ ! -f $(cmt_final_setup_new_rootsys) ] || \
	  $(not_new_rootsys_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building new_rootsys.make"; \
	  $(cmtexe) -tag=$(tags) $(new_rootsys_extratags) build constituent_config -out=$(cmt_local_new_rootsys_makefile) new_rootsys; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_new_rootsys_makefile) : $(new_rootsys_dependencies) build_library_links
	$(echo) "(constituents.make) Building new_rootsys.make"; \
	  $(cmtexe) -f=$(bin)new_rootsys.in -tag=$(tags) $(new_rootsys_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_new_rootsys_makefile) new_rootsys
else
$(cmt_local_new_rootsys_makefile) : $(new_rootsys_dependencies) $(cmt_build_library_linksstamp) $(bin)new_rootsys.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_new_rootsys) ] || \
	  [ ! -f $(cmt_final_setup_new_rootsys) ] || \
	  $(not_new_rootsys_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building new_rootsys.make"; \
	  $(cmtexe) -f=$(bin)new_rootsys.in -tag=$(tags) $(new_rootsys_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_new_rootsys_makefile) new_rootsys; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(new_rootsys_extratags) build constituent_makefile -out=$(cmt_local_new_rootsys_makefile) new_rootsys

new_rootsys :: $(new_rootsys_dependencies) $(cmt_local_new_rootsys_makefile) dirs new_rootsysdirs
	$(echo) "(constituents.make) Starting new_rootsys"
	@if test -f $(cmt_local_new_rootsys_makefile); then \
	  $(MAKE) -f $(cmt_local_new_rootsys_makefile) new_rootsys; \
	  fi
#	@$(MAKE) -f $(cmt_local_new_rootsys_makefile) new_rootsys
	$(echo) "(constituents.make) new_rootsys done"

clean :: new_rootsysclean ;

new_rootsysclean :: $(new_rootsysclean_dependencies) ##$(cmt_local_new_rootsys_makefile)
	$(echo) "(constituents.make) Starting new_rootsysclean"
	@-if test -f $(cmt_local_new_rootsys_makefile); then \
	  $(MAKE) -f $(cmt_local_new_rootsys_makefile) new_rootsysclean; \
	fi
	$(echo) "(constituents.make) new_rootsysclean done"
#	@-$(MAKE) -f $(cmt_local_new_rootsys_makefile) new_rootsysclean

##	  /bin/rm -f $(cmt_local_new_rootsys_makefile) $(bin)new_rootsys_dependencies.make

install :: new_rootsysinstall ;

new_rootsysinstall :: $(new_rootsys_dependencies) $(cmt_local_new_rootsys_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_new_rootsys_makefile); then \
	  $(MAKE) -f $(cmt_local_new_rootsys_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_new_rootsys_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : new_rootsysuninstall

$(foreach d,$(new_rootsys_dependencies),$(eval $(d)uninstall_dependencies += new_rootsysuninstall))

new_rootsysuninstall : $(new_rootsysuninstall_dependencies) ##$(cmt_local_new_rootsys_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_new_rootsys_makefile); then \
	  $(MAKE) -f $(cmt_local_new_rootsys_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_new_rootsys_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: new_rootsysuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ new_rootsys"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ new_rootsys done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_doxygen_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_doxygen_has_target_tag

cmt_local_tagfile_doxygen = $(bin)$(TrigCostMonitor_tag)_doxygen.make
cmt_final_setup_doxygen = $(bin)setup_doxygen.make
cmt_local_doxygen_makefile = $(bin)doxygen.make

doxygen_extratags = -tag_add=target_doxygen

else

cmt_local_tagfile_doxygen = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_doxygen = $(bin)setup.make
cmt_local_doxygen_makefile = $(bin)doxygen.make

endif

not_doxygen_dependencies = { n=0; for p in $?; do m=0; for d in $(doxygen_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
doxygendirs :
	@if test ! -d $(bin)doxygen; then $(mkdir) -p $(bin)doxygen; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)doxygen
else
doxygendirs : ;
endif

ifdef cmt_doxygen_has_target_tag

ifndef QUICK
$(cmt_local_doxygen_makefile) : $(doxygen_dependencies) build_library_links
	$(echo) "(constituents.make) Building doxygen.make"; \
	  $(cmtexe) -tag=$(tags) $(doxygen_extratags) build constituent_config -out=$(cmt_local_doxygen_makefile) doxygen
else
$(cmt_local_doxygen_makefile) : $(doxygen_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_doxygen) ] || \
	  [ ! -f $(cmt_final_setup_doxygen) ] || \
	  $(not_doxygen_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building doxygen.make"; \
	  $(cmtexe) -tag=$(tags) $(doxygen_extratags) build constituent_config -out=$(cmt_local_doxygen_makefile) doxygen; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_doxygen_makefile) : $(doxygen_dependencies) build_library_links
	$(echo) "(constituents.make) Building doxygen.make"; \
	  $(cmtexe) -f=$(bin)doxygen.in -tag=$(tags) $(doxygen_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_doxygen_makefile) doxygen
else
$(cmt_local_doxygen_makefile) : $(doxygen_dependencies) $(cmt_build_library_linksstamp) $(bin)doxygen.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_doxygen) ] || \
	  [ ! -f $(cmt_final_setup_doxygen) ] || \
	  $(not_doxygen_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building doxygen.make"; \
	  $(cmtexe) -f=$(bin)doxygen.in -tag=$(tags) $(doxygen_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_doxygen_makefile) doxygen; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(doxygen_extratags) build constituent_makefile -out=$(cmt_local_doxygen_makefile) doxygen

doxygen :: $(doxygen_dependencies) $(cmt_local_doxygen_makefile) dirs doxygendirs
	$(echo) "(constituents.make) Starting doxygen"
	@if test -f $(cmt_local_doxygen_makefile); then \
	  $(MAKE) -f $(cmt_local_doxygen_makefile) doxygen; \
	  fi
#	@$(MAKE) -f $(cmt_local_doxygen_makefile) doxygen
	$(echo) "(constituents.make) doxygen done"

clean :: doxygenclean ;

doxygenclean :: $(doxygenclean_dependencies) ##$(cmt_local_doxygen_makefile)
	$(echo) "(constituents.make) Starting doxygenclean"
	@-if test -f $(cmt_local_doxygen_makefile); then \
	  $(MAKE) -f $(cmt_local_doxygen_makefile) doxygenclean; \
	fi
	$(echo) "(constituents.make) doxygenclean done"
#	@-$(MAKE) -f $(cmt_local_doxygen_makefile) doxygenclean

##	  /bin/rm -f $(cmt_local_doxygen_makefile) $(bin)doxygen_dependencies.make

install :: doxygeninstall ;

doxygeninstall :: $(doxygen_dependencies) $(cmt_local_doxygen_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_doxygen_makefile); then \
	  $(MAKE) -f $(cmt_local_doxygen_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_doxygen_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : doxygenuninstall

$(foreach d,$(doxygen_dependencies),$(eval $(d)uninstall_dependencies += doxygenuninstall))

doxygenuninstall : $(doxygenuninstall_dependencies) ##$(cmt_local_doxygen_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_doxygen_makefile); then \
	  $(MAKE) -f $(cmt_local_doxygen_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_doxygen_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: doxygenuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ doxygen"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ doxygen done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_post_install_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_post_install_has_target_tag

cmt_local_tagfile_post_install = $(bin)$(TrigCostMonitor_tag)_post_install.make
cmt_final_setup_post_install = $(bin)setup_post_install.make
cmt_local_post_install_makefile = $(bin)post_install.make

post_install_extratags = -tag_add=target_post_install

else

cmt_local_tagfile_post_install = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_post_install = $(bin)setup.make
cmt_local_post_install_makefile = $(bin)post_install.make

endif

not_post_install_dependencies = { n=0; for p in $?; do m=0; for d in $(post_install_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
post_installdirs :
	@if test ! -d $(bin)post_install; then $(mkdir) -p $(bin)post_install; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)post_install
else
post_installdirs : ;
endif

ifdef cmt_post_install_has_target_tag

ifndef QUICK
$(cmt_local_post_install_makefile) : $(post_install_dependencies) build_library_links
	$(echo) "(constituents.make) Building post_install.make"; \
	  $(cmtexe) -tag=$(tags) $(post_install_extratags) build constituent_config -out=$(cmt_local_post_install_makefile) post_install
else
$(cmt_local_post_install_makefile) : $(post_install_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_post_install) ] || \
	  [ ! -f $(cmt_final_setup_post_install) ] || \
	  $(not_post_install_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building post_install.make"; \
	  $(cmtexe) -tag=$(tags) $(post_install_extratags) build constituent_config -out=$(cmt_local_post_install_makefile) post_install; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_post_install_makefile) : $(post_install_dependencies) build_library_links
	$(echo) "(constituents.make) Building post_install.make"; \
	  $(cmtexe) -f=$(bin)post_install.in -tag=$(tags) $(post_install_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_post_install_makefile) post_install
else
$(cmt_local_post_install_makefile) : $(post_install_dependencies) $(cmt_build_library_linksstamp) $(bin)post_install.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_post_install) ] || \
	  [ ! -f $(cmt_final_setup_post_install) ] || \
	  $(not_post_install_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building post_install.make"; \
	  $(cmtexe) -f=$(bin)post_install.in -tag=$(tags) $(post_install_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_post_install_makefile) post_install; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(post_install_extratags) build constituent_makefile -out=$(cmt_local_post_install_makefile) post_install

post_install :: $(post_install_dependencies) $(cmt_local_post_install_makefile) dirs post_installdirs
	$(echo) "(constituents.make) Starting post_install"
	@if test -f $(cmt_local_post_install_makefile); then \
	  $(MAKE) -f $(cmt_local_post_install_makefile) post_install; \
	  fi
#	@$(MAKE) -f $(cmt_local_post_install_makefile) post_install
	$(echo) "(constituents.make) post_install done"

clean :: post_installclean ;

post_installclean :: $(post_installclean_dependencies) ##$(cmt_local_post_install_makefile)
	$(echo) "(constituents.make) Starting post_installclean"
	@-if test -f $(cmt_local_post_install_makefile); then \
	  $(MAKE) -f $(cmt_local_post_install_makefile) post_installclean; \
	fi
	$(echo) "(constituents.make) post_installclean done"
#	@-$(MAKE) -f $(cmt_local_post_install_makefile) post_installclean

##	  /bin/rm -f $(cmt_local_post_install_makefile) $(bin)post_install_dependencies.make

install :: post_installinstall ;

post_installinstall :: $(post_install_dependencies) $(cmt_local_post_install_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_post_install_makefile); then \
	  $(MAKE) -f $(cmt_local_post_install_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_post_install_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : post_installuninstall

$(foreach d,$(post_install_dependencies),$(eval $(d)uninstall_dependencies += post_installuninstall))

post_installuninstall : $(post_installuninstall_dependencies) ##$(cmt_local_post_install_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_post_install_makefile); then \
	  $(MAKE) -f $(cmt_local_post_install_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_post_install_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: post_installuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ post_install"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ post_install done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_post_merge_rootmap_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_post_merge_rootmap_has_target_tag

cmt_local_tagfile_post_merge_rootmap = $(bin)$(TrigCostMonitor_tag)_post_merge_rootmap.make
cmt_final_setup_post_merge_rootmap = $(bin)setup_post_merge_rootmap.make
cmt_local_post_merge_rootmap_makefile = $(bin)post_merge_rootmap.make

post_merge_rootmap_extratags = -tag_add=target_post_merge_rootmap

else

cmt_local_tagfile_post_merge_rootmap = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_post_merge_rootmap = $(bin)setup.make
cmt_local_post_merge_rootmap_makefile = $(bin)post_merge_rootmap.make

endif

not_post_merge_rootmap_dependencies = { n=0; for p in $?; do m=0; for d in $(post_merge_rootmap_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
post_merge_rootmapdirs :
	@if test ! -d $(bin)post_merge_rootmap; then $(mkdir) -p $(bin)post_merge_rootmap; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)post_merge_rootmap
else
post_merge_rootmapdirs : ;
endif

ifdef cmt_post_merge_rootmap_has_target_tag

ifndef QUICK
$(cmt_local_post_merge_rootmap_makefile) : $(post_merge_rootmap_dependencies) build_library_links
	$(echo) "(constituents.make) Building post_merge_rootmap.make"; \
	  $(cmtexe) -tag=$(tags) $(post_merge_rootmap_extratags) build constituent_config -out=$(cmt_local_post_merge_rootmap_makefile) post_merge_rootmap
else
$(cmt_local_post_merge_rootmap_makefile) : $(post_merge_rootmap_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_post_merge_rootmap) ] || \
	  [ ! -f $(cmt_final_setup_post_merge_rootmap) ] || \
	  $(not_post_merge_rootmap_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building post_merge_rootmap.make"; \
	  $(cmtexe) -tag=$(tags) $(post_merge_rootmap_extratags) build constituent_config -out=$(cmt_local_post_merge_rootmap_makefile) post_merge_rootmap; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_post_merge_rootmap_makefile) : $(post_merge_rootmap_dependencies) build_library_links
	$(echo) "(constituents.make) Building post_merge_rootmap.make"; \
	  $(cmtexe) -f=$(bin)post_merge_rootmap.in -tag=$(tags) $(post_merge_rootmap_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_post_merge_rootmap_makefile) post_merge_rootmap
else
$(cmt_local_post_merge_rootmap_makefile) : $(post_merge_rootmap_dependencies) $(cmt_build_library_linksstamp) $(bin)post_merge_rootmap.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_post_merge_rootmap) ] || \
	  [ ! -f $(cmt_final_setup_post_merge_rootmap) ] || \
	  $(not_post_merge_rootmap_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building post_merge_rootmap.make"; \
	  $(cmtexe) -f=$(bin)post_merge_rootmap.in -tag=$(tags) $(post_merge_rootmap_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_post_merge_rootmap_makefile) post_merge_rootmap; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(post_merge_rootmap_extratags) build constituent_makefile -out=$(cmt_local_post_merge_rootmap_makefile) post_merge_rootmap

post_merge_rootmap :: $(post_merge_rootmap_dependencies) $(cmt_local_post_merge_rootmap_makefile) dirs post_merge_rootmapdirs
	$(echo) "(constituents.make) Starting post_merge_rootmap"
	@if test -f $(cmt_local_post_merge_rootmap_makefile); then \
	  $(MAKE) -f $(cmt_local_post_merge_rootmap_makefile) post_merge_rootmap; \
	  fi
#	@$(MAKE) -f $(cmt_local_post_merge_rootmap_makefile) post_merge_rootmap
	$(echo) "(constituents.make) post_merge_rootmap done"

clean :: post_merge_rootmapclean ;

post_merge_rootmapclean :: $(post_merge_rootmapclean_dependencies) ##$(cmt_local_post_merge_rootmap_makefile)
	$(echo) "(constituents.make) Starting post_merge_rootmapclean"
	@-if test -f $(cmt_local_post_merge_rootmap_makefile); then \
	  $(MAKE) -f $(cmt_local_post_merge_rootmap_makefile) post_merge_rootmapclean; \
	fi
	$(echo) "(constituents.make) post_merge_rootmapclean done"
#	@-$(MAKE) -f $(cmt_local_post_merge_rootmap_makefile) post_merge_rootmapclean

##	  /bin/rm -f $(cmt_local_post_merge_rootmap_makefile) $(bin)post_merge_rootmap_dependencies.make

install :: post_merge_rootmapinstall ;

post_merge_rootmapinstall :: $(post_merge_rootmap_dependencies) $(cmt_local_post_merge_rootmap_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_post_merge_rootmap_makefile); then \
	  $(MAKE) -f $(cmt_local_post_merge_rootmap_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_post_merge_rootmap_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : post_merge_rootmapuninstall

$(foreach d,$(post_merge_rootmap_dependencies),$(eval $(d)uninstall_dependencies += post_merge_rootmapuninstall))

post_merge_rootmapuninstall : $(post_merge_rootmapuninstall_dependencies) ##$(cmt_local_post_merge_rootmap_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_post_merge_rootmap_makefile); then \
	  $(MAKE) -f $(cmt_local_post_merge_rootmap_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_post_merge_rootmap_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: post_merge_rootmapuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ post_merge_rootmap"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ post_merge_rootmap done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_post_merge_genconfdb_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_post_merge_genconfdb_has_target_tag

cmt_local_tagfile_post_merge_genconfdb = $(bin)$(TrigCostMonitor_tag)_post_merge_genconfdb.make
cmt_final_setup_post_merge_genconfdb = $(bin)setup_post_merge_genconfdb.make
cmt_local_post_merge_genconfdb_makefile = $(bin)post_merge_genconfdb.make

post_merge_genconfdb_extratags = -tag_add=target_post_merge_genconfdb

else

cmt_local_tagfile_post_merge_genconfdb = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_post_merge_genconfdb = $(bin)setup.make
cmt_local_post_merge_genconfdb_makefile = $(bin)post_merge_genconfdb.make

endif

not_post_merge_genconfdb_dependencies = { n=0; for p in $?; do m=0; for d in $(post_merge_genconfdb_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
post_merge_genconfdbdirs :
	@if test ! -d $(bin)post_merge_genconfdb; then $(mkdir) -p $(bin)post_merge_genconfdb; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)post_merge_genconfdb
else
post_merge_genconfdbdirs : ;
endif

ifdef cmt_post_merge_genconfdb_has_target_tag

ifndef QUICK
$(cmt_local_post_merge_genconfdb_makefile) : $(post_merge_genconfdb_dependencies) build_library_links
	$(echo) "(constituents.make) Building post_merge_genconfdb.make"; \
	  $(cmtexe) -tag=$(tags) $(post_merge_genconfdb_extratags) build constituent_config -out=$(cmt_local_post_merge_genconfdb_makefile) post_merge_genconfdb
else
$(cmt_local_post_merge_genconfdb_makefile) : $(post_merge_genconfdb_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_post_merge_genconfdb) ] || \
	  [ ! -f $(cmt_final_setup_post_merge_genconfdb) ] || \
	  $(not_post_merge_genconfdb_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building post_merge_genconfdb.make"; \
	  $(cmtexe) -tag=$(tags) $(post_merge_genconfdb_extratags) build constituent_config -out=$(cmt_local_post_merge_genconfdb_makefile) post_merge_genconfdb; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_post_merge_genconfdb_makefile) : $(post_merge_genconfdb_dependencies) build_library_links
	$(echo) "(constituents.make) Building post_merge_genconfdb.make"; \
	  $(cmtexe) -f=$(bin)post_merge_genconfdb.in -tag=$(tags) $(post_merge_genconfdb_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_post_merge_genconfdb_makefile) post_merge_genconfdb
else
$(cmt_local_post_merge_genconfdb_makefile) : $(post_merge_genconfdb_dependencies) $(cmt_build_library_linksstamp) $(bin)post_merge_genconfdb.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_post_merge_genconfdb) ] || \
	  [ ! -f $(cmt_final_setup_post_merge_genconfdb) ] || \
	  $(not_post_merge_genconfdb_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building post_merge_genconfdb.make"; \
	  $(cmtexe) -f=$(bin)post_merge_genconfdb.in -tag=$(tags) $(post_merge_genconfdb_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_post_merge_genconfdb_makefile) post_merge_genconfdb; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(post_merge_genconfdb_extratags) build constituent_makefile -out=$(cmt_local_post_merge_genconfdb_makefile) post_merge_genconfdb

post_merge_genconfdb :: $(post_merge_genconfdb_dependencies) $(cmt_local_post_merge_genconfdb_makefile) dirs post_merge_genconfdbdirs
	$(echo) "(constituents.make) Starting post_merge_genconfdb"
	@if test -f $(cmt_local_post_merge_genconfdb_makefile); then \
	  $(MAKE) -f $(cmt_local_post_merge_genconfdb_makefile) post_merge_genconfdb; \
	  fi
#	@$(MAKE) -f $(cmt_local_post_merge_genconfdb_makefile) post_merge_genconfdb
	$(echo) "(constituents.make) post_merge_genconfdb done"

clean :: post_merge_genconfdbclean ;

post_merge_genconfdbclean :: $(post_merge_genconfdbclean_dependencies) ##$(cmt_local_post_merge_genconfdb_makefile)
	$(echo) "(constituents.make) Starting post_merge_genconfdbclean"
	@-if test -f $(cmt_local_post_merge_genconfdb_makefile); then \
	  $(MAKE) -f $(cmt_local_post_merge_genconfdb_makefile) post_merge_genconfdbclean; \
	fi
	$(echo) "(constituents.make) post_merge_genconfdbclean done"
#	@-$(MAKE) -f $(cmt_local_post_merge_genconfdb_makefile) post_merge_genconfdbclean

##	  /bin/rm -f $(cmt_local_post_merge_genconfdb_makefile) $(bin)post_merge_genconfdb_dependencies.make

install :: post_merge_genconfdbinstall ;

post_merge_genconfdbinstall :: $(post_merge_genconfdb_dependencies) $(cmt_local_post_merge_genconfdb_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_post_merge_genconfdb_makefile); then \
	  $(MAKE) -f $(cmt_local_post_merge_genconfdb_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_post_merge_genconfdb_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : post_merge_genconfdbuninstall

$(foreach d,$(post_merge_genconfdb_dependencies),$(eval $(d)uninstall_dependencies += post_merge_genconfdbuninstall))

post_merge_genconfdbuninstall : $(post_merge_genconfdbuninstall_dependencies) ##$(cmt_local_post_merge_genconfdb_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_post_merge_genconfdb_makefile); then \
	  $(MAKE) -f $(cmt_local_post_merge_genconfdb_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_post_merge_genconfdb_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: post_merge_genconfdbuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ post_merge_genconfdb"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ post_merge_genconfdb done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_post_build_tpcnvdb_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_post_build_tpcnvdb_has_target_tag

cmt_local_tagfile_post_build_tpcnvdb = $(bin)$(TrigCostMonitor_tag)_post_build_tpcnvdb.make
cmt_final_setup_post_build_tpcnvdb = $(bin)setup_post_build_tpcnvdb.make
cmt_local_post_build_tpcnvdb_makefile = $(bin)post_build_tpcnvdb.make

post_build_tpcnvdb_extratags = -tag_add=target_post_build_tpcnvdb

else

cmt_local_tagfile_post_build_tpcnvdb = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_post_build_tpcnvdb = $(bin)setup.make
cmt_local_post_build_tpcnvdb_makefile = $(bin)post_build_tpcnvdb.make

endif

not_post_build_tpcnvdb_dependencies = { n=0; for p in $?; do m=0; for d in $(post_build_tpcnvdb_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
post_build_tpcnvdbdirs :
	@if test ! -d $(bin)post_build_tpcnvdb; then $(mkdir) -p $(bin)post_build_tpcnvdb; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)post_build_tpcnvdb
else
post_build_tpcnvdbdirs : ;
endif

ifdef cmt_post_build_tpcnvdb_has_target_tag

ifndef QUICK
$(cmt_local_post_build_tpcnvdb_makefile) : $(post_build_tpcnvdb_dependencies) build_library_links
	$(echo) "(constituents.make) Building post_build_tpcnvdb.make"; \
	  $(cmtexe) -tag=$(tags) $(post_build_tpcnvdb_extratags) build constituent_config -out=$(cmt_local_post_build_tpcnvdb_makefile) post_build_tpcnvdb
else
$(cmt_local_post_build_tpcnvdb_makefile) : $(post_build_tpcnvdb_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_post_build_tpcnvdb) ] || \
	  [ ! -f $(cmt_final_setup_post_build_tpcnvdb) ] || \
	  $(not_post_build_tpcnvdb_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building post_build_tpcnvdb.make"; \
	  $(cmtexe) -tag=$(tags) $(post_build_tpcnvdb_extratags) build constituent_config -out=$(cmt_local_post_build_tpcnvdb_makefile) post_build_tpcnvdb; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_post_build_tpcnvdb_makefile) : $(post_build_tpcnvdb_dependencies) build_library_links
	$(echo) "(constituents.make) Building post_build_tpcnvdb.make"; \
	  $(cmtexe) -f=$(bin)post_build_tpcnvdb.in -tag=$(tags) $(post_build_tpcnvdb_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_post_build_tpcnvdb_makefile) post_build_tpcnvdb
else
$(cmt_local_post_build_tpcnvdb_makefile) : $(post_build_tpcnvdb_dependencies) $(cmt_build_library_linksstamp) $(bin)post_build_tpcnvdb.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_post_build_tpcnvdb) ] || \
	  [ ! -f $(cmt_final_setup_post_build_tpcnvdb) ] || \
	  $(not_post_build_tpcnvdb_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building post_build_tpcnvdb.make"; \
	  $(cmtexe) -f=$(bin)post_build_tpcnvdb.in -tag=$(tags) $(post_build_tpcnvdb_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_post_build_tpcnvdb_makefile) post_build_tpcnvdb; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(post_build_tpcnvdb_extratags) build constituent_makefile -out=$(cmt_local_post_build_tpcnvdb_makefile) post_build_tpcnvdb

post_build_tpcnvdb :: $(post_build_tpcnvdb_dependencies) $(cmt_local_post_build_tpcnvdb_makefile) dirs post_build_tpcnvdbdirs
	$(echo) "(constituents.make) Starting post_build_tpcnvdb"
	@if test -f $(cmt_local_post_build_tpcnvdb_makefile); then \
	  $(MAKE) -f $(cmt_local_post_build_tpcnvdb_makefile) post_build_tpcnvdb; \
	  fi
#	@$(MAKE) -f $(cmt_local_post_build_tpcnvdb_makefile) post_build_tpcnvdb
	$(echo) "(constituents.make) post_build_tpcnvdb done"

clean :: post_build_tpcnvdbclean ;

post_build_tpcnvdbclean :: $(post_build_tpcnvdbclean_dependencies) ##$(cmt_local_post_build_tpcnvdb_makefile)
	$(echo) "(constituents.make) Starting post_build_tpcnvdbclean"
	@-if test -f $(cmt_local_post_build_tpcnvdb_makefile); then \
	  $(MAKE) -f $(cmt_local_post_build_tpcnvdb_makefile) post_build_tpcnvdbclean; \
	fi
	$(echo) "(constituents.make) post_build_tpcnvdbclean done"
#	@-$(MAKE) -f $(cmt_local_post_build_tpcnvdb_makefile) post_build_tpcnvdbclean

##	  /bin/rm -f $(cmt_local_post_build_tpcnvdb_makefile) $(bin)post_build_tpcnvdb_dependencies.make

install :: post_build_tpcnvdbinstall ;

post_build_tpcnvdbinstall :: $(post_build_tpcnvdb_dependencies) $(cmt_local_post_build_tpcnvdb_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_post_build_tpcnvdb_makefile); then \
	  $(MAKE) -f $(cmt_local_post_build_tpcnvdb_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_post_build_tpcnvdb_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : post_build_tpcnvdbuninstall

$(foreach d,$(post_build_tpcnvdb_dependencies),$(eval $(d)uninstall_dependencies += post_build_tpcnvdbuninstall))

post_build_tpcnvdbuninstall : $(post_build_tpcnvdbuninstall_dependencies) ##$(cmt_local_post_build_tpcnvdb_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_post_build_tpcnvdb_makefile); then \
	  $(MAKE) -f $(cmt_local_post_build_tpcnvdb_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_post_build_tpcnvdb_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: post_build_tpcnvdbuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ post_build_tpcnvdb"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ post_build_tpcnvdb done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_all_post_constituents_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_all_post_constituents_has_target_tag

cmt_local_tagfile_all_post_constituents = $(bin)$(TrigCostMonitor_tag)_all_post_constituents.make
cmt_final_setup_all_post_constituents = $(bin)setup_all_post_constituents.make
cmt_local_all_post_constituents_makefile = $(bin)all_post_constituents.make

all_post_constituents_extratags = -tag_add=target_all_post_constituents

else

cmt_local_tagfile_all_post_constituents = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_all_post_constituents = $(bin)setup.make
cmt_local_all_post_constituents_makefile = $(bin)all_post_constituents.make

endif

not_all_post_constituents_dependencies = { n=0; for p in $?; do m=0; for d in $(all_post_constituents_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
all_post_constituentsdirs :
	@if test ! -d $(bin)all_post_constituents; then $(mkdir) -p $(bin)all_post_constituents; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)all_post_constituents
else
all_post_constituentsdirs : ;
endif

ifdef cmt_all_post_constituents_has_target_tag

ifndef QUICK
$(cmt_local_all_post_constituents_makefile) : $(all_post_constituents_dependencies) build_library_links
	$(echo) "(constituents.make) Building all_post_constituents.make"; \
	  $(cmtexe) -tag=$(tags) $(all_post_constituents_extratags) build constituent_config -out=$(cmt_local_all_post_constituents_makefile) all_post_constituents
else
$(cmt_local_all_post_constituents_makefile) : $(all_post_constituents_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_all_post_constituents) ] || \
	  [ ! -f $(cmt_final_setup_all_post_constituents) ] || \
	  $(not_all_post_constituents_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building all_post_constituents.make"; \
	  $(cmtexe) -tag=$(tags) $(all_post_constituents_extratags) build constituent_config -out=$(cmt_local_all_post_constituents_makefile) all_post_constituents; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_all_post_constituents_makefile) : $(all_post_constituents_dependencies) build_library_links
	$(echo) "(constituents.make) Building all_post_constituents.make"; \
	  $(cmtexe) -f=$(bin)all_post_constituents.in -tag=$(tags) $(all_post_constituents_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_all_post_constituents_makefile) all_post_constituents
else
$(cmt_local_all_post_constituents_makefile) : $(all_post_constituents_dependencies) $(cmt_build_library_linksstamp) $(bin)all_post_constituents.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_all_post_constituents) ] || \
	  [ ! -f $(cmt_final_setup_all_post_constituents) ] || \
	  $(not_all_post_constituents_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building all_post_constituents.make"; \
	  $(cmtexe) -f=$(bin)all_post_constituents.in -tag=$(tags) $(all_post_constituents_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_all_post_constituents_makefile) all_post_constituents; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(all_post_constituents_extratags) build constituent_makefile -out=$(cmt_local_all_post_constituents_makefile) all_post_constituents

all_post_constituents :: $(all_post_constituents_dependencies) $(cmt_local_all_post_constituents_makefile) dirs all_post_constituentsdirs
	$(echo) "(constituents.make) Starting all_post_constituents"
	@if test -f $(cmt_local_all_post_constituents_makefile); then \
	  $(MAKE) -f $(cmt_local_all_post_constituents_makefile) all_post_constituents; \
	  fi
#	@$(MAKE) -f $(cmt_local_all_post_constituents_makefile) all_post_constituents
	$(echo) "(constituents.make) all_post_constituents done"

clean :: all_post_constituentsclean ;

all_post_constituentsclean :: $(all_post_constituentsclean_dependencies) ##$(cmt_local_all_post_constituents_makefile)
	$(echo) "(constituents.make) Starting all_post_constituentsclean"
	@-if test -f $(cmt_local_all_post_constituents_makefile); then \
	  $(MAKE) -f $(cmt_local_all_post_constituents_makefile) all_post_constituentsclean; \
	fi
	$(echo) "(constituents.make) all_post_constituentsclean done"
#	@-$(MAKE) -f $(cmt_local_all_post_constituents_makefile) all_post_constituentsclean

##	  /bin/rm -f $(cmt_local_all_post_constituents_makefile) $(bin)all_post_constituents_dependencies.make

install :: all_post_constituentsinstall ;

all_post_constituentsinstall :: $(all_post_constituents_dependencies) $(cmt_local_all_post_constituents_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_all_post_constituents_makefile); then \
	  $(MAKE) -f $(cmt_local_all_post_constituents_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_all_post_constituents_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : all_post_constituentsuninstall

$(foreach d,$(all_post_constituents_dependencies),$(eval $(d)uninstall_dependencies += all_post_constituentsuninstall))

all_post_constituentsuninstall : $(all_post_constituentsuninstall_dependencies) ##$(cmt_local_all_post_constituents_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_all_post_constituents_makefile); then \
	  $(MAKE) -f $(cmt_local_all_post_constituents_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_all_post_constituents_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: all_post_constituentsuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ all_post_constituents"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ all_post_constituents done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_checkreq_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_checkreq_has_target_tag

cmt_local_tagfile_checkreq = $(bin)$(TrigCostMonitor_tag)_checkreq.make
cmt_final_setup_checkreq = $(bin)setup_checkreq.make
cmt_local_checkreq_makefile = $(bin)checkreq.make

checkreq_extratags = -tag_add=target_checkreq

else

cmt_local_tagfile_checkreq = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_checkreq = $(bin)setup.make
cmt_local_checkreq_makefile = $(bin)checkreq.make

endif

not_checkreq_dependencies = { n=0; for p in $?; do m=0; for d in $(checkreq_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
checkreqdirs :
	@if test ! -d $(bin)checkreq; then $(mkdir) -p $(bin)checkreq; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)checkreq
else
checkreqdirs : ;
endif

ifdef cmt_checkreq_has_target_tag

ifndef QUICK
$(cmt_local_checkreq_makefile) : $(checkreq_dependencies) build_library_links
	$(echo) "(constituents.make) Building checkreq.make"; \
	  $(cmtexe) -tag=$(tags) $(checkreq_extratags) build constituent_config -out=$(cmt_local_checkreq_makefile) checkreq
else
$(cmt_local_checkreq_makefile) : $(checkreq_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_checkreq) ] || \
	  [ ! -f $(cmt_final_setup_checkreq) ] || \
	  $(not_checkreq_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building checkreq.make"; \
	  $(cmtexe) -tag=$(tags) $(checkreq_extratags) build constituent_config -out=$(cmt_local_checkreq_makefile) checkreq; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_checkreq_makefile) : $(checkreq_dependencies) build_library_links
	$(echo) "(constituents.make) Building checkreq.make"; \
	  $(cmtexe) -f=$(bin)checkreq.in -tag=$(tags) $(checkreq_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_checkreq_makefile) checkreq
else
$(cmt_local_checkreq_makefile) : $(checkreq_dependencies) $(cmt_build_library_linksstamp) $(bin)checkreq.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_checkreq) ] || \
	  [ ! -f $(cmt_final_setup_checkreq) ] || \
	  $(not_checkreq_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building checkreq.make"; \
	  $(cmtexe) -f=$(bin)checkreq.in -tag=$(tags) $(checkreq_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_checkreq_makefile) checkreq; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(checkreq_extratags) build constituent_makefile -out=$(cmt_local_checkreq_makefile) checkreq

checkreq :: $(checkreq_dependencies) $(cmt_local_checkreq_makefile) dirs checkreqdirs
	$(echo) "(constituents.make) Starting checkreq"
	@if test -f $(cmt_local_checkreq_makefile); then \
	  $(MAKE) -f $(cmt_local_checkreq_makefile) checkreq; \
	  fi
#	@$(MAKE) -f $(cmt_local_checkreq_makefile) checkreq
	$(echo) "(constituents.make) checkreq done"

clean :: checkreqclean ;

checkreqclean :: $(checkreqclean_dependencies) ##$(cmt_local_checkreq_makefile)
	$(echo) "(constituents.make) Starting checkreqclean"
	@-if test -f $(cmt_local_checkreq_makefile); then \
	  $(MAKE) -f $(cmt_local_checkreq_makefile) checkreqclean; \
	fi
	$(echo) "(constituents.make) checkreqclean done"
#	@-$(MAKE) -f $(cmt_local_checkreq_makefile) checkreqclean

##	  /bin/rm -f $(cmt_local_checkreq_makefile) $(bin)checkreq_dependencies.make

install :: checkreqinstall ;

checkreqinstall :: $(checkreq_dependencies) $(cmt_local_checkreq_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_checkreq_makefile); then \
	  $(MAKE) -f $(cmt_local_checkreq_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_checkreq_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : checkrequninstall

$(foreach d,$(checkreq_dependencies),$(eval $(d)uninstall_dependencies += checkrequninstall))

checkrequninstall : $(checkrequninstall_dependencies) ##$(cmt_local_checkreq_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_checkreq_makefile); then \
	  $(MAKE) -f $(cmt_local_checkreq_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_checkreq_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: checkrequninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ checkreq"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ checkreq done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_TrigCostMonitor_NICOS_Fix_debuginfo_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_TrigCostMonitor_NICOS_Fix_debuginfo_has_target_tag

cmt_local_tagfile_TrigCostMonitor_NICOS_Fix_debuginfo = $(bin)$(TrigCostMonitor_tag)_TrigCostMonitor_NICOS_Fix_debuginfo.make
cmt_final_setup_TrigCostMonitor_NICOS_Fix_debuginfo = $(bin)setup_TrigCostMonitor_NICOS_Fix_debuginfo.make
cmt_local_TrigCostMonitor_NICOS_Fix_debuginfo_makefile = $(bin)TrigCostMonitor_NICOS_Fix_debuginfo.make

TrigCostMonitor_NICOS_Fix_debuginfo_extratags = -tag_add=target_TrigCostMonitor_NICOS_Fix_debuginfo

else

cmt_local_tagfile_TrigCostMonitor_NICOS_Fix_debuginfo = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_TrigCostMonitor_NICOS_Fix_debuginfo = $(bin)setup.make
cmt_local_TrigCostMonitor_NICOS_Fix_debuginfo_makefile = $(bin)TrigCostMonitor_NICOS_Fix_debuginfo.make

endif

not_TrigCostMonitor_NICOS_Fix_debuginfo_dependencies = { n=0; for p in $?; do m=0; for d in $(TrigCostMonitor_NICOS_Fix_debuginfo_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
TrigCostMonitor_NICOS_Fix_debuginfodirs :
	@if test ! -d $(bin)TrigCostMonitor_NICOS_Fix_debuginfo; then $(mkdir) -p $(bin)TrigCostMonitor_NICOS_Fix_debuginfo; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)TrigCostMonitor_NICOS_Fix_debuginfo
else
TrigCostMonitor_NICOS_Fix_debuginfodirs : ;
endif

ifdef cmt_TrigCostMonitor_NICOS_Fix_debuginfo_has_target_tag

ifndef QUICK
$(cmt_local_TrigCostMonitor_NICOS_Fix_debuginfo_makefile) : $(TrigCostMonitor_NICOS_Fix_debuginfo_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitor_NICOS_Fix_debuginfo.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitor_NICOS_Fix_debuginfo_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitor_NICOS_Fix_debuginfo_makefile) TrigCostMonitor_NICOS_Fix_debuginfo
else
$(cmt_local_TrigCostMonitor_NICOS_Fix_debuginfo_makefile) : $(TrigCostMonitor_NICOS_Fix_debuginfo_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitor_NICOS_Fix_debuginfo) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitor_NICOS_Fix_debuginfo) ] || \
	  $(not_TrigCostMonitor_NICOS_Fix_debuginfo_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitor_NICOS_Fix_debuginfo.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitor_NICOS_Fix_debuginfo_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitor_NICOS_Fix_debuginfo_makefile) TrigCostMonitor_NICOS_Fix_debuginfo; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_TrigCostMonitor_NICOS_Fix_debuginfo_makefile) : $(TrigCostMonitor_NICOS_Fix_debuginfo_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitor_NICOS_Fix_debuginfo.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitor_NICOS_Fix_debuginfo.in -tag=$(tags) $(TrigCostMonitor_NICOS_Fix_debuginfo_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitor_NICOS_Fix_debuginfo_makefile) TrigCostMonitor_NICOS_Fix_debuginfo
else
$(cmt_local_TrigCostMonitor_NICOS_Fix_debuginfo_makefile) : $(TrigCostMonitor_NICOS_Fix_debuginfo_dependencies) $(cmt_build_library_linksstamp) $(bin)TrigCostMonitor_NICOS_Fix_debuginfo.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitor_NICOS_Fix_debuginfo) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitor_NICOS_Fix_debuginfo) ] || \
	  $(not_TrigCostMonitor_NICOS_Fix_debuginfo_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitor_NICOS_Fix_debuginfo.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitor_NICOS_Fix_debuginfo.in -tag=$(tags) $(TrigCostMonitor_NICOS_Fix_debuginfo_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitor_NICOS_Fix_debuginfo_makefile) TrigCostMonitor_NICOS_Fix_debuginfo; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(TrigCostMonitor_NICOS_Fix_debuginfo_extratags) build constituent_makefile -out=$(cmt_local_TrigCostMonitor_NICOS_Fix_debuginfo_makefile) TrigCostMonitor_NICOS_Fix_debuginfo

TrigCostMonitor_NICOS_Fix_debuginfo :: $(TrigCostMonitor_NICOS_Fix_debuginfo_dependencies) $(cmt_local_TrigCostMonitor_NICOS_Fix_debuginfo_makefile) dirs TrigCostMonitor_NICOS_Fix_debuginfodirs
	$(echo) "(constituents.make) Starting TrigCostMonitor_NICOS_Fix_debuginfo"
	@if test -f $(cmt_local_TrigCostMonitor_NICOS_Fix_debuginfo_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitor_NICOS_Fix_debuginfo_makefile) TrigCostMonitor_NICOS_Fix_debuginfo; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitor_NICOS_Fix_debuginfo_makefile) TrigCostMonitor_NICOS_Fix_debuginfo
	$(echo) "(constituents.make) TrigCostMonitor_NICOS_Fix_debuginfo done"

clean :: TrigCostMonitor_NICOS_Fix_debuginfoclean ;

TrigCostMonitor_NICOS_Fix_debuginfoclean :: $(TrigCostMonitor_NICOS_Fix_debuginfoclean_dependencies) ##$(cmt_local_TrigCostMonitor_NICOS_Fix_debuginfo_makefile)
	$(echo) "(constituents.make) Starting TrigCostMonitor_NICOS_Fix_debuginfoclean"
	@-if test -f $(cmt_local_TrigCostMonitor_NICOS_Fix_debuginfo_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitor_NICOS_Fix_debuginfo_makefile) TrigCostMonitor_NICOS_Fix_debuginfoclean; \
	fi
	$(echo) "(constituents.make) TrigCostMonitor_NICOS_Fix_debuginfoclean done"
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitor_NICOS_Fix_debuginfo_makefile) TrigCostMonitor_NICOS_Fix_debuginfoclean

##	  /bin/rm -f $(cmt_local_TrigCostMonitor_NICOS_Fix_debuginfo_makefile) $(bin)TrigCostMonitor_NICOS_Fix_debuginfo_dependencies.make

install :: TrigCostMonitor_NICOS_Fix_debuginfoinstall ;

TrigCostMonitor_NICOS_Fix_debuginfoinstall :: $(TrigCostMonitor_NICOS_Fix_debuginfo_dependencies) $(cmt_local_TrigCostMonitor_NICOS_Fix_debuginfo_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_TrigCostMonitor_NICOS_Fix_debuginfo_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitor_NICOS_Fix_debuginfo_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitor_NICOS_Fix_debuginfo_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : TrigCostMonitor_NICOS_Fix_debuginfouninstall

$(foreach d,$(TrigCostMonitor_NICOS_Fix_debuginfo_dependencies),$(eval $(d)uninstall_dependencies += TrigCostMonitor_NICOS_Fix_debuginfouninstall))

TrigCostMonitor_NICOS_Fix_debuginfouninstall : $(TrigCostMonitor_NICOS_Fix_debuginfouninstall_dependencies) ##$(cmt_local_TrigCostMonitor_NICOS_Fix_debuginfo_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_TrigCostMonitor_NICOS_Fix_debuginfo_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitor_NICOS_Fix_debuginfo_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitor_NICOS_Fix_debuginfo_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: TrigCostMonitor_NICOS_Fix_debuginfouninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ TrigCostMonitor_NICOS_Fix_debuginfo"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ TrigCostMonitor_NICOS_Fix_debuginfo done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_TrigCostMonitorLib_NICOS_Fix_debuginfo_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_TrigCostMonitorLib_NICOS_Fix_debuginfo_has_target_tag

cmt_local_tagfile_TrigCostMonitorLib_NICOS_Fix_debuginfo = $(bin)$(TrigCostMonitor_tag)_TrigCostMonitorLib_NICOS_Fix_debuginfo.make
cmt_final_setup_TrigCostMonitorLib_NICOS_Fix_debuginfo = $(bin)setup_TrigCostMonitorLib_NICOS_Fix_debuginfo.make
cmt_local_TrigCostMonitorLib_NICOS_Fix_debuginfo_makefile = $(bin)TrigCostMonitorLib_NICOS_Fix_debuginfo.make

TrigCostMonitorLib_NICOS_Fix_debuginfo_extratags = -tag_add=target_TrigCostMonitorLib_NICOS_Fix_debuginfo

else

cmt_local_tagfile_TrigCostMonitorLib_NICOS_Fix_debuginfo = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_TrigCostMonitorLib_NICOS_Fix_debuginfo = $(bin)setup.make
cmt_local_TrigCostMonitorLib_NICOS_Fix_debuginfo_makefile = $(bin)TrigCostMonitorLib_NICOS_Fix_debuginfo.make

endif

not_TrigCostMonitorLib_NICOS_Fix_debuginfo_dependencies = { n=0; for p in $?; do m=0; for d in $(TrigCostMonitorLib_NICOS_Fix_debuginfo_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
TrigCostMonitorLib_NICOS_Fix_debuginfodirs :
	@if test ! -d $(bin)TrigCostMonitorLib_NICOS_Fix_debuginfo; then $(mkdir) -p $(bin)TrigCostMonitorLib_NICOS_Fix_debuginfo; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)TrigCostMonitorLib_NICOS_Fix_debuginfo
else
TrigCostMonitorLib_NICOS_Fix_debuginfodirs : ;
endif

ifdef cmt_TrigCostMonitorLib_NICOS_Fix_debuginfo_has_target_tag

ifndef QUICK
$(cmt_local_TrigCostMonitorLib_NICOS_Fix_debuginfo_makefile) : $(TrigCostMonitorLib_NICOS_Fix_debuginfo_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitorLib_NICOS_Fix_debuginfo.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorLib_NICOS_Fix_debuginfo_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitorLib_NICOS_Fix_debuginfo_makefile) TrigCostMonitorLib_NICOS_Fix_debuginfo
else
$(cmt_local_TrigCostMonitorLib_NICOS_Fix_debuginfo_makefile) : $(TrigCostMonitorLib_NICOS_Fix_debuginfo_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitorLib_NICOS_Fix_debuginfo) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitorLib_NICOS_Fix_debuginfo) ] || \
	  $(not_TrigCostMonitorLib_NICOS_Fix_debuginfo_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitorLib_NICOS_Fix_debuginfo.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorLib_NICOS_Fix_debuginfo_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitorLib_NICOS_Fix_debuginfo_makefile) TrigCostMonitorLib_NICOS_Fix_debuginfo; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_TrigCostMonitorLib_NICOS_Fix_debuginfo_makefile) : $(TrigCostMonitorLib_NICOS_Fix_debuginfo_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitorLib_NICOS_Fix_debuginfo.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitorLib_NICOS_Fix_debuginfo.in -tag=$(tags) $(TrigCostMonitorLib_NICOS_Fix_debuginfo_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitorLib_NICOS_Fix_debuginfo_makefile) TrigCostMonitorLib_NICOS_Fix_debuginfo
else
$(cmt_local_TrigCostMonitorLib_NICOS_Fix_debuginfo_makefile) : $(TrigCostMonitorLib_NICOS_Fix_debuginfo_dependencies) $(cmt_build_library_linksstamp) $(bin)TrigCostMonitorLib_NICOS_Fix_debuginfo.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitorLib_NICOS_Fix_debuginfo) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitorLib_NICOS_Fix_debuginfo) ] || \
	  $(not_TrigCostMonitorLib_NICOS_Fix_debuginfo_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitorLib_NICOS_Fix_debuginfo.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitorLib_NICOS_Fix_debuginfo.in -tag=$(tags) $(TrigCostMonitorLib_NICOS_Fix_debuginfo_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitorLib_NICOS_Fix_debuginfo_makefile) TrigCostMonitorLib_NICOS_Fix_debuginfo; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorLib_NICOS_Fix_debuginfo_extratags) build constituent_makefile -out=$(cmt_local_TrigCostMonitorLib_NICOS_Fix_debuginfo_makefile) TrigCostMonitorLib_NICOS_Fix_debuginfo

TrigCostMonitorLib_NICOS_Fix_debuginfo :: $(TrigCostMonitorLib_NICOS_Fix_debuginfo_dependencies) $(cmt_local_TrigCostMonitorLib_NICOS_Fix_debuginfo_makefile) dirs TrigCostMonitorLib_NICOS_Fix_debuginfodirs
	$(echo) "(constituents.make) Starting TrigCostMonitorLib_NICOS_Fix_debuginfo"
	@if test -f $(cmt_local_TrigCostMonitorLib_NICOS_Fix_debuginfo_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorLib_NICOS_Fix_debuginfo_makefile) TrigCostMonitorLib_NICOS_Fix_debuginfo; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitorLib_NICOS_Fix_debuginfo_makefile) TrigCostMonitorLib_NICOS_Fix_debuginfo
	$(echo) "(constituents.make) TrigCostMonitorLib_NICOS_Fix_debuginfo done"

clean :: TrigCostMonitorLib_NICOS_Fix_debuginfoclean ;

TrigCostMonitorLib_NICOS_Fix_debuginfoclean :: $(TrigCostMonitorLib_NICOS_Fix_debuginfoclean_dependencies) ##$(cmt_local_TrigCostMonitorLib_NICOS_Fix_debuginfo_makefile)
	$(echo) "(constituents.make) Starting TrigCostMonitorLib_NICOS_Fix_debuginfoclean"
	@-if test -f $(cmt_local_TrigCostMonitorLib_NICOS_Fix_debuginfo_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorLib_NICOS_Fix_debuginfo_makefile) TrigCostMonitorLib_NICOS_Fix_debuginfoclean; \
	fi
	$(echo) "(constituents.make) TrigCostMonitorLib_NICOS_Fix_debuginfoclean done"
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitorLib_NICOS_Fix_debuginfo_makefile) TrigCostMonitorLib_NICOS_Fix_debuginfoclean

##	  /bin/rm -f $(cmt_local_TrigCostMonitorLib_NICOS_Fix_debuginfo_makefile) $(bin)TrigCostMonitorLib_NICOS_Fix_debuginfo_dependencies.make

install :: TrigCostMonitorLib_NICOS_Fix_debuginfoinstall ;

TrigCostMonitorLib_NICOS_Fix_debuginfoinstall :: $(TrigCostMonitorLib_NICOS_Fix_debuginfo_dependencies) $(cmt_local_TrigCostMonitorLib_NICOS_Fix_debuginfo_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_TrigCostMonitorLib_NICOS_Fix_debuginfo_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorLib_NICOS_Fix_debuginfo_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitorLib_NICOS_Fix_debuginfo_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : TrigCostMonitorLib_NICOS_Fix_debuginfouninstall

$(foreach d,$(TrigCostMonitorLib_NICOS_Fix_debuginfo_dependencies),$(eval $(d)uninstall_dependencies += TrigCostMonitorLib_NICOS_Fix_debuginfouninstall))

TrigCostMonitorLib_NICOS_Fix_debuginfouninstall : $(TrigCostMonitorLib_NICOS_Fix_debuginfouninstall_dependencies) ##$(cmt_local_TrigCostMonitorLib_NICOS_Fix_debuginfo_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_TrigCostMonitorLib_NICOS_Fix_debuginfo_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorLib_NICOS_Fix_debuginfo_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitorLib_NICOS_Fix_debuginfo_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: TrigCostMonitorLib_NICOS_Fix_debuginfouninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ TrigCostMonitorLib_NICOS_Fix_debuginfo"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ TrigCostMonitorLib_NICOS_Fix_debuginfo done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_check_install_python_modules_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_check_install_python_modules_has_target_tag

cmt_local_tagfile_check_install_python_modules = $(bin)$(TrigCostMonitor_tag)_check_install_python_modules.make
cmt_final_setup_check_install_python_modules = $(bin)setup_check_install_python_modules.make
cmt_local_check_install_python_modules_makefile = $(bin)check_install_python_modules.make

check_install_python_modules_extratags = -tag_add=target_check_install_python_modules

else

cmt_local_tagfile_check_install_python_modules = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_check_install_python_modules = $(bin)setup.make
cmt_local_check_install_python_modules_makefile = $(bin)check_install_python_modules.make

endif

not_check_install_python_modules_dependencies = { n=0; for p in $?; do m=0; for d in $(check_install_python_modules_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
check_install_python_modulesdirs :
	@if test ! -d $(bin)check_install_python_modules; then $(mkdir) -p $(bin)check_install_python_modules; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)check_install_python_modules
else
check_install_python_modulesdirs : ;
endif

ifdef cmt_check_install_python_modules_has_target_tag

ifndef QUICK
$(cmt_local_check_install_python_modules_makefile) : $(check_install_python_modules_dependencies) build_library_links
	$(echo) "(constituents.make) Building check_install_python_modules.make"; \
	  $(cmtexe) -tag=$(tags) $(check_install_python_modules_extratags) build constituent_config -out=$(cmt_local_check_install_python_modules_makefile) check_install_python_modules
else
$(cmt_local_check_install_python_modules_makefile) : $(check_install_python_modules_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_check_install_python_modules) ] || \
	  [ ! -f $(cmt_final_setup_check_install_python_modules) ] || \
	  $(not_check_install_python_modules_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building check_install_python_modules.make"; \
	  $(cmtexe) -tag=$(tags) $(check_install_python_modules_extratags) build constituent_config -out=$(cmt_local_check_install_python_modules_makefile) check_install_python_modules; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_check_install_python_modules_makefile) : $(check_install_python_modules_dependencies) build_library_links
	$(echo) "(constituents.make) Building check_install_python_modules.make"; \
	  $(cmtexe) -f=$(bin)check_install_python_modules.in -tag=$(tags) $(check_install_python_modules_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_check_install_python_modules_makefile) check_install_python_modules
else
$(cmt_local_check_install_python_modules_makefile) : $(check_install_python_modules_dependencies) $(cmt_build_library_linksstamp) $(bin)check_install_python_modules.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_check_install_python_modules) ] || \
	  [ ! -f $(cmt_final_setup_check_install_python_modules) ] || \
	  $(not_check_install_python_modules_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building check_install_python_modules.make"; \
	  $(cmtexe) -f=$(bin)check_install_python_modules.in -tag=$(tags) $(check_install_python_modules_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_check_install_python_modules_makefile) check_install_python_modules; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(check_install_python_modules_extratags) build constituent_makefile -out=$(cmt_local_check_install_python_modules_makefile) check_install_python_modules

check_install_python_modules :: $(check_install_python_modules_dependencies) $(cmt_local_check_install_python_modules_makefile) dirs check_install_python_modulesdirs
	$(echo) "(constituents.make) Starting check_install_python_modules"
	@if test -f $(cmt_local_check_install_python_modules_makefile); then \
	  $(MAKE) -f $(cmt_local_check_install_python_modules_makefile) check_install_python_modules; \
	  fi
#	@$(MAKE) -f $(cmt_local_check_install_python_modules_makefile) check_install_python_modules
	$(echo) "(constituents.make) check_install_python_modules done"

clean :: check_install_python_modulesclean ;

check_install_python_modulesclean :: $(check_install_python_modulesclean_dependencies) ##$(cmt_local_check_install_python_modules_makefile)
	$(echo) "(constituents.make) Starting check_install_python_modulesclean"
	@-if test -f $(cmt_local_check_install_python_modules_makefile); then \
	  $(MAKE) -f $(cmt_local_check_install_python_modules_makefile) check_install_python_modulesclean; \
	fi
	$(echo) "(constituents.make) check_install_python_modulesclean done"
#	@-$(MAKE) -f $(cmt_local_check_install_python_modules_makefile) check_install_python_modulesclean

##	  /bin/rm -f $(cmt_local_check_install_python_modules_makefile) $(bin)check_install_python_modules_dependencies.make

install :: check_install_python_modulesinstall ;

check_install_python_modulesinstall :: $(check_install_python_modules_dependencies) $(cmt_local_check_install_python_modules_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_check_install_python_modules_makefile); then \
	  $(MAKE) -f $(cmt_local_check_install_python_modules_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_check_install_python_modules_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : check_install_python_modulesuninstall

$(foreach d,$(check_install_python_modules_dependencies),$(eval $(d)uninstall_dependencies += check_install_python_modulesuninstall))

check_install_python_modulesuninstall : $(check_install_python_modulesuninstall_dependencies) ##$(cmt_local_check_install_python_modules_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_check_install_python_modules_makefile); then \
	  $(MAKE) -f $(cmt_local_check_install_python_modules_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_check_install_python_modules_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: check_install_python_modulesuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ check_install_python_modules"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ check_install_python_modules done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_check_install_joboptions_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_check_install_joboptions_has_target_tag

cmt_local_tagfile_check_install_joboptions = $(bin)$(TrigCostMonitor_tag)_check_install_joboptions.make
cmt_final_setup_check_install_joboptions = $(bin)setup_check_install_joboptions.make
cmt_local_check_install_joboptions_makefile = $(bin)check_install_joboptions.make

check_install_joboptions_extratags = -tag_add=target_check_install_joboptions

else

cmt_local_tagfile_check_install_joboptions = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_check_install_joboptions = $(bin)setup.make
cmt_local_check_install_joboptions_makefile = $(bin)check_install_joboptions.make

endif

not_check_install_joboptions_dependencies = { n=0; for p in $?; do m=0; for d in $(check_install_joboptions_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
check_install_joboptionsdirs :
	@if test ! -d $(bin)check_install_joboptions; then $(mkdir) -p $(bin)check_install_joboptions; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)check_install_joboptions
else
check_install_joboptionsdirs : ;
endif

ifdef cmt_check_install_joboptions_has_target_tag

ifndef QUICK
$(cmt_local_check_install_joboptions_makefile) : $(check_install_joboptions_dependencies) build_library_links
	$(echo) "(constituents.make) Building check_install_joboptions.make"; \
	  $(cmtexe) -tag=$(tags) $(check_install_joboptions_extratags) build constituent_config -out=$(cmt_local_check_install_joboptions_makefile) check_install_joboptions
else
$(cmt_local_check_install_joboptions_makefile) : $(check_install_joboptions_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_check_install_joboptions) ] || \
	  [ ! -f $(cmt_final_setup_check_install_joboptions) ] || \
	  $(not_check_install_joboptions_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building check_install_joboptions.make"; \
	  $(cmtexe) -tag=$(tags) $(check_install_joboptions_extratags) build constituent_config -out=$(cmt_local_check_install_joboptions_makefile) check_install_joboptions; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_check_install_joboptions_makefile) : $(check_install_joboptions_dependencies) build_library_links
	$(echo) "(constituents.make) Building check_install_joboptions.make"; \
	  $(cmtexe) -f=$(bin)check_install_joboptions.in -tag=$(tags) $(check_install_joboptions_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_check_install_joboptions_makefile) check_install_joboptions
else
$(cmt_local_check_install_joboptions_makefile) : $(check_install_joboptions_dependencies) $(cmt_build_library_linksstamp) $(bin)check_install_joboptions.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_check_install_joboptions) ] || \
	  [ ! -f $(cmt_final_setup_check_install_joboptions) ] || \
	  $(not_check_install_joboptions_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building check_install_joboptions.make"; \
	  $(cmtexe) -f=$(bin)check_install_joboptions.in -tag=$(tags) $(check_install_joboptions_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_check_install_joboptions_makefile) check_install_joboptions; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(check_install_joboptions_extratags) build constituent_makefile -out=$(cmt_local_check_install_joboptions_makefile) check_install_joboptions

check_install_joboptions :: $(check_install_joboptions_dependencies) $(cmt_local_check_install_joboptions_makefile) dirs check_install_joboptionsdirs
	$(echo) "(constituents.make) Starting check_install_joboptions"
	@if test -f $(cmt_local_check_install_joboptions_makefile); then \
	  $(MAKE) -f $(cmt_local_check_install_joboptions_makefile) check_install_joboptions; \
	  fi
#	@$(MAKE) -f $(cmt_local_check_install_joboptions_makefile) check_install_joboptions
	$(echo) "(constituents.make) check_install_joboptions done"

clean :: check_install_joboptionsclean ;

check_install_joboptionsclean :: $(check_install_joboptionsclean_dependencies) ##$(cmt_local_check_install_joboptions_makefile)
	$(echo) "(constituents.make) Starting check_install_joboptionsclean"
	@-if test -f $(cmt_local_check_install_joboptions_makefile); then \
	  $(MAKE) -f $(cmt_local_check_install_joboptions_makefile) check_install_joboptionsclean; \
	fi
	$(echo) "(constituents.make) check_install_joboptionsclean done"
#	@-$(MAKE) -f $(cmt_local_check_install_joboptions_makefile) check_install_joboptionsclean

##	  /bin/rm -f $(cmt_local_check_install_joboptions_makefile) $(bin)check_install_joboptions_dependencies.make

install :: check_install_joboptionsinstall ;

check_install_joboptionsinstall :: $(check_install_joboptions_dependencies) $(cmt_local_check_install_joboptions_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_check_install_joboptions_makefile); then \
	  $(MAKE) -f $(cmt_local_check_install_joboptions_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_check_install_joboptions_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : check_install_joboptionsuninstall

$(foreach d,$(check_install_joboptions_dependencies),$(eval $(d)uninstall_dependencies += check_install_joboptionsuninstall))

check_install_joboptionsuninstall : $(check_install_joboptionsuninstall_dependencies) ##$(cmt_local_check_install_joboptions_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_check_install_joboptions_makefile); then \
	  $(MAKE) -f $(cmt_local_check_install_joboptions_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_check_install_joboptions_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: check_install_joboptionsuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ check_install_joboptions"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ check_install_joboptions done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_check_install_runtime_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_check_install_runtime_has_target_tag

cmt_local_tagfile_check_install_runtime = $(bin)$(TrigCostMonitor_tag)_check_install_runtime.make
cmt_final_setup_check_install_runtime = $(bin)setup_check_install_runtime.make
cmt_local_check_install_runtime_makefile = $(bin)check_install_runtime.make

check_install_runtime_extratags = -tag_add=target_check_install_runtime

else

cmt_local_tagfile_check_install_runtime = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_check_install_runtime = $(bin)setup.make
cmt_local_check_install_runtime_makefile = $(bin)check_install_runtime.make

endif

not_check_install_runtime_dependencies = { n=0; for p in $?; do m=0; for d in $(check_install_runtime_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
check_install_runtimedirs :
	@if test ! -d $(bin)check_install_runtime; then $(mkdir) -p $(bin)check_install_runtime; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)check_install_runtime
else
check_install_runtimedirs : ;
endif

ifdef cmt_check_install_runtime_has_target_tag

ifndef QUICK
$(cmt_local_check_install_runtime_makefile) : $(check_install_runtime_dependencies) build_library_links
	$(echo) "(constituents.make) Building check_install_runtime.make"; \
	  $(cmtexe) -tag=$(tags) $(check_install_runtime_extratags) build constituent_config -out=$(cmt_local_check_install_runtime_makefile) check_install_runtime
else
$(cmt_local_check_install_runtime_makefile) : $(check_install_runtime_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_check_install_runtime) ] || \
	  [ ! -f $(cmt_final_setup_check_install_runtime) ] || \
	  $(not_check_install_runtime_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building check_install_runtime.make"; \
	  $(cmtexe) -tag=$(tags) $(check_install_runtime_extratags) build constituent_config -out=$(cmt_local_check_install_runtime_makefile) check_install_runtime; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_check_install_runtime_makefile) : $(check_install_runtime_dependencies) build_library_links
	$(echo) "(constituents.make) Building check_install_runtime.make"; \
	  $(cmtexe) -f=$(bin)check_install_runtime.in -tag=$(tags) $(check_install_runtime_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_check_install_runtime_makefile) check_install_runtime
else
$(cmt_local_check_install_runtime_makefile) : $(check_install_runtime_dependencies) $(cmt_build_library_linksstamp) $(bin)check_install_runtime.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_check_install_runtime) ] || \
	  [ ! -f $(cmt_final_setup_check_install_runtime) ] || \
	  $(not_check_install_runtime_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building check_install_runtime.make"; \
	  $(cmtexe) -f=$(bin)check_install_runtime.in -tag=$(tags) $(check_install_runtime_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_check_install_runtime_makefile) check_install_runtime; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(check_install_runtime_extratags) build constituent_makefile -out=$(cmt_local_check_install_runtime_makefile) check_install_runtime

check_install_runtime :: $(check_install_runtime_dependencies) $(cmt_local_check_install_runtime_makefile) dirs check_install_runtimedirs
	$(echo) "(constituents.make) Starting check_install_runtime"
	@if test -f $(cmt_local_check_install_runtime_makefile); then \
	  $(MAKE) -f $(cmt_local_check_install_runtime_makefile) check_install_runtime; \
	  fi
#	@$(MAKE) -f $(cmt_local_check_install_runtime_makefile) check_install_runtime
	$(echo) "(constituents.make) check_install_runtime done"

clean :: check_install_runtimeclean ;

check_install_runtimeclean :: $(check_install_runtimeclean_dependencies) ##$(cmt_local_check_install_runtime_makefile)
	$(echo) "(constituents.make) Starting check_install_runtimeclean"
	@-if test -f $(cmt_local_check_install_runtime_makefile); then \
	  $(MAKE) -f $(cmt_local_check_install_runtime_makefile) check_install_runtimeclean; \
	fi
	$(echo) "(constituents.make) check_install_runtimeclean done"
#	@-$(MAKE) -f $(cmt_local_check_install_runtime_makefile) check_install_runtimeclean

##	  /bin/rm -f $(cmt_local_check_install_runtime_makefile) $(bin)check_install_runtime_dependencies.make

install :: check_install_runtimeinstall ;

check_install_runtimeinstall :: $(check_install_runtime_dependencies) $(cmt_local_check_install_runtime_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_check_install_runtime_makefile); then \
	  $(MAKE) -f $(cmt_local_check_install_runtime_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_check_install_runtime_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : check_install_runtimeuninstall

$(foreach d,$(check_install_runtime_dependencies),$(eval $(d)uninstall_dependencies += check_install_runtimeuninstall))

check_install_runtimeuninstall : $(check_install_runtimeuninstall_dependencies) ##$(cmt_local_check_install_runtime_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_check_install_runtime_makefile); then \
	  $(MAKE) -f $(cmt_local_check_install_runtime_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_check_install_runtime_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: check_install_runtimeuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ check_install_runtime"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ check_install_runtime done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_has_target_tag

cmt_local_tagfile_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap = $(bin)$(TrigCostMonitor_tag)_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap.make
cmt_final_setup_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap = $(bin)setup_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap.make
cmt_local_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile = $(bin)check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap.make

check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_extratags = -tag_add=target_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap

else

cmt_local_tagfile_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap = $(bin)setup.make
cmt_local_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile = $(bin)check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap.make

endif

not_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_dependencies = { n=0; for p in $?; do m=0; for d in $(check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
check_install_TrigCostMonitorDict_TrigCostMonitordictrootmapdirs :
	@if test ! -d $(bin)check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap; then $(mkdir) -p $(bin)check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap
else
check_install_TrigCostMonitorDict_TrigCostMonitordictrootmapdirs : ;
endif

ifdef cmt_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_has_target_tag

ifndef QUICK
$(cmt_local_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) : $(check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_dependencies) build_library_links
	$(echo) "(constituents.make) Building check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap.make"; \
	  $(cmtexe) -tag=$(tags) $(check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_extratags) build constituent_config -out=$(cmt_local_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap
else
$(cmt_local_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) : $(check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap) ] || \
	  [ ! -f $(cmt_final_setup_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap) ] || \
	  $(not_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap.make"; \
	  $(cmtexe) -tag=$(tags) $(check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_extratags) build constituent_config -out=$(cmt_local_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) : $(check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_dependencies) build_library_links
	$(echo) "(constituents.make) Building check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap.make"; \
	  $(cmtexe) -f=$(bin)check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap.in -tag=$(tags) $(check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap
else
$(cmt_local_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) : $(check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_dependencies) $(cmt_build_library_linksstamp) $(bin)check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap) ] || \
	  [ ! -f $(cmt_final_setup_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap) ] || \
	  $(not_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap.make"; \
	  $(cmtexe) -f=$(bin)check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap.in -tag=$(tags) $(check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_extratags) build constituent_makefile -out=$(cmt_local_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap

check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap :: $(check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_dependencies) $(cmt_local_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) dirs check_install_TrigCostMonitorDict_TrigCostMonitordictrootmapdirs
	$(echo) "(constituents.make) Starting check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap"
	@if test -f $(cmt_local_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile); then \
	  $(MAKE) -f $(cmt_local_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap; \
	  fi
#	@$(MAKE) -f $(cmt_local_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap
	$(echo) "(constituents.make) check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap done"

clean :: check_install_TrigCostMonitorDict_TrigCostMonitordictrootmapclean ;

check_install_TrigCostMonitorDict_TrigCostMonitordictrootmapclean :: $(check_install_TrigCostMonitorDict_TrigCostMonitordictrootmapclean_dependencies) ##$(cmt_local_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile)
	$(echo) "(constituents.make) Starting check_install_TrigCostMonitorDict_TrigCostMonitordictrootmapclean"
	@-if test -f $(cmt_local_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile); then \
	  $(MAKE) -f $(cmt_local_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) check_install_TrigCostMonitorDict_TrigCostMonitordictrootmapclean; \
	fi
	$(echo) "(constituents.make) check_install_TrigCostMonitorDict_TrigCostMonitordictrootmapclean done"
#	@-$(MAKE) -f $(cmt_local_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) check_install_TrigCostMonitorDict_TrigCostMonitordictrootmapclean

##	  /bin/rm -f $(cmt_local_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) $(bin)check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_dependencies.make

install :: check_install_TrigCostMonitorDict_TrigCostMonitordictrootmapinstall ;

check_install_TrigCostMonitorDict_TrigCostMonitordictrootmapinstall :: $(check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_dependencies) $(cmt_local_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile); then \
	  $(MAKE) -f $(cmt_local_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : check_install_TrigCostMonitorDict_TrigCostMonitordictrootmapuninstall

$(foreach d,$(check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_dependencies),$(eval $(d)uninstall_dependencies += check_install_TrigCostMonitorDict_TrigCostMonitordictrootmapuninstall))

check_install_TrigCostMonitorDict_TrigCostMonitordictrootmapuninstall : $(check_install_TrigCostMonitorDict_TrigCostMonitordictrootmapuninstall_dependencies) ##$(cmt_local_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile); then \
	  $(MAKE) -f $(cmt_local_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: check_install_TrigCostMonitorDict_TrigCostMonitordictrootmapuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ check_install_TrigCostMonitorDict_TrigCostMonitordictrootmap done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_TrigCostMonitorDict_NICOS_Fix_debuginfo_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_TrigCostMonitorDict_NICOS_Fix_debuginfo_has_target_tag

cmt_local_tagfile_TrigCostMonitorDict_NICOS_Fix_debuginfo = $(bin)$(TrigCostMonitor_tag)_TrigCostMonitorDict_NICOS_Fix_debuginfo.make
cmt_final_setup_TrigCostMonitorDict_NICOS_Fix_debuginfo = $(bin)setup_TrigCostMonitorDict_NICOS_Fix_debuginfo.make
cmt_local_TrigCostMonitorDict_NICOS_Fix_debuginfo_makefile = $(bin)TrigCostMonitorDict_NICOS_Fix_debuginfo.make

TrigCostMonitorDict_NICOS_Fix_debuginfo_extratags = -tag_add=target_TrigCostMonitorDict_NICOS_Fix_debuginfo

else

cmt_local_tagfile_TrigCostMonitorDict_NICOS_Fix_debuginfo = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_TrigCostMonitorDict_NICOS_Fix_debuginfo = $(bin)setup.make
cmt_local_TrigCostMonitorDict_NICOS_Fix_debuginfo_makefile = $(bin)TrigCostMonitorDict_NICOS_Fix_debuginfo.make

endif

not_TrigCostMonitorDict_NICOS_Fix_debuginfo_dependencies = { n=0; for p in $?; do m=0; for d in $(TrigCostMonitorDict_NICOS_Fix_debuginfo_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
TrigCostMonitorDict_NICOS_Fix_debuginfodirs :
	@if test ! -d $(bin)TrigCostMonitorDict_NICOS_Fix_debuginfo; then $(mkdir) -p $(bin)TrigCostMonitorDict_NICOS_Fix_debuginfo; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)TrigCostMonitorDict_NICOS_Fix_debuginfo
else
TrigCostMonitorDict_NICOS_Fix_debuginfodirs : ;
endif

ifdef cmt_TrigCostMonitorDict_NICOS_Fix_debuginfo_has_target_tag

ifndef QUICK
$(cmt_local_TrigCostMonitorDict_NICOS_Fix_debuginfo_makefile) : $(TrigCostMonitorDict_NICOS_Fix_debuginfo_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitorDict_NICOS_Fix_debuginfo.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorDict_NICOS_Fix_debuginfo_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitorDict_NICOS_Fix_debuginfo_makefile) TrigCostMonitorDict_NICOS_Fix_debuginfo
else
$(cmt_local_TrigCostMonitorDict_NICOS_Fix_debuginfo_makefile) : $(TrigCostMonitorDict_NICOS_Fix_debuginfo_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitorDict_NICOS_Fix_debuginfo) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitorDict_NICOS_Fix_debuginfo) ] || \
	  $(not_TrigCostMonitorDict_NICOS_Fix_debuginfo_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitorDict_NICOS_Fix_debuginfo.make"; \
	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorDict_NICOS_Fix_debuginfo_extratags) build constituent_config -out=$(cmt_local_TrigCostMonitorDict_NICOS_Fix_debuginfo_makefile) TrigCostMonitorDict_NICOS_Fix_debuginfo; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_TrigCostMonitorDict_NICOS_Fix_debuginfo_makefile) : $(TrigCostMonitorDict_NICOS_Fix_debuginfo_dependencies) build_library_links
	$(echo) "(constituents.make) Building TrigCostMonitorDict_NICOS_Fix_debuginfo.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitorDict_NICOS_Fix_debuginfo.in -tag=$(tags) $(TrigCostMonitorDict_NICOS_Fix_debuginfo_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitorDict_NICOS_Fix_debuginfo_makefile) TrigCostMonitorDict_NICOS_Fix_debuginfo
else
$(cmt_local_TrigCostMonitorDict_NICOS_Fix_debuginfo_makefile) : $(TrigCostMonitorDict_NICOS_Fix_debuginfo_dependencies) $(cmt_build_library_linksstamp) $(bin)TrigCostMonitorDict_NICOS_Fix_debuginfo.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_TrigCostMonitorDict_NICOS_Fix_debuginfo) ] || \
	  [ ! -f $(cmt_final_setup_TrigCostMonitorDict_NICOS_Fix_debuginfo) ] || \
	  $(not_TrigCostMonitorDict_NICOS_Fix_debuginfo_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building TrigCostMonitorDict_NICOS_Fix_debuginfo.make"; \
	  $(cmtexe) -f=$(bin)TrigCostMonitorDict_NICOS_Fix_debuginfo.in -tag=$(tags) $(TrigCostMonitorDict_NICOS_Fix_debuginfo_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_TrigCostMonitorDict_NICOS_Fix_debuginfo_makefile) TrigCostMonitorDict_NICOS_Fix_debuginfo; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(TrigCostMonitorDict_NICOS_Fix_debuginfo_extratags) build constituent_makefile -out=$(cmt_local_TrigCostMonitorDict_NICOS_Fix_debuginfo_makefile) TrigCostMonitorDict_NICOS_Fix_debuginfo

TrigCostMonitorDict_NICOS_Fix_debuginfo :: $(TrigCostMonitorDict_NICOS_Fix_debuginfo_dependencies) $(cmt_local_TrigCostMonitorDict_NICOS_Fix_debuginfo_makefile) dirs TrigCostMonitorDict_NICOS_Fix_debuginfodirs
	$(echo) "(constituents.make) Starting TrigCostMonitorDict_NICOS_Fix_debuginfo"
	@if test -f $(cmt_local_TrigCostMonitorDict_NICOS_Fix_debuginfo_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorDict_NICOS_Fix_debuginfo_makefile) TrigCostMonitorDict_NICOS_Fix_debuginfo; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitorDict_NICOS_Fix_debuginfo_makefile) TrigCostMonitorDict_NICOS_Fix_debuginfo
	$(echo) "(constituents.make) TrigCostMonitorDict_NICOS_Fix_debuginfo done"

clean :: TrigCostMonitorDict_NICOS_Fix_debuginfoclean ;

TrigCostMonitorDict_NICOS_Fix_debuginfoclean :: $(TrigCostMonitorDict_NICOS_Fix_debuginfoclean_dependencies) ##$(cmt_local_TrigCostMonitorDict_NICOS_Fix_debuginfo_makefile)
	$(echo) "(constituents.make) Starting TrigCostMonitorDict_NICOS_Fix_debuginfoclean"
	@-if test -f $(cmt_local_TrigCostMonitorDict_NICOS_Fix_debuginfo_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorDict_NICOS_Fix_debuginfo_makefile) TrigCostMonitorDict_NICOS_Fix_debuginfoclean; \
	fi
	$(echo) "(constituents.make) TrigCostMonitorDict_NICOS_Fix_debuginfoclean done"
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitorDict_NICOS_Fix_debuginfo_makefile) TrigCostMonitorDict_NICOS_Fix_debuginfoclean

##	  /bin/rm -f $(cmt_local_TrigCostMonitorDict_NICOS_Fix_debuginfo_makefile) $(bin)TrigCostMonitorDict_NICOS_Fix_debuginfo_dependencies.make

install :: TrigCostMonitorDict_NICOS_Fix_debuginfoinstall ;

TrigCostMonitorDict_NICOS_Fix_debuginfoinstall :: $(TrigCostMonitorDict_NICOS_Fix_debuginfo_dependencies) $(cmt_local_TrigCostMonitorDict_NICOS_Fix_debuginfo_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_TrigCostMonitorDict_NICOS_Fix_debuginfo_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorDict_NICOS_Fix_debuginfo_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_TrigCostMonitorDict_NICOS_Fix_debuginfo_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : TrigCostMonitorDict_NICOS_Fix_debuginfouninstall

$(foreach d,$(TrigCostMonitorDict_NICOS_Fix_debuginfo_dependencies),$(eval $(d)uninstall_dependencies += TrigCostMonitorDict_NICOS_Fix_debuginfouninstall))

TrigCostMonitorDict_NICOS_Fix_debuginfouninstall : $(TrigCostMonitorDict_NICOS_Fix_debuginfouninstall_dependencies) ##$(cmt_local_TrigCostMonitorDict_NICOS_Fix_debuginfo_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_TrigCostMonitorDict_NICOS_Fix_debuginfo_makefile); then \
	  $(MAKE) -f $(cmt_local_TrigCostMonitorDict_NICOS_Fix_debuginfo_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_TrigCostMonitorDict_NICOS_Fix_debuginfo_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: TrigCostMonitorDict_NICOS_Fix_debuginfouninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ TrigCostMonitorDict_NICOS_Fix_debuginfo"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ TrigCostMonitorDict_NICOS_Fix_debuginfo done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_find_packages_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_find_packages_has_target_tag

cmt_local_tagfile_find_packages = $(bin)$(TrigCostMonitor_tag)_find_packages.make
cmt_final_setup_find_packages = $(bin)setup_find_packages.make
cmt_local_find_packages_makefile = $(bin)find_packages.make

find_packages_extratags = -tag_add=target_find_packages

else

cmt_local_tagfile_find_packages = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_find_packages = $(bin)setup.make
cmt_local_find_packages_makefile = $(bin)find_packages.make

endif

not_find_packages_dependencies = { n=0; for p in $?; do m=0; for d in $(find_packages_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
find_packagesdirs :
	@if test ! -d $(bin)find_packages; then $(mkdir) -p $(bin)find_packages; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)find_packages
else
find_packagesdirs : ;
endif

ifdef cmt_find_packages_has_target_tag

ifndef QUICK
$(cmt_local_find_packages_makefile) : $(find_packages_dependencies) build_library_links
	$(echo) "(constituents.make) Building find_packages.make"; \
	  $(cmtexe) -tag=$(tags) $(find_packages_extratags) build constituent_config -out=$(cmt_local_find_packages_makefile) find_packages
else
$(cmt_local_find_packages_makefile) : $(find_packages_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_find_packages) ] || \
	  [ ! -f $(cmt_final_setup_find_packages) ] || \
	  $(not_find_packages_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building find_packages.make"; \
	  $(cmtexe) -tag=$(tags) $(find_packages_extratags) build constituent_config -out=$(cmt_local_find_packages_makefile) find_packages; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_find_packages_makefile) : $(find_packages_dependencies) build_library_links
	$(echo) "(constituents.make) Building find_packages.make"; \
	  $(cmtexe) -f=$(bin)find_packages.in -tag=$(tags) $(find_packages_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_find_packages_makefile) find_packages
else
$(cmt_local_find_packages_makefile) : $(find_packages_dependencies) $(cmt_build_library_linksstamp) $(bin)find_packages.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_find_packages) ] || \
	  [ ! -f $(cmt_final_setup_find_packages) ] || \
	  $(not_find_packages_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building find_packages.make"; \
	  $(cmtexe) -f=$(bin)find_packages.in -tag=$(tags) $(find_packages_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_find_packages_makefile) find_packages; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(find_packages_extratags) build constituent_makefile -out=$(cmt_local_find_packages_makefile) find_packages

find_packages :: $(find_packages_dependencies) $(cmt_local_find_packages_makefile) dirs find_packagesdirs
	$(echo) "(constituents.make) Starting find_packages"
	@if test -f $(cmt_local_find_packages_makefile); then \
	  $(MAKE) -f $(cmt_local_find_packages_makefile) find_packages; \
	  fi
#	@$(MAKE) -f $(cmt_local_find_packages_makefile) find_packages
	$(echo) "(constituents.make) find_packages done"

clean :: find_packagesclean ;

find_packagesclean :: $(find_packagesclean_dependencies) ##$(cmt_local_find_packages_makefile)
	$(echo) "(constituents.make) Starting find_packagesclean"
	@-if test -f $(cmt_local_find_packages_makefile); then \
	  $(MAKE) -f $(cmt_local_find_packages_makefile) find_packagesclean; \
	fi
	$(echo) "(constituents.make) find_packagesclean done"
#	@-$(MAKE) -f $(cmt_local_find_packages_makefile) find_packagesclean

##	  /bin/rm -f $(cmt_local_find_packages_makefile) $(bin)find_packages_dependencies.make

install :: find_packagesinstall ;

find_packagesinstall :: $(find_packages_dependencies) $(cmt_local_find_packages_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_find_packages_makefile); then \
	  $(MAKE) -f $(cmt_local_find_packages_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_find_packages_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : find_packagesuninstall

$(foreach d,$(find_packages_dependencies),$(eval $(d)uninstall_dependencies += find_packagesuninstall))

find_packagesuninstall : $(find_packagesuninstall_dependencies) ##$(cmt_local_find_packages_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_find_packages_makefile); then \
	  $(MAKE) -f $(cmt_local_find_packages_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_find_packages_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: find_packagesuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ find_packages"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ find_packages done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_compile_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_compile_has_target_tag

cmt_local_tagfile_compile = $(bin)$(TrigCostMonitor_tag)_compile.make
cmt_final_setup_compile = $(bin)setup_compile.make
cmt_local_compile_makefile = $(bin)compile.make

compile_extratags = -tag_add=target_compile

else

cmt_local_tagfile_compile = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_compile = $(bin)setup.make
cmt_local_compile_makefile = $(bin)compile.make

endif

not_compile_dependencies = { n=0; for p in $?; do m=0; for d in $(compile_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
compiledirs :
	@if test ! -d $(bin)compile; then $(mkdir) -p $(bin)compile; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)compile
else
compiledirs : ;
endif

ifdef cmt_compile_has_target_tag

ifndef QUICK
$(cmt_local_compile_makefile) : $(compile_dependencies) build_library_links
	$(echo) "(constituents.make) Building compile.make"; \
	  $(cmtexe) -tag=$(tags) $(compile_extratags) build constituent_config -out=$(cmt_local_compile_makefile) compile
else
$(cmt_local_compile_makefile) : $(compile_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_compile) ] || \
	  [ ! -f $(cmt_final_setup_compile) ] || \
	  $(not_compile_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building compile.make"; \
	  $(cmtexe) -tag=$(tags) $(compile_extratags) build constituent_config -out=$(cmt_local_compile_makefile) compile; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_compile_makefile) : $(compile_dependencies) build_library_links
	$(echo) "(constituents.make) Building compile.make"; \
	  $(cmtexe) -f=$(bin)compile.in -tag=$(tags) $(compile_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_compile_makefile) compile
else
$(cmt_local_compile_makefile) : $(compile_dependencies) $(cmt_build_library_linksstamp) $(bin)compile.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_compile) ] || \
	  [ ! -f $(cmt_final_setup_compile) ] || \
	  $(not_compile_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building compile.make"; \
	  $(cmtexe) -f=$(bin)compile.in -tag=$(tags) $(compile_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_compile_makefile) compile; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(compile_extratags) build constituent_makefile -out=$(cmt_local_compile_makefile) compile

compile :: $(compile_dependencies) $(cmt_local_compile_makefile) dirs compiledirs
	$(echo) "(constituents.make) Starting compile"
	@if test -f $(cmt_local_compile_makefile); then \
	  $(MAKE) -f $(cmt_local_compile_makefile) compile; \
	  fi
#	@$(MAKE) -f $(cmt_local_compile_makefile) compile
	$(echo) "(constituents.make) compile done"

clean :: compileclean ;

compileclean :: $(compileclean_dependencies) ##$(cmt_local_compile_makefile)
	$(echo) "(constituents.make) Starting compileclean"
	@-if test -f $(cmt_local_compile_makefile); then \
	  $(MAKE) -f $(cmt_local_compile_makefile) compileclean; \
	fi
	$(echo) "(constituents.make) compileclean done"
#	@-$(MAKE) -f $(cmt_local_compile_makefile) compileclean

##	  /bin/rm -f $(cmt_local_compile_makefile) $(bin)compile_dependencies.make

install :: compileinstall ;

compileinstall :: $(compile_dependencies) $(cmt_local_compile_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_compile_makefile); then \
	  $(MAKE) -f $(cmt_local_compile_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_compile_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : compileuninstall

$(foreach d,$(compile_dependencies),$(eval $(d)uninstall_dependencies += compileuninstall))

compileuninstall : $(compileuninstall_dependencies) ##$(cmt_local_compile_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_compile_makefile); then \
	  $(MAKE) -f $(cmt_local_compile_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_compile_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: compileuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ compile"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ compile done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_compile_pkg_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_compile_pkg_has_target_tag

cmt_local_tagfile_compile_pkg = $(bin)$(TrigCostMonitor_tag)_compile_pkg.make
cmt_final_setup_compile_pkg = $(bin)setup_compile_pkg.make
cmt_local_compile_pkg_makefile = $(bin)compile_pkg.make

compile_pkg_extratags = -tag_add=target_compile_pkg

else

cmt_local_tagfile_compile_pkg = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_compile_pkg = $(bin)setup.make
cmt_local_compile_pkg_makefile = $(bin)compile_pkg.make

endif

not_compile_pkg_dependencies = { n=0; for p in $?; do m=0; for d in $(compile_pkg_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
compile_pkgdirs :
	@if test ! -d $(bin)compile_pkg; then $(mkdir) -p $(bin)compile_pkg; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)compile_pkg
else
compile_pkgdirs : ;
endif

ifdef cmt_compile_pkg_has_target_tag

ifndef QUICK
$(cmt_local_compile_pkg_makefile) : $(compile_pkg_dependencies) build_library_links
	$(echo) "(constituents.make) Building compile_pkg.make"; \
	  $(cmtexe) -tag=$(tags) $(compile_pkg_extratags) build constituent_config -out=$(cmt_local_compile_pkg_makefile) compile_pkg
else
$(cmt_local_compile_pkg_makefile) : $(compile_pkg_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_compile_pkg) ] || \
	  [ ! -f $(cmt_final_setup_compile_pkg) ] || \
	  $(not_compile_pkg_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building compile_pkg.make"; \
	  $(cmtexe) -tag=$(tags) $(compile_pkg_extratags) build constituent_config -out=$(cmt_local_compile_pkg_makefile) compile_pkg; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_compile_pkg_makefile) : $(compile_pkg_dependencies) build_library_links
	$(echo) "(constituents.make) Building compile_pkg.make"; \
	  $(cmtexe) -f=$(bin)compile_pkg.in -tag=$(tags) $(compile_pkg_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_compile_pkg_makefile) compile_pkg
else
$(cmt_local_compile_pkg_makefile) : $(compile_pkg_dependencies) $(cmt_build_library_linksstamp) $(bin)compile_pkg.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_compile_pkg) ] || \
	  [ ! -f $(cmt_final_setup_compile_pkg) ] || \
	  $(not_compile_pkg_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building compile_pkg.make"; \
	  $(cmtexe) -f=$(bin)compile_pkg.in -tag=$(tags) $(compile_pkg_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_compile_pkg_makefile) compile_pkg; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(compile_pkg_extratags) build constituent_makefile -out=$(cmt_local_compile_pkg_makefile) compile_pkg

compile_pkg :: $(compile_pkg_dependencies) $(cmt_local_compile_pkg_makefile) dirs compile_pkgdirs
	$(echo) "(constituents.make) Starting compile_pkg"
	@if test -f $(cmt_local_compile_pkg_makefile); then \
	  $(MAKE) -f $(cmt_local_compile_pkg_makefile) compile_pkg; \
	  fi
#	@$(MAKE) -f $(cmt_local_compile_pkg_makefile) compile_pkg
	$(echo) "(constituents.make) compile_pkg done"

clean :: compile_pkgclean ;

compile_pkgclean :: $(compile_pkgclean_dependencies) ##$(cmt_local_compile_pkg_makefile)
	$(echo) "(constituents.make) Starting compile_pkgclean"
	@-if test -f $(cmt_local_compile_pkg_makefile); then \
	  $(MAKE) -f $(cmt_local_compile_pkg_makefile) compile_pkgclean; \
	fi
	$(echo) "(constituents.make) compile_pkgclean done"
#	@-$(MAKE) -f $(cmt_local_compile_pkg_makefile) compile_pkgclean

##	  /bin/rm -f $(cmt_local_compile_pkg_makefile) $(bin)compile_pkg_dependencies.make

install :: compile_pkginstall ;

compile_pkginstall :: $(compile_pkg_dependencies) $(cmt_local_compile_pkg_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_compile_pkg_makefile); then \
	  $(MAKE) -f $(cmt_local_compile_pkg_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_compile_pkg_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : compile_pkguninstall

$(foreach d,$(compile_pkg_dependencies),$(eval $(d)uninstall_dependencies += compile_pkguninstall))

compile_pkguninstall : $(compile_pkguninstall_dependencies) ##$(cmt_local_compile_pkg_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_compile_pkg_makefile); then \
	  $(MAKE) -f $(cmt_local_compile_pkg_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_compile_pkg_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: compile_pkguninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ compile_pkg"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ compile_pkg done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_new_analysisapp_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_new_analysisapp_has_target_tag

cmt_local_tagfile_new_analysisapp = $(bin)$(TrigCostMonitor_tag)_new_analysisapp.make
cmt_final_setup_new_analysisapp = $(bin)setup_new_analysisapp.make
cmt_local_new_analysisapp_makefile = $(bin)new_analysisapp.make

new_analysisapp_extratags = -tag_add=target_new_analysisapp

else

cmt_local_tagfile_new_analysisapp = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_new_analysisapp = $(bin)setup.make
cmt_local_new_analysisapp_makefile = $(bin)new_analysisapp.make

endif

not_new_analysisapp_dependencies = { n=0; for p in $?; do m=0; for d in $(new_analysisapp_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
new_analysisappdirs :
	@if test ! -d $(bin)new_analysisapp; then $(mkdir) -p $(bin)new_analysisapp; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)new_analysisapp
else
new_analysisappdirs : ;
endif

ifdef cmt_new_analysisapp_has_target_tag

ifndef QUICK
$(cmt_local_new_analysisapp_makefile) : $(new_analysisapp_dependencies) build_library_links
	$(echo) "(constituents.make) Building new_analysisapp.make"; \
	  $(cmtexe) -tag=$(tags) $(new_analysisapp_extratags) build constituent_config -out=$(cmt_local_new_analysisapp_makefile) new_analysisapp
else
$(cmt_local_new_analysisapp_makefile) : $(new_analysisapp_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_new_analysisapp) ] || \
	  [ ! -f $(cmt_final_setup_new_analysisapp) ] || \
	  $(not_new_analysisapp_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building new_analysisapp.make"; \
	  $(cmtexe) -tag=$(tags) $(new_analysisapp_extratags) build constituent_config -out=$(cmt_local_new_analysisapp_makefile) new_analysisapp; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_new_analysisapp_makefile) : $(new_analysisapp_dependencies) build_library_links
	$(echo) "(constituents.make) Building new_analysisapp.make"; \
	  $(cmtexe) -f=$(bin)new_analysisapp.in -tag=$(tags) $(new_analysisapp_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_new_analysisapp_makefile) new_analysisapp
else
$(cmt_local_new_analysisapp_makefile) : $(new_analysisapp_dependencies) $(cmt_build_library_linksstamp) $(bin)new_analysisapp.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_new_analysisapp) ] || \
	  [ ! -f $(cmt_final_setup_new_analysisapp) ] || \
	  $(not_new_analysisapp_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building new_analysisapp.make"; \
	  $(cmtexe) -f=$(bin)new_analysisapp.in -tag=$(tags) $(new_analysisapp_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_new_analysisapp_makefile) new_analysisapp; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(new_analysisapp_extratags) build constituent_makefile -out=$(cmt_local_new_analysisapp_makefile) new_analysisapp

new_analysisapp :: $(new_analysisapp_dependencies) $(cmt_local_new_analysisapp_makefile) dirs new_analysisappdirs
	$(echo) "(constituents.make) Starting new_analysisapp"
	@if test -f $(cmt_local_new_analysisapp_makefile); then \
	  $(MAKE) -f $(cmt_local_new_analysisapp_makefile) new_analysisapp; \
	  fi
#	@$(MAKE) -f $(cmt_local_new_analysisapp_makefile) new_analysisapp
	$(echo) "(constituents.make) new_analysisapp done"

clean :: new_analysisappclean ;

new_analysisappclean :: $(new_analysisappclean_dependencies) ##$(cmt_local_new_analysisapp_makefile)
	$(echo) "(constituents.make) Starting new_analysisappclean"
	@-if test -f $(cmt_local_new_analysisapp_makefile); then \
	  $(MAKE) -f $(cmt_local_new_analysisapp_makefile) new_analysisappclean; \
	fi
	$(echo) "(constituents.make) new_analysisappclean done"
#	@-$(MAKE) -f $(cmt_local_new_analysisapp_makefile) new_analysisappclean

##	  /bin/rm -f $(cmt_local_new_analysisapp_makefile) $(bin)new_analysisapp_dependencies.make

install :: new_analysisappinstall ;

new_analysisappinstall :: $(new_analysisapp_dependencies) $(cmt_local_new_analysisapp_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_new_analysisapp_makefile); then \
	  $(MAKE) -f $(cmt_local_new_analysisapp_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_new_analysisapp_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : new_analysisappuninstall

$(foreach d,$(new_analysisapp_dependencies),$(eval $(d)uninstall_dependencies += new_analysisappuninstall))

new_analysisappuninstall : $(new_analysisappuninstall_dependencies) ##$(cmt_local_new_analysisapp_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_new_analysisapp_makefile); then \
	  $(MAKE) -f $(cmt_local_new_analysisapp_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_new_analysisapp_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: new_analysisappuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ new_analysisapp"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ new_analysisapp done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_new_pkg_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_new_pkg_has_target_tag

cmt_local_tagfile_new_pkg = $(bin)$(TrigCostMonitor_tag)_new_pkg.make
cmt_final_setup_new_pkg = $(bin)setup_new_pkg.make
cmt_local_new_pkg_makefile = $(bin)new_pkg.make

new_pkg_extratags = -tag_add=target_new_pkg

else

cmt_local_tagfile_new_pkg = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_new_pkg = $(bin)setup.make
cmt_local_new_pkg_makefile = $(bin)new_pkg.make

endif

not_new_pkg_dependencies = { n=0; for p in $?; do m=0; for d in $(new_pkg_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
new_pkgdirs :
	@if test ! -d $(bin)new_pkg; then $(mkdir) -p $(bin)new_pkg; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)new_pkg
else
new_pkgdirs : ;
endif

ifdef cmt_new_pkg_has_target_tag

ifndef QUICK
$(cmt_local_new_pkg_makefile) : $(new_pkg_dependencies) build_library_links
	$(echo) "(constituents.make) Building new_pkg.make"; \
	  $(cmtexe) -tag=$(tags) $(new_pkg_extratags) build constituent_config -out=$(cmt_local_new_pkg_makefile) new_pkg
else
$(cmt_local_new_pkg_makefile) : $(new_pkg_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_new_pkg) ] || \
	  [ ! -f $(cmt_final_setup_new_pkg) ] || \
	  $(not_new_pkg_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building new_pkg.make"; \
	  $(cmtexe) -tag=$(tags) $(new_pkg_extratags) build constituent_config -out=$(cmt_local_new_pkg_makefile) new_pkg; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_new_pkg_makefile) : $(new_pkg_dependencies) build_library_links
	$(echo) "(constituents.make) Building new_pkg.make"; \
	  $(cmtexe) -f=$(bin)new_pkg.in -tag=$(tags) $(new_pkg_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_new_pkg_makefile) new_pkg
else
$(cmt_local_new_pkg_makefile) : $(new_pkg_dependencies) $(cmt_build_library_linksstamp) $(bin)new_pkg.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_new_pkg) ] || \
	  [ ! -f $(cmt_final_setup_new_pkg) ] || \
	  $(not_new_pkg_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building new_pkg.make"; \
	  $(cmtexe) -f=$(bin)new_pkg.in -tag=$(tags) $(new_pkg_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_new_pkg_makefile) new_pkg; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(new_pkg_extratags) build constituent_makefile -out=$(cmt_local_new_pkg_makefile) new_pkg

new_pkg :: $(new_pkg_dependencies) $(cmt_local_new_pkg_makefile) dirs new_pkgdirs
	$(echo) "(constituents.make) Starting new_pkg"
	@if test -f $(cmt_local_new_pkg_makefile); then \
	  $(MAKE) -f $(cmt_local_new_pkg_makefile) new_pkg; \
	  fi
#	@$(MAKE) -f $(cmt_local_new_pkg_makefile) new_pkg
	$(echo) "(constituents.make) new_pkg done"

clean :: new_pkgclean ;

new_pkgclean :: $(new_pkgclean_dependencies) ##$(cmt_local_new_pkg_makefile)
	$(echo) "(constituents.make) Starting new_pkgclean"
	@-if test -f $(cmt_local_new_pkg_makefile); then \
	  $(MAKE) -f $(cmt_local_new_pkg_makefile) new_pkgclean; \
	fi
	$(echo) "(constituents.make) new_pkgclean done"
#	@-$(MAKE) -f $(cmt_local_new_pkg_makefile) new_pkgclean

##	  /bin/rm -f $(cmt_local_new_pkg_makefile) $(bin)new_pkg_dependencies.make

install :: new_pkginstall ;

new_pkginstall :: $(new_pkg_dependencies) $(cmt_local_new_pkg_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_new_pkg_makefile); then \
	  $(MAKE) -f $(cmt_local_new_pkg_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_new_pkg_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : new_pkguninstall

$(foreach d,$(new_pkg_dependencies),$(eval $(d)uninstall_dependencies += new_pkguninstall))

new_pkguninstall : $(new_pkguninstall_dependencies) ##$(cmt_local_new_pkg_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_new_pkg_makefile); then \
	  $(MAKE) -f $(cmt_local_new_pkg_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_new_pkg_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: new_pkguninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ new_pkg"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ new_pkg done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_new_alg_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_new_alg_has_target_tag

cmt_local_tagfile_new_alg = $(bin)$(TrigCostMonitor_tag)_new_alg.make
cmt_final_setup_new_alg = $(bin)setup_new_alg.make
cmt_local_new_alg_makefile = $(bin)new_alg.make

new_alg_extratags = -tag_add=target_new_alg

else

cmt_local_tagfile_new_alg = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_new_alg = $(bin)setup.make
cmt_local_new_alg_makefile = $(bin)new_alg.make

endif

not_new_alg_dependencies = { n=0; for p in $?; do m=0; for d in $(new_alg_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
new_algdirs :
	@if test ! -d $(bin)new_alg; then $(mkdir) -p $(bin)new_alg; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)new_alg
else
new_algdirs : ;
endif

ifdef cmt_new_alg_has_target_tag

ifndef QUICK
$(cmt_local_new_alg_makefile) : $(new_alg_dependencies) build_library_links
	$(echo) "(constituents.make) Building new_alg.make"; \
	  $(cmtexe) -tag=$(tags) $(new_alg_extratags) build constituent_config -out=$(cmt_local_new_alg_makefile) new_alg
else
$(cmt_local_new_alg_makefile) : $(new_alg_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_new_alg) ] || \
	  [ ! -f $(cmt_final_setup_new_alg) ] || \
	  $(not_new_alg_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building new_alg.make"; \
	  $(cmtexe) -tag=$(tags) $(new_alg_extratags) build constituent_config -out=$(cmt_local_new_alg_makefile) new_alg; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_new_alg_makefile) : $(new_alg_dependencies) build_library_links
	$(echo) "(constituents.make) Building new_alg.make"; \
	  $(cmtexe) -f=$(bin)new_alg.in -tag=$(tags) $(new_alg_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_new_alg_makefile) new_alg
else
$(cmt_local_new_alg_makefile) : $(new_alg_dependencies) $(cmt_build_library_linksstamp) $(bin)new_alg.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_new_alg) ] || \
	  [ ! -f $(cmt_final_setup_new_alg) ] || \
	  $(not_new_alg_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building new_alg.make"; \
	  $(cmtexe) -f=$(bin)new_alg.in -tag=$(tags) $(new_alg_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_new_alg_makefile) new_alg; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(new_alg_extratags) build constituent_makefile -out=$(cmt_local_new_alg_makefile) new_alg

new_alg :: $(new_alg_dependencies) $(cmt_local_new_alg_makefile) dirs new_algdirs
	$(echo) "(constituents.make) Starting new_alg"
	@if test -f $(cmt_local_new_alg_makefile); then \
	  $(MAKE) -f $(cmt_local_new_alg_makefile) new_alg; \
	  fi
#	@$(MAKE) -f $(cmt_local_new_alg_makefile) new_alg
	$(echo) "(constituents.make) new_alg done"

clean :: new_algclean ;

new_algclean :: $(new_algclean_dependencies) ##$(cmt_local_new_alg_makefile)
	$(echo) "(constituents.make) Starting new_algclean"
	@-if test -f $(cmt_local_new_alg_makefile); then \
	  $(MAKE) -f $(cmt_local_new_alg_makefile) new_algclean; \
	fi
	$(echo) "(constituents.make) new_algclean done"
#	@-$(MAKE) -f $(cmt_local_new_alg_makefile) new_algclean

##	  /bin/rm -f $(cmt_local_new_alg_makefile) $(bin)new_alg_dependencies.make

install :: new_alginstall ;

new_alginstall :: $(new_alg_dependencies) $(cmt_local_new_alg_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_new_alg_makefile); then \
	  $(MAKE) -f $(cmt_local_new_alg_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_new_alg_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : new_alguninstall

$(foreach d,$(new_alg_dependencies),$(eval $(d)uninstall_dependencies += new_alguninstall))

new_alguninstall : $(new_alguninstall_dependencies) ##$(cmt_local_new_alg_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_new_alg_makefile); then \
	  $(MAKE) -f $(cmt_local_new_alg_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_new_alg_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: new_alguninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ new_alg"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ new_alg done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_new_analysisalg_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_new_analysisalg_has_target_tag

cmt_local_tagfile_new_analysisalg = $(bin)$(TrigCostMonitor_tag)_new_analysisalg.make
cmt_final_setup_new_analysisalg = $(bin)setup_new_analysisalg.make
cmt_local_new_analysisalg_makefile = $(bin)new_analysisalg.make

new_analysisalg_extratags = -tag_add=target_new_analysisalg

else

cmt_local_tagfile_new_analysisalg = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_new_analysisalg = $(bin)setup.make
cmt_local_new_analysisalg_makefile = $(bin)new_analysisalg.make

endif

not_new_analysisalg_dependencies = { n=0; for p in $?; do m=0; for d in $(new_analysisalg_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
new_analysisalgdirs :
	@if test ! -d $(bin)new_analysisalg; then $(mkdir) -p $(bin)new_analysisalg; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)new_analysisalg
else
new_analysisalgdirs : ;
endif

ifdef cmt_new_analysisalg_has_target_tag

ifndef QUICK
$(cmt_local_new_analysisalg_makefile) : $(new_analysisalg_dependencies) build_library_links
	$(echo) "(constituents.make) Building new_analysisalg.make"; \
	  $(cmtexe) -tag=$(tags) $(new_analysisalg_extratags) build constituent_config -out=$(cmt_local_new_analysisalg_makefile) new_analysisalg
else
$(cmt_local_new_analysisalg_makefile) : $(new_analysisalg_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_new_analysisalg) ] || \
	  [ ! -f $(cmt_final_setup_new_analysisalg) ] || \
	  $(not_new_analysisalg_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building new_analysisalg.make"; \
	  $(cmtexe) -tag=$(tags) $(new_analysisalg_extratags) build constituent_config -out=$(cmt_local_new_analysisalg_makefile) new_analysisalg; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_new_analysisalg_makefile) : $(new_analysisalg_dependencies) build_library_links
	$(echo) "(constituents.make) Building new_analysisalg.make"; \
	  $(cmtexe) -f=$(bin)new_analysisalg.in -tag=$(tags) $(new_analysisalg_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_new_analysisalg_makefile) new_analysisalg
else
$(cmt_local_new_analysisalg_makefile) : $(new_analysisalg_dependencies) $(cmt_build_library_linksstamp) $(bin)new_analysisalg.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_new_analysisalg) ] || \
	  [ ! -f $(cmt_final_setup_new_analysisalg) ] || \
	  $(not_new_analysisalg_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building new_analysisalg.make"; \
	  $(cmtexe) -f=$(bin)new_analysisalg.in -tag=$(tags) $(new_analysisalg_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_new_analysisalg_makefile) new_analysisalg; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(new_analysisalg_extratags) build constituent_makefile -out=$(cmt_local_new_analysisalg_makefile) new_analysisalg

new_analysisalg :: $(new_analysisalg_dependencies) $(cmt_local_new_analysisalg_makefile) dirs new_analysisalgdirs
	$(echo) "(constituents.make) Starting new_analysisalg"
	@if test -f $(cmt_local_new_analysisalg_makefile); then \
	  $(MAKE) -f $(cmt_local_new_analysisalg_makefile) new_analysisalg; \
	  fi
#	@$(MAKE) -f $(cmt_local_new_analysisalg_makefile) new_analysisalg
	$(echo) "(constituents.make) new_analysisalg done"

clean :: new_analysisalgclean ;

new_analysisalgclean :: $(new_analysisalgclean_dependencies) ##$(cmt_local_new_analysisalg_makefile)
	$(echo) "(constituents.make) Starting new_analysisalgclean"
	@-if test -f $(cmt_local_new_analysisalg_makefile); then \
	  $(MAKE) -f $(cmt_local_new_analysisalg_makefile) new_analysisalgclean; \
	fi
	$(echo) "(constituents.make) new_analysisalgclean done"
#	@-$(MAKE) -f $(cmt_local_new_analysisalg_makefile) new_analysisalgclean

##	  /bin/rm -f $(cmt_local_new_analysisalg_makefile) $(bin)new_analysisalg_dependencies.make

install :: new_analysisalginstall ;

new_analysisalginstall :: $(new_analysisalg_dependencies) $(cmt_local_new_analysisalg_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_new_analysisalg_makefile); then \
	  $(MAKE) -f $(cmt_local_new_analysisalg_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_new_analysisalg_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : new_analysisalguninstall

$(foreach d,$(new_analysisalg_dependencies),$(eval $(d)uninstall_dependencies += new_analysisalguninstall))

new_analysisalguninstall : $(new_analysisalguninstall_dependencies) ##$(cmt_local_new_analysisalg_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_new_analysisalg_makefile); then \
	  $(MAKE) -f $(cmt_local_new_analysisalg_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_new_analysisalg_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: new_analysisalguninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ new_analysisalg"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ new_analysisalg done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_new_asgtool_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_new_asgtool_has_target_tag

cmt_local_tagfile_new_asgtool = $(bin)$(TrigCostMonitor_tag)_new_asgtool.make
cmt_final_setup_new_asgtool = $(bin)setup_new_asgtool.make
cmt_local_new_asgtool_makefile = $(bin)new_asgtool.make

new_asgtool_extratags = -tag_add=target_new_asgtool

else

cmt_local_tagfile_new_asgtool = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_new_asgtool = $(bin)setup.make
cmt_local_new_asgtool_makefile = $(bin)new_asgtool.make

endif

not_new_asgtool_dependencies = { n=0; for p in $?; do m=0; for d in $(new_asgtool_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
new_asgtooldirs :
	@if test ! -d $(bin)new_asgtool; then $(mkdir) -p $(bin)new_asgtool; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)new_asgtool
else
new_asgtooldirs : ;
endif

ifdef cmt_new_asgtool_has_target_tag

ifndef QUICK
$(cmt_local_new_asgtool_makefile) : $(new_asgtool_dependencies) build_library_links
	$(echo) "(constituents.make) Building new_asgtool.make"; \
	  $(cmtexe) -tag=$(tags) $(new_asgtool_extratags) build constituent_config -out=$(cmt_local_new_asgtool_makefile) new_asgtool
else
$(cmt_local_new_asgtool_makefile) : $(new_asgtool_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_new_asgtool) ] || \
	  [ ! -f $(cmt_final_setup_new_asgtool) ] || \
	  $(not_new_asgtool_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building new_asgtool.make"; \
	  $(cmtexe) -tag=$(tags) $(new_asgtool_extratags) build constituent_config -out=$(cmt_local_new_asgtool_makefile) new_asgtool; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_new_asgtool_makefile) : $(new_asgtool_dependencies) build_library_links
	$(echo) "(constituents.make) Building new_asgtool.make"; \
	  $(cmtexe) -f=$(bin)new_asgtool.in -tag=$(tags) $(new_asgtool_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_new_asgtool_makefile) new_asgtool
else
$(cmt_local_new_asgtool_makefile) : $(new_asgtool_dependencies) $(cmt_build_library_linksstamp) $(bin)new_asgtool.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_new_asgtool) ] || \
	  [ ! -f $(cmt_final_setup_new_asgtool) ] || \
	  $(not_new_asgtool_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building new_asgtool.make"; \
	  $(cmtexe) -f=$(bin)new_asgtool.in -tag=$(tags) $(new_asgtool_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_new_asgtool_makefile) new_asgtool; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(new_asgtool_extratags) build constituent_makefile -out=$(cmt_local_new_asgtool_makefile) new_asgtool

new_asgtool :: $(new_asgtool_dependencies) $(cmt_local_new_asgtool_makefile) dirs new_asgtooldirs
	$(echo) "(constituents.make) Starting new_asgtool"
	@if test -f $(cmt_local_new_asgtool_makefile); then \
	  $(MAKE) -f $(cmt_local_new_asgtool_makefile) new_asgtool; \
	  fi
#	@$(MAKE) -f $(cmt_local_new_asgtool_makefile) new_asgtool
	$(echo) "(constituents.make) new_asgtool done"

clean :: new_asgtoolclean ;

new_asgtoolclean :: $(new_asgtoolclean_dependencies) ##$(cmt_local_new_asgtool_makefile)
	$(echo) "(constituents.make) Starting new_asgtoolclean"
	@-if test -f $(cmt_local_new_asgtool_makefile); then \
	  $(MAKE) -f $(cmt_local_new_asgtool_makefile) new_asgtoolclean; \
	fi
	$(echo) "(constituents.make) new_asgtoolclean done"
#	@-$(MAKE) -f $(cmt_local_new_asgtool_makefile) new_asgtoolclean

##	  /bin/rm -f $(cmt_local_new_asgtool_makefile) $(bin)new_asgtool_dependencies.make

install :: new_asgtoolinstall ;

new_asgtoolinstall :: $(new_asgtool_dependencies) $(cmt_local_new_asgtool_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_new_asgtool_makefile); then \
	  $(MAKE) -f $(cmt_local_new_asgtool_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_new_asgtool_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : new_asgtooluninstall

$(foreach d,$(new_asgtool_dependencies),$(eval $(d)uninstall_dependencies += new_asgtooluninstall))

new_asgtooluninstall : $(new_asgtooluninstall_dependencies) ##$(cmt_local_new_asgtool_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_new_asgtool_makefile); then \
	  $(MAKE) -f $(cmt_local_new_asgtool_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_new_asgtool_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: new_asgtooluninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ new_asgtool"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ new_asgtool done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_new_jobo_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_new_jobo_has_target_tag

cmt_local_tagfile_new_jobo = $(bin)$(TrigCostMonitor_tag)_new_jobo.make
cmt_final_setup_new_jobo = $(bin)setup_new_jobo.make
cmt_local_new_jobo_makefile = $(bin)new_jobo.make

new_jobo_extratags = -tag_add=target_new_jobo

else

cmt_local_tagfile_new_jobo = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_new_jobo = $(bin)setup.make
cmt_local_new_jobo_makefile = $(bin)new_jobo.make

endif

not_new_jobo_dependencies = { n=0; for p in $?; do m=0; for d in $(new_jobo_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
new_jobodirs :
	@if test ! -d $(bin)new_jobo; then $(mkdir) -p $(bin)new_jobo; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)new_jobo
else
new_jobodirs : ;
endif

ifdef cmt_new_jobo_has_target_tag

ifndef QUICK
$(cmt_local_new_jobo_makefile) : $(new_jobo_dependencies) build_library_links
	$(echo) "(constituents.make) Building new_jobo.make"; \
	  $(cmtexe) -tag=$(tags) $(new_jobo_extratags) build constituent_config -out=$(cmt_local_new_jobo_makefile) new_jobo
else
$(cmt_local_new_jobo_makefile) : $(new_jobo_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_new_jobo) ] || \
	  [ ! -f $(cmt_final_setup_new_jobo) ] || \
	  $(not_new_jobo_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building new_jobo.make"; \
	  $(cmtexe) -tag=$(tags) $(new_jobo_extratags) build constituent_config -out=$(cmt_local_new_jobo_makefile) new_jobo; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_new_jobo_makefile) : $(new_jobo_dependencies) build_library_links
	$(echo) "(constituents.make) Building new_jobo.make"; \
	  $(cmtexe) -f=$(bin)new_jobo.in -tag=$(tags) $(new_jobo_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_new_jobo_makefile) new_jobo
else
$(cmt_local_new_jobo_makefile) : $(new_jobo_dependencies) $(cmt_build_library_linksstamp) $(bin)new_jobo.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_new_jobo) ] || \
	  [ ! -f $(cmt_final_setup_new_jobo) ] || \
	  $(not_new_jobo_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building new_jobo.make"; \
	  $(cmtexe) -f=$(bin)new_jobo.in -tag=$(tags) $(new_jobo_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_new_jobo_makefile) new_jobo; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(new_jobo_extratags) build constituent_makefile -out=$(cmt_local_new_jobo_makefile) new_jobo

new_jobo :: $(new_jobo_dependencies) $(cmt_local_new_jobo_makefile) dirs new_jobodirs
	$(echo) "(constituents.make) Starting new_jobo"
	@if test -f $(cmt_local_new_jobo_makefile); then \
	  $(MAKE) -f $(cmt_local_new_jobo_makefile) new_jobo; \
	  fi
#	@$(MAKE) -f $(cmt_local_new_jobo_makefile) new_jobo
	$(echo) "(constituents.make) new_jobo done"

clean :: new_joboclean ;

new_joboclean :: $(new_joboclean_dependencies) ##$(cmt_local_new_jobo_makefile)
	$(echo) "(constituents.make) Starting new_joboclean"
	@-if test -f $(cmt_local_new_jobo_makefile); then \
	  $(MAKE) -f $(cmt_local_new_jobo_makefile) new_joboclean; \
	fi
	$(echo) "(constituents.make) new_joboclean done"
#	@-$(MAKE) -f $(cmt_local_new_jobo_makefile) new_joboclean

##	  /bin/rm -f $(cmt_local_new_jobo_makefile) $(bin)new_jobo_dependencies.make

install :: new_joboinstall ;

new_joboinstall :: $(new_jobo_dependencies) $(cmt_local_new_jobo_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_new_jobo_makefile); then \
	  $(MAKE) -f $(cmt_local_new_jobo_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_new_jobo_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : new_jobouninstall

$(foreach d,$(new_jobo_dependencies),$(eval $(d)uninstall_dependencies += new_jobouninstall))

new_jobouninstall : $(new_jobouninstall_dependencies) ##$(cmt_local_new_jobo_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_new_jobo_makefile); then \
	  $(MAKE) -f $(cmt_local_new_jobo_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_new_jobo_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: new_jobouninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ new_jobo"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ new_jobo done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_new_skeleton_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_new_skeleton_has_target_tag

cmt_local_tagfile_new_skeleton = $(bin)$(TrigCostMonitor_tag)_new_skeleton.make
cmt_final_setup_new_skeleton = $(bin)setup_new_skeleton.make
cmt_local_new_skeleton_makefile = $(bin)new_skeleton.make

new_skeleton_extratags = -tag_add=target_new_skeleton

else

cmt_local_tagfile_new_skeleton = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_new_skeleton = $(bin)setup.make
cmt_local_new_skeleton_makefile = $(bin)new_skeleton.make

endif

not_new_skeleton_dependencies = { n=0; for p in $?; do m=0; for d in $(new_skeleton_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
new_skeletondirs :
	@if test ! -d $(bin)new_skeleton; then $(mkdir) -p $(bin)new_skeleton; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)new_skeleton
else
new_skeletondirs : ;
endif

ifdef cmt_new_skeleton_has_target_tag

ifndef QUICK
$(cmt_local_new_skeleton_makefile) : $(new_skeleton_dependencies) build_library_links
	$(echo) "(constituents.make) Building new_skeleton.make"; \
	  $(cmtexe) -tag=$(tags) $(new_skeleton_extratags) build constituent_config -out=$(cmt_local_new_skeleton_makefile) new_skeleton
else
$(cmt_local_new_skeleton_makefile) : $(new_skeleton_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_new_skeleton) ] || \
	  [ ! -f $(cmt_final_setup_new_skeleton) ] || \
	  $(not_new_skeleton_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building new_skeleton.make"; \
	  $(cmtexe) -tag=$(tags) $(new_skeleton_extratags) build constituent_config -out=$(cmt_local_new_skeleton_makefile) new_skeleton; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_new_skeleton_makefile) : $(new_skeleton_dependencies) build_library_links
	$(echo) "(constituents.make) Building new_skeleton.make"; \
	  $(cmtexe) -f=$(bin)new_skeleton.in -tag=$(tags) $(new_skeleton_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_new_skeleton_makefile) new_skeleton
else
$(cmt_local_new_skeleton_makefile) : $(new_skeleton_dependencies) $(cmt_build_library_linksstamp) $(bin)new_skeleton.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_new_skeleton) ] || \
	  [ ! -f $(cmt_final_setup_new_skeleton) ] || \
	  $(not_new_skeleton_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building new_skeleton.make"; \
	  $(cmtexe) -f=$(bin)new_skeleton.in -tag=$(tags) $(new_skeleton_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_new_skeleton_makefile) new_skeleton; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(new_skeleton_extratags) build constituent_makefile -out=$(cmt_local_new_skeleton_makefile) new_skeleton

new_skeleton :: $(new_skeleton_dependencies) $(cmt_local_new_skeleton_makefile) dirs new_skeletondirs
	$(echo) "(constituents.make) Starting new_skeleton"
	@if test -f $(cmt_local_new_skeleton_makefile); then \
	  $(MAKE) -f $(cmt_local_new_skeleton_makefile) new_skeleton; \
	  fi
#	@$(MAKE) -f $(cmt_local_new_skeleton_makefile) new_skeleton
	$(echo) "(constituents.make) new_skeleton done"

clean :: new_skeletonclean ;

new_skeletonclean :: $(new_skeletonclean_dependencies) ##$(cmt_local_new_skeleton_makefile)
	$(echo) "(constituents.make) Starting new_skeletonclean"
	@-if test -f $(cmt_local_new_skeleton_makefile); then \
	  $(MAKE) -f $(cmt_local_new_skeleton_makefile) new_skeletonclean; \
	fi
	$(echo) "(constituents.make) new_skeletonclean done"
#	@-$(MAKE) -f $(cmt_local_new_skeleton_makefile) new_skeletonclean

##	  /bin/rm -f $(cmt_local_new_skeleton_makefile) $(bin)new_skeleton_dependencies.make

install :: new_skeletoninstall ;

new_skeletoninstall :: $(new_skeleton_dependencies) $(cmt_local_new_skeleton_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_new_skeleton_makefile); then \
	  $(MAKE) -f $(cmt_local_new_skeleton_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_new_skeleton_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : new_skeletonuninstall

$(foreach d,$(new_skeleton_dependencies),$(eval $(d)uninstall_dependencies += new_skeletonuninstall))

new_skeletonuninstall : $(new_skeletonuninstall_dependencies) ##$(cmt_local_new_skeleton_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_new_skeleton_makefile); then \
	  $(MAKE) -f $(cmt_local_new_skeleton_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_new_skeleton_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: new_skeletonuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ new_skeleton"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ new_skeleton done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_make_skeleton_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_make_skeleton_has_target_tag

cmt_local_tagfile_make_skeleton = $(bin)$(TrigCostMonitor_tag)_make_skeleton.make
cmt_final_setup_make_skeleton = $(bin)setup_make_skeleton.make
cmt_local_make_skeleton_makefile = $(bin)make_skeleton.make

make_skeleton_extratags = -tag_add=target_make_skeleton

else

cmt_local_tagfile_make_skeleton = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_make_skeleton = $(bin)setup.make
cmt_local_make_skeleton_makefile = $(bin)make_skeleton.make

endif

not_make_skeleton_dependencies = { n=0; for p in $?; do m=0; for d in $(make_skeleton_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
make_skeletondirs :
	@if test ! -d $(bin)make_skeleton; then $(mkdir) -p $(bin)make_skeleton; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)make_skeleton
else
make_skeletondirs : ;
endif

ifdef cmt_make_skeleton_has_target_tag

ifndef QUICK
$(cmt_local_make_skeleton_makefile) : $(make_skeleton_dependencies) build_library_links
	$(echo) "(constituents.make) Building make_skeleton.make"; \
	  $(cmtexe) -tag=$(tags) $(make_skeleton_extratags) build constituent_config -out=$(cmt_local_make_skeleton_makefile) make_skeleton
else
$(cmt_local_make_skeleton_makefile) : $(make_skeleton_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_make_skeleton) ] || \
	  [ ! -f $(cmt_final_setup_make_skeleton) ] || \
	  $(not_make_skeleton_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building make_skeleton.make"; \
	  $(cmtexe) -tag=$(tags) $(make_skeleton_extratags) build constituent_config -out=$(cmt_local_make_skeleton_makefile) make_skeleton; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_make_skeleton_makefile) : $(make_skeleton_dependencies) build_library_links
	$(echo) "(constituents.make) Building make_skeleton.make"; \
	  $(cmtexe) -f=$(bin)make_skeleton.in -tag=$(tags) $(make_skeleton_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_make_skeleton_makefile) make_skeleton
else
$(cmt_local_make_skeleton_makefile) : $(make_skeleton_dependencies) $(cmt_build_library_linksstamp) $(bin)make_skeleton.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_make_skeleton) ] || \
	  [ ! -f $(cmt_final_setup_make_skeleton) ] || \
	  $(not_make_skeleton_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building make_skeleton.make"; \
	  $(cmtexe) -f=$(bin)make_skeleton.in -tag=$(tags) $(make_skeleton_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_make_skeleton_makefile) make_skeleton; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(make_skeleton_extratags) build constituent_makefile -out=$(cmt_local_make_skeleton_makefile) make_skeleton

make_skeleton :: $(make_skeleton_dependencies) $(cmt_local_make_skeleton_makefile) dirs make_skeletondirs
	$(echo) "(constituents.make) Starting make_skeleton"
	@if test -f $(cmt_local_make_skeleton_makefile); then \
	  $(MAKE) -f $(cmt_local_make_skeleton_makefile) make_skeleton; \
	  fi
#	@$(MAKE) -f $(cmt_local_make_skeleton_makefile) make_skeleton
	$(echo) "(constituents.make) make_skeleton done"

clean :: make_skeletonclean ;

make_skeletonclean :: $(make_skeletonclean_dependencies) ##$(cmt_local_make_skeleton_makefile)
	$(echo) "(constituents.make) Starting make_skeletonclean"
	@-if test -f $(cmt_local_make_skeleton_makefile); then \
	  $(MAKE) -f $(cmt_local_make_skeleton_makefile) make_skeletonclean; \
	fi
	$(echo) "(constituents.make) make_skeletonclean done"
#	@-$(MAKE) -f $(cmt_local_make_skeleton_makefile) make_skeletonclean

##	  /bin/rm -f $(cmt_local_make_skeleton_makefile) $(bin)make_skeleton_dependencies.make

install :: make_skeletoninstall ;

make_skeletoninstall :: $(make_skeleton_dependencies) $(cmt_local_make_skeleton_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_make_skeleton_makefile); then \
	  $(MAKE) -f $(cmt_local_make_skeleton_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_make_skeleton_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : make_skeletonuninstall

$(foreach d,$(make_skeleton_dependencies),$(eval $(d)uninstall_dependencies += make_skeletonuninstall))

make_skeletonuninstall : $(make_skeletonuninstall_dependencies) ##$(cmt_local_make_skeleton_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_make_skeleton_makefile); then \
	  $(MAKE) -f $(cmt_local_make_skeleton_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_make_skeleton_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: make_skeletonuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ make_skeleton"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ make_skeleton done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_checkout_pkg_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_checkout_pkg_has_target_tag

cmt_local_tagfile_checkout_pkg = $(bin)$(TrigCostMonitor_tag)_checkout_pkg.make
cmt_final_setup_checkout_pkg = $(bin)setup_checkout_pkg.make
cmt_local_checkout_pkg_makefile = $(bin)checkout_pkg.make

checkout_pkg_extratags = -tag_add=target_checkout_pkg

else

cmt_local_tagfile_checkout_pkg = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_checkout_pkg = $(bin)setup.make
cmt_local_checkout_pkg_makefile = $(bin)checkout_pkg.make

endif

not_checkout_pkg_dependencies = { n=0; for p in $?; do m=0; for d in $(checkout_pkg_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
checkout_pkgdirs :
	@if test ! -d $(bin)checkout_pkg; then $(mkdir) -p $(bin)checkout_pkg; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)checkout_pkg
else
checkout_pkgdirs : ;
endif

ifdef cmt_checkout_pkg_has_target_tag

ifndef QUICK
$(cmt_local_checkout_pkg_makefile) : $(checkout_pkg_dependencies) build_library_links
	$(echo) "(constituents.make) Building checkout_pkg.make"; \
	  $(cmtexe) -tag=$(tags) $(checkout_pkg_extratags) build constituent_config -out=$(cmt_local_checkout_pkg_makefile) checkout_pkg
else
$(cmt_local_checkout_pkg_makefile) : $(checkout_pkg_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_checkout_pkg) ] || \
	  [ ! -f $(cmt_final_setup_checkout_pkg) ] || \
	  $(not_checkout_pkg_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building checkout_pkg.make"; \
	  $(cmtexe) -tag=$(tags) $(checkout_pkg_extratags) build constituent_config -out=$(cmt_local_checkout_pkg_makefile) checkout_pkg; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_checkout_pkg_makefile) : $(checkout_pkg_dependencies) build_library_links
	$(echo) "(constituents.make) Building checkout_pkg.make"; \
	  $(cmtexe) -f=$(bin)checkout_pkg.in -tag=$(tags) $(checkout_pkg_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_checkout_pkg_makefile) checkout_pkg
else
$(cmt_local_checkout_pkg_makefile) : $(checkout_pkg_dependencies) $(cmt_build_library_linksstamp) $(bin)checkout_pkg.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_checkout_pkg) ] || \
	  [ ! -f $(cmt_final_setup_checkout_pkg) ] || \
	  $(not_checkout_pkg_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building checkout_pkg.make"; \
	  $(cmtexe) -f=$(bin)checkout_pkg.in -tag=$(tags) $(checkout_pkg_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_checkout_pkg_makefile) checkout_pkg; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(checkout_pkg_extratags) build constituent_makefile -out=$(cmt_local_checkout_pkg_makefile) checkout_pkg

checkout_pkg :: $(checkout_pkg_dependencies) $(cmt_local_checkout_pkg_makefile) dirs checkout_pkgdirs
	$(echo) "(constituents.make) Starting checkout_pkg"
	@if test -f $(cmt_local_checkout_pkg_makefile); then \
	  $(MAKE) -f $(cmt_local_checkout_pkg_makefile) checkout_pkg; \
	  fi
#	@$(MAKE) -f $(cmt_local_checkout_pkg_makefile) checkout_pkg
	$(echo) "(constituents.make) checkout_pkg done"

clean :: checkout_pkgclean ;

checkout_pkgclean :: $(checkout_pkgclean_dependencies) ##$(cmt_local_checkout_pkg_makefile)
	$(echo) "(constituents.make) Starting checkout_pkgclean"
	@-if test -f $(cmt_local_checkout_pkg_makefile); then \
	  $(MAKE) -f $(cmt_local_checkout_pkg_makefile) checkout_pkgclean; \
	fi
	$(echo) "(constituents.make) checkout_pkgclean done"
#	@-$(MAKE) -f $(cmt_local_checkout_pkg_makefile) checkout_pkgclean

##	  /bin/rm -f $(cmt_local_checkout_pkg_makefile) $(bin)checkout_pkg_dependencies.make

install :: checkout_pkginstall ;

checkout_pkginstall :: $(checkout_pkg_dependencies) $(cmt_local_checkout_pkg_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_checkout_pkg_makefile); then \
	  $(MAKE) -f $(cmt_local_checkout_pkg_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_checkout_pkg_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : checkout_pkguninstall

$(foreach d,$(checkout_pkg_dependencies),$(eval $(d)uninstall_dependencies += checkout_pkguninstall))

checkout_pkguninstall : $(checkout_pkguninstall_dependencies) ##$(cmt_local_checkout_pkg_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_checkout_pkg_makefile); then \
	  $(MAKE) -f $(cmt_local_checkout_pkg_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_checkout_pkg_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: checkout_pkguninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ checkout_pkg"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ checkout_pkg done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_cppcheck_has_no_target_tag = 1

#--------------------------------------

ifdef cmt_cppcheck_has_target_tag

cmt_local_tagfile_cppcheck = $(bin)$(TrigCostMonitor_tag)_cppcheck.make
cmt_final_setup_cppcheck = $(bin)setup_cppcheck.make
cmt_local_cppcheck_makefile = $(bin)cppcheck.make

cppcheck_extratags = -tag_add=target_cppcheck

else

cmt_local_tagfile_cppcheck = $(bin)$(TrigCostMonitor_tag).make
cmt_final_setup_cppcheck = $(bin)setup.make
cmt_local_cppcheck_makefile = $(bin)cppcheck.make

endif

not_cppcheck_dependencies = { n=0; for p in $?; do m=0; for d in $(cppcheck_dependencies); do if [ $$p = $$d ]; then m=1; break; fi; done; if [ $$m -eq 0 ]; then n=1; break; fi; done; [ $$n -eq 1 ]; }

ifdef STRUCTURED_OUTPUT
cppcheckdirs :
	@if test ! -d $(bin)cppcheck; then $(mkdir) -p $(bin)cppcheck; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)cppcheck
else
cppcheckdirs : ;
endif

ifdef cmt_cppcheck_has_target_tag

ifndef QUICK
$(cmt_local_cppcheck_makefile) : $(cppcheck_dependencies) build_library_links
	$(echo) "(constituents.make) Building cppcheck.make"; \
	  $(cmtexe) -tag=$(tags) $(cppcheck_extratags) build constituent_config -out=$(cmt_local_cppcheck_makefile) cppcheck
else
$(cmt_local_cppcheck_makefile) : $(cppcheck_dependencies) $(cmt_build_library_linksstamp) $(use_requirements)
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_cppcheck) ] || \
	  [ ! -f $(cmt_final_setup_cppcheck) ] || \
	  $(not_cppcheck_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building cppcheck.make"; \
	  $(cmtexe) -tag=$(tags) $(cppcheck_extratags) build constituent_config -out=$(cmt_local_cppcheck_makefile) cppcheck; \
	  fi
endif

else

ifndef QUICK
$(cmt_local_cppcheck_makefile) : $(cppcheck_dependencies) build_library_links
	$(echo) "(constituents.make) Building cppcheck.make"; \
	  $(cmtexe) -f=$(bin)cppcheck.in -tag=$(tags) $(cppcheck_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_cppcheck_makefile) cppcheck
else
$(cmt_local_cppcheck_makefile) : $(cppcheck_dependencies) $(cmt_build_library_linksstamp) $(bin)cppcheck.in
	@if [ ! -f $@ ] || [ ! -f $(cmt_local_tagfile_cppcheck) ] || \
	  [ ! -f $(cmt_final_setup_cppcheck) ] || \
	  $(not_cppcheck_dependencies) ; then \
	  test -z "$(cmtmsg)" || \
	  echo "$(CMTMSGPREFIX)" "(constituents.make) Building cppcheck.make"; \
	  $(cmtexe) -f=$(bin)cppcheck.in -tag=$(tags) $(cppcheck_extratags) build constituent_makefile -without_cmt -out=$(cmt_local_cppcheck_makefile) cppcheck; \
	  fi
endif

endif

#	  $(cmtexe) -tag=$(tags) $(cppcheck_extratags) build constituent_makefile -out=$(cmt_local_cppcheck_makefile) cppcheck

cppcheck :: $(cppcheck_dependencies) $(cmt_local_cppcheck_makefile) dirs cppcheckdirs
	$(echo) "(constituents.make) Starting cppcheck"
	@if test -f $(cmt_local_cppcheck_makefile); then \
	  $(MAKE) -f $(cmt_local_cppcheck_makefile) cppcheck; \
	  fi
#	@$(MAKE) -f $(cmt_local_cppcheck_makefile) cppcheck
	$(echo) "(constituents.make) cppcheck done"

clean :: cppcheckclean ;

cppcheckclean :: $(cppcheckclean_dependencies) ##$(cmt_local_cppcheck_makefile)
	$(echo) "(constituents.make) Starting cppcheckclean"
	@-if test -f $(cmt_local_cppcheck_makefile); then \
	  $(MAKE) -f $(cmt_local_cppcheck_makefile) cppcheckclean; \
	fi
	$(echo) "(constituents.make) cppcheckclean done"
#	@-$(MAKE) -f $(cmt_local_cppcheck_makefile) cppcheckclean

##	  /bin/rm -f $(cmt_local_cppcheck_makefile) $(bin)cppcheck_dependencies.make

install :: cppcheckinstall ;

cppcheckinstall :: $(cppcheck_dependencies) $(cmt_local_cppcheck_makefile)
	$(echo) "(constituents.make) Starting $@"
	@if test -f $(cmt_local_cppcheck_makefile); then \
	  $(MAKE) -f $(cmt_local_cppcheck_makefile) install; \
	  fi
#	@-$(MAKE) -f $(cmt_local_cppcheck_makefile) install
	$(echo) "(constituents.make) $@ done"

uninstall : cppcheckuninstall

$(foreach d,$(cppcheck_dependencies),$(eval $(d)uninstall_dependencies += cppcheckuninstall))

cppcheckuninstall : $(cppcheckuninstall_dependencies) ##$(cmt_local_cppcheck_makefile)
	$(echo) "(constituents.make) Starting $@"
	@-if test -f $(cmt_local_cppcheck_makefile); then \
	  $(MAKE) -f $(cmt_local_cppcheck_makefile) uninstall; \
	  fi
#	@$(MAKE) -f $(cmt_local_cppcheck_makefile) uninstall
	$(echo) "(constituents.make) $@ done"

remove_library_links :: cppcheckuninstall ;

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ cppcheck"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ cppcheck done"
endif

#-- end of constituent ------
#-- start of constituents_trailer ------

uninstall : remove_library_links ;
clean ::
	$(cleanup_echo) $(cmt_build_library_linksstamp)
	-$(cleanup_silent) \rm -f $(cmt_build_library_linksstamp)
#clean :: remove_library_links

remove_library_links ::
ifndef QUICK
	$(echo) "(constituents.make) Removing library links"; \
	  $(remove_library_links)
else
	$(echo) "(constituents.make) Removing library links"; \
	  $(remove_library_links) -f=$(bin)library_links.in -without_cmt
endif

#-- end of constituents_trailer ------

#-- start of make_header -----------------

#====================================
#  Document TrigCostMonitorGen
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

cmt_TrigCostMonitorGen_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_TrigCostMonitorGen_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_TrigCostMonitorGen

TrigCostMonitor_tag = $(tag)

#cmt_local_tagfile_TrigCostMonitorGen = $(TrigCostMonitor_tag)_TrigCostMonitorGen.make
cmt_local_tagfile_TrigCostMonitorGen = $(bin)$(TrigCostMonitor_tag)_TrigCostMonitorGen.make

else

tags      = $(tag),$(CMTEXTRATAGS)

TrigCostMonitor_tag = $(tag)

#cmt_local_tagfile_TrigCostMonitorGen = $(TrigCostMonitor_tag).make
cmt_local_tagfile_TrigCostMonitorGen = $(bin)$(TrigCostMonitor_tag).make

endif

include $(cmt_local_tagfile_TrigCostMonitorGen)
#-include $(cmt_local_tagfile_TrigCostMonitorGen)

ifdef cmt_TrigCostMonitorGen_has_target_tag

cmt_final_setup_TrigCostMonitorGen = $(bin)setup_TrigCostMonitorGen.make
cmt_dependencies_in_TrigCostMonitorGen = $(bin)dependencies_TrigCostMonitorGen.in
#cmt_final_setup_TrigCostMonitorGen = $(bin)TrigCostMonitor_TrigCostMonitorGensetup.make
cmt_local_TrigCostMonitorGen_makefile = $(bin)TrigCostMonitorGen.make

else

cmt_final_setup_TrigCostMonitorGen = $(bin)setup.make
cmt_dependencies_in_TrigCostMonitorGen = $(bin)dependencies.in
#cmt_final_setup_TrigCostMonitorGen = $(bin)TrigCostMonitorsetup.make
cmt_local_TrigCostMonitorGen_makefile = $(bin)TrigCostMonitorGen.make

endif

#cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)TrigCostMonitorsetup.make

#TrigCostMonitorGen :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'TrigCostMonitorGen'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = TrigCostMonitorGen/
#TrigCostMonitorGen::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

${CMTROOT}/src/Makefile.core : ;
ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------

TrigCostMonitorGen :: ${dict_dir}/TrigCostMonitorGenDictEnd.stamp

#Begin: create dir and first part of required files
${dict_dir}/TrigCostMonitorGenDictBegin.stamp ::   $(reflex_dictTrigCostMonitor_selection_file)  $(cmt_final_setup_TrigCostMonitorGen)
	@echo "----- BEGIN SEAL Dictionary selection file generation for TrigCostMonitor -----"
	@echo "  Cleaning up TrigCostMonitorDict-related generated files " 
	@$(cleanup_silent) cd $(bin); /bin/rm -rf *TrigCostMonitorDict*.a
	@if test -d ${dict_dir}/TrigCostMonitor ; then echo "Remove ${dict_dir}/TrigCostMonitor" ; /bin/rm -rf ${dict_dir}/TrigCostMonitor*; fi
	@echo "  Create ${dict_dir}" ; mkdir -p ${dict_dir}/TrigCostMonitor; 
	@echo "  Copy $(reflex_dictTrigCostMonitor_selection_file) to ${dict_dir}/TrigCostMonitor_selection.xml "
	@grep -v "</lcgdict>" $(reflex_dictTrigCostMonitor_selection_file) >| ${dict_dir}/TrigCostMonitor_selection.xml 
	@if test ! -z "${reflex_dictTrigCostMonitor_navigables}" ; then \
	    class_list=`echo '$(reflex_dictTrigCostMonitor_navigables)' | sed -e "s/[ ][ ]*/' '/g" -e "s/^/'/"  -e "s/$$/'/" -e "s/''//g"`; \
	    for class_name in $${class_list} ; do  \
	        echo "  Add navigable: $${class_name} to selection file" ; \
	        $(cmtexe) expand model "<Navigable_selection.xml class=$${class_name}/>" >> ${dict_dir}/TrigCostMonitor_selection.xml ; \
	        $(cmtexe) expand model "<ElementLink_selection.xml class=$${class_name}/>" >> ${dict_dir}/TrigCostMonitor_selection.xml ; \
	        $(cmtexe) expand model "<ElementLinkVector_selection.xml class=$${class_name}/>" >> ${dict_dir}/TrigCostMonitor_selection.xml ; \
	        $(cmtexe) expand model "<DataLink_selection.xml class=$${class_name}/>" >> ${dict_dir}/TrigCostMonitor_selection.xml ; \
	    done ; \
	fi 
	@if test ! -z "${reflex_dictTrigCostMonitor_data_links}" ; then \
	    class_list=`echo '$(reflex_dictTrigCostMonitor_data_links)' | sed -e "s/[ ][ ]*/' '/g" -e "s/^/'/"  -e "s/$$/'/" -e "s/''//g"`; \
	    for class_name in $${class_list} ; do  \
	        echo "  Add data link: $${class_name} to selection file" ; \
	        $(cmtexe) expand model "<DataLink_selection.xml class=$${class_name}/>" >> ${dict_dir}/TrigCostMonitor_selection.xml ; \
	    done ; \
	fi 
	@if test ! -z "${reflex_dictTrigCostMonitor_element_links}" ; then \
	    class_list=`echo '$(reflex_dictTrigCostMonitor_element_links)' | sed -e "s/[ ][ ]*/' '/g" -e "s/^/'/"  -e "s/$$/'/" -e "s/''//g"`; \
	    for class_name in $${class_list} ; do  \
	        echo "  Add element link: $${class_name} to selection file" ; \
	        $(cmtexe) expand model "<ElementLink_selection.xml class=$${class_name}/>" >> ${dict_dir}/TrigCostMonitor_selection.xml ; \
	        $(cmtexe) expand model "<ElementLinkVector_selection.xml class=$${class_name}/>" >> ${dict_dir}/TrigCostMonitor_selection.xml ; \
	        $(cmtexe) expand model "<DataLink_selection.xml class=$${class_name}/>" >> ${dict_dir}/TrigCostMonitor_selection.xml ; \
	    done ; \
	fi 
	@if test ! -z ${reflex_dictTrigCostMonitor_element_link_vectors} ; then \
	    class_list=`echo '$(reflex_dictTrigCostMonitor_element_link_vectors)' | sed -e "s/[ ][ ]*/' '/g" -e "s/^/'/"  -e "s/$$/'/" -e "s/''//g"`; \
	    for class_name in $${class_list} ; do  \
	        echo "  This is deprecated. Include the class in navigables if possible, or just use elementLinks" ; \
	        echo "  Add element link vector: $${class_name} to selection file" ; \
	        $(cmtexe) expand model "<ElementLinkVector_selection.xml class=$${class_name}/>" >> ${dict_dir}/TrigCostMonitor_selection.xml ; \
	        $(cmtexe) expand model "<DataLink_selection.xml class=$${class_name}/>" >> ${dict_dir}/TrigCostMonitor_selection.xml ; \
	    done ; \
	fi 
	@echo "</lcgdict>" >> ${dict_dir}/TrigCostMonitor_selection.xml 
	@touch ${dict_dir}/TrigCostMonitorGenDictBegin.stamp

#End: create final part of required files
${dict_dir}/TrigCostMonitorGenDictEnd.stamp :: ${dict_dir}/TrigCostMonitorGenDict.stamp
	@echo "----- END SEAL Dictionary selection file generation for TrigCostMonitor -----"
	@touch ${dict_dir}/TrigCostMonitorGenDictEnd.stamp
#-- start of dependencies ------------------
ifneq ($(MAKECMDGOALS),TrigCostMonitorGenclean)
ifneq ($(MAKECMDGOALS),uninstall)

$(bin)TrigCostMonitorGen_dependencies.make : $(use_requirements) $(cmt_final_setup_TrigCostMonitorGen)
	$(echo) "(TrigCostMonitorGen.make) Rebuilding $@"; \
	  $(cmtexe) -tag=$(tags) build dependencies -out=$@ -start_all ../TrigCostMonitor/TrigCostMonitorDict.h -end_all $(includes) $(app_TrigCostMonitorGen_cppflags) $(lib_TrigCostMonitorGen_cppflags) -name=TrigCostMonitorGen $? -f=$(cmt_dependencies_in_TrigCostMonitorGen) -without_cmt

-include $(bin)TrigCostMonitorGen_dependencies.make

endif
endif

TrigCostMonitorGenclean ::
	$(cleanup_silent) \rm -rf $(bin)TrigCostMonitorGen_deps $(bin)TrigCostMonitorGen_dependencies.make
#-- end of dependencies -------------------
#-- start of dependency ------------------
ifneq ($(MAKECMDGOALS),TrigCostMonitorGenclean)
ifneq ($(MAKECMDGOALS),uninstall)

$(bin)TrigCostMonitorGen_dependencies.make : $(TrigCostMonitorDict_h_dependencies)

$(bin)TrigCostMonitorGen_dependencies.make : ../TrigCostMonitor/TrigCostMonitorDict.h

endif
endif
#-- end of dependency -------------------

${dict_dir}/TrigCostMonitorGenDict.stamp :: ${dict_dir}/TrigCostMonitorGenDictBegin.stamp ${dict_dir}/TrigCostMonitor/TrigCostMonitorDict.xml.stamp
	@touch ${dict_dir}/TrigCostMonitorGenDict.stamp


TrigCostMonitorGen ::  ${dict_dir}/TrigCostMonitor/TrigCostMonitorDict.xml.stamp

${dict_dir}/TrigCostMonitor/TrigCostMonitorDict.xml.stamp :: $(TrigCostMonitorDict_h_dependencies) $(reflex_dictTrigCostMonitor_selection_file) ${dict_dir}/TrigCostMonitorGenDictBegin.stamp
	@$(silent) echo $@ TrigCostMonitorDict_gen.h
	@cat ../TrigCostMonitor/TrigCostMonitorDict.h >| ${dict_dir}/TrigCostMonitor/TrigCostMonitorDict_gen.h
	@if test ! -z "${reflex_dictTrigCostMonitor_navigables}" ; then \
	    class_list=`echo '$(reflex_dictTrigCostMonitor_navigables)' | sed -e "s/[ ][ ]*/' '/g" -e "s/^/'/"  -e "s/$$/'/" -e "s/''//g"`; \
            echo "class_list = $${class_list}";\
	    for class_name in $${class_list} ; do  \
	        echo "  Add navigable: $${class_name} to dict header file" ; \
		TYPE=`echo $${class_name} | sed 's/[[:punct:]]/_/g'` ;	\
	        $(cmtexe) expand model "<NavigableDict.h namespace=$${TYPE} cont=$${class_name}/>" >> ${dict_dir}/TrigCostMonitor/TrigCostMonitorDict_gen.h ; \
	        $(cmtexe) expand model "<ElementLinkDict.h namespace=$${TYPE} cont=$${class_name}/>" >> ${dict_dir}/TrigCostMonitor/TrigCostMonitorDict_gen.h ; \
	        $(cmtexe) expand model "<DataLinkDict.h namespace=$${TYPE} cont=$${class_name}/>" >> ${dict_dir}/TrigCostMonitor/TrigCostMonitorDict_gen.h ; \
	    done ; \
	fi 
	@if test ! -z "${reflex_dictTrigCostMonitor_element_links}" ; then \
	    class_list=`echo '$(reflex_dictTrigCostMonitor_element_links)' | sed -e "s/[ ][ ]*/' '/g" -e "s/^/'/"  -e "s/$$/'/" -e "s/''//g"`; \
	    for class_name in $${class_list} ; do  \
	        echo "  Add ElementLink & ElementLinkVector: $${class_name} to dict header file" ; \
		TYPE=`echo $${class_name} | sed 's/[[:punct:]]/_/g'` ;	\
	        $(cmtexe) expand model "<ElementLinkDict.h namespace=$${TYPE} cont=$${class_name}/>" >> ${dict_dir}/TrigCostMonitor/TrigCostMonitorDict_gen.h ; \
	        $(cmtexe) expand model "<DataLinkDict.h namespace=$${TYPE} cont=$${class_name}/>" >> ${dict_dir}/TrigCostMonitor/TrigCostMonitorDict_gen.h ; \
	    done ; \
	fi 
	@if test ! -z "${reflex_dictTrigCostMonitor_data_links}" ; then \
	    class_list=`echo '$(reflex_dictTrigCostMonitor_data_links)' | sed -e "s/[ ][ ]*/' '/g" -e "s/^/'/"  -e "s/$$/'/" -e "s/''//g"`; \
	    for class_name in $${class_list} ; do  \
	        echo "  Add DataLink: $${class_name} to dict header file" ; \
		TYPE=`echo $${class_name} | sed 's/[[:punct:]]/_/g'` ;	\
	        $(cmtexe) expand model "<DataLinkDict.h namespace=$${TYPE} cont=$${class_name}/>" >> ${dict_dir}/TrigCostMonitor/TrigCostMonitorDict_gen.h ; \
	    done ; \
	fi
	@if test ! -z "$(gcc_user_flags)" ; then \
	    export  GCCXML_USER_FLAGS="$(gcc_user_flags)" ; \
	fi
	$(silent) $(athena_genreflex_wrapper_cmd) TrigCostMonitor $(genreflex_cmd) ${dict_dir}/TrigCostMonitor/TrigCostMonitorDict_gen.h -o ${dict_dir}/TrigCostMonitor $(reflex_dictTrigCostMonitor_options) ${munged_reflex_dict_options} $(TrigCostMonitor_reflex_dict_options)  $(includes) $(use_pp_cppflags) 
	@touch ${dict_dir}/TrigCostMonitor/TrigCostMonitorDict.xml.stamp


TrigCostMonitorGenclean ::
	@if test -d ${dict_dir} ; then \
	    file_list=`ls ${dict_dir}` ; \
	    for file_name in $${file_list} ; do  \
	        if test -f ${dict_dir}/$${file_name} ; then \
	            echo "Remove ${dict_dir}/$${file_name}" ; \
		    /bin/rm -f ${dict_dir}/$${file_name} ; \
		fi  \
	    done ; \
	fi 

#-- start of cleanup_header --------------

clean :: TrigCostMonitorGenclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(TrigCostMonitorGen.make) $@: No rule for such target" >&2
else
.DEFAULT::
	$(error PEDANTIC: $@: No rule for such target)
endif

TrigCostMonitorGenclean ::
#-- end of cleanup_header ---------------

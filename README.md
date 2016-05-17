# METTriggerMonitoring

setup:
	git clone git@github.com:rjwang/METTriggerMonitoring.git Trigger

	lsetup 'asetup AtlasProduction,20.3.5.3,here'

	cmt co Trigger/TrigMonitoring/TrigXMonitor
	cmt co Trigger/TrigCost/TrigCostPython
	svn checkout svn+ssh://svn.cern.ch/reps/atlasoff/Trigger/TrigMonitoring/TrigCostMonitor/tags/TrigCostMonitor-01-20-09 Trigger/TrigMonitoring/TrigCostMonitor
	### need to add a version.cmt in TrigCostMonitor package ###

	setupWorkArea.py
	cd $TestArea/WorkArea/cmt
	cmt bro cmt config
	cmt bro gmake
	cd -


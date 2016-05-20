#Fri May 20 01:56:16 2016"""Automatically generated. DO NOT EDIT please"""
from GaudiKernel.GaudiHandles import *
from GaudiKernel.Proxy.Configurable import *

class Trig__TrigNtConfTool( ConfigurableAlgTool ) :
  __slots__ = { 
    'MonitorService' : 'MonitorSvc', # str
    'OutputLevel' : 7, # int
    'AuditTools' : False, # bool
    'AuditInitialize' : False, # bool
    'AuditStart' : False, # bool
    'AuditStop' : False, # bool
    'AuditFinalize' : False, # bool
    'EvtStore' : ServiceHandle('StoreGateSvc'), # GaudiHandle
    'DetStore' : ServiceHandle('StoreGateSvc/DetectorStore'), # GaudiHandle
    'UserStore' : ServiceHandle('UserDataSvc/UserDataSvc'), # GaudiHandle
    'configSvc' : ServiceHandle('TrigConf::TrigConfigSvc/TrigConfigSvc'), # GaudiHandle
    'printConfig' : False, # bool
    'useDB' : True, # bool
    'useConfSvc' : True, # bool
    'connectionCool' : 'COOLONL_TRIGGER/CONDBR2', # str
    'connectionTrig' : 'TRIGGERDB', # str
    'username' : '', # str
    'password' : '', # str
    'triggerMenuSetup' : '', # str
    'L1PrescaleSet' : '', # str
    'HLTPrescaleSet' : '', # str
  }
  _propertyDocDct = { 
    'DetStore' : """ Handle to a StoreGateSvc/DetectorStore instance: it will be used to retrieve data during the course of the job """,
    'UserStore' : """ Handle to a UserDataSvc/UserDataSvc instance: it will be used to retrieve user data during the course of the job """,
    'EvtStore' : """ Handle to a StoreGateSvc instance: it will be used to retrieve data during the course of the job """,
  }
  def __init__(self, name = Configurable.DefaultName, **kwargs):
      super(Trig__TrigNtConfTool, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'TrigCostMonitor'
  def getType( self ):
      return 'Trig::TrigNtConfTool'
  pass # class Trig__TrigNtConfTool

class Trig__TrigNtEBWeightTool( ConfigurableAlgTool ) :
  __slots__ = { 
    'MonitorService' : 'MonitorSvc', # str
    'OutputLevel' : 7, # int
    'AuditTools' : False, # bool
    'AuditInitialize' : False, # bool
    'AuditStart' : False, # bool
    'AuditStop' : False, # bool
    'AuditFinalize' : False, # bool
    'EvtStore' : ServiceHandle('StoreGateSvc'), # GaudiHandle
    'DetStore' : ServiceHandle('StoreGateSvc/DetectorStore'), # GaudiHandle
    'UserStore' : ServiceHandle('UserDataSvc/UserDataSvc'), # GaudiHandle
  }
  _propertyDocDct = { 
    'DetStore' : """ Handle to a StoreGateSvc/DetectorStore instance: it will be used to retrieve data during the course of the job """,
    'UserStore' : """ Handle to a UserDataSvc/UserDataSvc instance: it will be used to retrieve user data during the course of the job """,
    'EvtStore' : """ Handle to a StoreGateSvc instance: it will be used to retrieve data during the course of the job """,
  }
  def __init__(self, name = Configurable.DefaultName, **kwargs):
      super(Trig__TrigNtEBWeightTool, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'TrigCostMonitor'
  def getType( self ):
      return 'Trig::TrigNtEBWeightTool'
  pass # class Trig__TrigNtEBWeightTool

class Trig__TrigNtElemTool( ConfigurableAlgTool ) :
  __slots__ = { 
    'MonitorService' : 'MonitorSvc', # str
    'OutputLevel' : 7, # int
    'AuditTools' : False, # bool
    'AuditInitialize' : False, # bool
    'AuditStart' : False, # bool
    'AuditStop' : False, # bool
    'AuditFinalize' : False, # bool
    'EvtStore' : ServiceHandle('StoreGateSvc'), # GaudiHandle
    'DetStore' : ServiceHandle('StoreGateSvc/DetectorStore'), # GaudiHandle
    'UserStore' : ServiceHandle('UserDataSvc/UserDataSvc'), # GaudiHandle
    'saveNavigation' : False, # bool
    'collectRoIData' : True, # bool
    'collectClid' : False, # bool
    'printClid' : False, # bool
    'printDebug' : False, # bool
    'filterTE' : False, # bool
  }
  _propertyDocDct = { 
    'DetStore' : """ Handle to a StoreGateSvc/DetectorStore instance: it will be used to retrieve data during the course of the job """,
    'UserStore' : """ Handle to a UserDataSvc/UserDataSvc instance: it will be used to retrieve user data during the course of the job """,
    'collectClid' : """ collect attached feature clids """,
    'printClid' : """ print attached feature clids """,
    'collectRoIData' : """ save RoI data """,
    'EvtStore' : """ Handle to a StoreGateSvc instance: it will be used to retrieve data during the course of the job """,
    'printDebug' : """ print debug info """,
    'saveNavigation' : """ save navigation """,
    'filterTE' : """ filter trigger elements """,
  }
  def __init__(self, name = Configurable.DefaultName, **kwargs):
      super(Trig__TrigNtElemTool, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'TrigCostMonitor'
  def getType( self ):
      return 'Trig::TrigNtElemTool'
  pass # class Trig__TrigNtElemTool

class Trig__TrigNtExecTool( ConfigurableAlgTool ) :
  __slots__ = { 
    'MonitorService' : 'MonitorSvc', # str
    'OutputLevel' : 7, # int
    'AuditTools' : False, # bool
    'AuditInitialize' : False, # bool
    'AuditStart' : False, # bool
    'AuditStop' : False, # bool
    'AuditFinalize' : False, # bool
    'EvtStore' : ServiceHandle('StoreGateSvc'), # GaudiHandle
    'DetStore' : ServiceHandle('StoreGateSvc/DetectorStore'), # GaudiHandle
    'UserStore' : ServiceHandle('UserDataSvc/UserDataSvc'), # GaudiHandle
    'printOPI' : False, # bool
    'printSEQ' : False, # bool
    'saveSeqTimer' : False, # bool
  }
  _propertyDocDct = { 
    'DetStore' : """ Handle to a StoreGateSvc/DetectorStore instance: it will be used to retrieve data during the course of the job """,
    'UserStore' : """ Handle to a UserDataSvc/UserDataSvc instance: it will be used to retrieve user data during the course of the job """,
    'EvtStore' : """ Handle to a StoreGateSvc instance: it will be used to retrieve data during the course of the job """,
  }
  def __init__(self, name = Configurable.DefaultName, **kwargs):
      super(Trig__TrigNtExecTool, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'TrigCostMonitor'
  def getType( self ):
      return 'Trig::TrigNtExecTool'
  pass # class Trig__TrigNtExecTool

class Trig__TrigNtHltRTool( ConfigurableAlgTool ) :
  __slots__ = { 
    'MonitorService' : 'MonitorSvc', # str
    'OutputLevel' : 7, # int
    'AuditTools' : False, # bool
    'AuditInitialize' : False, # bool
    'AuditStart' : False, # bool
    'AuditStop' : False, # bool
    'AuditFinalize' : False, # bool
    'EvtStore' : ServiceHandle('StoreGateSvc'), # GaudiHandle
    'DetStore' : ServiceHandle('StoreGateSvc/DetectorStore'), # GaudiHandle
    'UserStore' : ServiceHandle('UserDataSvc/UserDataSvc'), # GaudiHandle
    'keyResult' : '', # str
    'saveFailedChains' : True, # bool
    'useSteering' : True, # bool
  }
  _propertyDocDct = { 
    'DetStore' : """ Handle to a StoreGateSvc/DetectorStore instance: it will be used to retrieve data during the course of the job """,
    'UserStore' : """ Handle to a UserDataSvc/UserDataSvc instance: it will be used to retrieve user data during the course of the job """,
    'EvtStore' : """ Handle to a StoreGateSvc instance: it will be used to retrieve data during the course of the job """,
  }
  def __init__(self, name = Configurable.DefaultName, **kwargs):
      super(Trig__TrigNtHltRTool, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'TrigCostMonitor'
  def getType( self ):
      return 'Trig::TrigNtHltRTool'
  pass # class Trig__TrigNtHltRTool

class Trig__TrigNtLvl1Tool( ConfigurableAlgTool ) :
  __slots__ = { 
    'MonitorService' : 'MonitorSvc', # str
    'OutputLevel' : 7, # int
    'AuditTools' : False, # bool
    'AuditInitialize' : False, # bool
    'AuditStart' : False, # bool
    'AuditStop' : False, # bool
    'AuditFinalize' : False, # bool
    'EvtStore' : ServiceHandle('StoreGateSvc'), # GaudiHandle
    'DetStore' : ServiceHandle('StoreGateSvc/DetectorStore'), # GaudiHandle
    'UserStore' : ServiceHandle('UserDataSvc/UserDataSvc'), # GaudiHandle
    'keyL1Result' : 'Lvl1Result', # str
    'keyRBResult' : '', # str
  }
  _propertyDocDct = { 
    'DetStore' : """ Handle to a StoreGateSvc/DetectorStore instance: it will be used to retrieve data during the course of the job """,
    'UserStore' : """ Handle to a UserDataSvc/UserDataSvc instance: it will be used to retrieve user data during the course of the job """,
    'EvtStore' : """ Handle to a StoreGateSvc instance: it will be used to retrieve data during the course of the job """,
  }
  def __init__(self, name = Configurable.DefaultName, **kwargs):
      super(Trig__TrigNtLvl1Tool, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'TrigCostMonitor'
  def getType( self ):
      return 'Trig::TrigNtLvl1Tool'
  pass # class Trig__TrigNtLvl1Tool

class Trig__TrigNtPostTool( ConfigurableAlgTool ) :
  __slots__ = { 
    'MonitorService' : 'MonitorSvc', # str
    'OutputLevel' : 7, # int
    'AuditTools' : False, # bool
    'AuditInitialize' : False, # bool
    'AuditStart' : False, # bool
    'AuditStop' : False, # bool
    'AuditFinalize' : False, # bool
    'EvtStore' : ServiceHandle('StoreGateSvc'), # GaudiHandle
    'DetStore' : ServiceHandle('StoreGateSvc/DetectorStore'), # GaudiHandle
    'UserStore' : ServiceHandle('UserDataSvc/UserDataSvc'), # GaudiHandle
  }
  _propertyDocDct = { 
    'DetStore' : """ Handle to a StoreGateSvc/DetectorStore instance: it will be used to retrieve data during the course of the job """,
    'UserStore' : """ Handle to a UserDataSvc/UserDataSvc instance: it will be used to retrieve user data during the course of the job """,
    'EvtStore' : """ Handle to a StoreGateSvc instance: it will be used to retrieve data during the course of the job """,
  }
  def __init__(self, name = Configurable.DefaultName, **kwargs):
      super(Trig__TrigNtPostTool, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'TrigCostMonitor'
  def getType( self ):
      return 'Trig::TrigNtPostTool'
  pass # class Trig__TrigNtPostTool

class Trig__TrigNtRobsTool( ConfigurableAlgTool ) :
  __slots__ = { 
    'MonitorService' : 'MonitorSvc', # str
    'OutputLevel' : 7, # int
    'AuditTools' : False, # bool
    'AuditInitialize' : False, # bool
    'AuditStart' : False, # bool
    'AuditStop' : False, # bool
    'AuditFinalize' : False, # bool
    'EvtStore' : ServiceHandle('StoreGateSvc'), # GaudiHandle
    'DetStore' : ServiceHandle('StoreGateSvc/DetectorStore'), # GaudiHandle
    'UserStore' : ServiceHandle('UserDataSvc/UserDataSvc'), # GaudiHandle
    'keyROB' : 'ROBDataMonitorCollection', # str
    'printDebug' : False, # bool
    'cleanROBs' : False, # bool
    'keepSubDet' : True, # bool
  }
  _propertyDocDct = { 
    'DetStore' : """ Handle to a StoreGateSvc/DetectorStore instance: it will be used to retrieve data during the course of the job """,
    'UserStore' : """ Handle to a UserDataSvc/UserDataSvc instance: it will be used to retrieve user data during the course of the job """,
    'EvtStore' : """ Handle to a StoreGateSvc instance: it will be used to retrieve data during the course of the job """,
  }
  def __init__(self, name = Configurable.DefaultName, **kwargs):
      super(Trig__TrigNtRobsTool, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'TrigCostMonitor'
  def getType( self ):
      return 'Trig::TrigNtRobsTool'
  pass # class Trig__TrigNtRobsTool

class Trig__TrigNtSaveTool( ConfigurableAlgTool ) :
  __slots__ = { 
    'MonitorService' : 'MonitorSvc', # str
    'OutputLevel' : 7, # int
    'AuditTools' : False, # bool
    'AuditInitialize' : False, # bool
    'AuditStart' : False, # bool
    'AuditStop' : False, # bool
    'AuditFinalize' : False, # bool
    'EvtStore' : ServiceHandle('StoreGateSvc'), # GaudiHandle
    'DetStore' : ServiceHandle('StoreGateSvc/DetectorStore'), # GaudiHandle
    'UserStore' : ServiceHandle('UserDataSvc/UserDataSvc'), # GaudiHandle
    'writeFile' : False, # bool
    'writeCostOnly' : False, # bool
    'writeRateOnly' : False, # bool
    'printPostSummary' : True, # bool
    'streamConfig' : '', # str
    'streamEvent' : '', # str
    'fileName' : '', # str
    'filePath' : '', # str
    'treeNameEvent' : 'event', # str
    'treeNameConfig' : 'config', # str
    'branchBuffer' : 10000000, # int
    'branchSplit' : 0, # int
    'fileCompr' : 1, # int
  }
  _propertyDocDct = { 
    'DetStore' : """ Handle to a StoreGateSvc/DetectorStore instance: it will be used to retrieve data during the course of the job """,
    'UserStore' : """ Handle to a UserDataSvc/UserDataSvc instance: it will be used to retrieve user data during the course of the job """,
    'EvtStore' : """ Handle to a StoreGateSvc instance: it will be used to retrieve data during the course of the job """,
  }
  def __init__(self, name = Configurable.DefaultName, **kwargs):
      super(Trig__TrigNtSaveTool, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'TrigCostMonitor'
  def getType( self ):
      return 'Trig::TrigNtSaveTool'
  pass # class Trig__TrigNtSaveTool

class Trig__TrigNtVarsTool( ConfigurableAlgTool ) :
  __slots__ = { 
    'MonitorService' : 'MonitorSvc', # str
    'OutputLevel' : 7, # int
    'AuditTools' : False, # bool
    'AuditInitialize' : False, # bool
    'AuditStart' : False, # bool
    'AuditStop' : False, # bool
    'AuditFinalize' : False, # bool
    'EvtStore' : ServiceHandle('StoreGateSvc'), # GaudiHandle
    'DetStore' : ServiceHandle('StoreGateSvc/DetectorStore'), # GaudiHandle
    'UserStore' : ServiceHandle('UserDataSvc/UserDataSvc'), # GaudiHandle
    'collectMC' : True, # bool
    'collectPU' : True, # bool
    'collectTD' : False, # bool
    'keyMCEvent' : 'TruthEvent', # str
    'keyPileUp' : 'OverlayEvent', # str
    'trigDec' : PublicToolHandle('Trig::TrigDecisionTool/TrigDecisionTool'), # GaudiHandle
  }
  _propertyDocDct = { 
    'DetStore' : """ Handle to a StoreGateSvc/DetectorStore instance: it will be used to retrieve data during the course of the job """,
    'UserStore' : """ Handle to a UserDataSvc/UserDataSvc instance: it will be used to retrieve user data during the course of the job """,
    'EvtStore' : """ Handle to a StoreGateSvc instance: it will be used to retrieve data during the course of the job """,
  }
  def __init__(self, name = Configurable.DefaultName, **kwargs):
      super(Trig__TrigNtVarsTool, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'TrigCostMonitor'
  def getType( self ):
      return 'Trig::TrigNtVarsTool'
  pass # class Trig__TrigNtVarsTool

class TrigCostAlg( ConfigurableAlgorithm ) :
  __slots__ = { 
    'OutputLevel' : 0, # int
    'Enable' : True, # bool
    'ErrorMax' : 1, # int
    'ErrorCount' : 0, # int
    'AuditAlgorithms' : False, # bool
    'AuditInitialize' : False, # bool
    'AuditReinitialize' : False, # bool
    'AuditRestart' : False, # bool
    'AuditExecute' : False, # bool
    'AuditFinalize' : False, # bool
    'AuditBeginRun' : False, # bool
    'AuditEndRun' : False, # bool
    'AuditStart' : False, # bool
    'AuditStop' : False, # bool
    'MonitorService' : 'MonitorSvc', # str
    'RegisterForContextService' : False, # bool
    'EvtStore' : ServiceHandle('StoreGateSvc'), # GaudiHandle
    'DetStore' : ServiceHandle('StoreGateSvc/DetectorStore'), # GaudiHandle
    'UserStore' : ServiceHandle('UserDataSvc/UserDataSvc'), # GaudiHandle
    'tools' : PrivateToolHandleArray([]), # GaudiHandleArray
    'doTiming' : True, # bool
    'writeConfig' : True, # bool
    'writeEvent' : True, # bool
    'mergeEvent' : True, # bool
    'printEvent' : False, # bool
    'keyConfigL2' : 'HLT_TrigMonConfigCollection_OPI_L2_monitoring_config', # str
    'keyConfigEF' : 'HLT_TrigMonConfigCollection_OPI_EF_monitoring_config', # str
    'keyConfigHLT' : 'HLT_TrigMonConfigCollection_OPI_HLT_monitoring_config', # str
    'keyEventL2' : 'HLT_TrigMonEventCollection_OPI_L2_monitoring_event', # str
    'keyEventEF' : 'HLT_TrigMonEventCollection_OPI_EF_monitoring_event', # str
    'keyEventHLT' : 'HLT_TrigMonEventCollection_OPI_HLT_monitoring_event', # str
  }
  _propertyDocDct = { 
    'DetStore' : """ Handle to a StoreGateSvc/DetectorStore instance: it will be used to retrieve data during the course of the job """,
    'RegisterForContextService' : """ The flag to enforce the registration for Algorithm Context Service """,
    'UserStore' : """ Handle to a UserDataSvc/UserDataSvc instance: it will be used to retrieve user data during the course of the job """,
    'tools' : """ Tools array """,
    'EvtStore' : """ Handle to a StoreGateSvc instance: it will be used to retrieve data during the course of the job """,
  }
  def __init__(self, name = Configurable.DefaultName, **kwargs):
      super(TrigCostAlg, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'TrigCostMonitor'
  def getType( self ):
      return 'TrigCostAlg'
  pass # class TrigCostAlg

class TrigCostRun( ConfigurableAlgorithm ) :
  __slots__ = { 
    'OutputLevel' : 0, # int
    'Enable' : True, # bool
    'ErrorMax' : 1, # int
    'ErrorCount' : 0, # int
    'AuditAlgorithms' : False, # bool
    'AuditInitialize' : False, # bool
    'AuditReinitialize' : False, # bool
    'AuditRestart' : False, # bool
    'AuditExecute' : False, # bool
    'AuditFinalize' : False, # bool
    'AuditBeginRun' : False, # bool
    'AuditEndRun' : False, # bool
    'AuditStart' : False, # bool
    'AuditStop' : False, # bool
    'MonitorService' : 'MonitorSvc', # str
    'RegisterForContextService' : False, # bool
    'EvtStore' : ServiceHandle('StoreGateSvc'), # GaudiHandle
    'DetStore' : ServiceHandle('StoreGateSvc/DetectorStore'), # GaudiHandle
    'UserStore' : ServiceHandle('UserDataSvc/UserDataSvc'), # GaudiHandle
    'navigation' : PrivateToolHandle('HLT::Navigation/Navigation'), # GaudiHandle
    'tools' : PrivateToolHandleArray([]), # GaudiHandleArray
    'toolsSave' : PrivateToolHandleArray([]), # GaudiHandleArray
    'doTiming' : True, # bool
    'printEvent' : False, # bool
    'keyStream' : '', # str
    'keyResultL2' : '', # str
    'keyConfigL2' : '', # str
    'keyEventL2' : '', # str
    'doL2' : True, # bool
    'keyResultEF' : '', # str
    'keyConfigEF' : '', # str
    'keyEventEF' : '', # str
    'doEF' : True, # bool
    'keyResultHLT' : '', # str
    'keyConfigHLT' : '', # str
    'keyEventHLT' : '', # str
    'doHLT' : True, # bool
  }
  _propertyDocDct = { 
    'DetStore' : """ Handle to a StoreGateSvc/DetectorStore instance: it will be used to retrieve data during the course of the job """,
    'RegisterForContextService' : """ The flag to enforce the registration for Algorithm Context Service """,
    'navigation' : """ Trigger navigation tool """,
    'toolsSave' : """ Tools array for writing output """,
    'UserStore' : """ Handle to a UserDataSvc/UserDataSvc instance: it will be used to retrieve user data during the course of the job """,
    'tools' : """ Tools array """,
    'EvtStore' : """ Handle to a StoreGateSvc instance: it will be used to retrieve data during the course of the job """,
  }
  def __init__(self, name = Configurable.DefaultName, **kwargs):
      super(TrigCostRun, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'TrigCostMonitor'
  def getType( self ):
      return 'TrigCostRun'
  pass # class TrigCostRun

class TrigCostTool( ConfigurableAlgTool ) :
  __slots__ = { 
    'MonitorService' : 'MonitorSvc', # str
    'OutputLevel' : 7, # int
    'AuditTools' : False, # bool
    'AuditInitialize' : False, # bool
    'AuditStart' : False, # bool
    'AuditStop' : False, # bool
    'AuditFinalize' : False, # bool
    'EvtStore' : ServiceHandle('StoreGateSvc'), # GaudiHandle
    'DetStore' : ServiceHandle('StoreGateSvc/DetectorStore'), # GaudiHandle
    'UserStore' : ServiceHandle('UserDataSvc/UserDataSvc'), # GaudiHandle
    'toolConf' : PrivateToolHandle('Trig::TrigNtConfTool/TrigNtConfTool'), # GaudiHandle
    'toolEBWeight' : PrivateToolHandle('Trig::TrigNtEBWeightTool/TrigNtEBWeightTool'), # GaudiHandle
    'eventTools' : PrivateToolHandleArray([]), # GaudiHandleArray
    'scaleTools' : PrivateToolHandleArray([]), # GaudiHandleArray
    'alwaysTools' : PrivateToolHandleArray([]), # GaudiHandleArray
    'scalerTool' : PrivateToolHandle('HLT::RandomScaler/TrigCostScaler'), # GaudiHandle
    'eventInfoTool' : PrivateToolHandle('HLT::EventInfoAccessTool/EventInfoAccessTool'), # GaudiHandle
    'level' : '', # str
    'monitoringLogic' : 'no-calib no-debug no-physics', # str
    'monitoringStream' : '', # str
    'monitoringTarget' : '', # str
    'useConfDb' : True, # bool
    'useConfSvc' : True, # bool
    'costForCAF' : False, # bool
    'doEBWeight' : False, # bool
    'keyResult' : 'HLTResult_HLT', # str
    'doTiming' : False, # bool
    'printEvent' : False, # bool
    'purgeCostStream' : True, # bool
    'saveEventTimers' : False, # bool
    'writeAlways' : False, # bool
    'writeConfig' : True, # bool
    'writeConfigDB' : False, # bool
    'onlySaveCostEvent' : True, # bool
    'obeyCostChainPS' : True, # bool
    'stopAfterNEvent' : 1000, # int
    'execPrescale' : 1.00000, # float
    'doOperationalInfo' : 1.00000, # float
  }
  _propertyDocDct = { 
    'doOperationalInfo' : """ Parent steering value of doOperationalInfo, used to control how often CostMon executes """,
    'saveEventTimers' : """ Save event timers """,
    'scalerTool' : """ Scaler used to prescale the scaleTools """,
    'obeyCostChainPS' : """ Only monitor events if the cost chain prescale is > 0 """,
    'DetStore' : """ Handle to a StoreGateSvc/DetectorStore instance: it will be used to retrieve data during the course of the job """,
    'UserStore' : """ Handle to a UserDataSvc/UserDataSvc instance: it will be used to retrieve user data during the course of the job """,
    'useConfSvc' : """ Get trigger configuration from configuration service """,
    'toolEBWeight' : """ Enhanced bias weighting tool """,
    'EvtStore' : """ Handle to a StoreGateSvc instance: it will be used to retrieve data during the course of the job """,
    'eventTools' : """ Cost sub-tools run on every event """,
    'doEBWeight' : """ Calculate EnhancedBias (un)weighting factors. """,
    'costForCAF' : """ Enable Cost for CAF mode when (re)running the trigger outside of P1 """,
    'scaleTools' : """ Cost sub-tools run on events after prescale """,
    'alwaysTools' : """ Cost sub-tools run on every event if always flag is set """,
    'keyResult' : """ Get the HLT result from storegate """,
    'toolConf' : """ Trigger configuration tool """,
    'onlySaveCostEvent' : """ Only save events which have passed the OPI prescale which run all scale tools """,
    'useConfDb' : """ Get trigger configuration from database """,
    'eventInfoTool' : """ Tool to manipulate the event streaming """,
  }
  def __init__(self, name = Configurable.DefaultName, **kwargs):
      super(TrigCostTool, self).__init__(name)
      for n,v in kwargs.items():
         setattr(self, n, v)
  def getDlls( self ):
      return 'TrigCostMonitor'
  def getType( self ):
      return 'TrigCostTool'
  pass # class TrigCostTool
